<?php

namespace App\Http\Controllers\Auth;

use App\Models\User;
use App\Models\Roles;

use Illuminate\Http\Request;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Http;
use App\Providers\RouteServiceProvider;
use Illuminate\Support\Facades\Session;
use Illuminate\Foundation\Auth\AuthenticatesUsers;

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    protected $redirectTo = RouteServiceProvider::HOME;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }

    public function redirect(Request $request){
        $query = http_build_query([
            'client_id' => env('CLIENT_SSO_ID',''),
            'redirect_uri' => env('CLIENT_SSO_CALLBACK',''),
            'response_type' => 'code',
            'scope' => '',
        ]);
        return redirect(env('CLIENT_SSO_SERVER','https://ssobmd.b1nus.com').'/oauth/authorize?' . $query);
    }

    public function callback(Request $request){
        $token_ = collect();
        if(!empty($request->code)){
            $params = array(
                'grant_type' => 'authorization_code',
                'client_id' => env('CLIENT_SSO_ID',''),
                'client_secret' => env('CLIENT_SSO_SECRET',''),
                'redirect_uri' => env('CLIENT_SSO_CALLBACK',""),
                'name'=>'RBAC Template',
                'code' => $request->code
            );
            $response = Http::withOptions(['verify' => false])->post(env('CLIENT_SSO_SERVER','').'/oauth/token', $params);
            $data = json_decode($response->getBody()->getContents(),true);
            //dd($data);
            if (!empty($data['access_token'])) {
                Session::put('sso_token',$data);
                return redirect('sso/hastoken');
            }else{
                return abort(403,'Unauthorized');
            } 
        }else{
            return "Invalid Authorization Code";
        }
    }

    public function loginSSO(){
        /**
         * Ambil response dari SSO
         */
        $token = Session::all()['sso_token'];
        $response = Http::withHeaders([
            'Accept' => 'application/json',
            'Authorization' => $token['token_type'].' '.$token['access_token'],
        ])->withOptions(['verify' => false])->get(env('CLIENT_SSO_SERVER','').'/api/user',['client_id'=>env('CLIENT_SSO_ID','')]);
        $response = json_decode($response->getBody()->getContents(),true);
        
        if(!empty($response['client_app'])){
            /**
             * Insert user ke rbac_user (jika belum)
             */
            $userSSO = $response;
            $user_ = User::firstOrNew(['id'=>$userSSO['id']]);
            $user_->id = $userSSO['id'];
            $user_->name = $userSSO['name'];
            $user_->email = $userSSO['email'];
            $user_->phone = $userSSO['phone'];
            if(empty($userSSO['roles'])){
                return abort(403,'User SSO has no roles access');
            }

            if($user_->save()){
                /**
                 * Insert role dan user_role (jika belum)
                 * $userSSO['roles'] = role di sub sistem yang di atur di daftar aplikasi
                 */
                foreach($userSSO['roles'] as $role){
                    $role_ = Roles::firstOrNew(['sso_role_id'=>$role['app_role_id']]);
                    $role_->sso_role_id = $role['app_role_id'];
                    $role_->role_name = $role['role_name'];
                    $role_->role_desc = $role['role_desc'];
                    $role_->is_default = $role['is_default'];
                    $role_->save();
                }
            }

            //Auth::loginUsingId(1);
            if (Auth::loginUsingId($user_->id)){
                return redirect('/');
            } else {
                return abort(403,'User SSO has no roles access');
            }
        } else {
            return abort(403,'User SSO not registered');
        }
    }

    public function logout(Request $request){
        $token = $request->session()->get('sso_token');
        $response = Http::withHeaders([
            'Accept' => 'application/json',
            'Authorization' => $token['token_type'].' '.$token['access_token'],
        ])->withOptions(['verify' => false])->post(env('CLIENT_SSO_SERVER','').'/api/logout');
        
        if(!empty($response)){
            Auth::logout();
            $request->session()->flush();
            return redirect()->to(env('CLIENT_SSO_SERVER','').'/sso/logout');        
        }
    }

}

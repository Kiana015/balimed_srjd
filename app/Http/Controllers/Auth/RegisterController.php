<?php

namespace App\Http\Controllers\Auth;

use Carbon\Carbon;
use App\Models\User;
use App\Models\Roles;
use App\Models\OTPModel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Crypt;
use App\Notifications\OTPNotification;
use App\Providers\RouteServiceProvider;
use Illuminate\Support\Facades\Validator;
use Illuminate\Foundation\Auth\RegistersUsers;

class RegisterController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Register Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users as well as their
    | validation and creation. By default this controller uses a trait to
    | provide this functionality without requiring any additional code.
    |
    */

    use RegistersUsers;

    /**
     * Where to redirect users after registration.
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
        $this->middleware('guest');
    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        return Validator::make($data, [
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'phone' => ['required', 'string', 'email', 'max:20', 'unique:users'],
            'password' => ['required', 'string', 'min:8', 'confirmed'],
        ]);
    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array  $data
     * @return \App\Models\User
     */
    protected function create(array $data)
    {
        
    }

    protected function register(Request $request){
        $errors = [];
        $messages = [
            'required' => ':attribute tidak diperkenankan Kosong',
            'min' => ':attribute tidak diperkenankan kurang dari :min karakter',
            'max' => 'Kolom :attribute tidak diperkenankan lebih dari :max karakter',
            'without_spaces' => ' Kolom :attribute kidak diperkenankan ada spasi',
            'unique' => ':attribute sudah terdaftar',
            'email' => ['id'=>'Alamat email tidak valid','en'=>'Invalid email address'],
            'confirmed' => 'Kolom :attribute tidak sesuai dengan konfirmasi password',
            'numeric'=>['id'=>'Kolom :attribute hanya angka','en'=>'Eng :attribute hanya angka']
        ];
        
        $data = array('name'=>$request->name,'email'=>$request->email,'phone'=>$request->phone);
        $rules = [
            'name'=>'required',
            'email' =>'required|email',
            'phone'=>'required|numeric|min:10'
        ];

        $validator = Validator::make($data, $rules,$messages)->messages()->toArray();
        if(empty($validator)){
            $checkAccount = User::where('email',$data['email']);
            if(!empty($checkAccount->first())){
                //$errors['email']['id'] = "Akun dengan email {$data['email']} sudah terdaftar";
                //$errors['email']['en'] = "Email {$data['email']} already registered";
                $errors['email'] = "Email {$data['email']} already registered";
            }
            if(!empty($checkAccount->orWhere('phone',$data['phone'])->first())){
                //$errors['phone']['id'] = "Akun dengan nomor {$data['phone']} sudah terdaftar";
                //$errors['phone']['en'] = "Eng : Akun dengan nomor {$data['phone']} sudah terdaftar";
                $errors['phone'] = "Eng : Akun dengan nomor {$data['phone']} sudah terdaftar";
            }
        }else{
            $errors = $validator;
        }

        if(!empty($errors)){
            return redirect()->route('register')
            ->withErrors($errors)->withInput();
        }else{
            $otp_token = rand(12345,99999);
            $createUser = User::create([
                'name' => $data['name'],
                'email' => $data['email'],
                'phone' => $data['phone'],
                'password'=>Hash::make($otp_token)
            ]);
            if($createUser->save()){
                $userId = $createUser->id;
                //init role
                DB::table('rbac_user_role')->insert(['user_id'=>$userId,'role_id'=>1]);
                // send otp
                $exp = Carbon::now()->addMinute(5);
                $otp = OTPModel::create(['user_id'=>$userId,'otp_token'=>$otp_token,'expired_at'=>strtotime($exp)]);
                //redirect to otp verfication
                $user = User::where('id',$userId)->first();
                $user->notify((new OTPNotification($otp))->afterCommit());
                $userId = Crypt::encryptString($userId);
                return redirect()->route("password.otp",$userId);
            }else{
                return redirect()->route('register')
                    ->withErrors($errors)->withInput();
            }
        }
    }
}

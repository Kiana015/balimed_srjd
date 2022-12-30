<?php

namespace App\Http\Controllers\Auth;

use App\Models\User;
use App\Models\OTPModel;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Validation\Rule;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Crypt;
use App\Notifications\OTPNotification;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;


class AuthOTPController extends Controller
{
    public function __construct()
    {
        $this->middleware('guest');
    }

    public function verify($user_id,Request $request){
        //dd($user_id);
        $errors = [];
        $messages = [
            'required' => ':attribute tidak diperkenankan Kosong</br>',
            'min' => ':attribute tidak diperkenankan kurang dari :min karakter</br>',
            'max' => 'Kolom :attribute tidak diperkenankan lebih dari :max karakter</br>',
            'without_spaces' => ' Kolom :attribute kidak diperkenankan ada spasi</br>',
            'unique' => ':attribute sudah terdaftar</br>',
            'email' => 'Alamat email tidak valid.</br>',
            'confirmed' => 'Kolom :attribute tidak sesuai dengan konfirmasi password</br>',
            'numeric'=>'Kolom :attribute hanya angka</br>'
        ];
        
        $data = array('name'=>$request->name,'email'=>$request->email,'phone'=>$request->phone);
        $rules = [
            'name'=>'required',
            'email' =>'required|email',
            'phone'=>'required|numeric|min:10'
        ];

        $validator = Validator::make($data, $rules,$messages)->messages()->toArray();
        if(empty($validator)){
            $checkAccount = User::where('email',$data['email'])->orWhere('phone',$data['phone'])->first();
            if(!empty($checkAccount)){
                $errors['account'] = "Akun dengan email {$data['email']} dan nomor {$data['phone']} telepon sudah terdaftar";
            }
        }else{
            $errors['account'] = $validator;
        }

        return view('auth.otp');
    }

    public function verifyOTPLogin(Request $request){
        $mergeotp = $request->post('digit-1').$request->post('digit-2').$request->post('digit-3').$request->post('digit-4').$request->post('digit-5');
        $otp_token = OTPModel::where('user_id',Crypt::decryptString($request->user))->where('otp_token',$mergeotp)->first();
        $now = strtotime(Carbon::now());
        if(empty($otp_token)){
            return redirect()->back()->withErrors(['otp'=>'OTP tidak sesuai']);
        }elseif(!empty($otp_token) && $now > $otp_token->expired_at){
            return redirect()->back()->withErrors(['otp'=>'OTP sudah tidak berlaku, generate OTP']);
        }else{
            $user = User::where('id',$otp_token->user_id)->first();
            if(!empty($user)){
                $user->update(['password'=>Hash::make($otp_token->otp_token),'email_verified_at'=>Carbon::now()->format('Y-m-d H:i:s'),'phone_verified_at'=>Carbon::now()->format('Y-m-d H:i:s')]);
                $credentials = array('email'=>$user->email,'password'=>$otp_token->otp_token);
                if (Auth::attempt($credentials)){
                    return redirect("/");
                }else{
                    return redirect()->back()->withErrors(['otp'=>'OTP tidak sesuai']);
                }
            }else{
                return redirect()->back()->withErrors(['otp'=>'OTP tidak sesuai']);
            }
        }
    }

    public function requestOtp($user_id){
        $otp_token = rand(12345,99999);
        if(!empty($user_id)){
            $userId = Crypt::decryptString($user_id);
            $user = User::where('id',$userId)->first();
            // send otp
            $exp = Carbon::now()->addMinute(15);
            $otp = OTPModel::create(['user_id'=>$userId,'otp_token'=>$otp_token,'expired_at'=>strtotime($exp)]);
            //redirect to otp verfication
            $user->notify((new OTPNotification($otp))->afterCommit());
            return redirect()->route("password.otp",$user_id)->with(['success'=>'<span class="fa fa-check"></span> Kode OTP berhasil dikirim, cek Email anda untuk kode OTP']);
        }else{
            $errors['otp'][] = "Email/ No. HP belum terdaftar, silahkan melakukan registrasi.";
            return redirect()->route('register')
                ->withErrors($errors)->withInput();
        }
    }
}

<?php

namespace App\Http\Controllers\Rbac;

use App\Models\User;
use App\Models\Roles;
use App\Helpers\RBACHelper;
use Illuminate\Http\Request;
use Yajra\DataTables\DataTables;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class UserRoleController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        if(!RBACHelper::hasPrivilege('View RBAC User Role')){
            return redirect('/');
        }
        $data['title'] = "RBAC User Roles";
        $data['desc'] = "manajemen role akses user";
        $data['roles'] = Roles::whereNull('deleted_at')->get();
        $data['form_id'] = "form-rbac-role-user";
        $data['table_id'] = "table-rbac-role-user";
        $data['roles'] = Roles::whereNull('deleted_at')->get();
        return view('rbac.userrole',$data);
    }

    public function listData(Request $request){
        $data = User::all();
        
    	$datatables = DataTables::of($data);
		return $datatables
        ->editColumn('user',function($data){
            return $data->name."<br>".$data->email."<br>".$data->phone;
        })
        ->addColumn('role_name',function($data){
            $roles = "";
            foreach($data->roles as $role){
                $roles.= "<span class='badge badge-outline-primary ml-1'>{$role->role_name}</span>";
            }
            return $roles;
        })
		->addcolumn('aksi',function($data){
            $aksi = "<a href='javascript:void(0)' onclick='changePassword({$data->id})' class='btn btn-xs btn-primary' data-toggle='tooltip' data-placement='bottom' title='Change Password'><i class='fas fa-key'></i></a>";
            $aksi .= "<a href='javascript:void(0)' onclick='showData({$data->id})' class='btn btn-xs btn-success' data-toggle='tooltip' data-placement='bottom' title='Edit Data'><i class='fas fa-edit'></i></a>";
            $aksi .= "<a href='javascript:void(0)' onclick='deleteData(\"{$data->id}\")' class='btn btn-xs btn-danger' data-id='{$data->id}' data-name='{$data->name}'><i class='fas fa-trash' data-toggle='tooltip' data-placement='bottom' title='Delete Data'></i></a>";
            return $aksi;
        })->rawColumns(['user','role_name','aksi'])
        ->addIndexColumn()
        ->make(true);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $data = array('name'=>$request->name,'email'=>$request->email,'phone'=>$request->phone);
        $msg = array();
        // setting up rules
        $rules = array(
            'name' => 'required',
            'email' => 'required|unique:rbac_users,email,',
            'phone' => 'required|unique:rbac_users,phone,'
        ); 

        $messages = [
            'required' => ':attribute tidak diperkenankan Kosong</br>',
            /* 'email' => 'Alamat email tidak valid.</br>', */
            'confirmed' => 'Kolom :attribute tidak sesuai dengan konfirmasi password</br>',
        ];
        
        $v = Validator::make($data, $rules, $messages);
        $errors = array();
        foreach ($v->messages()->toArray() as $err => $errvalue) {
            $errors = array_merge($errors, $errvalue);
        }

        if(!empty($errors)){
            return response()->json(array('success'=>2,'msg'=>$errors));
        }else{
            $user = new User;
            $user->name = $request->name;
            $user->email = $request->email;
            $user->phone = $request->phone;
            $user->password = Hash::make('123456789');
            if($user->save()){
                $lastid = $user->id;
                $user = User::find($lastid);
                $user->roles()->sync($request->roles);
            }
            if($user->save()){
                return response()->json(['success'=>1,'msg'=>['User role berhasil ditambahkan.']]);
            }else{
                return response()->json(['success'=>2,'msg'=>['User role gagal ditambahkan.']]);
            }
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $user = User::find($id);
        $user->roles = $user->roles;
        return response()->json($user);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {

    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $data = array('name'=>$request->name,'email'=>$request->email,'phone'=>$request->phone);
        $msg = array();
        // setting up rules
        $rules = array(
            'name' => 'required',
            'email' => 'required|unique:rbac_users,email,'.$id,
            'phone' => 'required|unique:rbac_users,phone,'.$id
        ); 

        $messages = [
            'required' => ':attribute tidak diperkenankan Kosong</br>',
            'email' => 'Alamat email tidak valid.</br>',
            'confirmed' => 'Kolom :attribute tidak sesuai dengan konfirmasi password</br>',
        ];
        
        $v = Validator::make($data, $rules, $messages);
        $errors = array();
        foreach ($v->messages()->toArray() as $err => $errvalue) {
            $errors = array_merge($errors, $errvalue);
        }

        if(!empty($errors)){
            return response()->json(array('success'=>2,'msg'=>$errors));
        }else{
            $user = User::find($request->user_id);
            $user->name = $request->name;
            $user->email = $request->email;
            $user->phone = $request->phone;
            $user->roles()->sync($request->roles);
            if($user->save()){
                return response()->json(['success'=>1,'msg'=>['User role berhasil di-update.']]);
            }else{
                return response()->json(['success'=>2,'msg'=>['User role gagal di-update.']]);
            }
        }
    }

    public function updatePassword(Request $request){
        $id = $request->user_id;
    	$data = array('password_confirmation'=>$request->password_confirmation,'password'=>$request->password);
        $msg = array();
        // setting up rules
        $rules = array(
            'password' => 'required|confirmed|min:9',
            'password_confirmation'=>'required|min:9'
        ); 

        $messages = [
            'required' => ':attribute tidak diperkenankan Kosong</br>',
            'min' => ':attribute tidak diperkenankan kurang dari :min karakter</br>',
            'max' => 'Kolom :attribute tidak diperkenankan lebih dari :max karakter</br>',
            'without_spaces' => ' Kolom :attribute kidak diperkenankan ada spasi</br>',
            'confirmed' => 'Kolom :attribute tidak sesuai dengan konfirmasi password</br>',
        ];
        
        $v = Validator::make($data, $rules, $messages);
        $errors = array();
        foreach ($v->messages()->toArray() as $err => $errvalue) {
            $errors = array_merge($errors, $errvalue);
        }

        if(!empty($errors)){
            return response()->json([
                'success'=>2,
                'msg' => $errors,
            ]);
        }else{
	    	$user = User::find($id);
	    	if(!empty($request->password)){
		    	$password = Hash::make($request->password);
		        $user->password = $password;
		    }

	        if($user->save()){
	            return response()->json([
	                'success'=>1,
	                'msg' => ['Update password User berhasil.'],
	            ]);
	        }else{
	            return response()->json([
	                'success'=>2,
	                'msg' => ['Update password User gagal.'],
	            ]);
	        }
	    }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $user = User::find($id)->delete();
        if($user){
            return response()->json([
                'success'=>1,
                'msg' => 'Hapus User berhasil.',
            ]);
        }else{
            return response()->json([
                'success'=>2,
                'msg' => 'Hapus User gagal.',
            ]);
        }
    }
}

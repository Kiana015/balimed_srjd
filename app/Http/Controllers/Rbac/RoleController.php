<?php

namespace App\Http\Controllers\Rbac;

use App\Models\Roles;
use App\Helpers\RBACHelper;
use Illuminate\Http\Request;
use Yajra\DataTables\DataTables;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;

class RoleController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        if(!RBACHelper::hasPrivilege('View RBAC Role')){
            return redirect('/');
        }
        $data['title'] = "RBAC Roles";
        $data['desc'] = "manajemen role akses";
        $data['form_id'] = "form-rbac-role";
        $data['table_id'] = "table-rbac-role";
        return view('rbac.role',$data);
    }

    public function listData(Request $request){
        $data = Roles::whereNull('deleted_at')->get();
    	$datatables = DataTables::of($data);
		return $datatables
        ->editColumn('role_name',function($data){
            return $data->role_name.($data->is_default == 1 ? "<small>(default role)</small>" : "");
        })
		->addcolumn('aksi',function($data){
            $aksi = "<a href='javascript:void(0)' onclick='showData({$data->role_id})' class='btn btn-xs btn-success'><i class='fas fa-edit'></i></a>";
            $aksi .= "<a href='javascript:void(0)' onclick='deleteData(\"{$data->role_id}\")' class='btn btn-xs btn-danger' data-id='{$data->role_id}' data-name='{$data->perm_desc}'><i class='fas fa-trash'></i></a>";
            return $aksi;
        })->rawColumns(['role_name','aksi'])
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

    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $errors = array();
        $data = array('role_name'=>$request->role_name,'role_desc'=>$request->role_desc,'is_default'=>$request->is_default,'created_by'=>auth()->user()->id);
        // setting up rules
        $rules = array(
            'role_name' => 'required',
        ); 
        $messages = [
            'required' => '<i class="fa fa-times-circle"></i> :attribute tidak diperkenankan kosong',
        ];
        
        $v = Validator::make($data, $rules, $messages);
        foreach ($v->messages()->toArray() as $err => $errvalue) {
            $errors = array_merge($errors, $errvalue);
        }
        if(empty($errors)){
            $create = Roles::create($data);
            $lastInsertID = $create->id; 
            if($create){
                $response = array('success'=>1,'msg'=>['Berhasil tambah role'],'id'=>$lastInsertID);
            }else{
                $response = array('success'=>2,'msg'=>['Gagal tambah role'],'id'=>'');
            }
        }else{
            $response = array('success'=>2,'msg'=>$errors,'id'=>'');
        }

        return response()->json($response);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        return response()->json(Roles::find($id));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
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
        $role = Roles::find($id);
        $role->role_name = $request->role_name;
        $role->role_desc = $request->role_desc;
        $role->is_default = $request->is_default;
        $role->updated_at = now();
        $role->updated_by = auth()->user()->id;
        if($role->save()){
            $response = array('success'=>1,'msg'=>['Berhasil update role'],'id'=>$id);
        }else{
            $response = array('success'=>2,'msg'=>['Gagal update role'],'id'=>$id);
        }

        return response()->json($response);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $permission = Roles::find($id);
        $permission->deleted_at = now();
        $permission->updated_by = auth()->user()->id;
        if($permission->save()){
            $response = array('success'=>1,'msg'=>'Berhasil hapus role');
        }else{
            $response = array('success'=>2,'msg'=>'Gagal hapus role');
        }

        return response()->json($response);
    }
}

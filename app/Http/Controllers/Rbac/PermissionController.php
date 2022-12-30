<?php

namespace App\Http\Controllers\Rbac;

use App\Models\Menus;
use App\Helpers\RBACHelper;
use App\Models\Permissions;
use Illuminate\Http\Request;
use Yajra\DataTables\DataTables;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;



class PermissionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        if(!RBACHelper::hasPrivilege('View RBAC Permission')){
            return redirect('/');
        }
        $data['title'] = "RBAC Permission";
        $data['desc'] = "manajemen permission akses";
        $data['form_id'] = "form-rbac-permission";
        $data['table_id'] = "table-rbac-permission";
        $data['permissions'] = null;
        $data['menus'] = Menus::whereNull('deleted_at')->get();
        return view('rbac.permission',$data);
    }

    public function listData(Request $request){
        $data = Permissions::leftJoin('rbac_menus','id','menu_id')->whereNull('rbac_permissions.deleted_at')->whereNull('rbac_menus.deleted_at')->get();
    	$datatables = DataTables::of($data);
		return $datatables
        ->editcolumn('menu',function($data){
            return $data->text;
        })
		->addcolumn('aksi',function($data){
            $aksi = "<a href='javascript:void(0)' onclick='showData({$data->perm_id})' class='btn btn-xs btn-success'><i class='fas fa-edit'></i></a>";
            $aksi .= "<a href='javascript:void(0)' onclick='deleteData(\"{$data->perm_id}\")' class='btn btn-xs btn-danger' data-id='{$data->perm_id}' data-name='{$data->perm_desc}'><i class='fas fa-trash'></i></a>";
            return $aksi;
        })->rawColumns(['menu','aksi'])
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
        $data = array('perm_desc'=>$request->perm_desc,'group'=>$request->group,'menu_id'=>$request->menu_id,'created_by'=>auth()->user()->id);
        // setting up rules
        $rules = array(
            'perm_desc' => 'required',
        ); 
        $messages = [
            'required' => '<i class="fas fa-times-circle"></i> :attribute tidak diperkenankan kosong',
        ];
        
        $v = Validator::make($data, $rules, $messages);
        foreach ($v->messages()->toArray() as $err => $errvalue) {
            $errors = array_merge($errors, $errvalue);
        }
        if(empty($errors)){
            $create = Permissions::create($data);
            $lastInsertID = $create->id; 
            if($create){
                $response = array('success'=>1,'msg'=>['Berhasil tambah permission'],'id'=>$lastInsertID);
            }else{
                $response = array('success'=>2,'msg'=>['Gagal tambah permission'],'id'=>'');
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
        return response()->json(Permissions::find($id));
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
        $permission = Permissions::find($id);
        $permission->perm_desc = $request->perm_desc;
        $permission->menu_id = $request->menu_id;
        $permission->group = $request->group;
        $permission->updated_at = now();
        $permission->updated_by = auth()->user()->id;
        if($permission->save()){
            $response = array('success'=>1,'msg'=>['Berhasil update permission'],'id'=>$id);
        }else{
            $response = array('success'=>2,'msg'=>['Gagal update permission'],'id'=>$id);
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
        $permission = Permissions::find($id);
        $permission->deleted_at = now();
        $permission->updated_by = auth()->user()->id;
        if($permission->save()){
            $response = array('success'=>1,'msg'=>'Berhasil hapus permission');
        }else{
            $response = array('success'=>2,'msg'=>'Gagal hapus permission');
        }

        return response()->json($response);
    }
    
}

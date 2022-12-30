<?php

namespace App\Http\Controllers\Rbac;

use App\Models\Roles;
use App\Helpers\Formatting;
use App\Helpers\RBACHelper;
use App\Models\Permissions;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;

class RolePermissionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        if(!RBACHelper::hasPrivilege('View RBAC Role Permission')){
            return redirect('/');
        }
        $data['title'] = "RBAC Roles Permission";
        $data['desc'] = "manajemen role akses permission";
        $data['roles'] = Roles::whereNull('deleted_at')->get();
        $data['form_id'] = "form-rbac-role-perm";
        $data['table_id'] = "table-rbac-role-perm";
        return view('rbac.rolepermission',$data);
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
        $res = false;
        //delete all role perm where role_id
        if(!empty($request->perm_id)){
            $delete = DB::table('rbac_role_permission')->where('role_id',$request->role_)->delete();
            foreach($request->perm_id as $perms){
                $data = array('role_id'=>$request->role_,'perm_id'=>$perms,'created_at'=>date('Y-m-d H:i:s'),'created_by'=>auth()->user()->id);
                $res = DB::table('rbac_role_permission')->insert($data);
            }

            if($res){
                $response = array('success'=>1,'msg'=>['Berhasil setting role permission']);
            }else{
                $response = array('success'=>2,'msg'=>['Gagal setting role_permission']);
            }
        }else{
            $response = array('success'=>0,'msg'=>['Silahkan pilih permission untuk setting role_permission']);
            //please pilih permission
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
        $groups = DB::table('rbac_role_permission')
                    ->rightjoin('rbac_permissions',function($query) use($id){
                            $query->on('rbac_role_permission.perm_id','rbac_permissions.perm_id');
                            $query->where('role_id',$id);
                    })->leftjoin('rbac_menus',function($query){
                            $query->on('rbac_menus.id','rbac_permissions.menu_id');
                            $query->whereNull('rbac_permissions.deleted_at');
                    })->select(['rbac_permissions.*','rbac_menus.text','rbac_menus.icon','rbac_role_permission.role_id'])->whereNull('rbac_permissions.deleted_at')->whereNull('rbac_menus.deleted_at')->get()->toArray();

        $permgroup = [];$response = "";
        foreach($groups as $key => $perm){
            if(!in_array($perm->group,$permgroup)){
                $permgroup[$perm->group]['group'] = $perm->group;
                $permgroup[$perm->group]['data'][] = $perm;
            }else{
                $permgroup[$perm->group]['data'][] = $perm;
            }
        }
        foreach($permgroup as $permgroupval){
            $response .= "<div class='card-body'>
            <h6 class='mb-3'><span>Permission Group </span>{$permgroupval['group']}</h6>";
            if(!empty($permgroupval['data'])){
                $response .= "<div class='row'>";
                foreach($permgroupval['data'] as $perm){
                    $response .= "<div class='col-md-4'>
                    <div class='custom-control custom-switch'>
                    <input type='checkbox' class='custom-control-input' id='perm-{$perm->perm_id}' name='perm_id[]' ".(!empty($perm->role_id) ? 'checked':'')." value='{$perm->perm_id}'>";
                    $response .= "<label class='custom-control-label' for='perm-{$perm->perm_id}'>{$perm->perm_desc}<p><small>(".(!empty($perm->text) ? "<i class='{$perm->icon}'></i>".$perm->text : '-').")</small></p></label>";
                    $response .= "</div></div>";
                }
                $response .= "</div>";
            }
            $response .= "</div>";
        }
        return response()->json(['html'=>$response]);

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
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}

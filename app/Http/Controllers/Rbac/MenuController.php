<?php

namespace App\Http\Controllers\Rbac;

use App\Models\Menus;
use App\Helpers\Formatting;
use App\Helpers\RBACHelper;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;

class MenuController extends Controller
{
    public function index(){
        if(!RBACHelper::hasPrivilege('View RBAC Menu')){
            return redirect('/');
        }
        $data['title'] = "RBAC Menu";
        $data['desc'] = "manajemen menu aplikasi";
        $data['form_id'] = 'form-rbac-menu';
        $data['table_id'] = 'rbac-menu';
        $data['icons'] = DB::connection('mysql2')->table('m_icons')->get();
        return view('rbac.menu',$data);
    }

    function loadRbacMenu(){
        $menus = Formatting::generateTree(Menus::whereNull('deleted_at')->orderBy('parent_id','ASC')->orderBy('weight','ASC')->get()->toArray(),0,'parent_id');
        $response = "";
        $response .= "<ul>";
        foreach($menus as $menu){
            $response .= "<li>";
            $response .= "<span class='badge badge-inverse-info'>".($menu['weight']?$menu['weight']:0)."</span> <i class='{$menu['icon']}'></i> {$menu['text']}";
            $response .=    "<span class='float-right' data-bs-toggle='tooltip' data-bs-placement='bottom' title='Hapus' style='padding-right:10px' onclick='deleteData({$menu['id']})'>
                                <i class='fas fa-trash'></i>
                            </span>
                            <span class='float-right' data-bs-toggle='tooltip' data-bs-placement='bottom' title='Ubah' onclick='showData({$menu['id']})'>
                                <i class='fas fa-edit'></i>
                            </span>";
                            if($menu['children']){
            $response .=        "<ul>";
                                foreach ($menu['children'] as $item) {
            $response .=            "<li>
                                        <span class='badge badge-inverse-info'>".($item['weight']?$item['weight']:0)."</span> <i class='{$item['icon']}'></i> {$item['text']}";
            $response .=                "<span class='float-right' data-bs-toggle='tooltip' data-bs-placement='bottom' title='Hapus' onclick='deleteData({$menu['id']})'>
                                            <i class='fas fa-trash'></i>
                                        </span>";
            $response .=                "<span class='float-right' data-bs-toggle='tooltip' data-bs-placement='bottom' title='Ubah' onclick='showData({$item['id']})'>
                                            <i class='fas fa-edit'></i>
                                        </span>";
            $response .=            "</li>";       
                                }                    
            $response .=       "</ul>";
                            }
            $response .= "</li>";
        }
        $response .= "</ul>";
        return response()->json(['content'=>$response]);
    }

    function getComboParentMenu(){
        $parent = Menus::where(function($query){
            $query->where('parent_id',0);
            $query->orWhere('parent_id','IS NULL');
        })->whereNull('deleted_at')->get();
        $response = "<option value='0'>Set as Parent Menu</option>";
        foreach($parent as $p){
            $response .= "<option value='{$p->id}'>{$p->text}</option>";
        }
        return response()->json(['option'=>$response]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //dd($request->all());
        $errors = array();
        $data = array('text'=>$request->text,'icon'=>$request->icon,'desc'=>$request->desc,'link'=>$request->link,'route_name'=>$request->route_name,'parent_id'=>$request->parent_id,'weight'=>($request->weight?$request->weight:0),'created_by'=>auth()->user()->id);
        // setting up rules
        $rules = array(
            'text'=>'required',
            'desc'=>'required',
            'link'=>'required',
            'route_name'=>'required',
        ); 
        $messages = [
            'required' => '<i class="fa fa-times-circle"></i> :attribute tidak diperkenankan kosong',
        ];
        
        $v = Validator::make($data, $rules, $messages);
        foreach ($v->messages()->toArray() as $err => $errvalue) {
            $errors = array_merge($errors, $errvalue);
        }
        if(empty($errors)){
            $create = Menus::create($data);
            $lastInsertID = $create->id; 
            if($create){
                $response = array('success'=>1,'msg'=>['Berhasil tambah menu'],'id'=>$lastInsertID);
            }else{
                $response = array('success'=>2,'msg'=>['Gagal tambah menu'],'id'=>'');
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
        return response()->json(Menus::find($id));
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
        $menus = Menus::find($id);
        $menus->text = $request->text;
        $menus->icon = $request->icon;
        $menus->desc = $request->desc;
        $menus->link = $request->link;
        $menus->route_name = $request->route_name;
        $menus->parent_id = $request->parent_id;
        $menus->weight = ($request->weight?$request->weight:0);
        $menus->updated_at = now();
        $menus->updated_by = auth()->user()->id;
        if($menus->save()){
            $response = array('success'=>1,'msg'=>['Berhasil update rbac menu'],'id'=>$id);
        }else{
            $response = array('success'=>2,'msg'=>['Gagal update rbac menu'],'id'=>$id);
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
        $menus = Menus::find($id);
        $menus->deleted_at = date('Y-m-d H:i:s');
        $menus->updated_by = auth()->user()->id;
        if($menus->save()){
            $response = array('success'=>1,'msg'=>'Berhasil hapus rbac menu');
        }else{
            $response = array('success'=>2,'msg'=>'Gagal hapus rbac menu');
        }

        return response()->json($response);
    }
}

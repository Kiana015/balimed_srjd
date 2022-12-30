<?php

namespace App\Helpers;

use App\Models\User;
use App\Models\Menus;
use App\Models\Roles;
use App\Models\UserRole;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;


class RBACHelper{
    static function initSession(){
        $session_data = collect();
        $user = User::find(Auth::user()->id);

        // ambil role user
        $roles_ = collect();
        foreach ($user->roles as $r) {
            $data = array(
                'role_id' => $r->role_id,
                'role_name' => $r->role_name,
                'ability' => $r->ability
            );
            $roles_->push($data);
        }

        // cari role active
        $role_active = UserRole::join('rbac_roles', 'rbac_roles.role_id', 'rbac_user_role.role_id')
        ->where([
            'user_id' => Auth::user()->id,
            'active' => 1
        ])->first();
        
        // jika belum di set di db
        if (!$role_active) {
            $role_active = $user->roles->sortBy('role_id')->first();
            // update ke db kalau ada role active
            if ($role_active) {
                UserRole::where([
                    'user_id' => Auth::user()->id,
                    'role_id' => $role_active->role_id
                ])->update([
                    'active' => 1
                ]);
            } else {
                $roleDefault = Roles::where('is_default', 1)->first();
                if (!$roleDefault) {
                    $roleDefault = Roles::orderBy('role_id')->first();
                }
                UserRole::create([
                    'user_id' => Auth::user()->id,
                    'role_id' => $roleDefault->role_id,
                    'active' => 1
                ]);

                // ambil role user (lagi)
                $user = User::find(Auth::user()->id);
                $roles_ = collect();
                foreach ($user->roles as $r) {
                    $data = array(
                        'role_id' => $r->role_id,
                        'role_name' => $r->role_name,
                        'ability' => $r->ability
                    );
                    $roles_->push($data);
                }
                $role_active = UserRole::join('rbac_roles', 'rbac_roles.role_id', 'rbac_user_role.role_id')
                ->where([
                    'user_id' => Auth::user()->id,
                    'active' => 1
                ])->first();
            }
        }

        // set session
        $role_active_ = collect([
            'role_id' => $role_active->role_id,
            'role_name' => $role_active->role_name,
            'ability' => $role_active->ability
        ]);
        $session_data->put('roles', $roles_->toArray());
        $session_data->put('role_active', $role_active_->toArray());

        // ambil permission role_active
        $permissions_ = collect();
        $menu_id = [];
        foreach (Roles::find($role_active_->get('role_id'))->permissions->whereNull('deleted_at') as $perm) {
            $data = array(
                'perm_id' => $perm->perm_id,
                'perm_desc' => $perm->perm_desc
            );
            $menu_id[] = $perm->menu_id;
            $permissions_->push($data);
        }
        $session_data->put('permissions', $permissions_->toArray());

        // ambil menu yg bisa diakses dari role_active
        $menus = Menus::whereIn('id', $menu_id)->whereNull('deleted_at')->orderBy('parent_id','ASC')->orderBy('weight','ASC')->get()->toArray();

        $tree = function ($elements, $parentId = 0) use (&$tree) {
            $branch = array();
            foreach ($elements as $element) {

                if ($element['parent_id'] == $parentId) {

                    $children = $tree($elements, $element['id']);
                    if ($children) {
                        $element['children'] = $children;
                    } else {
                        $element['children'] = [];
                    }
                    $branch[] = $element;
                }
            }

            return $branch;
        };

        $tree = $tree($menus);
        $session_data->put('menu', $tree);
        Session::put($session_data->toArray());
        return true;
    }

    static function changeRoleActive($role_id){
        $session_data = collect();
        
        // update di rbac user role semua 0 active
        $userRole = UserRole::where([
            'user_id' => Auth::user()->id
        ])->update([
            'active' => 0
        ]);

        // cari nama role
        $role_active = Roles::where('role_id',$role_id)->first();

        // set session
        $role_active_ = collect([
            'role_id' => $role_active->role_id,
            'role_name' => $role_active->role_name,
            'ability' => $role_active->ability
        ]);
        $session_data->put('role_active', $role_active_->toArray());

        // update role yang active menjadi 1
        UserRole::where([
            'user_id' => Auth::user()->id,
            'role_id' => $role_id
        ])->update([
            'active' => 1
        ]);

        // ambil permission role_active
        $permissions_ = collect();
        $menu_id = [];
        foreach (Roles::find($role_active_->get('role_id'))->permissions->whereNull('deleted_at') as $perm) {
            $data = array(
                'perm_id' => $perm->perm_id,
                'perm_desc' => $perm->perm_desc,
            );
            $menu_id[] = $perm->menu_id;
            $permissions_->push($data);
        }
        $session_data->put('permissions', $permissions_->toArray());

        // ambil menu yg bisa diakses dari role_active
        $menus = Menus::whereIn('id', $menu_id)->whereNull('deleted_at')->orderBy('parent_id','ASC')->orderBy('weight','ASC')->get()->toArray();

        $tree = function ($elements, $parentId = 0) use (&$tree) {
            $branch = array();
            foreach ($elements as $element) {

                if ($element['parent_id'] == $parentId) {

                    $children = $tree($elements, $element['id']);
                    if ($children) {
                        $element['children'] = $children;
                    } else {
                        $element['children'] = [];
                    }
                    $branch[] = $element;
                }
            }

            return $branch;
        };

        $tree = $tree($menus);
        $session_data->put('menu', $tree);
        Session::put($session_data->toArray());
        return true;
    }

    static function hasPrivilege($perm_name)
    {
        return collect(Session::all()['permissions'])->contains('perm_desc', $perm_name);
    }

    static function hasRole($role_name)
    {
        return collect(Session::all()['roles'])->contains('role_name', $role_name);
    }

    static function isParentActive($menu){
        return collect(Session::all()['menu'])->contains('text', $menu);
    }
}
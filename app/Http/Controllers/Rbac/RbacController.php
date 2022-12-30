<?php

namespace App\Http\Controllers\Rbac;

use RBACHelper;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;

class RbacController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function changeRoleActive(Request $request, $role_id)
    {
        \RBACHelper::changeRoleActive($role_id);
        return redirect()->back();
    }
}

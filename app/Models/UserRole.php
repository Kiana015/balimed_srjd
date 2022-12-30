<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class UserRole extends Model
{
    protected $table = 'rbac_user_role';
    protected $primaryKey = 'id';

    protected $guarded = [];
}

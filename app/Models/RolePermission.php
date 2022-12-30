<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Traits\CreatedUpdatedBy;

class RolePermission extends Model
{
    use SoftDeletes, CreatedUpdatedBy;

    protected $table = 'rbac_role_permission';
    protected $primaryKey = 'role_id';

    protected $guarded = [];
}

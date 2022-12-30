<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Roles extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $table = 'rbac_roles';
    protected $primaryKey  = 'role_id';
    protected $guarded = ['role_id'];
    protected $dates = ['deleted_at'];

    public function permissions(){
        return $this->belongsToMany(Permissions::class, 'rbac_role_permission', 'role_id', 'perm_id','role_id','perm_id');
    }

    public function user(){
        return $this->belongsToMany(User::class, 'rbac_user_role', 'role_id', 'user_id','role_id','id');
    }
}

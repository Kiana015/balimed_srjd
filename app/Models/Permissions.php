<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Permissions extends Model
{
    use HasFactory;

    protected $table = 'rbac_permissions';
    protected $primaryKey  = 'perm_id';
    protected $guarded = ['perm_id'];
    public $timestamps = true;
    protected $fillable = [
        'perm_desc','group','menu_id','created_at','created_by','updated_at','updated_by'
    ];

    public function roles(){
        return $this->belongsToMany(Roles::class, 'rbac_role_permission', 'perm_id', 'role_id','perm_id','role_id');
    }

    public function menu(){
        return $this->hasOne(Menus::class,"id","menu_id");
    }
}

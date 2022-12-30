<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Menus extends Model
{
    use HasFactory;
    use \Staudenmeir\LaravelAdjacencyList\Eloquent\HasRecursiveRelationships;
    
    protected $table = 'rbac_menus';
    protected $primaryKey  = 'id';
    protected $guarded = ['id'];
    protected $fillable = [
        'text',
        'desc',
        'link',
        'route_name',
        'icon',
        'parent_id',
        'weight',
        'created_at',
        'created_by',
        'updated_at',
        'updated_by',
        'deleted_at'
    ];

    public function permission(){
        return $this->belongsTo("App\Models\Permissions","id","id_menu");
    }

    public function parent(){
        return $this->belongsTo('Modules\Rbac\Entities\Menu', 'parent','id');
    }

    public function child(){
        return $this->belongsTo('Modules\Rbac\Entities\Menu','id','parent');
    }
}

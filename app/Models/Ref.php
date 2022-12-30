<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Traits\CreatedUpdatedBy;

class Ref extends Model
{
    use SoftDeletes, CreatedUpdatedBy;

    protected $connection= 'mysql2';
    protected $table = 'm_ref';
    protected $primaryKey = 'id';

    protected $guarded = [];
}

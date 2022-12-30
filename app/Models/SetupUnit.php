<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SetupUnit extends Model
{
    protected $connection = 'mysql2';
    protected $table = 'm_setup_unit';
    protected $primaryKey = 'id';
    protected $guarded = [];
}

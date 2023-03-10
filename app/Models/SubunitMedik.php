<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class SubunitMedik extends Model
{
    use SoftDeletes;

    protected $connection= 'mysql2';
    protected $table = 'm_subunit_medik';
    protected $primaryKey = 'id';

    protected $guarded = [];
}

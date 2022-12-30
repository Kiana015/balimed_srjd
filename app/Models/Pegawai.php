<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Pegawai extends Model
{
    use SoftDeletes;

    protected $connection= 'mysql2';
    protected $table = 'm_pegawai';
    protected $primaryKey = 'id';

    protected $guarded = [];

    public function subunit () {
        return $this->belongsTo(SubunitMedik::class, 'subunit_id', 'id');
    }

    public function subunitDokter () {
        return $this->hasMany(SubunitDokter::class, 'pegawai_id', 'id');
    }
}

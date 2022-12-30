<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class tindakan extends Model
{
    protected $table = "tri_resiko_jatuh_dewasa_d";
    protected $fillable = [
        'tanggal', 'jam', 'tri_resiko_jatuh_dewasa_id',
        'std_rr1','std_rr2','std_rr3','std_rr4','std_rr5',
        'std_rr6','std_rr7','std_rr8','std_rr9','std_rr10',
        'std_rt1','std_rt2','std_rt3','std_rt4',
        'std_rt5','std_rt6','std_rt7','std_rt8',
        'std_rst1','std_rst2','std_rst3','std_rst4','std_rst5',
        'evaluasi','petugas_id','keterangan'
    ];
}

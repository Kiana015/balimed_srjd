<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class resikoJatuhDewasa extends Model
{
    use HasFactory;
    protected $table = "tri_resiko_jatuh_dewasa";
    protected $fillable = [
        'tanggal', 'jam', 'usia_pilihan', 'defisit_sensoris_pilihan','aktivitas_pilihan',
        'riwayat_jatuh_pilihan', 'kognisi_pilihan', 'pengobatan_pilihan',
        'mobilitas_pilihan', 'pola_bab_bak_pilihan', 'komorbiditas_pilihan',
        'keterangan', 'usia_skor', 'defisit_sensoris_skor', 'aktivitas_skor',
        'riwayat_jatuh_skor', 'kognisi_skor', 'pengobatan_skor','mobilitas_skor',
        'pola_bab_bak_skor', 'komorbiditas_skor', 'jumlah_skor', 'resiko'
    ];
}

<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Laravel\Sanctum\HasApiTokens;
use Illuminate\Notifications\Notifiable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = "rbac_users";

    /**
     * Indicates if the model should be timestamped.
     *
     * @var bool
     */
    public $timestamps = true;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'email',
        'phone',
        'nik',
        'tempat_lahir',
        'tanggal_lahir',
        'jenis_kelamin_id',
        'golongan_darah_id',
        'alamat_idcard',
        'provinsi_idcard',
        'kabupaten_idcard',
        'kecamatan_idcard',
        'desa_idcard',
        'dusun_idcard',
        'kodepos',
        'alamat_domisili',
        'provinsi_',
        'kabupaten_',
        'kecamatan_',
        'desa_',
        'dusun_',
        'kodepos_',
        'agama_id',
        'status_kawin_id',
        'pekerjaan_id',
        'gologan_darah_id',
        'status_wn',
        'kewarganegaraan_id',
        'file_photo',
        'file_ktp',
        'file_kk',
        'file_passport',
        'file_kitas',
        'email_verified_at',
        'phone_verified_at',
        'password',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
        'phone_verified_at' => 'datetime',
    ];
    
    public function roles(){
        return $this->belongsToMany(Roles::class,'rbac_user_role', 'user_id', 'role_id','id','role_id');
    }

    public function pasiens(){
        return $this->hasMany(User::class,'created_by','id');
    }
}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Traits\CreatedUpdatedBy;

class Triage extends Model
{
    use SoftDeletes, CreatedUpdatedBy;

    protected $connection = 'mysql2';
    protected $table = 'ugd_triage';
    protected $primaryKey = 'id';

    protected $fillable = [
        // "id",
        "layanan_id",
        "nomor_registrasi",
        "no_rm",
        "tanggal_datang",
        "jam_datang",
        // "created_at",
        // "created_by",
        // "updated_at",
        // "updated_by",
        // "deleted_at",
        "keluhan_utama",
        "riwayat_penyakit_dahulu",
        "alergi_id",
        "alergi_obat_id",
        "alergi_makanan_id",
        "alergi_udara_id",
        "alergi_debu_id",
        "alergi_des",
        "doa_tanda_hidup_minus",
        "doa_tidak_ada_denyut",
        "doa_rc_minmin",
        "doa_ekg_flat",
        "doa_waktu",
        "doa_trauma_obsetri",
        "tv_td_sistol",
        "tv_td_diastol",
        "tv_rr",
        "tv_nadi",
        "tv_suhu",
        "status_psi_nilai",
        "nyeri_nilai",
        "nyeri_lokasi",
        "nyeri_durasi",
        "resiko_jatuh",
        "jalan_nafas",
        "pernafasan",
        "sirkulasi",
        "kesadaran",
        "gcs_e",
        "gcs_v",
        "gcs_m",
        "keterangan",
        "kesimpulan_triage",
        "perawat_id",
        "dokter_id",
        "jn_obstruksi",
        "jn_parsial_obstruksi",
        "jn_paten",
        "pn_henti_nafas",
        "pn_distres_berat",
        "pn_nafas_berat",
        "pn_distres_ringan",
        "pn_nafas_normal",
        "sk_henti_jantung",
        "sk_gangguan_hmd",
        "sk_pendarahan_tt",
        "sk_gangguan_hmd_rs",
        "sk_nadi_kuat",
        "sk_frek_nadi_normal",
        "sk_td_normal",
        "ksd_gcs"
    ];
}

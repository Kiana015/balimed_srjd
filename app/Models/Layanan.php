<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Traits\CreatedUpdatedBy;

class Layanan extends Model
{
    use SoftDeletes, CreatedUpdatedBy;

    protected $connection = 'mysql2';
    protected $table = 't_layanan';
    protected $primaryKey = 'id';

    protected $fillable = [
        // "id",
        "pasien_id",
        "no_rm",
        "nomor_registrasi",
        "nomor_antrian",
        "tanggal_masuk",
        "tanggal_keluar",
        "is_pasien_baru",
        "is_kontrol",
        "waktu_awal",
        "waktu_akhir",
        "subunit_id",
        "dokter_id",
        "ners_id",
        "penjamin_id",
        "jenis_kedatangan",
        "faskes_id",
        "is_rujukan",
        "nomor_rujukan",
        "tanggal_rujukan",
        "nama_dokter_perujuk",
        "nama_smf_perujuk",
        "diagnosa_rujukan",
        "icd_rujukan_id",
        "mulai_berlaku_rujukan",
        "akhir_berlaku_rujukan",
        "is_cito",
        "is_resikojatuh",
        "tujuan_kunjungan_id",
        "datang_rs",
        "mulai_admisi",
        "akhir_admisi",
        "mulai_layan_poli",
        "akhir_layan_poli",
        "mulai_buat_obat",
        "akhir_selesai_obat",
        "akhir_kasir",
        "akhir_ambil_obat",
        "status_antrian",
        "status_antrian_ugd",
        "nationality_code1",
        "is_tarif_lokal",
        "status_kronis",
        "status_transaksi",
        "kelas_id",
        "nomor_kamar",
        "nomor_kamar_titip",
        "nomor_bed",
        // "created_at",
        // "created_by",
        // "updated_at",
        // "updated_by",
        // "deleted_at",
        "registered_by",
        "nomor_sep",
        "nomor_bpjs",
        "is_cob",
        "is_katarak",
        "is_kecelakaan",
        "jenis_kecelakaan_id",
        "keterangan_kecelakaan",
        "tanggal_kecelakaan",
        "asuransi_id",
        "is_suplesi_kecelakaan",
        "nomor_suplesi_kecelakaan",
        "provinsi_kecelakaan_id",
        "kabupaten_kecelakaan_id",
        "kecamatan_kecelakaan_id",
        "instalasi_id",
        "unit_id",
        "kanal_id",
        "dpjp_id",
        "alamat_ditemukan",
        "tgl_ditemukan",
        "tanggal_rujukan_awal",
        "tanggal_rujukan_akhir",
        "status_pinlan",
        "dokter_dpjp_id",
        "dokter_dpjp"
    ];

    public function pasien() {
        return $this->belongsTo(Pasien::class, 'pasien_id', 'id');
    }
}

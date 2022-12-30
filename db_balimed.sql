/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 10.4.25-MariaDB : Database - db_balimed
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `bpjs_batal_booking_ant` */

DROP TABLE IF EXISTS `bpjs_batal_booking_ant`;

CREATE TABLE `bpjs_batal_booking_ant` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kodebooking` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_batal` smallint(6) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `bpjs_batal_booking_ant` */

/*Table structure for table `bpjs_booking_ant` */

DROP TABLE IF EXISTS `bpjs_booking_ant`;

CREATE TABLE `bpjs_booking_ant` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kodebooking` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jenispasien` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nomorkartu` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nik` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nohp` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kodepoli` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `namapoli` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pasienbaru` smallint(6) DEFAULT NULL,
  `norm` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggalperiksa` date DEFAULT NULL,
  `kodesubspesialis` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kodedokter` bigint(20) DEFAULT NULL,
  `namadokter` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jampraktek` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jeniskunjungan` smallint(6) DEFAULT NULL,
  `nomorreferensi` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nomorantrean` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `angkaantrean` int(11) DEFAULT NULL,
  `estimasidilayani` int(11) DEFAULT NULL,
  `sisakuotajkn` int(11) DEFAULT NULL,
  `kuotajkn` int(11) DEFAULT NULL,
  `sisakuotanonjkn` int(11) DEFAULT NULL,
  `kuotanonjkn` int(11) DEFAULT NULL,
  `keterangan` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `statusbooking` smallint(6) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `bpjs_booking_ant` */

/*Table structure for table `bpjs_dokter_ant` */

DROP TABLE IF EXISTS `bpjs_dokter_ant`;

CREATE TABLE `bpjs_dokter_ant` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kddokter` bigint(20) NOT NULL,
  `nmdokter` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `bpjs_dokter_ant` */

/*Table structure for table `bpjs_inacbgs` */

DROP TABLE IF EXISTS `bpjs_inacbgs`;

CREATE TABLE `bpjs_inacbgs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `bpjs_inacbgs` */

/*Table structure for table `bpjs_jadwal_dokter_ant` */

DROP TABLE IF EXISTS `bpjs_jadwal_dokter_ant`;

CREATE TABLE `bpjs_jadwal_dokter_ant` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kodesubspesialis` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal_jadwal` date DEFAULT NULL,
  `hari` smallint(6) DEFAULT NULL,
  `namahari` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `libur` smallint(6) DEFAULT NULL,
  `jadwal` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `namasubspesialis` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kodepoli` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `namapoli` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kodedokter` bigint(20) DEFAULT NULL,
  `namadokter` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kapasistaspasien` smallint(6) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `bpjs_jadwal_dokter_ant` */

/*Table structure for table `bpjs_list_taskid_ant` */

DROP TABLE IF EXISTS `bpjs_list_taskid_ant`;

CREATE TABLE `bpjs_list_taskid_ant` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kodebooking` bigint(30) NOT NULL,
  `taskid` smallint(6) NOT NULL,
  `taskname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `waktu` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wakturs` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `bpjs_list_taskid_ant` */

/*Table structure for table `bpjs_poli_ant` */

DROP TABLE IF EXISTS `bpjs_poli_ant`;

CREATE TABLE `bpjs_poli_ant` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kdpoli` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nmpoli` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kdsubspesialis` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nmsubspesialis` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `bpjs_poli_ant` */

/*Table structure for table `bpjs_update_jadwal_ant` */

DROP TABLE IF EXISTS `bpjs_update_jadwal_ant`;

CREATE TABLE `bpjs_update_jadwal_ant` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kodepoli` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kodesubspesialis` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kodedokter` bigint(20) DEFAULT NULL,
  `hari` smallint(6) DEFAULT NULL,
  `buka` time DEFAULT NULL,
  `tutup` time DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `bpjs_update_jadwal_ant` */

/*Table structure for table `bpjs_update_waktu_ant` */

DROP TABLE IF EXISTS `bpjs_update_waktu_ant`;

CREATE TABLE `bpjs_update_waktu_ant` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kodebooking` bigint(30) NOT NULL,
  `task_id` smallint(6) NOT NULL,
  `waktu` timestamp NULL DEFAULT NULL,
  `status_update` smallint(6) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `bpjs_update_waktu_ant` */

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `failed_jobs` */

/*Table structure for table `m_agama` */

DROP TABLE IF EXISTS `m_agama`;

CREATE TABLE `m_agama` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `m_agama` */

/*Table structure for table `m_asuransi` */

DROP TABLE IF EXISTS `m_asuransi`;

CREATE TABLE `m_asuransi` (
  `id` int(11) DEFAULT NULL,
  `kode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `m_asuransi` */

/*Table structure for table `m_bahasaaktif` */

DROP TABLE IF EXISTS `m_bahasaaktif`;

CREATE TABLE `m_bahasaaktif` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `kode` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `m_bahasaaktif` */

/*Table structure for table `m_carabayar` */

DROP TABLE IF EXISTS `m_carabayar`;

CREATE TABLE `m_carabayar` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `kode` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `nama` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT 'CASH, DEBIT BCA, DEBIT BNI, QRIS, CREDIT, dll',
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `regencies_province_id_index` (`kode`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `m_carabayar` */

/*Table structure for table `m_desa` */

DROP TABLE IF EXISTS `m_desa`;

CREATE TABLE `m_desa` (
  `id` char(10) COLLATE utf8_unicode_ci NOT NULL,
  `kecamatan_id` char(7) COLLATE utf8_unicode_ci NOT NULL,
  `nama_desa` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `villages_district_id_index` (`kecamatan_id`),
  CONSTRAINT `villages_district_id_foreign` FOREIGN KEY (`kecamatan_id`) REFERENCES `m_kecamatan` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `m_desa` */

/*Table structure for table `m_diagnosa` */

DROP TABLE IF EXISTS `m_diagnosa`;

CREATE TABLE `m_diagnosa` (
  `kd_diagnosa` varchar(10) NOT NULL,
  `kd_dtd` varchar(10) NOT NULL,
  `nm_diagnosa` varchar(200) NOT NULL,
  `ket` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`kd_diagnosa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `m_diagnosa` */

/*Table structure for table `m_farmasi` */

DROP TABLE IF EXISTS `m_farmasi`;

CREATE TABLE `m_farmasi` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nama_group` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Satu tabel master untuk semua;ex. jenis; satuan; kelompok;golongan;skt (sub kelas therapy);satuandosis;formularium_rs;formularium_nas;tipe',
  `kode` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'entry',
  `nama` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'entry;ex. untuk namagroup=Jenis, maka nilainya: 1. Obat; 2. Alkes',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `m_farmasi` */

/*Table structure for table `m_farmasi_adj` */

DROP TABLE IF EXISTS `m_farmasi_adj`;

CREATE TABLE `m_farmasi_adj` (
  `id` bigint(11) unsigned NOT NULL,
  `nomor` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry/otomatis: nomor opname',
  `tanggal_awal` datetime DEFAULT NULL COMMENT 'entry:tanggal adjusment barang masuk',
  `tanggal_akhir` datetime DEFAULT NULL COMMENT 'entry',
  `subunit_id` int(11) DEFAULT NULL COMMENT 'entry:m_subunit_medik;di adjusment',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:m_farmasi_distributor',
  `status_kode` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:m_farmasi;status adjusment;0=Dalam Proses; 1= Sudah Selesai',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL COMMENT 'entry:pegawai_id',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL COMMENT 'entry:pegawai_id',
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `kode_owner` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:kode unit/subunit pemilik dokumen ini',
  `jdoc_id` int(11) DEFAULT NULL COMMENT 'entry:m_mo_jdoc',
  `kode_doc` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'entry:prefix di m_mo_jdoc + kode_owner + nomor',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `m_farmasi_adj` */

/*Table structure for table `m_farmasi_barang` */

DROP TABLE IF EXISTS `m_farmasi_barang`;

CREATE TABLE `m_farmasi_barang` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `kode_barang` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'entry',
  `nama_barang` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'entry',
  `jenis_kode` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'entry:m_farmasi dengan group Jenis ;ex: 1. Obat; 2. Alat Kesehatan, dll',
  `satuan_kode` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'entry:m_farmasi dengan group satuan;ex. tablet; botol; ampul; vial; dll',
  `kelompok_kode` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'entry:m_farmasi dengan group kelompok;ex. sirup, krim, tabelt, dll',
  `golongan_kode` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'entry:m_farmasi dengan group golongan; ex. keras, bebas',
  `komposisi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:ex. mengandung ini itu 5mg',
  `skt_kode` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:m_farmasi dengan group Sub Kelas Therapy ;ex. antibiotik, anti diabet, dll',
  `dosis` smallint(6) DEFAULT NULL COMMENT 'entry:ex.120 mg',
  `satuandosis_kode` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:m_farmasi dengan group satuan dosis; ex. mg, ml',
  `formula_rs_kode` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:m_farmasi dengan group Formularium RS;ex. paten, generic, non for RS dll',
  `formula_nas_kode` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:m_farmasi demgam group Fromularium Nasional;ex. paten,generic, dll',
  `pabrik_kode` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:m_farmasi_pabrik',
  `harga_hna` double DEFAULT NULL COMMENT 'entry',
  `tipe_kode` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:m_farmasi dengan group Tipe;ex. Konsinyasi, non konsinyasi',
  `file_gambar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `is_pt` tinyint(4) DEFAULT NULL COMMENT 'entry:m_yesno;protokol terapi apa tidak',
  `alasan_pt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:alasan protokol terapi',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `m_farmasi_barang` */

/*Table structure for table `m_farmasi_baranglokasi` */

DROP TABLE IF EXISTS `m_farmasi_baranglokasi`;

CREATE TABLE `m_farmasi_baranglokasi` (
  `id` int(11) unsigned NOT NULL,
  `lokasi_id` int(11) DEFAULT NULL COMMENT 'entry:m_subunit; bisa gudang;depo;unit lainnya',
  `barang_id` int(11) DEFAULT NULL COMMENT 'entry:m_farmasi_produkarang',
  `stock` int(11) DEFAULT NULL COMMENT 'entry',
  `stokmin` smallint(6) DEFAULT NULL,
  `stokmax` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `m_farmasi_baranglokasi` */

/*Table structure for table `m_farmasi_distributor` */

DROP TABLE IF EXISTS `m_farmasi_distributor`;

CREATE TABLE `m_farmasi_distributor` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `kode_dis` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:ex. P1',
  `nama_dis` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:ex. PT Sanbefarma Indonesia',
  `nama_dagang` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:ex. Sanbe',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `alamat` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_telp` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_aktif` tinyint(4) DEFAULT NULL COMMENT '1=aktif; 0 = tidak aktif',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `m_farmasi_distributor` */

/*Table structure for table `m_farmasi_konsin` */

DROP TABLE IF EXISTS `m_farmasi_konsin`;

CREATE TABLE `m_farmasi_konsin` (
  `id` bigint(11) unsigned NOT NULL,
  `tanggal` datetime DEFAULT NULL COMMENT 'entry:tanggal konsinyasi barang masuk',
  `nomor` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry/otomatis: nomor preorder',
  `distributor_id` int(11) DEFAULT NULL COMMENT 'entry:m_farmasi_distributor',
  `disc` float DEFAULT NULL COMMENT 'entry',
  `ppn` float DEFAULT NULL COMMENT 'entry',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL COMMENT 'entry:pegawai_id',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL COMMENT 'entry:pegawai_id',
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `kode_owner` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:kode unit/subunit pemilik dokumen ini',
  `jdoc_id` int(11) DEFAULT NULL COMMENT 'entry:m_mo_jdoc',
  `kode_doc` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'entry:prefix di m_mo_jdoc + kode_owner + nomor',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `m_farmasi_konsin` */

/*Table structure for table `m_farmasi_konsout` */

DROP TABLE IF EXISTS `m_farmasi_konsout`;

CREATE TABLE `m_farmasi_konsout` (
  `id` bigint(11) unsigned NOT NULL,
  `tanggal` datetime DEFAULT NULL COMMENT 'entry:tanggal konsinyasi barang masuk',
  `nomor` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry/otomatis: nomor preorder',
  `distributor_id` int(11) DEFAULT NULL COMMENT 'entry:m_farmasi_distributor',
  `disc` float DEFAULT NULL COMMENT 'entry',
  `ppn` float DEFAULT NULL COMMENT 'entry',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL COMMENT 'entry:pegawai_id',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL COMMENT 'entry:pegawai_id',
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `kode_owner` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:kode unit/subunit pemilik dokumen ini',
  `jdoc_id` int(11) DEFAULT NULL COMMENT 'entry:m_mo_jdoc',
  `kode_doc` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'entry:prefix di m_mo_jdoc + kode_owner + nomor',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `m_farmasi_konsout` */

/*Table structure for table `m_farmasi_mutasi` */

DROP TABLE IF EXISTS `m_farmasi_mutasi`;

CREATE TABLE `m_farmasi_mutasi` (
  `id` bigint(11) unsigned NOT NULL,
  `tanggal` datetime DEFAULT NULL COMMENT 'entry:tanggal preorder',
  `nomor` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry/otomatis: nomor preorder',
  `subunit_id_a` int(11) DEFAULT NULL COMMENT 'entry:m_subunit_medik asal',
  `subunit_id_t` int(11) DEFAULT NULL COMMENT 'entry:m_subunit_tujuan',
  `status_proses` tinyint(4) DEFAULT NULL COMMENT 'entry:1.Barang Keluar; 2. Barang diterima; 3. Selesai',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL COMMENT 'entry:m_pegawai;pegawai yang membuat mutasi barang',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `kode_owner` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:kode unit/subunit pemilik dokumen ini',
  `jdoc_id` int(11) DEFAULT NULL COMMENT 'entry:m_mo_jdoc',
  `kode_doc` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:prefix di m_mo_jdoc + kode_owner + nomor',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `m_farmasi_mutasi` */

/*Table structure for table `m_farmasi_opname` */

DROP TABLE IF EXISTS `m_farmasi_opname`;

CREATE TABLE `m_farmasi_opname` (
  `id` bigint(11) unsigned NOT NULL,
  `nomor` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry/otomatis: nomor opname',
  `tanggal_mulai` datetime DEFAULT NULL COMMENT 'entry:tanggal konsinyasi barang masuk',
  `tanggal_akhir` datetime DEFAULT NULL COMMENT 'entry:mulai opname',
  `subunit_id` int(11) DEFAULT NULL COMMENT 'entry:m_subunit_medik;diopname',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:m_farmasi_distributor',
  `so_id` tinyint(4) DEFAULT NULL COMMENT 'entry:status update stock;1=Sudah Updated; 0 = Belum Updated; ini dipakai bila update ke stock secara batch',
  `so_date` datetime DEFAULT NULL COMMENT 'entry:tanggal status update stock',
  `jenis_id` smallint(6) DEFAULT NULL COMMENT 'entry:m_farmasi',
  `kelompok_id` smallint(6) DEFAULT NULL COMMENT 'entry:m_farmasi',
  `golongan_id` smallint(6) DEFAULT NULL COMMENT 'entry:m_farmasi',
  `tipe_id` smallint(6) DEFAULT NULL COMMENT 'entry:m_farmasi',
  `status_id` tinyint(4) DEFAULT NULL COMMENT 'entry:m_farmasi;status opname;0=Dalam Proses ;1=Sudah Selsai',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL COMMENT 'entry:pegawai_id',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL COMMENT 'entry:pegawai_id',
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `kode_owner` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:kode unit/subunit pemilik dokumen ini',
  `jdoc_id` int(11) DEFAULT NULL COMMENT 'entry:m_mo_jdoc',
  `kode_doc` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'entry:prefix di m_mo_jdoc + kode_owner + nomor',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `m_farmasi_opname` */

/*Table structure for table `m_farmasi_pabrik` */

DROP TABLE IF EXISTS `m_farmasi_pabrik`;

CREATE TABLE `m_farmasi_pabrik` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:ex. P1',
  `nama_pabrik` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:ex. PT Sanbefarma Indonesia',
  `nama_dagang` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:ex. Sanbe',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `m_farmasi_pabrik` */

/*Table structure for table `m_farmasi_po` */

DROP TABLE IF EXISTS `m_farmasi_po`;

CREATE TABLE `m_farmasi_po` (
  `id` bigint(11) unsigned NOT NULL,
  `tanggal` datetime DEFAULT NULL COMMENT 'entry:tanggal preorder',
  `nomor` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry/otomatis: nomor preorder',
  `distributor_id` int(11) DEFAULT NULL COMMENT 'entry:m_subunit_medik',
  `disc` float DEFAULT NULL COMMENT 'entry',
  `ppn` float DEFAULT NULL COMMENT 'entry',
  `status_kode` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:m_farmasi;status po;0.Belum dipenuhi 0. Belum dipenuhi; 1.Terpenuhi Sebagian; 2. Selesai',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL COMMENT 'entry:pegawai_id',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL COMMENT 'entry:pegawai_id',
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `kode_owner` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:kode unit/subunit pemilik dokumen ini',
  `jdoc_id` int(11) DEFAULT NULL COMMENT 'entry:m_mo_jdoc',
  `kode_doc` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'entry:prefix di m_mo_jdoc + kode_owner + nomor',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `m_farmasi_po` */

/*Table structure for table `m_farmasi_preorder` */

DROP TABLE IF EXISTS `m_farmasi_preorder`;

CREATE TABLE `m_farmasi_preorder` (
  `id` bigint(11) unsigned NOT NULL,
  `tanggal` datetime DEFAULT NULL COMMENT 'entry:tanggal preorder',
  `nomor` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry/otomatis: nomor preorder',
  `subunit_id_a` int(11) DEFAULT NULL COMMENT 'entry:m_subunit_medik yang melakukan preorder',
  `subunit_id_t` int(11) DEFAULT NULL COMMENT 'entry:m_subunit_medik, subunit yang dituju untuk memenuhi permintaan',
  `status_proses` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:m_farmasi; 1.Preorder Masuk; 2. Preorder diproses; 3. Terpenuhi sebagian; 4. Selesai',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL COMMENT 'entry:m_pegawai;yang membuat preorder',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `kode_owner` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jdoc_id` int(11) DEFAULT NULL,
  `kode_doc` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `m_farmasi_preorder` */

/*Table structure for table `m_farmasi_resep` */

DROP TABLE IF EXISTS `m_farmasi_resep`;

CREATE TABLE `m_farmasi_resep` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `layanan_id` bigint(20) DEFAULT NULL COMMENT 't_layanan',
  `nomor_registrasi` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'entry',
  `nomor_resep` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry ;otomatis',
  `nomor_nota` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'entry;ex. untuk namagroup=Jenis, maka nilainya: 1. Obat; 2. Alkes',
  `status_nota` tinyint(4) DEFAULT NULL COMMENT 'entry:m_yesno;nota sudah terkirim ke kasir Ya atau Belum',
  `is_tr` tinyint(4) DEFAULT NULL COMMENT 'telaah resep:m_yesno',
  `is_to` tinyint(4) DEFAULT NULL COMMENT 'telaah obat:m_yesno',
  `pegawai_id_tr` int(11) DEFAULT NULL COMMENT 'entry:pegawai id telaah resep;m_pegawai',
  `pegawai_id_to` int(11) DEFAULT NULL COMMENT 'entry:pegawai id telaah obat;m_pegawai',
  `waktu_tr` time DEFAULT NULL COMMENT 'entry:waktu telaah resep',
  `waktu_to` time DEFAULT NULL COMMENT 'entry:waktu telaah obat',
  `status_a_id` tinyint(4) DEFAULT NULL COMMENT 'status resep A:m_farmasi;',
  `status_b_id` tinyint(4) DEFAULT NULL COMMENT 'status resep B:m_farmasi',
  `pegawai_id_i` int(11) DEFAULT NULL COMMENT 'entry:m_pegawai;pegawai yang memasukan',
  `pegawai_id_p` int(11) DEFAULT NULL COMMENT 'entry:m_pegawai;pegawai yang memeriksa',
  `pegawai_id_s` int(11) DEFAULT NULL COMMENT 'entry:m_pegawai;pegawai yang menyerahkan',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'jam masuk resep',
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `m_farmasi_resep` */

/*Table structure for table `m_farmasi_returd` */

DROP TABLE IF EXISTS `m_farmasi_returd`;

CREATE TABLE `m_farmasi_returd` (
  `id` bigint(11) unsigned NOT NULL,
  `tanggal` datetime DEFAULT NULL COMMENT 'entry:tanggal preorder',
  `nomor` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry/otomatis: nomor preorder',
  `subunit_id` int(11) DEFAULT NULL COMMENT 'entry:gudang farmasi, m_subunit_medik asal',
  `distributor_id_t` int(11) DEFAULT NULL COMMENT 'entry:distributor',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `status_kode` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_farmasi;1. Dibuat 2. Dikirim',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL COMMENT 'entry:m_pegawai;pegawai yang membuat mutasi barang',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `kode_owner` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jdoc_id` int(11) DEFAULT NULL,
  `kode_doc` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `m_farmasi_returd` */

/*Table structure for table `m_farmasi_returg` */

DROP TABLE IF EXISTS `m_farmasi_returg`;

CREATE TABLE `m_farmasi_returg` (
  `id` bigint(11) unsigned NOT NULL,
  `tanggal` datetime DEFAULT NULL COMMENT 'entry:tanggal preorder',
  `nomor` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry/otomatis: nomor return g',
  `subunit_id_a` int(11) DEFAULT NULL COMMENT 'entry:depo/unit, m_subunit_medik asal',
  `subunit_id_t` int(11) DEFAULT NULL COMMENT 'entry:gudang, m_subunit_medik;gudang yang dituju',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL COMMENT 'entry:m_pegawai;pegawai yang membuat mutasi barang',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `kode_owner` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jdoc_id` int(11) DEFAULT NULL,
  `kode_doc` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `m_farmasi_returg` */

/*Table structure for table `m_farmasi_ro` */

DROP TABLE IF EXISTS `m_farmasi_ro`;

CREATE TABLE `m_farmasi_ro` (
  `id` bigint(11) unsigned NOT NULL,
  `tanggal` datetime DEFAULT NULL COMMENT 'entry:tanggal faktur',
  `nomor_ro` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:otomatis;prefix di m_mo_jdoc +  nomor',
  `nomor_faktur` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `distributor_id` int(11) DEFAULT NULL COMMENT 'entry:m_subunit_medik',
  `disc` float DEFAULT NULL COMMENT 'entry',
  `ppn` float DEFAULT NULL COMMENT 'entry',
  `carabayar_id` tinyint(4) DEFAULT NULL COMMENT 'entry:m_farmasi, Cara Bayar: 1. Credit; 2. COD; dll',
  `tanggal_jt` date DEFAULT NULL COMMENT 'entry:tanggal jatuh tempo bayar',
  `biaya_lain` float DEFAULT NULL COMMENT 'entry',
  `kepada` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:nama pelanggan dituju(balimed)',
  `telp` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:telp pelanggan dituju',
  `alamat` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:alamat pelanggan dituju',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_pdf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL COMMENT 'entry:pegawai_id',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL COMMENT 'entry:pegawai_id',
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `kode_owner` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:kode unit/subunit pemilik dokumen ini',
  `jdoc_id` int(11) DEFAULT NULL COMMENT 'entry:m_mo_jdoc',
  `kode_doc` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'entry: nomor_ro',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `m_farmasi_ro` */

/*Table structure for table `m_faskes` */

DROP TABLE IF EXISTS `m_faskes`;

CREATE TABLE `m_faskes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'entry',
  `kode_bpjs` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `nama` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry(Puskesmas A,B, Klinik A, B dll)',
  `group_faskes_kode` smallint(6) DEFAULT NULL COMMENT 'm_group_faskes',
  `group_bpjs_kode` smallint(6) DEFAULT NULL COMMENT 'm_group_rujukan_bpjs',
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `kecamatan_id` int(11) DEFAULT NULL COMMENT 'm_kecamatan',
  `kabupaten_id` int(11) DEFAULT NULL COMMENT 'm_kabupaten',
  `provinsi_id` int(11) DEFAULT NULL COMMENT 'm_provinsi',
  `no_telp` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `tipe` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kelas` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=349 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `m_faskes` */

/*Table structure for table `m_golongan_darah` */

DROP TABLE IF EXISTS `m_golongan_darah`;

CREATE TABLE `m_golongan_darah` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `m_golongan_darah` */

/*Table structure for table `m_group_faskes` */

DROP TABLE IF EXISTS `m_group_faskes`;

CREATE TABLE `m_group_faskes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `m_group_faskes` */

/*Table structure for table `m_group_rujukan_bpjs` */

DROP TABLE IF EXISTS `m_group_rujukan_bpjs`;

CREATE TABLE `m_group_rujukan_bpjs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `istilah` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `m_group_rujukan_bpjs` */

/*Table structure for table `m_grup_menu_master_data` */

DROP TABLE IF EXISTS `m_grup_menu_master_data`;

CREATE TABLE `m_grup_menu_master_data` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nama_grup` varchar(255) DEFAULT NULL,
  `deskripsi` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `m_grup_menu_master_data` */

/*Table structure for table `m_hari` */

DROP TABLE IF EXISTS `m_hari`;

CREATE TABLE `m_hari` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `hari_ind` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hari_eng` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `m_hari` */

/*Table structure for table `m_hubungankerabat` */

DROP TABLE IF EXISTS `m_hubungankerabat`;

CREATE TABLE `m_hubungankerabat` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hubungan_kerabat` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `m_hubungankerabat` */

/*Table structure for table `m_icons` */

DROP TABLE IF EXISTS `m_icons`;

CREATE TABLE `m_icons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(50) NOT NULL,
  `text` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1375 DEFAULT CHARSET=latin1;

/*Data for the table `m_icons` */

/*Table structure for table `m_ikatan_kerjasama` */

DROP TABLE IF EXISTS `m_ikatan_kerjasama`;

CREATE TABLE `m_ikatan_kerjasama` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `kode_iks` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama_iks` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `penjamin_pasien_id` int(11) DEFAULT NULL,
  `status_aktif` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `masa_berlaku_awal` date DEFAULT NULL,
  `masa_berlaku_akhir` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=175 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `m_ikatan_kerjasama` */

/*Table structure for table `m_jadwal_layanan` */

DROP TABLE IF EXISTS `m_jadwal_layanan`;

CREATE TABLE `m_jadwal_layanan` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `version_id` int(11) unsigned DEFAULT NULL COMMENT 'entry:m_jadwal_version',
  `hari_id` int(11) unsigned DEFAULT NULL COMMENT 'entry:m_hari',
  `dokter_id` bigint(20) unsigned DEFAULT NULL COMMENT 'entry:m_pegawai',
  `subunit_id` int(11) unsigned DEFAULT NULL COMMENT 'entry:m_subunit_medik',
  `ruangan_id` int(11) unsigned DEFAULT NULL COMMENT 'entry:m_subunit_ruangan',
  `waktu_awal` time DEFAULT NULL,
  `waktu_akhir` time DEFAULT NULL,
  `status_jadwal` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:m_jadwal_sattus',
  `kuota_standar` smallint(6) DEFAULT NULL COMMENT 'entry:default m_kuota',
  `kuota_tambahan` smallint(6) DEFAULT NULL COMMENT 'entry:default m_kuota',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `version_id` (`version_id`),
  KEY `hari_id` (`hari_id`),
  KEY `dokter_id` (`dokter_id`),
  KEY `subunit_id` (`subunit_id`),
  KEY `ruangan_id` (`ruangan_id`),
  CONSTRAINT `m_jadwal_layanan_ibfk_1` FOREIGN KEY (`version_id`) REFERENCES `m_jadwal_version` (`id`),
  CONSTRAINT `m_jadwal_layanan_ibfk_2` FOREIGN KEY (`hari_id`) REFERENCES `m_hari` (`id`),
  CONSTRAINT `m_jadwal_layanan_ibfk_4` FOREIGN KEY (`dokter_id`) REFERENCES `m_pegawai` (`id`),
  CONSTRAINT `m_jadwal_layanan_ibfk_5` FOREIGN KEY (`subunit_id`) REFERENCES `m_subunit_medik` (`id`),
  CONSTRAINT `m_jadwal_layanan_ibfk_6` FOREIGN KEY (`ruangan_id`) REFERENCES `m_subunit_ruangan` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `m_jadwal_layanan` */

/*Table structure for table `m_jadwal_status` */

DROP TABLE IF EXISTS `m_jadwal_status`;

CREATE TABLE `m_jadwal_status` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:Buka,Tutup,Libur',
  `is_default` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `m_jadwal_status` */

/*Table structure for table `m_jadwal_version` */

DROP TABLE IF EXISTS `m_jadwal_version`;

CREATE TABLE `m_jadwal_version` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `version` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_aktif` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `m_jadwal_version` */

/*Table structure for table `m_jenis_kelamin` */

DROP TABLE IF EXISTS `m_jenis_kelamin`;

CREATE TABLE `m_jenis_kelamin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `m_jenis_kelamin` */

/*Table structure for table `m_jenis_kunjungan` */

DROP TABLE IF EXISTS `m_jenis_kunjungan`;

CREATE TABLE `m_jenis_kunjungan` (
  `id` int(11) NOT NULL,
  `kode_kunjungan` smallint(6) NOT NULL,
  `nama_kunjungan` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `m_jenis_kunjungan` */

/*Table structure for table `m_jenis_pegawai` */

DROP TABLE IF EXISTS `m_jenis_pegawai`;

CREATE TABLE `m_jenis_pegawai` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'entry',
  `nama` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Dokter;2=Perawat;3=Bidan;4=dst',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `m_jenis_pegawai` */

/*Table structure for table `m_jenispegawai` */

DROP TABLE IF EXISTS `m_jenispegawai`;

CREATE TABLE `m_jenispegawai` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `jenis` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Dokter 2 = Perawat 3 = Bidan 4 = Pegawai dll',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `m_jenispegawai` */

/*Table structure for table `m_kabupaten` */

DROP TABLE IF EXISTS `m_kabupaten`;

CREATE TABLE `m_kabupaten` (
  `id` char(4) COLLATE utf8_unicode_ci NOT NULL,
  `provinsi_id` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `nama_kabupaten` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `regencies_province_id_index` (`provinsi_id`),
  CONSTRAINT `regencies_province_id_foreign` FOREIGN KEY (`provinsi_id`) REFERENCES `m_provinsi` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `m_kabupaten` */

/*Table structure for table `m_kasus` */

DROP TABLE IF EXISTS `m_kasus`;

CREATE TABLE `m_kasus` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `kode` tinyint(4) DEFAULT NULL,
  `nama` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `m_kasus` */

/*Table structure for table `m_kecamatan` */

DROP TABLE IF EXISTS `m_kecamatan`;

CREATE TABLE `m_kecamatan` (
  `id` char(7) COLLATE utf8_unicode_ci NOT NULL,
  `kabupaten_id` char(4) COLLATE utf8_unicode_ci NOT NULL,
  `nama_kecamatan` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `districts_id_index` (`kabupaten_id`),
  CONSTRAINT `districts_regency_id_foreign` FOREIGN KEY (`kabupaten_id`) REFERENCES `m_kabupaten` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `m_kecamatan` */

/*Table structure for table `m_kelas` */

DROP TABLE IF EXISTS `m_kelas`;

CREATE TABLE `m_kelas` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `kode_kelas` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama_kelas` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_aktif` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `m_kelas` */

/*Table structure for table `m_kualifikasi` */

DROP TABLE IF EXISTS `m_kualifikasi`;

CREATE TABLE `m_kualifikasi` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `periode_valid` date DEFAULT NULL,
  `organisasi` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_kualifikasi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `m_kualifikasi` */

/*Table structure for table `m_kuota` */

DROP TABLE IF EXISTS `m_kuota`;

CREATE TABLE `m_kuota` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `kuotastandar` smallint(6) DEFAULT NULL,
  `kuotatambahan` smallint(6) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `m_kuota` */

/*Table structure for table `m_landingpage` */

DROP TABLE IF EXISTS `m_landingpage`;

CREATE TABLE `m_landingpage` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `judul` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_aktif` smallint(6) NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipe` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `m_landingpage` */

/*Table structure for table `m_lisensi` */

DROP TABLE IF EXISTS `m_lisensi`;

CREATE TABLE `m_lisensi` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tahun` smallint(50) NOT NULL,
  `namaaplikasi` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lisensito` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `m_lisensi` */

/*Table structure for table `m_menu_master_data` */

DROP TABLE IF EXISTS `m_menu_master_data`;

CREATE TABLE `m_menu_master_data` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `grup_menu_master_data_id` int(10) DEFAULT NULL COMMENT 'm_grup_menu_master_data',
  `nama_menu` varchar(255) DEFAULT NULL,
  `href` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `grup_master_data_id` (`grup_menu_master_data_id`),
  CONSTRAINT `m_menu_master_data_ibfk_1` FOREIGN KEY (`grup_menu_master_data_id`) REFERENCES `m_grup_menu_master_data` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

/*Data for the table `m_menu_master_data` */

/*Table structure for table `m_mo_jdoc` */

DROP TABLE IF EXISTS `m_mo_jdoc`;

CREATE TABLE `m_mo_jdoc` (
  `id` int(11) unsigned NOT NULL,
  `kode_jdoc` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:D001',
  `nama_jdoc` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:Purchase Order',
  `prefix_jdoc` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:prefix untuk jenis dokumen,dipakai dalam pengkodean doc',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `m_mo_jdoc` */

/*Table structure for table `m_mo_proof` */

DROP TABLE IF EXISTS `m_mo_proof`;

CREATE TABLE `m_mo_proof` (
  `id` int(11) unsigned NOT NULL,
  `jdoc_id` int(11) NOT NULL COMMENT 'entry:jenis dokumen yang diapprove',
  `kode_owner` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'entry:unit/subunit pemilik',
  `jab_id` int(11) NOT NULL COMMENT 'entry:jabatan yang mengapprove dokumen',
  `order_proof` tinyint(11) NOT NULL COMMENT 'entry:urutan jabatan yang approve',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `m_mo_proof` */

/*Table structure for table `m_mo_struktur` */

DROP TABLE IF EXISTS `m_mo_struktur`;

CREATE TABLE `m_mo_struktur` (
  `id` int(11) unsigned NOT NULL,
  `kode_jab` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'entry:J001',
  `nama_jab` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'entry:Direktur',
  `nama_org` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'entry:nama unit organisasi',
  `tipe_id` smallint(6) NOT NULL COMMENT 'entry:m_mo_tipe; tipe unit organisasi; 0.Induk ; 1. Unit; 2. Sub Unit; 3. Sub Sub Unit; dll',
  `level` tinyint(4) NOT NULL COMMENT 'entry:level unit organisais',
  `parent_id` smallint(6) NOT NULL COMMENT 'entry:induk dari jabatan ini',
  `pegawai_id` int(11) NOT NULL COMMENT 'entry:pejabat saat ini',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `m_mo_struktur` */

/*Table structure for table `m_mo_tipe` */

DROP TABLE IF EXISTS `m_mo_tipe`;

CREATE TABLE `m_mo_tipe` (
  `id` int(11) unsigned NOT NULL,
  `kode` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:01;02;03;04 dst',
  `nama` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:Top; Unit; Sub Unit; Sub Sub Unit',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `m_mo_tipe` */

/*Table structure for table `m_negara` */

DROP TABLE IF EXISTS `m_negara`;

CREATE TABLE `m_negara` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_negara` varchar(50) NOT NULL,
  `code1` varchar(10) NOT NULL,
  `code2` varchar(10) NOT NULL,
  `flag` varchar(20) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8mb4;

/*Data for the table `m_negara` */

/*Table structure for table `m_paket_jenis` */

DROP TABLE IF EXISTS `m_paket_jenis`;

CREATE TABLE `m_paket_jenis` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '2. Paket RS; 3. Paket BPJS; 1. Bukan Paket',
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `kode_versi` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:t_paket, kode versi tarif',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `m_paket_jenis` */

/*Table structure for table `m_pasien` */

DROP TABLE IF EXISTS `m_pasien`;

CREATE TABLE `m_pasien` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `no_rm` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:no rekam medis',
  `nationality_code1` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'm_negara',
  `nik` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'entry:no ktp',
  `no_kk` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:no kk',
  `is_kepalakeluarga` tinyint(1) DEFAULT NULL COMMENT 'entry:apakah KK',
  `no_passport` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:no passpord',
  `no_kitas` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:no kitas',
  `masa_berlaku_kitas` date DEFAULT NULL COMMENT 'entry:masa berlaku kitas',
  `first_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'entry',
  `last_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'entry',
  `maiden_first_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'entry',
  `maiden_last_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'entry',
  `tempat_lahir` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'entry',
  `tanggal_lahir` date NOT NULL COMMENT 'entry',
  `janis_kelamin` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'entry',
  `gol_darah` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'entry:m_goldarah',
  `alamat_idcard` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'entry:alamat ktp',
  `provinsi_idcard` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:ktp',
  `kabupaten_idcard` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:ktp',
  `kecamatan_idcard` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:ktp',
  `desa_idcard` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:ktp',
  `dusun_idcard` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:ktp',
  `kodepos_idcard` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:ktp',
  `status_menikah` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:m_statusnikah',
  `tingkat_pendidikan` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:m_pendidikan',
  `pekerjaan` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:m_pekerjaan',
  `agama` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:m_agama',
  `alamat_domisili` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:domisili',
  `dusun_domisili` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:domisili',
  `desa_domisili` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:domisili',
  `kecamatan_domisili` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:domisili',
  `kabupaten_domisili` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:domisili',
  `kodepos_domisili` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:domisili',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `no_hp` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `no_wa` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `status_meninggal` tinyint(1) NOT NULL COMMENT '0=hidup;1=meninggal',
  `file_photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `file_ktp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `file_kk` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `file_passport` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `file_kitas` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `is_valid` tinyint(1) NOT NULL COMMENT 'entry:ini dilakukan admisi',
  `valid_at` datetime NOT NULL COMMENT 'entry/otomatis',
  `valid_by` int(11) NOT NULL COMMENT 'entry/otomatis',
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `no_peserta_bpjs` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `asuransi_id` int(11) DEFAULT NULL COMMENT 'entry:m_asuransi',
  `asuransi_no` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `asuransi_penjamin` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `bahasa_aktif_id` smallint(6) DEFAULT NULL COMMENT 'entry:m_bahasaaktif',
  `file_ttd` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `m_pasien` */

/*Table structure for table `m_pasien_kerabat` */

DROP TABLE IF EXISTS `m_pasien_kerabat`;

CREATE TABLE `m_pasien_kerabat` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pasien_id` bigint(20) NOT NULL,
  `nama_lengkap` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hubungankerabat_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tempat_lahir` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `jenis_kelamin` int(11) DEFAULT NULL,
  `alamat` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dusun` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desa` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kecamatan_id` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kabupaten_id` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provinsi_id` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_hp` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_wa` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_valid` tinyint(1) NOT NULL,
  `valid_at` datetime NOT NULL,
  `valid_by` int(20) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `organisasi_id` int(11) DEFAULT NULL,
  `perioduntilorg_id` date DEFAULT NULL,
  `file_ttd` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `m_pasien_kerabat` */

/*Table structure for table `m_pegawai` */

DROP TABLE IF EXISTS `m_pegawai`;

CREATE TABLE `m_pegawai` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'entry',
  `kode_bpjs` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `nama` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'entry',
  `jenis_pegawai_id` int(10) unsigned DEFAULT NULL COMMENT 'm_jenis_pegawai',
  `spesialisasi_id` smallint(6) DEFAULT NULL COMMENT 'm_spesialisasi',
  `sub_spesialisasi_id` int(10) unsigned DEFAULT NULL COMMENT 'm_subspesialisasi',
  `qualifikasi_id` int(11) unsigned DEFAULT NULL COMMENT 'm_kualifikasi',
  `pendidikan_id` int(11) DEFAULT NULL COMMENT 'm_pendidikan',
  `tempat_lahir` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `tanggal_lahir` date DEFAULT NULL COMMENT 'entry',
  `janiskelamin_id` int(11) unsigned DEFAULT NULL COMMENT 'm_jenis_kelamin',
  `agama_id` int(10) unsigned DEFAULT NULL COMMENT 'm_agama',
  `bahasa_aktif_id` smallint(6) DEFAULT NULL COMMENT 'm_bahasaaktif',
  `alamat` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `dusun` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `desa` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `kecamatan_id` char(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_kecamatan',
  `kabupaten_id` int(11) DEFAULT NULL COMMENT 'm_kabupaten',
  `provinsi_id` int(11) DEFAULT NULL COMMENT 'm_provinsi',
  `kodepos` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `nik` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `npwp` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `no_hp` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `no_wa` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `file_photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `status_nikah_id` tinyint(4) DEFAULT NULL COMMENT 'm_statusnikah',
  `status_daftar_id` tinyint(4) DEFAULT NULL COMMENT '1= Terdaftar di Balimed; 2=Tidak Terdaftar',
  `status_pegawai_id` tinyint(4) DEFAULT NULL COMMENT 'm_statuspegawai',
  `status_aktif` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `sso_user_id` int(11) DEFAULT NULL COMMENT 'sso',
  PRIMARY KEY (`id`),
  KEY `spesialisasi_id` (`spesialisasi_id`),
  KEY `sub_spesialisasi_id` (`sub_spesialisasi_id`),
  KEY `qualifikasi_id` (`qualifikasi_id`),
  KEY `pendidikan_id` (`pendidikan_id`),
  KEY `jenis_pegawai_id` (`jenis_pegawai_id`),
  KEY `m_pegawai_ibfk_6` (`janiskelamin_id`),
  KEY `agama_id` (`agama_id`),
  KEY `bahasa_aktif_id` (`bahasa_aktif_id`),
  CONSTRAINT `m_pegawai_ibfk_1` FOREIGN KEY (`spesialisasi_id`) REFERENCES `m_spesialisasi` (`id`),
  CONSTRAINT `m_pegawai_ibfk_2` FOREIGN KEY (`jenis_pegawai_id`) REFERENCES `m_jenis_pegawai` (`id`),
  CONSTRAINT `m_pegawai_ibfk_3` FOREIGN KEY (`sub_spesialisasi_id`) REFERENCES `m_subspesialisasi` (`id`),
  CONSTRAINT `m_pegawai_ibfk_4` FOREIGN KEY (`qualifikasi_id`) REFERENCES `m_kualifikasi` (`id`),
  CONSTRAINT `m_pegawai_ibfk_5` FOREIGN KEY (`pendidikan_id`) REFERENCES `m_pendidikan` (`id`),
  CONSTRAINT `m_pegawai_ibfk_6` FOREIGN KEY (`janiskelamin_id`) REFERENCES `m_jenis_kelamin` (`id`),
  CONSTRAINT `m_pegawai_ibfk_7` FOREIGN KEY (`agama_id`) REFERENCES `m_agama` (`id`),
  CONSTRAINT `m_pegawai_ibfk_8` FOREIGN KEY (`bahasa_aktif_id`) REFERENCES `m_bahasaaktif` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=392 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `m_pegawai` */

/*Table structure for table `m_pekerjaan` */

DROP TABLE IF EXISTS `m_pekerjaan`;

CREATE TABLE `m_pekerjaan` (
  `id` int(11) NOT NULL,
  `pekerjaan` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `m_pekerjaan` */

/*Table structure for table `m_pendidikan` */

DROP TABLE IF EXISTS `m_pendidikan`;

CREATE TABLE `m_pendidikan` (
  `id` int(11) NOT NULL,
  `nama` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `m_pendidikan` */

/*Table structure for table `m_penjamin` */

DROP TABLE IF EXISTS `m_penjamin`;

CREATE TABLE `m_penjamin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `kode_penjamin` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `nama_penjamin` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '1=Umum,2=BPJS,3=IKS,4=Karyawan',
  `prefix_antrean` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `m_penjamin` */

/*Table structure for table `m_pp_booking` */

DROP TABLE IF EXISTS `m_pp_booking`;

CREATE TABLE `m_pp_booking` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tanggal_booking` datetime DEFAULT NULL COMMENT 'terhubung ke group_item_pemeriksaan_penunjang, misal PK1 = Hematologi',
  `kode_booking` varchar(20) DEFAULT NULL COMMENT 'entry:otomatis/kode booking lab',
  `layanan_id` bigint(20) DEFAULT NULL COMMENT 't_layanan',
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `kode_subunit_dituju` varchar(10) DEFAULT NULL COMMENT 'entry:subunit yang dituju (PK, PA, dll)',
  `status_verifikasi` tinyint(4) DEFAULT NULL COMMENT 'entry:0=belum verif, 1=verifikasi',
  `tanggal_verifikasi` date DEFAULT NULL COMMENT 'entry:tgl diverifikasi',
  `pegawai_verifikasi_kode` varchar(20) DEFAULT NULL COMMENT 'entry:petugas yang memverif',
  `tanggal_spesimen` datetime NOT NULL COMMENT 'entry:tgl spesimen dditerima',
  `tanggal_selesai` date DEFAULT NULL COMMENT 'entry:tgl selesai dientry petugas',
  `status_selesai` tinyint(4) DEFAULT NULL COMMENT '0=belum;1 = selesai',
  `file_pengantar` varchar(255) DEFAULT NULL COMMENT 'entry:file pengantar dokter',
  `pegawai_pj_kode` varchar(20) DEFAULT NULL COMMENT 'entry:dokter penandatangan',
  `status_std` tinyint(4) DEFAULT NULL COMMENT 'entry:status send to LIS',
  `tanggal_std` date DEFAULT NULL COMMENT 'entry:tgl send to device',
  `status_rfd` tinyint(4) DEFAULT NULL COMMENT 'entry:status  receive from device',
  `tanggal_rfd` date DEFAULT NULL COMMENT 'entry:tgl receive from evice',
  `sifat_hasil` tinyint(4) DEFAULT NULL COMMENT '1=cito 2=rutin',
  `status_proses` tinyint(4) DEFAULT NULL COMMENT 'entry mm_pp_proses; 1=booking;2=Terverif;3=Persetujuan/menunggu deposit; 4= Sudah Deposit 5=Proses Lab; 6=Proses Lab Selesai; 7 = Ambil Hasil',
  `status_persetujuan` tinyint(4) DEFAULT NULL COMMENT 'entry: status persetujuan pasien;1=setuju;0=belum/tidak',
  `format_hl7_kirim` text DEFAULT NULL COMMENT 'otomatis, formah HL7 data yang diperiksa lab',
  `format_hl7_hasil` text DEFAULT NULL COMMENT 'otomatis LIS, format HL7 dari hasil lab',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `m_pp_booking` */

/*Table structure for table `m_pp_detil` */

DROP TABLE IF EXISTS `m_pp_detil`;

CREATE TABLE `m_pp_detil` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pp_booking_id` bigint(20) DEFAULT NULL COMMENT 'm_pp_booking',
  `kode_grup` varchar(5) DEFAULT NULL COMMENT 'm_pp_group; misal H1, H2, H3 dst',
  `kode_item` varchar(5) DEFAULT NULL COMMENT 'm_pp_item',
  `kode_tarif` varchar(10) DEFAULT NULL COMMENT 'm_tarif;berasis versi',
  `besar_tarif` float DEFAULT NULL COMMENT 'm_tarif',
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `m_pp_detil` */

/*Table structure for table `m_pp_group` */

DROP TABLE IF EXISTS `m_pp_group`;

CREATE TABLE `m_pp_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `kode_subunit` varchar(10) DEFAULT NULL COMMENT 'm_subunit_medik',
  `kode_group` varchar(5) DEFAULT NULL COMMENT 'entry:kode group',
  `nama_group` varchar(50) DEFAULT NULL COMMENT 'PK1 = Hematologi, PK2 = Urinalisa, PK3 = Fungsi Ginjal, PK4 = Lemak, PK5 = Anemia, dst',
  `baris_tampil` smallint(6) DEFAULT NULL,
  `kolom_tampil` smallint(6) DEFAULT NULL,
  `is_aktif` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;

/*Data for the table `m_pp_group` */

/*Table structure for table `m_pp_item` */

DROP TABLE IF EXISTS `m_pp_item`;

CREATE TABLE `m_pp_item` (
  `id` smallint(11) unsigned NOT NULL AUTO_INCREMENT,
  `kode_group` varchar(5) NOT NULL COMMENT 'm_pp_group',
  `kode_item` varchar(5) NOT NULL COMMENT 'misal H1, H2, H3 dst',
  `nama_item` varchar(40) DEFAULT NULL COMMENT 'H1 = Hematologi Rutin, H2 = LED, H3 = Golongan Darah, dst',
  `kode_tarif` varchar(10) DEFAULT NULL COMMENT 'm_tarif',
  `is_aktif` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`,`kode_item`)
) ENGINE=InnoDB AUTO_INCREMENT=408 DEFAULT CHARSET=latin1;

/*Data for the table `m_pp_item` */

/*Table structure for table `m_pp_persetujuan` */

DROP TABLE IF EXISTS `m_pp_persetujuan`;

CREATE TABLE `m_pp_persetujuan` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pp_booking_id` bigint(20) DEFAULT NULL COMMENT 'm_pp_booking',
  `tanggal_persetujuan` datetime DEFAULT NULL COMMENT 'm_pp_group; misal H1, H2, H3 dst',
  `teks_persetujuan` text DEFAULT NULL COMMENT 'm_tarif;berasis versi',
  `biaya_persetujuan` float DEFAULT NULL COMMENT 'entry:otomatis dihitung dari list pemeriksaan',
  `pegawai_kode` varchar(20) DEFAULT NULL COMMENT 'entry:m_pegawai',
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `m_pp_persetujuan` */

/*Table structure for table `m_pp_proses` */

DROP TABLE IF EXISTS `m_pp_proses`;

CREATE TABLE `m_pp_proses` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `kode` smallint(6) DEFAULT NULL COMMENT 'ex:1,2,3,4,5,,,',
  `nama_proses` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '1=booking;2=Terverif;3=Persetujuan/menunggu deposit; 4= Sudah Deposit 5=Proses Lab; 6=Proses Lab Selesai; 7 = Ambil Hasil',
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `regencies_province_id_index` (`nama_proses`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `m_pp_proses` */

/*Table structure for table `m_provinsi` */

DROP TABLE IF EXISTS `m_provinsi`;

CREATE TABLE `m_provinsi` (
  `id` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `negara_id` int(11) DEFAULT NULL,
  `nama_provinsi` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `m_provinsi` */

/*Table structure for table `m_setup_unit` */

DROP TABLE IF EXISTS `m_setup_unit`;

CREATE TABLE `m_setup_unit` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `rawat_jalan` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '1' COMMENT '1; Klinik 2; UGD 3; Rawat ini 4; Lab 5; Farmasi 6;Radiologi 7;OK ; 8 VK',
  `ugd` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '2',
  `rawat_inap` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '3',
  `lab` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '4',
  `farmasi` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '5',
  `radiologi` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '6',
  `ok` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '7',
  `vk` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '8',
  `idjenisdokter` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `m_setup_unit` */

/*Table structure for table `m_spesialisasi` */

DROP TABLE IF EXISTS `m_spesialisasi`;

CREATE TABLE `m_spesialisasi` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `kode` varchar(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `gelar` varchar(30) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

/*Data for the table `m_spesialisasi` */

/*Table structure for table `m_statusdaftar` */

DROP TABLE IF EXISTS `m_statusdaftar`;

CREATE TABLE `m_statusdaftar` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `nama` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'entry',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `m_statusdaftar` */

/*Table structure for table `m_statuslayanan` */

DROP TABLE IF EXISTS `m_statuslayanan`;

CREATE TABLE `m_statuslayanan` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `kelompokstatus` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode` tinyint(4) NOT NULL,
  `nama` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `m_statuslayanan` */

/*Table structure for table `m_statusnikah` */

DROP TABLE IF EXISTS `m_statusnikah`;

CREATE TABLE `m_statusnikah` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `m_statusnikah` */

/*Table structure for table `m_statuspegawai` */

DROP TABLE IF EXISTS `m_statuspegawai`;

CREATE TABLE `m_statuspegawai` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `nama` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'entry',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `m_statuspegawai` */

/*Table structure for table `m_subspesialisasi` */

DROP TABLE IF EXISTS `m_subspesialisasi`;

CREATE TABLE `m_subspesialisasi` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `spesialisasi_id` smallint(6) DEFAULT NULL,
  `kode` varchar(10) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `gelar` varchar(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

/*Data for the table `m_subspesialisasi` */

/*Table structure for table `m_subunit_medik` */

DROP TABLE IF EXISTS `m_subunit_medik`;

CREATE TABLE `m_subunit_medik` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `unit_id` int(11) unsigned DEFAULT NULL,
  `kode_subunit` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_subunit_bpjs` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama_subunit` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_spesialis_id` int(11) DEFAULT NULL,
  `kelas_id` smallint(6) DEFAULT NULL COMMENT 'entry:m_kelas',
  `prefix_antrean` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `inacbgs_id` int(11) DEFAULT NULL COMMENT 'entry:bpjs_inacbgs',
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `rm_nama_tabel` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'future:nama tabel rekam medis',
  PRIMARY KEY (`id`,`kode_subunit`),
  KEY `unit_id` (`unit_id`),
  CONSTRAINT `m_subunit_medik_ibfk_1` FOREIGN KEY (`unit_id`) REFERENCES `m_unit_medik` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `m_subunit_medik` */

/*Table structure for table `m_subunit_ruangan` */

DROP TABLE IF EXISTS `m_subunit_ruangan`;

CREATE TABLE `m_subunit_ruangan` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `subunit_id` int(11) DEFAULT NULL,
  `namaruangan` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_aktif` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `m_subunit_ruangan` */

/*Table structure for table `m_tarif_komponen` */

DROP TABLE IF EXISTS `m_tarif_komponen`;

CREATE TABLE `m_tarif_komponen` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `kode_komponen` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT 'entry',
  `nama_komponen` varchar(150) COLLATE utf8_unicode_ci NOT NULL COMMENT 'entry',
  `status_aktif` tinyint(4) DEFAULT NULL COMMENT 'entry',
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `m_tarif_komponen` */

/*Table structure for table `m_tarif_versi` */

DROP TABLE IF EXISTS `m_tarif_versi`;

CREATE TABLE `m_tarif_versi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode_versi` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama_versi` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_aktif` tinyint(4) DEFAULT NULL COMMENT '1=aktif 2=tidak aktif',
  `fx_wna` smallint(6) DEFAULT 2 COMMENT 'faktor pengali tarif',
  `file_tarif` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'bisa SK Tim, dll',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `m_tarif_versi` */

/*Table structure for table `m_tindakan` */

DROP TABLE IF EXISTS `m_tindakan`;

CREATE TABLE `m_tindakan` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `kode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'entry: kode tindakan',
  `nama` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'entry: nama tindakan',
  `deskripsi` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'entry',
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `regencies_province_id_index` (`nama`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `m_tindakan` */

/*Table structure for table `m_tindakan_kriteria` */

DROP TABLE IF EXISTS `m_tindakan_kriteria`;

CREATE TABLE `m_tindakan_kriteria` (
  `id` int(11) NOT NULL,
  `kode` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ex:ringan, sedang, berat',
  `status_aktif` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `m_tindakan_kriteria` */

/*Table structure for table `m_tindakan_tarif` */

DROP TABLE IF EXISTS `m_tindakan_tarif`;

CREATE TABLE `m_tindakan_tarif` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `versi_id` int(11) DEFAULT NULL COMMENT 'm_tarif_versi',
  `subunit_id` int(11) DEFAULT NULL COMMENT 'm_subunit_medik',
  `tindakan_id` int(11) DEFAULT NULL COMMENT 'm_tindakan',
  `kriteria_id` smallint(6) DEFAULT NULL COMMENT 'm_tindakan_kriteria',
  `kode_tarif` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT 'entry',
  `nama_tarif` varchar(150) COLLATE utf8_unicode_ci NOT NULL COMMENT 'entry: namatindakan + nama kriteria',
  `totaltarif` float DEFAULT NULL COMMENT 'menyimpan total dari m_tindakan_tarif_komponen',
  `valid_until` date DEFAULT NULL COMMENT 'tarif berlaku sampai kapan',
  `paket_jenis_id` int(11) DEFAULT NULL COMMENT 'entry:m_paket_jenis',
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`kode_tarif`,`id`),
  KEY `regencies_province_id_index` (`subunit_id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `m_tindakan_tarif` */

/*Table structure for table `m_tindakan_tarif_komponen` */

DROP TABLE IF EXISTS `m_tindakan_tarif_komponen`;

CREATE TABLE `m_tindakan_tarif_komponen` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tindakan_tarif_id` bigint(10) NOT NULL COMMENT 'm_tindakan_tarif',
  `tarif_komponen_id` int(150) NOT NULL COMMENT 'm_tarif_komponen',
  `besartarif_lokal` float DEFAULT NULL COMMENT 'nilai rp tarif lokal',
  `besartarif_wna` float DEFAULT NULL COMMENT 'nilai rp tarif wna',
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `m_tindakan_tarif_komponen` */

/*Table structure for table `m_tipebayar` */

DROP TABLE IF EXISTS `m_tipebayar`;

CREATE TABLE `m_tipebayar` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `kode` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `nama` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Deposit, Pelunasan',
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `regencies_province_id_index` (`kode`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `m_tipebayar` */

/*Table structure for table `m_unit_medik` */

DROP TABLE IF EXISTS `m_unit_medik`;

CREATE TABLE `m_unit_medik` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `kode_unit` varchar(5) DEFAULT NULL,
  `nama_unit` varchar(30) DEFAULT NULL COMMENT '1; Rawat Jalan 2; UGD 3; Rawat ini 4; Lab 5; Farmasi 6;Radiologi 7;OK ; 8 VK; 99 Luar',
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `m_unit_medik` */

/*Table structure for table `m_yesno` */

DROP TABLE IF EXISTS `m_yesno`;

CREATE TABLE `m_yesno` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `kode` tinyint(4) DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `m_yesno` */

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(1,'2014_10_12_000000_create_users_table',1),
(2,'2014_10_12_100000_create_password_resets_table',1),
(3,'2019_08_19_000000_create_failed_jobs_table',1),
(4,'2019_12_14_000001_create_personal_access_tokens_table',1),
(5,'2022_09_17_114220_create_otp_table',1);

/*Table structure for table `otp_request` */

DROP TABLE IF EXISTS `otp_request`;

CREATE TABLE `otp_request` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `otp_request` */

/*Table structure for table `otp_token` */

DROP TABLE IF EXISTS `otp_token`;

CREATE TABLE `otp_token` (
  `otp_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `otp_token` int(11) DEFAULT NULL,
  `expired_at` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`otp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

/*Data for the table `otp_token` */

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `personal_access_tokens` */

DROP TABLE IF EXISTS `personal_access_tokens`;

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `personal_access_tokens` */

/*Table structure for table `rbac_menus` */

DROP TABLE IF EXISTS `rbac_menus`;

CREATE TABLE `rbac_menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(255) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `custom_icon` varchar(255) DEFAULT NULL,
  `route_name` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `weight` int(11) DEFAULT NULL,
  `is_public` tinyint(2) DEFAULT 0,
  `is_dashboard` smallint(2) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

/*Data for the table `rbac_menus` */

/*Table structure for table `rbac_permissions` */

DROP TABLE IF EXISTS `rbac_permissions`;

CREATE TABLE `rbac_permissions` (
  `perm_id` int(11) NOT NULL AUTO_INCREMENT,
  `perm_desc` varchar(255) DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `group` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`perm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

/*Data for the table `rbac_permissions` */

/*Table structure for table `rbac_role_permission` */

DROP TABLE IF EXISTS `rbac_role_permission`;

CREATE TABLE `rbac_role_permission` (
  `role_id` int(11) NOT NULL,
  `perm_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  KEY `role_id` (`role_id`,`perm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `rbac_role_permission` */

/*Table structure for table `rbac_roles` */

DROP TABLE IF EXISTS `rbac_roles`;

CREATE TABLE `rbac_roles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) NOT NULL,
  `role_desc` varchar(255) NOT NULL,
  `is_default` smallint(2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `rbac_roles` */

/*Table structure for table `rbac_user_role` */

DROP TABLE IF EXISTS `rbac_user_role`;

CREATE TABLE `rbac_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  KEY `id` (`id`),
  KEY `user_id` (`user_id`,`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `rbac_user_role` */

/*Table structure for table `rbac_users` */

DROP TABLE IF EXISTS `rbac_users`;

CREATE TABLE `rbac_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `phone_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `rbac_users` */

insert  into `rbac_users`(`id`,`name`,`firstname`,`lastname`,`email`,`phone`,`file_photo`,`email_verified_at`,`phone_verified_at`,`password`,`remember_token`,`created_at`,`updated_at`) values 
(34,'pandu','pandu',NULL,'pandu.pratama871@gmail.com','0895413219536',NULL,NULL,NULL,'$2y$10$J2mlZAB/6.4olSZC389pmeJw5ZMSOQzXTMwqymi1IZ9.cpvTu77si',NULL,'2022-12-25 03:58:48','2022-12-25 03:58:48');

/*Table structure for table `t_billing` */

DROP TABLE IF EXISTS `t_billing`;

CREATE TABLE `t_billing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layanan_id` bigint(20) DEFAULT NULL COMMENT 't_layanan',
  `tgl_transaksi` date DEFAULT NULL COMMENT 'utk rawat jalan = tgl masuk;utk rawat inap beda2',
  `kode_subunit` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'kode subunit terjadinya tindakan',
  `tindakan_tarif_id` bigint(20) DEFAULT NULL COMMENT 'm_tindakan_tarif',
  `tarif` float DEFAULT 2 COMMENT 'masing-masing layanan',
  `qty` smallint(6) DEFAULT NULL COMMENT 'diinput',
  `disc` float DEFAULT NULL COMMENT 'diinput/set',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status_pakai` tinyint(4) DEFAULT NULL COMMENT '1=pakai, 0=batal',
  `ditanggung` float DEFAULT NULL COMMENT 'berapa besar rp ditanggung',
  `is_label` tinyint(4) DEFAULT NULL COMMENT '1=label; 0=transaksi;ini sequences',
  `ketlabel` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'jika is_label 1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `t_billing` */

/*Table structure for table `t_billing_bayar` */

DROP TABLE IF EXISTS `t_billing_bayar`;

CREATE TABLE `t_billing_bayar` (
  `id` bigint(20) NOT NULL,
  `layanan_id` bigint(20) DEFAULT NULL COMMENT 't_layanan',
  `nomor_registrasi` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 't_layanan',
  `tanggal_bayar` datetime DEFAULT NULL,
  `carabayar_id` smallint(6) NOT NULL,
  `tipe_bayar` tinyint(4) DEFAULT NULL COMMENT 'm_tipebayar;1. Deposit; 2. Pelunasan',
  `besar_bayar` double NOT NULL COMMENT 'besar rp',
  `note_bayar` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'entry:keterangan',
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `regencies_province_id_index` (`nomor_registrasi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_billing_bayar` */

/*Table structure for table `t_farmasi_adj` */

DROP TABLE IF EXISTS `t_farmasi_adj`;

CREATE TABLE `t_farmasi_adj` (
  `id` int(11) unsigned NOT NULL,
  `adj_id` int(11) NOT NULL COMMENT 'entry:m_farmasi_adj',
  `barang_id` int(11) NOT NULL COMMENT 'entry:m_farmasi_barang',
  `stock_c` int(11) NOT NULL COMMENT 'entry:stock komputer',
  `stock_a` int(11) NOT NULL COMMENT 'entry:stock adjusment',
  `harga_hna` double NOT NULL COMMENT 'entry:m_farmasi_barang',
  `no_batch` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `kondisi_id` tinyint(4) DEFAULT NULL COMMENT 'entry:m_farmasi;1.Barang Rusak; 2. Barang Expire Dated; 3. BHP; 4.lainnya;',
  `jenis_id` smallint(6) DEFAULT NULL COMMENT 'entry:m_farmasi',
  `kelompok_id` smallint(6) DEFAULT NULL COMMENT 'entry:m_farmasi',
  `golongan_id` smallint(6) DEFAULT NULL COMMENT 'entry:m_farmasi',
  `tipe_id` smallint(6) DEFAULT NULL COMMENT 'entry:m_farmasi',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `t_farmasi_adj` */

/*Table structure for table `t_farmasi_konsin` */

DROP TABLE IF EXISTS `t_farmasi_konsin`;

CREATE TABLE `t_farmasi_konsin` (
  `id` int(11) unsigned NOT NULL,
  `konsin_id` int(11) DEFAULT NULL COMMENT 'entry:m_farmasi_konsin',
  `barang_id` int(11) DEFAULT NULL COMMENT 'entry:m_farmasi_barang',
  `qty_ff` int(11) DEFAULT NULL COMMENT 'entry:qty fullfil/terpenuhi',
  `satuan_id` smallint(6) DEFAULT NULL,
  `harga_hna` double DEFAULT NULL COMMENT 'entry:m_farmasi_barang',
  `no_batch` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'entry',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `t_farmasi_konsin` */

/*Table structure for table `t_farmasi_konsout` */

DROP TABLE IF EXISTS `t_farmasi_konsout`;

CREATE TABLE `t_farmasi_konsout` (
  `id` int(11) unsigned NOT NULL,
  `konsin_id` int(11) DEFAULT NULL COMMENT 'entry:m_farmasi_konsin',
  `barang_id` int(11) DEFAULT NULL COMMENT 'entry:m_farmasi_barang',
  `qty_ff` int(11) DEFAULT NULL COMMENT 'entry:qty fullfil/terpenuhi',
  `satuan_id` smallint(6) DEFAULT NULL,
  `harga_hna` double DEFAULT NULL COMMENT 'entry:m_farmasi_barang',
  `no_batch` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `t_farmasi_konsout` */

/*Table structure for table `t_farmasi_mutasi` */

DROP TABLE IF EXISTS `t_farmasi_mutasi`;

CREATE TABLE `t_farmasi_mutasi` (
  `id` int(11) unsigned NOT NULL,
  `mutasi_id` bigint(20) DEFAULT NULL COMMENT 'entry:m_farmasi_mutasi',
  `barang_id` bigint(20) DEFAULT NULL COMMENT 'entry:m_farmasi_barang',
  `preorder_id` bigint(20) DEFAULT NULL COMMENT 'preorder_id mana yang dipenuhi dari mutasi ini',
  `qty_ff` int(11) DEFAULT NULL COMMENT 'qty dipenuhi;update ke preorder, update stok di subunit2',
  `harga_hna` double DEFAULT NULL COMMENT 'm_farmasi',
  `satuan_id` smallint(6) DEFAULT NULL COMMENT 'm_farmasi',
  `no_batch` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `t_farmasi_mutasi` */

/*Table structure for table `t_farmasi_opname` */

DROP TABLE IF EXISTS `t_farmasi_opname`;

CREATE TABLE `t_farmasi_opname` (
  `id` int(11) unsigned NOT NULL,
  `opname_id` int(11) DEFAULT NULL COMMENT 'entry:m_farmasi_opname',
  `barang_id` int(11) DEFAULT NULL COMMENT 'entry:m_farmasi_barang',
  `stock_c` int(11) DEFAULT NULL COMMENT 'entry:stock komputer',
  `stock_o` int(11) DEFAULT NULL COMMENT 'entry:stock opname',
  `qty_in` int(11) DEFAULT NULL COMMENT 'entry/otomatis:barang masuk selama opname',
  `qty_out` int(11) DEFAULT NULL COMMENT 'entry/otomatis:barang keluar selama opname',
  `so_id` tinyint(4) DEFAULT NULL COMMENT 'entry:status opname (so);1=Selesai;2=Belum Selesai;dipakai ketika update opname ke stock parsial/satu per satu',
  `so_date` datetime DEFAULT NULL COMMENT 'entry:tanggal status opname',
  `harga_hna` double DEFAULT NULL COMMENT 'entry:m_farmasi_barang',
  `no_batch` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `t_farmasi_opname` */

/*Table structure for table `t_farmasi_po` */

DROP TABLE IF EXISTS `t_farmasi_po`;

CREATE TABLE `t_farmasi_po` (
  `id` int(11) unsigned NOT NULL,
  `po_id` int(11) DEFAULT NULL COMMENT 'entry:m_farmasi_po',
  `barang_id` int(11) DEFAULT NULL COMMENT 'entry:m_farmasi_barang',
  `qty_rq` int(11) DEFAULT NULL COMMENT 'entry:qty reguest/permintaan',
  `qty_ff` int(11) DEFAULT NULL COMMENT 'entry:qty fullfil/terpenuhi',
  `stokmin` smallint(4) DEFAULT NULL COMMENT 'otomatis:m_farmasi_depobarang',
  `stokmax` int(11) DEFAULT NULL COMMENT 'otomatis:m_farmasi_depobarang',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `satuan_id` smallint(6) DEFAULT NULL,
  `harga_hna` double DEFAULT NULL COMMENT 'entry:m_farmasi_barang',
  `disc` float DEFAULT NULL COMMENT 'entry',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `t_farmasi_po` */

/*Table structure for table `t_farmasi_preorder` */

DROP TABLE IF EXISTS `t_farmasi_preorder`;

CREATE TABLE `t_farmasi_preorder` (
  `id` int(11) unsigned NOT NULL,
  `preorder_id` int(11) DEFAULT NULL COMMENT 'entry:m_farmasi_preorder',
  `barang_id` int(11) DEFAULT NULL COMMENT 'entry:m_farmasi_barang',
  `qty_rq` int(11) DEFAULT NULL COMMENT 'entry:qty reguest/permintaan',
  `qty_ff` int(11) DEFAULT NULL COMMENT 'entry:qty fullfil/terpenuhi',
  `stokmin` tinyint(4) DEFAULT NULL COMMENT 'otomatis:m_farmasi_depobarang',
  `stokmax` int(11) DEFAULT NULL COMMENT 'otomatis:m_farmasi_depobarang',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `t_farmasi_preorder` */

/*Table structure for table `t_farmasi_resep` */

DROP TABLE IF EXISTS `t_farmasi_resep`;

CREATE TABLE `t_farmasi_resep` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `mresep_id` bigint(20) NOT NULL COMMENT 'entry:m_farmasi_resep',
  `barang_id` int(11) NOT NULL COMMENT 'entry:m_farmasi_barang',
  `qty_a` smallint(6) NOT NULL COMMENT 'entry:qty request',
  `qty_b` smallint(6) NOT NULL COMMENT 'entry:qty terpenuhi',
  `signa_id` smallint(6) NOT NULL COMMENT 'entry;m_farmasi;signa',
  `aturan_id` smallint(6) NOT NULL COMMENT 'entry:m_uarmasi;aturan pakai',
  `note` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `harga_hna` float NOT NULL COMMENT 'entry:m_farmasi_barang',
  `harga_jual` float DEFAULT NULL COMMENT 'hna + perhitungan',
  `status_b_id` tinyint(4) NOT NULL COMMENT 'entry:status resep b; m_farmasi',
  `racik_id` smallint(6) DEFAULT NULL COMMENT 'entry:Racik;m_farmasi',
  `is_pt` tinyint(4) DEFAULT NULL COMMENT 'm_farmasi_barang;obat ini protokol terapi apa tidak',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `t_farmasi_resep` */

/*Table structure for table `t_farmasi_returd` */

DROP TABLE IF EXISTS `t_farmasi_returd`;

CREATE TABLE `t_farmasi_returd` (
  `id` int(11) unsigned NOT NULL,
  `retur_id` bigint(20) DEFAULT NULL COMMENT 'entry:m_farmasi_retur',
  `barang_id` bigint(20) DEFAULT NULL COMMENT 'entry:m_farmasi_barang',
  `qty_rr` int(11) DEFAULT NULL COMMENT 'qty dipenuhi;update ke preorder, update stok di subunit2',
  `harga_hpp` double DEFAULT NULL COMMENT 'entry:otomatis harga hpp dari m_farmasi_barang',
  `satuan_id` smallint(6) DEFAULT NULL COMMENT 'entry:otomatis satuan id m_farmasi_barang',
  `kondisi_id` tinyint(4) DEFAULT NULL COMMENT 'entry:m_farmasi; 1. Barang Rusak; 2. Barang Expired Dated; dll',
  `no_batch` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `t_farmasi_returd` */

/*Table structure for table `t_farmasi_returg` */

DROP TABLE IF EXISTS `t_farmasi_returg`;

CREATE TABLE `t_farmasi_returg` (
  `id` int(11) unsigned NOT NULL,
  `retur_id` bigint(20) NOT NULL COMMENT 'entry:m_farmasi_returg',
  `barang_id` int(11) NOT NULL COMMENT 'entry:m_farmasi_barang',
  `qty` int(11) NOT NULL COMMENT 'qty dipenuhi;update ke preorder, update stok di subunit2',
  `harga_hna` double NOT NULL COMMENT 'entry:otomatis harga hpp dari m_farmasi_barang',
  `satuan_id` smallint(6) NOT NULL COMMENT 'entry:otomatis satuan id m_farmasi_barang',
  `no_batch` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `kondisi_id` tinyint(4) NOT NULL COMMENT 'entry:m_farmasi; 1. Barang Rusak; 2. Barang Expired Dated; dll',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `t_farmasi_returg` */

/*Table structure for table `t_farmasi_ro` */

DROP TABLE IF EXISTS `t_farmasi_ro`;

CREATE TABLE `t_farmasi_ro` (
  `id` int(11) unsigned NOT NULL,
  `ro_id` bigint(20) NOT NULL COMMENT 'entry:m_farmasi_ro',
  `barang_id` bigint(20) NOT NULL COMMENT 'entry:m_farmasi_barang',
  `po_id` bigint(20) NOT NULL COMMENT 'po_id mana yang dipenuhi dari ro ini',
  `qty_ff` int(11) NOT NULL COMMENT 'qty dipenuhi;update ke preorder, update stok di subunit2',
  `harga_hna` double NOT NULL COMMENT 'm_farmasi',
  `satuan_id` smallint(6) NOT NULL COMMENT 'm_farmasi',
  `no_batch` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `ed` date DEFAULT NULL COMMENT 'entry',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `t_farmasi_ro` */

/*Table structure for table `t_farmasi_telaah` */

DROP TABLE IF EXISTS `t_farmasi_telaah`;

CREATE TABLE `t_farmasi_telaah` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `mresep_id` bigint(20) NOT NULL COMMENT 'entry:m_farmasi_resep',
  `nama_group` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'nama_group:m_farmasi',
  `kode_t` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'entry:m_farmasi;telaah resep',
  `nilai_t` tinyint(6) NOT NULL COMMENT 'entry:m_yesno',
  `note_t` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'entry',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `t_farmasi_telaah` */

/*Table structure for table `t_jadwal_layanan_ubah` */

DROP TABLE IF EXISTS `t_jadwal_layanan_ubah`;

CREATE TABLE `t_jadwal_layanan_ubah` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `jadwal_id_old` int(11) unsigned DEFAULT NULL,
  `hari_id` int(11) unsigned DEFAULT NULL COMMENT 'entry:m_hari',
  `dokter_id` bigint(20) unsigned DEFAULT NULL COMMENT 'entry:m_pegawai',
  `subunit_id` int(11) unsigned DEFAULT NULL COMMENT 'entry:m_subunit_medik',
  `ruangan_id` int(11) DEFAULT NULL,
  `status_jadwal` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:m_jadwal_sattus',
  `keterangan_jadwal` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `kuota_standar` smallint(6) DEFAULT NULL COMMENT 'entry:default m_kuota',
  `kuota_tambahan` smallint(6) DEFAULT NULL COMMENT 'entry:default m_kuota',
  `waktu_awal` time DEFAULT NULL,
  `waktu_akhir` time DEFAULT NULL,
  `tgl_update` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hari_id` (`hari_id`),
  KEY `dokter_id` (`dokter_id`),
  KEY `subunit_id` (`subunit_id`),
  KEY `jadwal_id_old` (`jadwal_id_old`),
  CONSTRAINT `t_jadwal_layanan_ubah_ibfk_1` FOREIGN KEY (`jadwal_id_old`) REFERENCES `m_jadwal_layanan` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `t_jadwal_layanan_ubah` */

/*Table structure for table `t_layanan` */

DROP TABLE IF EXISTS `t_layanan`;

CREATE TABLE `t_layanan` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `pasien_id` bigint(20) NOT NULL COMMENT 'm_pasien',
  `no_rm` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'm_pasien',
  `nomor_registrasi` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'saat registrasi/otomatis',
  `nomor_antrian` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'saat registrasi/otomatis',
  `tanggal_masuk` date NOT NULL COMMENT 'tgl periksa',
  `tanggal_keluar` date DEFAULT NULL COMMENT 'tgl keluar utk rawat jalan = tgl masuk',
  `is_pasien_baru` tinyint(4) DEFAULT NULL COMMENT '0=baru;1=lama',
  `kasus_id` smallint(6) DEFAULT NULL COMMENT 'm_kasus; 1. Kasus Baru; 2. Kontrol',
  `waktu_awal` time DEFAULT NULL COMMENT 'm_jadwal_layanan',
  `waktu_akhir` time DEFAULT NULL COMMENT 'm_jadwal_layanan',
  `kode_subunit` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_subunit_medik;',
  `kode_dokter` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_tenagamedis',
  `kode_penjamin` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'm_penjamin; 1=Umum;2=BPJS;3=IKS;4=Karyawan',
  `kode_iks` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'kode_iks, jika penjamin adalah IKS atau karyawan',
  `kode_faskes` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'm_faskes kode',
  `nama_perujuk` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'dientry diadmisi BPJS',
  `nomor_sep` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'dientry diadmisi BPJS',
  `nomor_rujukan` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'dientry diadmisi BPJS',
  `tanggal_rujukan` date DEFAULT NULL COMMENT 'dientry diadmisi bpjs',
  `masa_berlaku_rujukan` int(11) DEFAULT NULL COMMENT 'dientry diadmisi BPJS',
  `diagnosa_rujukan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datang_rs` datetime DEFAULT NULL COMMENT 'saat pasien check in di rs',
  `mulai_admisi` datetime DEFAULT NULL COMMENT 'dientry admisi bpjs/iks, saat pasien mulai dilayanan diadmisi',
  `akhir_admisi` datetime DEFAULT NULL COMMENT 'dientry admisi bpjs/iks, saat selesai diadmisi',
  `mulai_layan_poli` datetime DEFAULT NULL COMMENT 'dientry perawat poli, saat px mulai dilayanan poli',
  `akhir_layan_poli` datetime DEFAULT NULL COMMENT 'dientry perawat poli, saat px selesai layanan poli',
  `mulai_buat_obat` datetime DEFAULT NULL COMMENT 'dientry farmasi saat selesai Nota farmasi',
  `akhir_selesai_obat` datetime DEFAULT NULL COMMENT 'dientry farmasi saat px ambil obat',
  `akhir_kasir` datetime DEFAULT NULL COMMENT 'dientry kasir saat selesai dikasir',
  `akhir_ambil_obat` datetime DEFAULT NULL COMMENT 'dientry farmasi saat pasien ambil obat',
  `status_antrian` smallint(6) DEFAULT NULL COMMENT 'm_statuslayanan; 0=regis belum valid;1=blm checkin;2=sdh checkin;3=mulai admisi;4=akhir admisi/mulai antre poli;5=mulai poli;6=selesai poli/tunggu farmas;7=selesai farmasi/awal kasir;8=selesai kasir;9=selesai obat',
  `kode_ners` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ners pendamping dokter',
  `nationality_code1` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'kode nasionality 3 digit',
  `is_kitas` tinyint(4) DEFAULT NULL COMMENT '1=masih aktif 0-expired',
  `status_kronis` tinyint(4) DEFAULT NULL COMMENT 'm_yesno; Ya/Tidak, diisi dokter poli',
  `status_transaksi` tinyint(4) DEFAULT NULL COMMENT '0=Open (Belum Lunas) 1=Closed (Lunas)',
  `nomor_ruangan` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'untuk rawat inap,nomor ruangan terakhir',
  `no_bill` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'nomor billing',
  `total_bill` double DEFAULT NULL COMMENT 'total transaksi rp',
  `total_disc` float DEFAULT NULL COMMENT 'diskon persen',
  `note_disc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:catatan discount',
  `total_ditanggung` double DEFAULT NULL COMMENT 'total ditanggung asuransi',
  `total_deposit` double DEFAULT NULL COMMENT 'total deposit rp',
  `total_dibayar` double DEFAULT NULL COMMENT 'uang rp dibayar pasien',
  `created_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `t_layanan` */

/*Table structure for table `t_layanan_ners_others` */

DROP TABLE IF EXISTS `t_layanan_ners_others`;

CREATE TABLE `t_layanan_ners_others` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `layanan_id` bigint(20) NOT NULL COMMENT 't_layanan',
  `kode_ners` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'entry:kode ners atau lainnya bila lebih dari 1 ners',
  `created_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `t_layanan_ners_others` */

/*Table structure for table `t_layanan_pindah` */

DROP TABLE IF EXISTS `t_layanan_pindah`;

CREATE TABLE `t_layanan_pindah` (
  `id` bigint(20) NOT NULL,
  `nomor_registrasi` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 't_layanan',
  `kode_subunit_asal` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT 'entry:t_Layanan',
  `no_ruangan_asal` varchar(5) COLLATE utf8_unicode_ci NOT NULL COMMENT 'entry:t_layanan',
  `kode_subunit_tujuan` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'entry:m_subunit',
  `no_ruangan_tujuan` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'entry',
  `tanggal_pindah` date DEFAULT NULL,
  `jam_pindah` time DEFAULT NULL,
  `note` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `regencies_province_id_index` (`nomor_registrasi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_layanan_pindah` */

/*Table structure for table `t_layanan_tindakan` */

DROP TABLE IF EXISTS `t_layanan_tindakan`;

CREATE TABLE `t_layanan_tindakan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layanan_id` bigint(20) DEFAULT NULL COMMENT 't_layanan',
  `tgl_transaksi` date DEFAULT NULL COMMENT 'utk rawat jalan = tgl masuk;utk rawat inap beda2',
  `kode_subunit` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'kode subunit terjadinya tindakan',
  `tindakan_tarif_id` bigint(20) DEFAULT NULL COMMENT 'm_tindakan_tarif',
  `tarif` float DEFAULT NULL COMMENT 'masing-masing layanan',
  `qty` smallint(6) DEFAULT NULL COMMENT 'diinput',
  `disc` float DEFAULT NULL COMMENT 'diinput/set',
  `ditanggung` float DEFAULT NULL COMMENT 'berapa besar rp ditanggung',
  `status_pakai` tinyint(4) DEFAULT NULL COMMENT '1=pakai, 0=batal',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `t_layanan_tindakan` */

/*Table structure for table `t_layanan_tindakan_komponen` */

DROP TABLE IF EXISTS `t_layanan_tindakan_komponen`;

CREATE TABLE `t_layanan_tindakan_komponen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layanan_tindakan_id` bigint(20) DEFAULT NULL COMMENT 't_layanan_tindakan',
  `tarif_komponen_id` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_tindakan_tarif_komponen',
  `pegawai_id` int(11) DEFAULT NULL COMMENT 'm_pegawai',
  `tarif_asli` float DEFAULT NULL COMMENT 'm_tindakan_tarif_komponen',
  `tarif_ubah` float DEFAULT NULL COMMENT 'defaul = tarif_asli;namun bisa diubah;',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `t_layanan_tindakan_komponen` */

/*Table structure for table `t_mo_proof` */

DROP TABLE IF EXISTS `t_mo_proof`;

CREATE TABLE `t_mo_proof` (
  `id` int(11) unsigned NOT NULL,
  `kode_doc` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'entry:dokumen yang di approve',
  `nomor_doc` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:nomor dokumen',
  `tanggal_doc` date DEFAULT NULL COMMENT 'entry:tanggal dokumen kode_doc',
  `jdoc_id` int(11) DEFAULT NULL COMMENT 'entry:jenis dokumen yang diapprove',
  `kode_owner` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:unit/subunit pemilik',
  `jab_id` int(11) DEFAULT NULL COMMENT 'entry:jabatan yang mengapprove dokumen',
  `pegawai_id` int(11) DEFAULT NULL COMMENT 'entry:m_pegawai;pegawai yang approve',
  `order_proof` tinyint(11) DEFAULT NULL COMMENT 'entry:urutan jabatan yang approve',
  `tanggal_proof` datetime DEFAULT NULL COMMENT 'entry:tanggal approved',
  `link_doc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:link url dokumen yang diaaprove',
  `status_proof` tinyint(4) DEFAULT NULL COMMENT 'entry:1=approved;0=belum approved',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `t_mo_proof` */

/*Table structure for table `t_mo_struktur` */

DROP TABLE IF EXISTS `t_mo_struktur`;

CREATE TABLE `t_mo_struktur` (
  `id` int(11) unsigned NOT NULL,
  `kode_jab` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:J001;hanya satu pejabat aktif',
  `pegawai_id` int(11) DEFAULT NULL COMMENT 'entry:pejabat saat ini;diupdate juga m_mo_struktur untuk pejabat yang aktif',
  `tanggal_awal` date DEFAULT NULL COMMENT 'entry:tanggal mulai menjabat',
  `status_aktif` tinyint(4) DEFAULT NULL COMMENT 'entry:1/aktif;0=tidak aktif',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `t_mo_struktur` */

/*Table structure for table `tri_resiko_jatuh_dewasa` */

DROP TABLE IF EXISTS `tri_resiko_jatuh_dewasa`;

CREATE TABLE `tri_resiko_jatuh_dewasa` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `no_rm` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'dari tabel t_layanan',
  `nomor_registrasi` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'dari tabel t_layanan',
  `layanan_id` bigint(20) unsigned DEFAULT NULL COMMENT 'dari tabel t_layanan',
  `doc_id` bigint(20) DEFAULT NULL COMMENT 'dari id triage, dlll',
  `doc_kode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `subunit_id` int(11) DEFAULT NULL COMMENT 'FK dari tabel dr m_subunit_medik, default nilai subunit_id di t_layanan',
  `kamar` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal` date NOT NULL,
  `jam` time NOT NULL,
  `usia_pilihan` int(11) NOT NULL COMMENT 'Nomor Pilihan USIA : (1) usia < 60 th, (2) 60th sd 80th, (3) > 80th',
  `usia_skor` int(11) NOT NULL COMMENT 'USIA : (a) skor 0 -> usia < 60 th, (b) skor 1 -> 60th sd 80th, (c) skor 2 -> > 80th',
  `defisit_sensoris_pilihan` int(11) NOT NULL COMMENT 'Nomor Pilihan DEFISIT SENSORIS : (1) Kacamata bukan bifokal (2) Kacamata bifokal(3) Gangguan pendengaran(4) Kacamata multifokal(5) Katarak/glaucoma(6) Hampir tidak melihat',
  `defisit_sensoris_skor` int(11) NOT NULL COMMENT 'DEFISIT SENSORIS : (a) skor 0 -> Kacamata bukan bifokal (b) skor 1 -> Kacamata bifokal(c) skor 1 -> Gangguan pendengaran(d) skor 2 -> Kacamata multifokal(e) skor 2 -> Katarak/glaucoma(f) skor 0 -> Hampir tidak melihat',
  `aktivitas_pilihan` int(11) NOT NULL COMMENT 'Nomor Pilihan AKTIVITAS : (1) Mandiri, (2) ADL dibantu sebagian, (3) ADL dibantu penuh, ',
  `aktivitas_skor` int(11) NOT NULL COMMENT 'AKTIVITAS : (a) skor 0 -> Mandiri, (b) skor 2 -> ADL dibantu sebagian, (c) skor 3 -> ADL dibantu penuh, ',
  `riwayat_jatuh_pilihan` int(11) NOT NULL COMMENT 'Nomor Pilihan RIWAYAT JATUH : (1) Tidak pernah, (2) Jatuh < 1 tahun, (3) Jatuh < 1 bulan, (4) Jatuh pada saat dirawat sekarang',
  `riwayat_jatuh_skor` int(11) NOT NULL COMMENT 'RIWAYAT JATUH : (a) skor 0 -> Tidak pernah, (b) skor 1 -> Jatuh < 1 tahun, (c) skor 2 -> Jatuh < 1 bulan, (d) skor 3 -> Jatuh pada saat dirawat sekarang',
  `kognisi_pilihan` int(11) NOT NULL COMMENT 'Nomor Pilihan KOGNISI : (1) Orientasi baik, (2) Kesulitan mengerti perintah(3) Gangguan memory, (4) Kebingungan, (5) Disorientasi',
  `kognisi_skor` int(11) NOT NULL COMMENT 'KOGNISI : (a) skor 0 -> Orientasi baik, (b) skor 2 -> Kesulitan mengerti perintah(c) skor 2 -> Gangguan memory, (d) skor 3 -> Kebingungan, (e) skor 3 -> Disorientasi',
  `pengobatan_pilihan` int(11) NOT NULL COMMENT 'Nomor Pilihan PENGOBATAN : (1) > 4 jenis pengobatan, (2) Anti hipertensi/hipoglikemik/Antidepresan, (3) Sedatif Psikotropika / Narkotika, (4) Infus/epidural/spinal/dower catheter/traksi',
  `pengobatan_skor` int(11) NOT NULL COMMENT 'PENGOBATAN : (a) skor 1 -> > 4 jenis pengobatan, (b) skor 2 -> Anti hipertensi/hipoglikemik/Antidepresan, (c) skor 2 -> Sedatif Psikotropika / Narkotika, (d) skor 2 -> Infus/epidural/spinal/dower catheter/traksi',
  `mobilitas_pilihan` int(11) NOT NULL COMMENT 'Nomor Pilihan MOBILITAS : (1) Mandiri ,(2) Menggunakan alat bantu berpindah(3) Koordinasi/keseimbangan buruk(4) Dibantu sebagian(5) Dibantu penuh/bed rest/nurse assist(6) Lingkungan dengan banyak furniture',
  `mobilitas_skor` int(11) NOT NULL COMMENT 'MOBILITAS : (a) skor 0 -> Mandiri ,(b) skor 1 -> Menggunakan alat bantu berpindah(c) skor 2 -> Koordinasi/keseimbangan buruk(d) skor 3 -> Dibantu sebagian(e) skor 4 -> Dibantu penuh/bed rest/nurse assist(f) skor 4 -> Lingkungan dengan banyak furniture',
  `pola_bab_bak_pilihan` int(11) NOT NULL COMMENT 'Nomor Pilihan POLA BAB/BAK : (1) Teratur ,(2) Inkontinensia urine/feses(3) Nokturia(4) Urgensi/frekuensi',
  `pola_bab_bak_skor` int(11) NOT NULL COMMENT 'POLA BAB/BAK : (a) skor 0 -> Teratur ,(b) skor 1 -> Inkontinensia urine/feses(c) skor 2 -> Nokturia(d) skor 3 -> Urgensi/frekuensi',
  `komorbiditas_pilihan` int(11) NOT NULL COMMENT 'Nomor Pilihan KOMORBIDITAS : (1) Diabetes/Penyakit Jantung/Stroke/ISK dll ,(2) Gangguan saraf pusat/Parkinson(3) Pasca bedah 0 - 24 jam',
  `komorbiditas_skor` int(11) NOT NULL COMMENT 'KOMORBIDITAS : (a) skor 2 -> Diabetes/Penyakit Jantung/Stroke/ISK dll ,(b) skor 3 -> Gangguan saraf pusat/Parkinson(d) skor 3 -> Pasca bedah 0 - 24 jam',
  `jumlah_skor` int(11) NOT NULL COMMENT 'Skor dihitung dari penjumlahan semua skor dari elemen diatas',
  `keterangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resiko` int(11) NOT NULL DEFAULT 0 COMMENT '0 -> resiko rendah, 1->resiko tinggi , 2-> resoko sangat tinggi:resiko rendah jika total skor antara 0 sd 7,resiko tinggi jika total skorantara 8 sd 13resiko sangat tinggi jika tital skor >=14',
  `petugas_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Select dari m_pegawai, dengan id_jenis_profesi = 7',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tri_resiko_jatuh_dewasa` */

insert  into `tri_resiko_jatuh_dewasa`(`id`,`no_rm`,`nomor_registrasi`,`layanan_id`,`doc_id`,`doc_kode`,`subunit_id`,`kamar`,`tanggal`,`jam`,`usia_pilihan`,`usia_skor`,`defisit_sensoris_pilihan`,`defisit_sensoris_skor`,`aktivitas_pilihan`,`aktivitas_skor`,`riwayat_jatuh_pilihan`,`riwayat_jatuh_skor`,`kognisi_pilihan`,`kognisi_skor`,`pengobatan_pilihan`,`pengobatan_skor`,`mobilitas_pilihan`,`mobilitas_skor`,`pola_bab_bak_pilihan`,`pola_bab_bak_skor`,`komorbiditas_pilihan`,`komorbiditas_skor`,`jumlah_skor`,`keterangan`,`resiko`,`petugas_id`,`created_at`,`updated_at`) values 
(7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-12-29','10:00:00',1,0,1,0,1,0,1,0,1,0,1,1,1,0,1,0,1,2,3,'dsd',1,NULL,'2022-12-29 10:29:11','2022-12-29 10:29:11');

/*Table structure for table `tri_resiko_jatuh_dewasa_d` */

DROP TABLE IF EXISTS `tri_resiko_jatuh_dewasa_d`;

CREATE TABLE `tri_resiko_jatuh_dewasa_d` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tri_resiko_jatuh_dewasa_id` bigint(20) NOT NULL COMMENT 'FK dari tabel tri_resiko_jatuh_dewasa',
  `tanggal` date NOT NULL,
  `jam` time NOT NULL,
  `std_rr1` int(11) DEFAULT NULL COMMENT 'Orientasi pasien pada lingkungan kamar/bangsal',
  `std_rr2` int(11) DEFAULT NULL COMMENT 'Pastikan rem tempat tidur terkunci',
  `std_rr3` int(11) DEFAULT NULL COMMENT 'Pastikan bel pasien terjangkau',
  `std_rr4` int(11) DEFAULT NULL COMMENT 'Singkirkan barang yang berbahaya terutama pada malam hari (kursi tambahan dll)',
  `std_rr5` int(11) DEFAULT NULL COMMENT 'Minta persetujuan pasien agar lampu malam tetap menyala karen lingkungan masih asing',
  `std_rr6` int(11) DEFAULT NULL COMMENT 'Pastikan alat bantu jalan dalam jangkauan (bila menggunakan)',
  `std_rr7` int(11) DEFAULT NULL COMMENT 'Pastikan alas kaki tidak licin',
  `std_rr8` int(11) DEFAULT NULL COMMENT 'Pastikan kebutuhan pribadi dalam jangkauan',
  `std_rr9` int(11) DEFAULT NULL COMMENT 'Tempatkan meja pasien dengan baik agar tidak menghalangi',
  `std_rr10` int(11) DEFAULT NULL COMMENT 'Tempatkan pasien sesuai dengan tinggi badannya',
  `std_rt1` int(11) DEFAULT NULL COMMENT 'Pasang gelang kuning dan penanda / simbol resiko jatuh diluar kamar',
  `std_rt2` int(11) DEFAULT NULL COMMENT 'Menjelaskan kepada pasien dan keluarga kemungkinan resiko jatuh',
  `std_rt3` int(11) DEFAULT NULL COMMENT 'Minta agar pasien segera memencet bel bila perlu bantuan',
  `std_rt4` int(11) DEFAULT NULL COMMENT 'Awasi atau bantu sebagian ADL pasien',
  `std_rt5` int(11) DEFAULT NULL COMMENT 'Cepat menanggapi bel',
  `std_rt6` int(11) DEFAULT NULL COMMENT 'Review kembali obat-obatan yang beresiko',
  `std_rt7` int(11) DEFAULT NULL COMMENT 'Beritahu pasien agar mobilisasi secara bertahap duduk perlahan sebelum berdiri',
  `std_rt8` int(11) DEFAULT NULL COMMENT 'Pasang penanda resiko jatuh diluar kamar',
  `std_rst1` int(11) DEFAULT NULL COMMENT 'Kajian kebutuhan BAB/BAK secara teratur setiap 2-3 jam',
  `std_rst2` int(11) DEFAULT NULL COMMENT 'Kolaborasi dengan fisioterapi/case manager',
  `std_rst3` int(11) DEFAULT NULL COMMENT 'Bila memungkinkan pindahkan pasien dekat nurse station',
  `std_rst4` int(11) DEFAULT NULL COMMENT 'Kaji kebutuhan dengan menggunakan pagar tempat tidur',
  `std_rst5` int(11) DEFAULT NULL COMMENT 'Orientasi ulang bila perlu',
  `evaluasi` int(11) DEFAULT NULL COMMENT 'Apakah terjadi insiden jatuh ?',
  `petugas_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Select dari m_pegawai, dengan id_jenis_profesi = 7',
  `keterangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Catatan : (1) Pada kolom keterangan beri kode waktu dilakukannya asesment IA: saat assesment pertama kali, WT: saat transfer antar ruangan, CC: saat terjadi perubahan kondisi pasien, ES:saat pergantian shift jaga (pagi hari)(2) Pada item monitoring berikan "ya" apabila monitor dilakukan dan jawaban "tidak" apabila monitoring tidak dilakukan pada kolom tanggal sesuai skor resiko jatuh pasien(3) Pada kolom evaluasi, berilah tanda cawang pada pilihan ya atau tidak',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tri_resiko_jatuh_dewasa_d` */

insert  into `tri_resiko_jatuh_dewasa_d`(`id`,`tri_resiko_jatuh_dewasa_id`,`tanggal`,`jam`,`std_rr1`,`std_rr2`,`std_rr3`,`std_rr4`,`std_rr5`,`std_rr6`,`std_rr7`,`std_rr8`,`std_rr9`,`std_rr10`,`std_rt1`,`std_rt2`,`std_rt3`,`std_rt4`,`std_rt5`,`std_rt6`,`std_rt7`,`std_rt8`,`std_rst1`,`std_rst2`,`std_rst3`,`std_rst4`,`std_rst5`,`evaluasi`,`petugas_id`,`keterangan`,`created_at`,`updated_at`) values 
(4,7,'2022-12-30','22:00:00',1,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,NULL,NULL,'Aman','2022-12-30 10:55:24','2022-12-30 11:13:10');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

/*Table structure for table `xxiks` */

DROP TABLE IF EXISTS `xxiks`;

CREATE TABLE `xxiks` (
  `F1` double DEFAULT NULL,
  `F2` varchar(255) DEFAULT NULL,
  `F3` varchar(255) DEFAULT NULL,
  `Kode` double DEFAULT NULL,
  `Nama` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xxiks` */

/*Table structure for table `xxnamadokter` */

DROP TABLE IF EXISTS `xxnamadokter`;

CREATE TABLE `xxnamadokter` (
  `kode` double DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `F3` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xxnamadokter` */

/*Table structure for table `xxpuskesmas` */

DROP TABLE IF EXISTS `xxpuskesmas`;

CREATE TABLE `xxpuskesmas` (
  `NO` double DEFAULT NULL,
  `NAMAPUSKESMAS` varchar(255) DEFAULT NULL,
  `KODEPUSKESMAS` double DEFAULT NULL,
  `PROVINSI` varchar(255) DEFAULT NULL,
  `ALAMAT` varchar(255) DEFAULT NULL,
  `LATITUDE` varchar(255) DEFAULT NULL,
  `LONGITUDE` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xxpuskesmas` */

/*Table structure for table `xxrumahsakit` */

DROP TABLE IF EXISTS `xxrumahsakit`;

CREATE TABLE `xxrumahsakit` (
  `No` double DEFAULT NULL,
  `Kode` double DEFAULT NULL,
  `Nama` varchar(255) DEFAULT NULL,
  `Tipe` varchar(255) DEFAULT NULL,
  `Kelas` varchar(255) DEFAULT NULL,
  `Pemilik` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xxrumahsakit` */

/*Table structure for table `xxt_rawatjalan` */

DROP TABLE IF EXISTS `xxt_rawatjalan`;

CREATE TABLE `xxt_rawatjalan` (
  `rawatjalan_id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `pasien_id` bigint(20) NOT NULL,
  `nomor_registrasi` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nomor_antrian` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_rm` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_rawatjalan` date NOT NULL,
  `is_pasien_baru` tinyint(4) DEFAULT NULL,
  `slotjam_id` tinyint(4) DEFAULT NULL,
  `kode_poli` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kode_dokter` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kode_penjamin` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_faskes` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_perujuk` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nomor_sep` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nomor_rujukan` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `datang_rs` datetime DEFAULT NULL,
  `mulai_admisi` datetime DEFAULT NULL,
  `akhir_admisi` datetime DEFAULT NULL,
  `mulai_layan_poli` datetime DEFAULT NULL,
  `akhir_layan_poli` datetime DEFAULT NULL,
  `mulai_buat_obat` datetime DEFAULT NULL,
  `akhir_kasir` datetime DEFAULT NULL,
  `akhir_selesai_obat` datetime DEFAULT NULL,
  `status_antrian` smallint(6) DEFAULT NULL,
  `kode_ners` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jeniskunjungan_id` smallint(6) DEFAULT NULL,
  `nationality_code1` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_kitas` tinyint(4) DEFAULT NULL COMMENT '1=masih aktif 0-expired',
  `tanggal_rujukan` date DEFAULT NULL,
  `masa_berlaku_rujukan` int(11) DEFAULT NULL,
  `status_kronis` tinyint(4) DEFAULT NULL,
  `status_transaksi` tinyint(4) DEFAULT NULL COMMENT '0 = open, 1 = closed',
  PRIMARY KEY (`rawatjalan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `xxt_rawatjalan` */

/*Table structure for table `xxtarif_contoh` */

DROP TABLE IF EXISTS `xxtarif_contoh`;

CREATE TABLE `xxtarif_contoh` (
  `id` int(11) DEFAULT NULL,
  `kode_tarif` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `nama_tarif` varchar(111) CHARACTER SET utf8 DEFAULT NULL,
  `tarif_wni` int(11) DEFAULT NULL,
  `tarif_wna` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `xxtarif_contoh` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

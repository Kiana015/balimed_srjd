/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 10.3.28-MariaDB-log : Database - db_rs_balimed
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `bpjs_aplicares_kamar` */

DROP TABLE IF EXISTS `bpjs_aplicares_kamar`;

CREATE TABLE `bpjs_aplicares_kamar` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kodekelas` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `koderuang` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `namaruang` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kapasitas` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tersedia` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tersediapria` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tersediawanita` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tersediapriawanita` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipe` smallint(6) NOT NULL COMMENT '1=create; 2=update; 3=delete;',
  `status` smallint(6) NOT NULL DEFAULT 1 COMMENT '1=pending; 2=sedang dikirim; 3=sukses; 4=error; ',
  `pesan` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `bpjs_aplicares_refkelas` */

DROP TABLE IF EXISTS `bpjs_aplicares_refkelas`;

CREATE TABLE `bpjs_aplicares_refkelas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kodekelas` varchar(10) DEFAULT NULL,
  `namakelas` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=433 DEFAULT CHARSET=latin1;

/*Table structure for table `bpjs_apotek_dpho` */

DROP TABLE IF EXISTS `bpjs_apotek_dpho`;

CREATE TABLE `bpjs_apotek_dpho` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kodeobat` varchar(30) DEFAULT NULL,
  `namaobat` varchar(100) DEFAULT NULL,
  `prb` varchar(30) DEFAULT NULL,
  `kemo` varchar(30) DEFAULT NULL,
  `kronis` varchar(30) DEFAULT NULL,
  `harga` varchar(100) DEFAULT NULL,
  `restriksi` text DEFAULT NULL,
  `generik` varchar(100) DEFAULT NULL,
  `aktif` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=631 DEFAULT CHARSET=latin1;

/*Table structure for table `bpjs_apotek_obat_nonracikan` */

DROP TABLE IF EXISTS `bpjs_apotek_obat_nonracikan`;

CREATE TABLE `bpjs_apotek_obat_nonracikan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NOSJP` varchar(30) DEFAULT NULL,
  `NORESEP` varchar(100) DEFAULT NULL,
  `KDOBT` varchar(30) DEFAULT NULL,
  `NMOBAT` varchar(30) DEFAULT NULL,
  `SIGNA1OBT` varchar(30) DEFAULT NULL,
  `SIGNA2OBT` varchar(30) DEFAULT NULL,
  `JMLOBT` varchar(100) DEFAULT NULL,
  `JHO` text DEFAULT NULL,
  `CatKhsObt` varchar(100) DEFAULT NULL,
  `status` smallint(6) DEFAULT 1 COMMENT '1=pending; 2=sedang dikirim; 3=sukses; 4=error; ',
  `pesan` varchar(100) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Table structure for table `bpjs_apotek_obat_racikan` */

DROP TABLE IF EXISTS `bpjs_apotek_obat_racikan`;

CREATE TABLE `bpjs_apotek_obat_racikan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NOSJP` varchar(30) DEFAULT NULL,
  `JNSROBT` varchar(30) DEFAULT NULL,
  `NORESEP` varchar(100) DEFAULT NULL,
  `KDOBT` varchar(30) DEFAULT NULL,
  `NMOBAT` varchar(30) DEFAULT NULL,
  `SIGNA1OBT` varchar(30) DEFAULT NULL,
  `SIGNA2OBT` varchar(30) DEFAULT NULL,
  `PERMINTAAN` varchar(100) DEFAULT NULL,
  `JMLOBT` varchar(100) DEFAULT NULL,
  `JHO` text DEFAULT NULL,
  `CatKhsObt` varchar(100) DEFAULT NULL,
  `status` smallint(6) DEFAULT 1 COMMENT '1=pending; 2=sedang dikirim; 3=sukses; 4=error; ',
  `pesan` varchar(100) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Table structure for table `bpjs_apotek_pelayananobat_hapus` */

DROP TABLE IF EXISTS `bpjs_apotek_pelayananobat_hapus`;

CREATE TABLE `bpjs_apotek_pelayananobat_hapus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nosepapotek` varchar(30) DEFAULT NULL,
  `noresep` varchar(100) DEFAULT NULL,
  `kodeobat` varchar(100) DEFAULT NULL,
  `tipeobat` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT '1' COMMENT '1=pending; 2=sedang dikirim; 3=sukses; 4=error; ',
  `pesan` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Table structure for table `bpjs_apotek_resep_daftar` */

DROP TABLE IF EXISTS `bpjs_apotek_resep_daftar`;

CREATE TABLE `bpjs_apotek_resep_daftar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kdppk` varchar(100) DEFAULT NULL,
  `KdJnsObat` varchar(100) DEFAULT NULL,
  `JnsTgl` varchar(100) DEFAULT NULL,
  `TglMulai` datetime DEFAULT NULL,
  `TglAkhir` datetime DEFAULT NULL,
  `status` varchar(100) DEFAULT '1' COMMENT '1=pending; 2=sedang dikirim; 3=sukses; 4=error; ',
  `pesan` varchar(100) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Table structure for table `bpjs_apotek_resep_hapus` */

DROP TABLE IF EXISTS `bpjs_apotek_resep_hapus`;

CREATE TABLE `bpjs_apotek_resep_hapus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nosjp` varchar(100) DEFAULT NULL,
  `refasalsjp` varchar(100) DEFAULT NULL,
  `noresep` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT '1' COMMENT '1=pending; 2=sedang dikirim; 3=sukses; 4=error; ',
  `pesan` varchar(100) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Table structure for table `bpjs_apotek_resep_simpan` */

DROP TABLE IF EXISTS `bpjs_apotek_resep_simpan`;

CREATE TABLE `bpjs_apotek_resep_simpan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `TGLSJP` datetime DEFAULT NULL,
  `REFASALSJP` varchar(100) DEFAULT NULL,
  `POLIRSP` varchar(100) DEFAULT NULL,
  `KDJNSOBAT` varchar(30) DEFAULT NULL,
  `NORESEP` varchar(30) DEFAULT NULL,
  `IDUSERSJP` varchar(30) DEFAULT NULL,
  `TGLRSP` datetime DEFAULT NULL,
  `TGLPELRSP` datetime DEFAULT NULL,
  `KdDokter` varchar(100) DEFAULT NULL,
  `iterasi` varchar(100) DEFAULT NULL,
  `status` smallint(6) DEFAULT 1 COMMENT '1=pending; 2=sedang dikirim; 3=sukses; 4=error; ',
  `pesan` varchar(100) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `bpjs_apotek_spesialistik` */

DROP TABLE IF EXISTS `bpjs_apotek_spesialistik`;

CREATE TABLE `bpjs_apotek_spesialistik` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode` varchar(30) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;

/*Table structure for table `bpjs_batal_booking_ant` */

DROP TABLE IF EXISTS `bpjs_batal_booking_ant`;

CREATE TABLE `bpjs_batal_booking_ant` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kodebooking` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_batal` smallint(6) NOT NULL DEFAULT 1 COMMENT '1=pending; 2=sedang dikirim; 3=sukses; 4=error; ',
  `pesan_batal` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `estimasidilayani` bigint(20) DEFAULT NULL,
  `sisakuotajkn` int(11) DEFAULT NULL,
  `kuotajkn` int(11) DEFAULT NULL,
  `sisakuotanonjkn` int(11) DEFAULT NULL,
  `kuotanonjkn` int(11) DEFAULT NULL,
  `keterangan` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `statusbooking` smallint(6) DEFAULT 1 COMMENT '1=pending; 2=sedang dikirim; 3=sukses; 4=error; ',
  `pesanbooking` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `bpjs_dokter_ant` */

DROP TABLE IF EXISTS `bpjs_dokter_ant`;

CREATE TABLE `bpjs_dokter_ant` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kodedokter` bigint(20) NOT NULL,
  `namadokter` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `kapasitaspasien` smallint(6) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

/*Table structure for table `bpjs_poli_ant` */

DROP TABLE IF EXISTS `bpjs_poli_ant`;

CREATE TABLE `bpjs_poli_ant` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kdpoli` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nmpoli` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kdsubspesialis` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nmsubspesialis` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `bpjs_scheduler` */

DROP TABLE IF EXISTS `bpjs_scheduler`;

CREATE TABLE `bpjs_scheduler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `service` varchar(30) DEFAULT NULL,
  `menit` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '1=aktif; 0=tidak aktif;',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Table structure for table `bpjs_sep` */

DROP TABLE IF EXISTS `bpjs_sep`;

CREATE TABLE `bpjs_sep` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pasien_id` int(11) DEFAULT NULL,
  `tgl_sep` date DEFAULT NULL,
  `detail` longtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

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
  `status_update` smallint(6) DEFAULT 1 COMMENT '1=pending; 2=sukses; 3=error;',
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `bpjs_update_waktu_ant` */

DROP TABLE IF EXISTS `bpjs_update_waktu_ant`;

CREATE TABLE `bpjs_update_waktu_ant` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kodebooking` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taskid` smallint(6) NOT NULL,
  `waktu` bigint(20) DEFAULT NULL,
  `status_update` smallint(6) DEFAULT 1 COMMENT '1=pending; 2=sedang dikirim; 3=sukses; 4=error; ',
  `pesan_update` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

/*Table structure for table `form_ass_pra_operasi` */

DROP TABLE IF EXISTS `form_ass_pra_operasi`;

CREATE TABLE `form_ass_pra_operasi` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `layanan_id` bigint(20) DEFAULT NULL COMMENT 't_layanan',
  `nomor_registrasi` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 't_layanan',
  `no_rm` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 't_layanan',
  `doc_id` bigint(20) DEFAULT NULL COMMENT 'id induk; m_ok_booking utk operasi',
  `subunit_id` int(11) DEFAULT NULL COMMENT 'subunit tempat kejadian',
  `doc_kode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'kode dokumen;setup di m_setup_unit',
  `datang_sendiri` tinyint(4) DEFAULT NULL,
  `datang_rujukan` tinyint(4) DEFAULT NULL,
  `tanggal` date DEFAULT NULL COMMENT 'entry',
  `jam` time DEFAULT NULL COMMENT 'entry',
  `statut_ttd_a` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `passcode_a` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry passcode dokter',
  `file_ttd_a` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry ttd dokter',
  `statut_ttd_b` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `passcode_b` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry passcode pasien',
  `file_ttd_b` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry ttd pasien',
  `ds_batuk` tinyint(4) DEFAULT NULL,
  `ds_pusing` tinyint(4) DEFAULT NULL,
  `ds_sesak_nafas` tinyint(4) DEFAULT NULL,
  `ds_pilek` tinyint(4) DEFAULT NULL,
  `ds_mual` tinyint(4) DEFAULT NULL,
  `ds_puasa` tinyint(4) DEFAULT NULL,
  `ds_gigi_palsu` tinyint(4) DEFAULT NULL,
  `ds_lain` tinyint(4) DEFAULT NULL,
  `ds_lain_txt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rp_dm` tinyint(4) DEFAULT NULL,
  `rp_tbparu` tinyint(4) DEFAULT NULL,
  `rp_hepatitis` tinyint(4) DEFAULT NULL,
  `rp_hipertensi` tinyint(4) DEFAULT NULL,
  `rp_ami` tinyint(4) DEFAULT NULL,
  `rp_hiv` tinyint(4) DEFAULT NULL,
  `rp_ashma` tinyint(4) DEFAULT NULL,
  `rp_chf` tinyint(4) DEFAULT NULL,
  `rp_lain` tinyint(4) DEFAULT NULL,
  `rp_lain_txt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `periksa_jam_a` time DEFAULT NULL,
  `periksa_jam_b` time DEFAULT NULL,
  `tekanan_sistol_a` int(11) DEFAULT NULL,
  `tekanan_diastol_a` int(11) DEFAULT NULL,
  `tekanan_sistol_b` int(11) DEFAULT NULL,
  `tekanan_diastol_b` int(11) DEFAULT NULL,
  `fnafas_a` int(11) DEFAULT NULL,
  `fnafas_b` int(11) DEFAULT NULL,
  `nadi_a` int(11) DEFAULT NULL,
  `nadi_b` int(11) DEFAULT NULL,
  `suhu_a` float DEFAULT NULL,
  `suhu_b` float DEFAULT NULL,
  `inspeksi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auskultasi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `palpasi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `perkusi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hpp_foto_rontgen` tinyint(4) DEFAULT NULL,
  `hpp_ctscan` tinyint(4) DEFAULT NULL,
  `hpp_mri` tinyint(4) DEFAULT NULL,
  `hpp_usg` tinyint(4) DEFAULT NULL,
  `hpp_ekg` tinyint(4) DEFAULT NULL,
  `hpp_lab` tinyint(4) DEFAULT NULL,
  `hpp_lain1_txt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hpp_lain1` tinyint(4) DEFAULT NULL,
  `hpp_lain2_txt` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hpp_lain2` tinyint(4) DEFAULT NULL,
  `hpp_lain3_txt` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hpp_lain3` tinyint(4) DEFAULT NULL,
  `hpp_lain4_txt` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hpp_lain4` tinyint(4) DEFAULT NULL,
  `riwayat_operasi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dok_inform_concent` tinyint(4) DEFAULT NULL,
  `dok_lain1_txt` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dok_lain1` tinyint(4) DEFAULT NULL,
  `dok_lain2_txt` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dok_lain2` tinyint(4) DEFAULT NULL,
  `dok_lain3_txt` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dok_lain3` tinyint(4) DEFAULT NULL,
  `diagnosa_pra` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rencana_operasi` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `posisi_pasien` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alat_khusus` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profilaksis` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `perkiraan_lama` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prosedur` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tgl_prosedur` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `form_check_list_post_operasi` */

DROP TABLE IF EXISTS `form_check_list_post_operasi`;

CREATE TABLE `form_check_list_post_operasi` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `layanan_id` bigint(20) DEFAULT NULL COMMENT 't_layanan',
  `nomor_registrasi` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 't_layanan',
  `no_rm` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 't_layanan',
  `doc_id` bigint(20) DEFAULT NULL COMMENT 'id induk; m_ok_booking utk operasi',
  `subunit_id` int(11) DEFAULT NULL COMMENT 'subunit tempat kejadian',
  `doc_kode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'kode dokumen;setup di m_setup_unit',
  `tanggal` date DEFAULT NULL COMMENT 'entry',
  `jam` time DEFAULT NULL COMMENT 'entry',
  `status_ttd_a` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `passcode_a` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `file_ttd_a` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `status_ttd_b` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `passcode_b` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `file_ttd_b` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `blanko_keperawatan_pr` tinyint(4) DEFAULT NULL,
  `blanko_keperawatan_pk` tinyint(4) DEFAULT NULL,
  `blanko_keperawatan_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blanko_kesiapan_pr` tinyint(4) DEFAULT NULL,
  `blanko_kesiapan_pk` tinyint(4) DEFAULT NULL,
  `blanko_kesiapan_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blanko_keselamatan_pr` tinyint(4) DEFAULT NULL,
  `blanko_keselamatan_pk` tinyint(4) DEFAULT NULL,
  `blanko_keselamatan_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blanko_anastesi_pr` tinyint(4) DEFAULT NULL,
  `blanko_anastesi_pk` tinyint(4) DEFAULT NULL,
  `blanko_anastesi_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blanko_operasi_pr` tinyint(4) DEFAULT NULL,
  `blanko_operasi_pk` tinyint(4) DEFAULT NULL,
  `blanko_operasi_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blanko_alat_pr` tinyint(4) DEFAULT NULL,
  `blanko_alat_pk` tinyint(4) DEFAULT NULL,
  `blanko_alat_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blanko_kitir_pr` tinyint(4) DEFAULT NULL,
  `blanko_kitir_pk` tinyint(4) DEFAULT NULL,
  `blanko_kitir_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blanko_ilo_pr` tinyint(4) DEFAULT NULL,
  `blanko_ilo_pk` tinyint(4) DEFAULT NULL,
  `blanko_ilo_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blanko_integrasi_pr` tinyint(4) DEFAULT NULL,
  `blanko_integrasi_pk` tinyint(4) DEFAULT NULL,
  `blanko_integrasi_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bahan_pa_pr` tinyint(4) DEFAULT NULL,
  `bahan_pa_pk` tinyint(4) DEFAULT NULL,
  `bahan_pa_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bahan_kultur_pr` tinyint(4) DEFAULT NULL,
  `bahan_kultur_pk` tinyint(4) DEFAULT NULL,
  `bahan_kultur_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hasil_rontgen_pr` tinyint(4) DEFAULT NULL,
  `hasil_rontgen_pk` tinyint(4) DEFAULT NULL,
  `hasil_rontgen_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hasil_lab_pr` tinyint(4) DEFAULT NULL,
  `hasil_lab_pk` tinyint(4) DEFAULT NULL,
  `hasil_lab_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hasil_ekg_pr` tinyint(4) DEFAULT NULL,
  `hasil_ekg_pk` tinyint(4) DEFAULT NULL,
  `hasil_ekg_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hasil_fotolain_pr` tinyint(4) DEFAULT NULL,
  `hasil_fotolain_pk` tinyint(4) DEFAULT NULL,
  `hasil_fotolain_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `barang_pasien_pr` tinyint(4) DEFAULT NULL,
  `barang_pasien_pk` tinyint(4) DEFAULT NULL,
  `barang_pasien_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vital_txt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vital_pr` tinyint(4) DEFAULT NULL,
  `vital_pk` tinyint(4) DEFAULT NULL,
  `vital_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `program_pr` tinyint(4) DEFAULT NULL,
  `program_pk` tinyint(4) DEFAULT NULL,
  `program_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `form_check_list_pra_operasi` */

DROP TABLE IF EXISTS `form_check_list_pra_operasi`;

CREATE TABLE `form_check_list_pra_operasi` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `layanan_id` bigint(20) DEFAULT NULL COMMENT 't_layanan',
  `nomor_registrasi` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 't_layanan',
  `no_rm` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 't_layanan',
  `doc_id` bigint(20) DEFAULT NULL COMMENT 'id induk; m_ok_booking utk operasi',
  `subunit_id` int(11) DEFAULT NULL COMMENT 'subunit tempat kejadian',
  `doc_kode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'kode dokumen;setup di m_setup_unit',
  `tanggal` date DEFAULT NULL COMMENT 'entry',
  `jam` time DEFAULT NULL COMMENT 'entry',
  `status_ttd_a` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `passcode_a` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `file_ttd_a` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `status_ttd_b` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `passcode_b` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `file_ttd_b` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `ip_benar_gelang_pr` tinyint(4) DEFAULT NULL COMMENT 'entry',
  `ip_benar_gelang_pk` tinyint(4) DEFAULT NULL COMMENT 'entry',
  `ip_benar_gelang_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `ip_benar_nama_pr` tinyint(4) DEFAULT NULL COMMENT 'entry',
  `ip_benar_nama_pk` tinyint(4) DEFAULT NULL COMMENT 'entry',
  `ip_benar_nama_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `ip_benar_norm_pr` tinyint(4) DEFAULT NULL COMMENT 'entry',
  `ip_benar_norm_pk` tinyint(4) DEFAULT NULL COMMENT 'entry',
  `ip_benar_norm_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `ip_benar_tgl_pr` tinyint(4) DEFAULT NULL COMMENT 'entry',
  `ip_benar_tgl_pk` tinyint(4) DEFAULT NULL COMMENT 'entry',
  `ip_benar_tgl_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `ic_bedah_pr` tinyint(4) DEFAULT NULL COMMENT 'entry',
  `ic_bedah_pk` tinyint(4) DEFAULT NULL COMMENT 'entry',
  `ic_bedah_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `ic_anastesi_pr` tinyint(4) DEFAULT NULL COMMENT 'entry',
  `ic_anastesi_pk` tinyint(4) DEFAULT NULL COMMENT 'entry',
  `ic_anastesi_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `site_marking_pr` tinyint(4) DEFAULT NULL COMMENT 'entry',
  `site_marking_pk` tinyint(4) DEFAULT NULL COMMENT 'entry',
  `site_marking_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `alergi_txt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `alergi_pr` tinyint(4) DEFAULT NULL COMMENT 'entry',
  `alergi_pk` tinyint(4) DEFAULT NULL COMMENT 'entry',
  `alergi_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `jenis_alergi_txt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jenis_alergi_pr` tinyint(4) DEFAULT NULL,
  `jenis_alergi_pk` tinyint(4) DEFAULT NULL,
  `jenis_alergi_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reaksi_alergi_txt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reaksi_alergi_pr` tinyint(4) DEFAULT NULL,
  `reaksi_alergi_pk` tinyint(4) DEFAULT NULL,
  `reaksi_alergi_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `evaluasi_anastesi_pr` tinyint(4) DEFAULT NULL,
  `evaluasi_anastesi_pk` tinyint(4) DEFAULT NULL,
  `evaluasi_anastesi_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `evaluasi_bedah_pr` tinyint(4) DEFAULT NULL,
  `evaluasi_bedah_pk` tinyint(4) DEFAULT NULL,
  `evaluasi_bedah_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hasil_lab_pr` tinyint(4) DEFAULT NULL,
  `hasil_lab_pk` tinyint(4) DEFAULT NULL,
  `hasil_lab_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hasil_pa_pr` tinyint(4) DEFAULT NULL,
  `hasil_pa_pk` tinyint(4) DEFAULT NULL,
  `hasil_pa_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hasil_djj_pr` tinyint(4) DEFAULT NULL,
  `hasil_djj_pk` tinyint(4) DEFAULT NULL,
  `hasil_djj_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hasil_rontgen_pr` tinyint(4) DEFAULT NULL,
  `hasil_rontgen_pk` tinyint(4) DEFAULT NULL,
  `hasil_rontgen_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hasil_ekg_pr` tinyint(4) DEFAULT NULL,
  `hasil_ekg_pk` tinyint(4) DEFAULT NULL,
  `hasil_ekg_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hasil_fotolain_pr` tinyint(4) DEFAULT NULL,
  `hasil_fotolain_pk` tinyint(4) DEFAULT NULL,
  `hasil_fotolain_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `okj_ctscan_pr` tinyint(4) DEFAULT NULL,
  `okj_ctscan_pk` tinyint(4) DEFAULT NULL,
  `okj_ctscan_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `okj_echo_pr` tinyint(4) DEFAULT NULL,
  `okj_echo_pk` tinyint(4) DEFAULT NULL,
  `okj_echo_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `okj_kateter_pr` tinyint(4) DEFAULT NULL,
  `okj_kateter_pk` tinyint(4) DEFAULT NULL,
  `okj_kateter_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hk_penyakit_dalam_pr` tinyint(4) DEFAULT NULL,
  `hk_penyakit_dalam_pk` tinyint(4) DEFAULT NULL,
  `hk_penyakit_dalam_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hk_anastesi_pr` tinyint(4) DEFAULT NULL,
  `hk_anastesi_pk` tinyint(4) DEFAULT NULL,
  `hk_anastesi_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hk_bagian_lain_txt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hk_bagian_lain_pr` tinyint(4) DEFAULT NULL,
  `hk_bagian_lain_pk` tinyint(4) DEFAULT NULL,
  `hk_bagian_lain_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trans_persiapan_pr` tinyint(4) DEFAULT NULL,
  `trans_persiapan_pk` tinyint(4) DEFAULT NULL,
  `trans_persiapan_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trans_persetujuan_pr` tinyint(4) DEFAULT NULL,
  `trans_persetujuan_pk` tinyint(4) DEFAULT NULL,
  `trans_persetujuan_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pro_implant_pr` tinyint(4) DEFAULT NULL,
  `pro_implant_pk` tinyint(4) DEFAULT NULL,
  `pro_implant_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pro_pace_pr` tinyint(4) DEFAULT NULL,
  `pro_pace_pk` tinyint(4) DEFAULT NULL,
  `pro_pace_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pro_alat_pr` tinyint(4) DEFAULT NULL,
  `pro_alat_pk` tinyint(4) DEFAULT NULL,
  `pro_alat_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pro_lensa_pr` tinyint(4) DEFAULT NULL,
  `pro_lensa_pk` tinyint(4) DEFAULT NULL,
  `pro_lensa_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gigi_palsu_pr` tinyint(4) DEFAULT NULL,
  `gigi_palsu_pk` tinyint(4) DEFAULT NULL,
  `gigi_palsu_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gigi_goyang_pr` tinyint(4) DEFAULT NULL,
  `gigi_goyang_pk` tinyint(4) DEFAULT NULL,
  `gigi_goyang_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pk_cukur_pr` tinyint(4) DEFAULT NULL,
  `pk_cukur_pk` tinyint(4) DEFAULT NULL,
  `pk_cukur_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pk_mandi_pr` tinyint(4) DEFAULT NULL,
  `pk_mandi_pk` tinyint(4) DEFAULT NULL,
  `pk_mandi_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pk_cuci_pr` tinyint(4) DEFAULT NULL,
  `pk_cuci_pk` tinyint(4) DEFAULT NULL,
  `pk_cuci_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pk_potong_pr` tinyint(4) DEFAULT NULL,
  `pk_potong_pk` tinyint(4) DEFAULT NULL,
  `pk_potong_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pk_hapus_pr` tinyint(4) DEFAULT NULL,
  `pk_hapus_pk` tinyint(4) DEFAULT NULL,
  `pk_hapus_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pk_pakaian_pr` tinyint(4) DEFAULT NULL,
  `pk_pakaian_pk` tinyint(4) DEFAULT NULL,
  `pk_pakaian_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pk_urus_pr` tinyint(4) DEFAULT NULL,
  `pk_urus_pk` tinyint(4) DEFAULT NULL,
  `pk_urus_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pk_huknah_tinggi_txt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pk_huknah_tinggi_pr` tinyint(4) DEFAULT NULL,
  `pk_huknah_tinggi_pk` tinyint(4) DEFAULT NULL,
  `pk_huknah_tinggi_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pk_huknah_rendah_txt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pk_huknah_rendah_pr` tinyint(4) DEFAULT NULL,
  `pk_huknah_rencah_pk` tinyint(4) DEFAULT NULL,
  `pk_huknah_rendah_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `buku_anc_pr` tinyint(4) DEFAULT NULL,
  `buku_anc_pk` tinyint(4) DEFAULT NULL,
  `buku_anc_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `puasa_jam_txt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `puasa_jam_pr` tinyint(4) DEFAULT NULL,
  `puasa_jam_pk` tinyint(4) DEFAULT NULL,
  `puasa_jam_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `barang_pasien_pr` tinyint(4) DEFAULT NULL,
  `barang_pasien_pk` tinyint(4) DEFAULT NULL,
  `barang_pasien_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cek_vital_jam_txt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cek_vital_jam_pr` tinyint(4) DEFAULT NULL,
  `cek_vital_jam_pk` tinyint(4) DEFAULT NULL,
  `cek_vital_jam_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cek_bb_tb_txt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cek_bb_tb_pr` tinyint(4) DEFAULT NULL,
  `cek_bb_tb_pk` tinyint(4) DEFAULT NULL,
  `cek_bb_tb_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `program_obat_pr` tinyint(4) DEFAULT NULL,
  `program_obat_pk` tinyint(4) DEFAULT NULL,
  `program_obat_ket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `form_survei_ilo` */

DROP TABLE IF EXISTS `form_survei_ilo`;

CREATE TABLE `form_survei_ilo` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `layanan_id` bigint(20) DEFAULT NULL,
  `nomor_registrasi` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_rm` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subunit_id` int(11) DEFAULT NULL,
  `doc_id` bigint(20) DEFAULT NULL COMMENT 'id induk',
  `doc_kode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tgl_mrs` date DEFAULT NULL COMMENT 'entry;ambil dari t_layanan',
  `tgl_operasi` date DEFAULT NULL COMMENT 'entry;ambil_dari m_ok_booking',
  `berat_badan` float DEFAULT NULL,
  `lama_operasi` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry;ambil dari kamar_status',
  `jenis_operasi_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref 345',
  `kualifikasi_dokter_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref 425',
  `kualifikasi_dokter_txt` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'jika kualifikasi_dokter 4',
  `operasi_trauma` tinyint(4) DEFAULT NULL COMMENT '0,1',
  `ruang_operasi` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ambil dari m_ok_booking',
  `prosedur_operasi_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref 426',
  `prosedur_operasi_txt` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry bila prosedur operasi 6',
  `multiprosedur` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `asa_score` tinyint(4) DEFAULT NULL COMMENT '1,2,3,4,5 sesuai isian',
  `klasifikasi_luka_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref 427',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `form_survei_ilo_durante` */

DROP TABLE IF EXISTS `form_survei_ilo_durante`;

CREATE TABLE `form_survei_ilo_durante` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `layanan_id` bigint(20) DEFAULT NULL,
  `nomor_registrasi` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_rm` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subunit_id` int(11) DEFAULT NULL,
  `doc_id` bigint(20) DEFAULT NULL COMMENT 'id induk',
  `doc_kode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sirkulasi_udara` float DEFAULT NULL,
  `air_count` float DEFAULT NULL,
  `kelembaban` float DEFAULT NULL,
  `tekanan_udara` tinyint(4) DEFAULT NULL COMMENT '1,0 (plus minus) sesuai isian',
  `jamur_ac` tinyint(4) DEFAULT NULL COMMENT '1,0 (plus minus)',
  `drain` tinyint(4) DEFAULT NULL COMMENT '1,0 (ya tidak)',
  `drain_txt` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `suhu_ruang` float DEFAULT NULL,
  `implant` tinyint(4) DEFAULT NULL COMMENT '1,0 (ya tidak)',
  `implant_txt` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `steril_cssd` tinyint(50) DEFAULT NULL COMMENT '1,0 (ya tidak)',
  `jumlah_staf` smallint(6) DEFAULT NULL,
  `antibiotik` tinyint(4) DEFAULT NULL COMMENT '1,0 (ya tidak)',
  `antibiotik_obat` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `antibiotik_dosis` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `antibiotik_jam` time DEFAULT NULL,
  `disinfeksi_chl` tinyint(4) DEFAULT NULL COMMENT '0,1',
  `disinfeksi_pov` tinyint(4) DEFAULT NULL COMMENT '0,1',
  `disinfeksi_alkohol` tinyint(4) DEFAULT NULL COMMENT '0,1',
  `intikator_int` tinyint(4) DEFAULT NULL COMMENT '0,1',
  `indikator_ext` tinyint(4) DEFAULT NULL COMMENT '0,1',
  `indikator_tidak` tinyint(4) DEFAULT NULL COMMENT '0,1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `form_survei_ilo_postop` */

DROP TABLE IF EXISTS `form_survei_ilo_postop`;

CREATE TABLE `form_survei_ilo_postop` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `layanan_id` bigint(20) DEFAULT NULL,
  `nomor_registrasi` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_rm` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subunit_id` int(11) DEFAULT NULL,
  `doc_id` bigint(50) DEFAULT NULL COMMENT 'form_survei_ilo',
  `doc_kode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '1' COMMENT 'buat di m_setup_unit',
  `superfisial` tinyint(4) DEFAULT NULL,
  `organ` tinyint(4) DEFAULT NULL,
  `dalam` tinyint(4) DEFAULT NULL,
  `sal_gastro` tinyint(4) DEFAULT NULL,
  `sal_genital` tinyint(4) DEFAULT NULL,
  `intra_abdominal` tinyint(4) DEFAULT NULL,
  `endokardium` tinyint(4) DEFAULT NULL,
  `sendi` tinyint(4) DEFAULT NULL,
  `peri` tinyint(4) DEFAULT NULL,
  `vaginal_cuff` tinyint(4) DEFAULT NULL,
  `lain` tinyint(4) DEFAULT NULL,
  `lain_txt` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `form_survei_ilo_postop_d` */

DROP TABLE IF EXISTS `form_survei_ilo_postop_d`;

CREATE TABLE `form_survei_ilo_postop_d` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `layanan_id` bigint(20) DEFAULT NULL,
  `nomor_registrasi` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_rm` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subunit_id` int(11) DEFAULT NULL,
  `doc_id` bigint(20) DEFAULT NULL COMMENT 'form_survei_ilo',
  `doc_kode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `materi_id` int(11) DEFAULT NULL COMMENT 'form_survey_ilo_mtg',
  `hari_ke` smallint(6) DEFAULT NULL COMMENT '1,2,3...30 dst',
  `keterangan` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `form_survei_ilo_postop_m` */

DROP TABLE IF EXISTS `form_survei_ilo_postop_m`;

CREATE TABLE `form_survei_ilo_postop_m` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `materi` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group_materi` tinyint(4) DEFAULT 1 COMMENT 'kelompok materi, 1 atau 2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `form_survei_ilo_preop` */

DROP TABLE IF EXISTS `form_survei_ilo_preop`;

CREATE TABLE `form_survei_ilo_preop` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `layanan_id` bigint(20) DEFAULT NULL,
  `nomor_registrasi` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_rm` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subunit_id` int(11) DEFAULT NULL,
  `doc_id` bigint(20) DEFAULT NULL COMMENT 'id induk',
  `doc_kode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `suhu_pasien` tinyint(4) DEFAULT NULL COMMENT '1,2 sesuai isian',
  `albumin` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gula_darah` tinyint(4) DEFAULT NULL COMMENT '1,2 sesuai isian',
  `steroid` tinyint(4) DEFAULT NULL COMMENT '0,1',
  `p_infeksi_kulit` tinyint(4) DEFAULT NULL COMMENT '0,1',
  `p_infeksi_mulut` tinyint(4) DEFAULT NULL COMMENT '0,1',
  `p_infeksi_mata` tinyint(4) DEFAULT NULL COMMENT '0,1',
  `p_infeksi_tht` tinyint(4) DEFAULT NULL COMMENT '0,1',
  `p_infeksi_paru` tinyint(4) DEFAULT NULL COMMENT '0,1',
  `p_infeksi_gl` tinyint(4) DEFAULT NULL COMMENT '0,1',
  `p_infeksi_lain` tinyint(4) DEFAULT NULL COMMENT '0,1',
  `p_infeksi_lain_txt` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `screening_mrsa` tinyint(4) DEFAULT NULL COMMENT '0,1',
  `screening_hasil` tinyint(4) DEFAULT NULL COMMENT '1,2 plus atau minus',
  `penyakit_dm` tinyint(4) DEFAULT NULL COMMENT '0,1',
  `penyakit_ggk` tinyint(4) DEFAULT NULL COMMENT '0,1',
  `penyakit_sepsis` tinyint(4) DEFAULT NULL COMMENT '0,1',
  `penyakit_hipertensi` tinyint(4) DEFAULT NULL COMMENT '0,1',
  `penyakit_tidak` tinyint(4) DEFAULT NULL COMMENT '0,1',
  `penyakit_lain` tinyint(4) DEFAULT NULL COMMENT '0,1',
  `penyakit_lain_txt` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `pencukuran` tinyint(4) DEFAULT NULL COMMENT '1,2,3 sesuai isian',
  `pencukuran_waktu` time DEFAULT NULL,
  `m_bowel` tinyint(4) DEFAULT NULL COMMENT '0,1',
  `mandi_sbl_operasi` tinyint(4) DEFAULT NULL COMMENT '1,2,3 sesuai isian',
  `profilak` tinyint(4) DEFAULT NULL COMMENT '0,1',
  `profilak_obat` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profilak_dosis` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profilak_jam` time DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `hd_booking_status` */

DROP TABLE IF EXISTS `hd_booking_status`;

CREATE TABLE `hd_booking_status` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `booking_id` bigint(20) DEFAULT NULL COMMENT 'm_hd_booking',
  `status_hd_id` bigint(20) DEFAULT NULL COMMENT 'hd_status; satu hd_status bisa banyak booking_id',
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `hd_resep_rajal` */

DROP TABLE IF EXISTS `hd_resep_rajal`;

CREATE TABLE `hd_resep_rajal` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `hd_status_id` bigint(20) DEFAULT NULL COMMENT 'hd_status',
  `hd_rdm_id` bigint(20) DEFAULT NULL COMMENT 'hd_rmd',
  `tanggal_hd` date DEFAULT NULL COMMENT 'entry',
  `jam_hd` time DEFAULT NULL COMMENT 'entry',
  `bb_kering` float DEFAULT NULL COMMENT 'entry;default nilai sebelumnya;kalau nga ada ambil dari hd_rmd',
  `frek_hd` smallint(6) DEFAULT NULL COMMENT 'entry;default nilai sebelumnya;kalau nga ada ambil dari hd_rmd',
  `lama_hd` float DEFAULT NULL COMMENT 'entry;default nilai sebelumnya;kalau nga ada ambil dari hd_rmd',
  `luas_membrane` float DEFAULT NULL COMMENT 'entry;default nilai sebelumnya;kalau nga ada ambil dari hd_rmd',
  `dialisat_flow` float DEFAULT NULL COMMENT 'entry;default nilai sebelumnya;kalau nga ada ambil dari hd_rmd',
  `akses_vaskuler_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry;default nilai sebelumnya;kalau nga ada ambil dari hd_rmd',
  `kecepatan_aliran_darah` float DEFAULT NULL COMMENT 'entry;default nilai sebelumnya;kalau nga ada ambil dari hd_rmd',
  `ukuran_jarum` float DEFAULT NULL COMMENT 'entry;default nilai sebelumnya;kalau nga ada ambil dari hd_rmd',
  `heparin_awal` float DEFAULT NULL COMMENT 'entry;default nilai sebelumnya;kalau nga ada ambil dari hd_rmd',
  `heparin_pemeliharaan` float DEFAULT NULL COMMENT 'entry;default nilai sebelumnya;kalau nga ada ambil dari hd_rmd',
  `intruksi_hd` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry;default nilai sebelumnya;kalau nga ada ambil dari hd_rmd',
  `dokter_hd_id` int(11) DEFAULT NULL COMMENT 'entry;default dari booking; m_subunit_medik dengan subunitid = hemodialisa',
  `status_ttd` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `passcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `file_ttd` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `hd_rmd` */

DROP TABLE IF EXISTS `hd_rmd`;

CREATE TABLE `hd_rmd` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `no_rm` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_pasien',
  `layanan_id` bigint(20) DEFAULT NULL COMMENT 't_layanan',
  `nomor_registrasi` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hd_status_id` bigint(20) DEFAULT NULL COMMENT 'hd_status',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `keluhan_utama` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `penyakit_sekarang` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `riwayat_pengobatan` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `riwayat_penyakit_keluarga` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `alergi_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `alergi_obat_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `alergi_makanan_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `alergi_udara_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `alergi_debu_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `alergi_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `hipertensi_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `diabetes_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `jantung_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `stroke_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `ginjal_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `asma_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `kejang_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `liver_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `cancer_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `tbc_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `glukoma_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `std_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `pendarahan_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `lainnya_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `riwayat_penyakit_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `operasi_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `operasi_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `tranfusi_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `reaksi_transfusi_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `reaksi_transfusi_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `diagnosa_primer` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `icd10_primer_kode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_icd',
  `diagnosa_banding` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `icd10_banding_kode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:m_icd',
  `pemeriksaan_penunjang` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `rencana_asuhan` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `rekomendasi_dokter` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `disposisi_id` tinyint(1) DEFAULT NULL COMMENT '1=pulang, 2=kontrol, 3=rawat, 4=rujuk',
  `pulang_id` tinyint(4) DEFAULT NULL COMMENT 'tidak dipakai, m_yesno',
  `pulang_datetime` datetime DEFAULT NULL COMMENT 'entry',
  `kontrol_id` tinyint(4) DEFAULT NULL COMMENT 'tidak dipakai, m_yesno',
  `kontrol_kronis_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `kontrol_datetime` datetime DEFAULT NULL COMMENT 'entry',
  `rawat_id` tinyint(4) DEFAULT NULL COMMENT 'tidak dipakai, m_yesno',
  `rawat_subunit_id` int(11) DEFAULT NULL COMMENT 'm_subunit_medik',
  `rawat_ruangan` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry;m_subunit_medik',
  `rujuk_id` tinyint(4) DEFAULT NULL COMMENT 'tidak dipakai, m_yesno',
  `alergi_lainnya_id` tinyint(4) DEFAULT NULL,
  `fu_td_sistole` int(11) DEFAULT NULL COMMENT 'entry',
  `fu_td_diastole` int(11) DEFAULT NULL COMMENT 'entry',
  `fu_rr` int(11) DEFAULT NULL COMMENT 'entry',
  `fu_nadi` int(11) DEFAULT NULL COMMENT 'entry',
  `fu_suhu` float DEFAULT NULL COMMENT 'entry',
  `fu_keadaan_umum_id` tinyint(4) DEFAULT NULL COMMENT 'm_ref group_id=337',
  `fu_gizi_id` tinyint(4) DEFAULT NULL COMMENT 'm_ref group_id=338',
  `fu_gcs_e` smallint(6) DEFAULT NULL COMMENT 'entry',
  `fu_gcs_v` smallint(6) DEFAULT NULL COMMENT 'entry',
  `fu_gcs_m` smallint(6) DEFAULT NULL COMMENT 'entry',
  `fu_kepala_normal` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_kepala_mikro` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_kepala_makro` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_kepala_lainnya` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_kepala_ket` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `fu_mata_a` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_mata_i` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_mata_r` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_mata_o` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_mata_ket` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `fu_tht_te` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_tht_hi` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_tht_fa` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_tht_to` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_tht_ket` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `fu_gigi_no` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_gigi_lu` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_gigi_bd` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_gigi_gp` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_gigi_ket` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `fu_leher_k` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_leher_j` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_leher_l` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_leher_p` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_leher_ket` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `fu_thorax_sim` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_thorax_ket` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `fu_cor_s1s2` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `fu_cor_reg` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_pulmo_s` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_pulmo_r` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_pulmo_w` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_pulmo_l` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_pulmo_ket` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `fu_abdomen_dis` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_abdomen_dis_pm` tinyint(4) DEFAULT NULL COMMENT 'm_yesno;pilih plus (+) atau minus (-);pakai optionbox',
  `fu_abdomen_met` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_abdomen_met_pm` tinyint(4) DEFAULT NULL COMMENT 'm_yesno;pilih plus (+) atau minus (-);pakai optionbox',
  `fu_abdomen_per` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_abdomen_nmm` tinyint(4) DEFAULT NULL COMMENT 'm_ref group_id=344',
  `fu_abdomen_asc` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_abdomen_asc_pm` tinyint(4) DEFAULT NULL COMMENT 'm_yesno;pilih plus (+) atau minus (-);pakai optionbox',
  `fu_abdomen_nyeri` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_abdomen_nyeri_pm` tinyint(4) DEFAULT NULL COMMENT 'm_yesno;pilih plus (+) atau minus (-);pakai optionbox',
  `fu_abdomen_lokasi` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `fu_abdomen_hepar` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `fu_abdomen_lien` tinyint(100) DEFAULT NULL COMMENT 'm_yesno',
  `fu_abdomen_lien_ket` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `fu_extrim_h` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_extrim_o` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_extrim_r` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_extrim_l` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_extrim_ket` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `fu_des` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'json data pemeriksaan fisik masing2 poli',
  `kontrol_subunit` int(10) DEFAULT NULL COMMENT 'm_subunit_medik',
  `kontrol_dokter_id` int(10) DEFAULT NULL COMMENT 'm_pegawai',
  `kontrol_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pulang_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jenis_hd_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref dengan group_id=380',
  `bb_kering` float DEFAULT NULL COMMENT 'entry',
  `frek_hd` smallint(6) DEFAULT NULL COMMENT 'entry',
  `lama_hd` float DEFAULT NULL COMMENT 'entry',
  `luas_membrane` float DEFAULT NULL COMMENT 'entry',
  `dialisat_flow` float DEFAULT NULL COMMENT 'entry',
  `akses_vaskuler_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref group id = 381',
  `kecepatan_aliran_darah` float DEFAULT NULL COMMENT 'entry',
  `ukuran_jarum` float DEFAULT NULL COMMENT 'entry',
  `hepar_awal` float DEFAULT NULL COMMENT 'entry',
  `hepar_pemeliharaan` float DEFAULT NULL COMMENT 'entry',
  `intruksi_hd` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `hd_rmp` */

DROP TABLE IF EXISTS `hd_rmp`;

CREATE TABLE `hd_rmp` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `no_rm` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_pasien',
  `nomor_registrasi` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `layanan_id` bigint(20) DEFAULT NULL COMMENT 't_layanan',
  `hd_status_id` bigint(20) DEFAULT NULL COMMENT 'hd_status',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `td_s` int(4) DEFAULT NULL COMMENT 'entry',
  `td_d` int(4) DEFAULT NULL,
  `rr` float DEFAULT NULL COMMENT 'entry',
  `nadi` float DEFAULT NULL COMMENT 'entry',
  `suhu` float DEFAULT NULL COMMENT 'entry',
  `bb` float DEFAULT NULL COMMENT 'entry',
  `tb` float DEFAULT NULL COMMENT 'entry',
  `nyeri_is` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `nyeri_kode` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=323;',
  `nyeri_lokasi_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `nyeri_onset_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `nyeri_pencetus_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `nyeri_kualitas_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=324',
  `nyeri_kualitas_lainnya` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `nyeri_menjalar_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=325',
  `nyeri_menjalar_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `nyeri_tingkatan_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=326',
  `nyeri_waktu_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=327',
  `nyeri_waktu_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `nyeri_skoring_kode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=328',
  `nyeri_skoring_skor_1` smallint(6) DEFAULT NULL COMMENT 'entry',
  `nyeri_skoring_skor_2` smallint(6) DEFAULT NULL,
  `nyeri_skoring_skor_3` smallint(6) DEFAULT NULL,
  `sumber_data_kode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=329',
  `sumber_data_lainnya` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keluhan_utama_p` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `psi_status_nikah_id` tinyint(4) DEFAULT NULL COMMENT 'm_statusnikah',
  `psi_punya_anak_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `psi_jumlah_anak` tinyint(4) DEFAULT NULL COMMENT 'entry',
  `psi_pendidikan_id` tinyint(4) DEFAULT NULL COMMENT 'm_pasien',
  `psi_pendidikan_lainnya` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `psi_warganegara_id` tinyint(4) DEFAULT NULL COMMENT 'm_pasien',
  `psi_pekerjaan_id` tinyint(4) DEFAULT NULL COMMENT 'm_pasien',
  `psi_tinggal_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=330',
  `psi_tinggal_lainnya` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `psi_tinggal_nama` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `psi_tinggal_telp` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `psi_kebiasaan_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=331',
  `psi_kebiasaan_des` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `psi_kebiasaan_lainnya` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `psi_agama_id` tinyint(4) DEFAULT NULL COMMENT 'm_pasien',
  `psi_berbicara_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `psi_berbicara_des` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `psi_bahasa` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `psi_penerjemah_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `psi_penerjemah_des` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `bicara_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=332',
  `bicara_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `hb_bahasa_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `hb_pendengaran_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `hb_memori_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `hb_motivasi_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `hb_penglihatan_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `hb_tidakada_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `hb_cemas_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `hb_emosi_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `hb_kognitif_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `hb_bicara_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `hb_partisipasi_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `hb_fisiologi_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `kajian_budaya_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `kajian_budaya_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `edukasi_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `potensial_proses_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `potensial_pengobatan_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `potensial_terapi_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `potensial_edukasi_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `nutrisi_diet_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `nutrisi_bb_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `nutrisi_bb_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `cb_menulis_id` tinyint(4) DEFAULT NULL COMMENT 'cara belajar disukai yesno',
  `cb_audio_id` tinyint(4) DEFAULT NULL,
  `cb_diskusi_id` tinyint(4) DEFAULT NULL,
  `cb_membaca_id` tinyint(4) DEFAULT NULL,
  `cb_demo_id` tinyint(4) DEFAULT NULL,
  `mens_siklus_id` tinyint(1) DEFAULT NULL COMMENT 'obstetri, m_yesno',
  `mens_siklus_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'obstetri',
  `mens_menarche_id` tinyint(4) DEFAULT NULL COMMENT 'obstetri',
  `mens_menarche_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'obstetri',
  `mens_akhir_id` tinyint(4) DEFAULT NULL COMMENT 'obstetri',
  `mens_akhir_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'obstetri',
  `mens_haid_id` tinyint(4) DEFAULT NULL COMMENT 'obstetri',
  `mens_haid_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'obstetri',
  `mens_banyak_id` tinyint(4) DEFAULT NULL COMMENT 'obstetri',
  `mens_banyak_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'obstetri',
  `mens_teratur_id` tinyint(4) DEFAULT NULL COMMENT 'obstetri',
  `mens_teratur_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'obstetri',
  `mens_lama_id` tinyint(4) DEFAULT NULL COMMENT 'obstetri',
  `mens_lama_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'obstetri',
  `mens_tgl_persalinan_id` tinyint(4) DEFAULT NULL,
  `mens_tgl_persalinan_des` date DEFAULT NULL COMMENT 'obstetri',
  `kwn_status_id` tinyint(4) DEFAULT NULL COMMENT 'obstetri 1=belum,2=cerai,3=kawin',
  `kwn_status_jumlah` int(4) DEFAULT NULL COMMENT 'obstetri',
  `kwn_pertama_umur` float DEFAULT NULL COMMENT 'obstetri',
  `is_ttd_perawat` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `hd_status` */

DROP TABLE IF EXISTS `hd_status`;

CREATE TABLE `hd_status` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `no_rm` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 't_layanan',
  `mulai_hd` date DEFAULT NULL COMMENT 'entry',
  `cimino_shunt` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `riwayat_operasi` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `riwayat_operasi_des` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `femoral` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `riwayat_alergi` tinyint(255) DEFAULT NULL COMMENT 'm_yesno',
  `alergi_obat` tinyint(255) DEFAULT NULL COMMENT 'm_yesno',
  `alergi_makanan` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `alergi_udara` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `alergi_debu` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `alergi_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `m_anggota_keluarga` */

DROP TABLE IF EXISTS `m_anggota_keluarga`;

CREATE TABLE `m_anggota_keluarga` (
  `id_anggota_keluarga` int(10) NOT NULL AUTO_INCREMENT,
  `pegawai_id` int(11) DEFAULT NULL COMMENT 'id di m_pegawai',
  `agama_id` int(2) DEFAULT NULL COMMENT 'm_agama',
  `jenjang_pendidikan_id` int(10) DEFAULT NULL COMMENT 'm_pendidikan',
  `pekerjaan_id` int(10) DEFAULT NULL COMMENT 'm_pekerjaan',
  `nama` varchar(255) DEFAULT NULL,
  `tempat_lahir` varchar(255) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `nik` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `hubungan` enum('Anak','Ayah','Ibu') DEFAULT NULL,
  `file_foto` varchar(255) DEFAULT NULL,
  `golongan_darah_id` tinyint(4) DEFAULT NULL COMMENT 'm_golongan_darah',
  `is_anak_kandung` tinyint(1) DEFAULT NULL,
  `is_aktif` int(1) DEFAULT NULL,
  `is_balimed` int(1) DEFAULT NULL,
  `is_valid` int(1) DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `jenis_kelamin_id` tinyint(4) DEFAULT NULL COMMENT 'm_jenis_kelamin',
  `akta_meninggal` varchar(255) DEFAULT NULL,
  `tgl_meninggal` date DEFAULT NULL,
  `file_akta_meninggal` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_anggota_keluarga`)
) ENGINE=InnoDB AUTO_INCREMENT=14104 DEFAULT CHARSET=latin1;

/*Table structure for table `m_antrean_counter` */

DROP TABLE IF EXISTS `m_antrean_counter`;

CREATE TABLE `m_antrean_counter` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `antrean_layanan_id` int(11) NOT NULL COMMENT 'm_antrean_layanan',
  `kode_counter` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_counter` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'entry;Admisi 1; Teller 1; CS 1',
  `status_aktif` tinyint(4) NOT NULL DEFAULT 1 COMMENT 'm_yesno',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `m_antrean_layanan` */

DROP TABLE IF EXISTS `m_antrean_layanan`;

CREATE TABLE `m_antrean_layanan` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'entry',
  `nama` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'entry;spt Admisi; Customer Service',
  `prefix_nomor` char(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry;misal A, spt nomor antrean A0001',
  `prefix_counter` char(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry;misal C, spt counter C01',
  `txt_a` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'Nomor Antrean' COMMENT 'entry;text to speech;Nomor Antrean ....',
  `txt_b` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'di Counter' COMMENT 'entry;text to speech di Counter ...',
  `status_aktif` tinyint(4) DEFAULT 1 COMMENT 'm_yesno',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `m_asuransi` */

DROP TABLE IF EXISTS `m_asuransi`;

CREATE TABLE `m_asuransi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `m_bahasaaktif` */

DROP TABLE IF EXISTS `m_bahasaaktif`;

CREATE TABLE `m_bahasaaktif` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `kode` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `m_billing` */

DROP TABLE IF EXISTS `m_billing`;

CREATE TABLE `m_billing` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `nomor_registrasi` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 't_layanan',
  `no_rm` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 't_layanan',
  `no_bill` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'otomatis harus UNIK;',
  `tgl_bill` datetime DEFAULT NULL COMMENT 'utk rawat jalan = tgl masuk;utk rawat inap beda2',
  `keterangan` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'nama group transaksi:ex. Farmasi Nota.3421;Lab #2321;bisa dibuat otomatis',
  `status_bill` tinyint(4) DEFAULT 1 COMMENT 'm_ref 417;1=open;2=closed;3=Idle',
  `total_bill` double DEFAULT NULL,
  `total_ditanggung` double DEFAULT NULL,
  `total_deposit` double DEFAULT NULL,
  `total_dibayar` double DEFAULT NULL,
  `total_disc` float DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `m_desa` */

DROP TABLE IF EXISTS `m_desa`;

CREATE TABLE `m_desa` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `kecamatan_id` int(6) NOT NULL,
  `kabupaten_id` smallint(6) unsigned NOT NULL,
  `nama_desa` varchar(100) DEFAULT NULL,
  `kode_desa` varchar(20) DEFAULT NULL,
  `name_existing` varchar(100) DEFAULT NULL,
  `not_exists` char(1) DEFAULT '0',
  `desakel_nama_panjang` varchar(100) DEFAULT NULL,
  `desakel_bentuk` tinyint(1) DEFAULT 1 COMMENT '1=desa; 0 = kelurahan',
  `nama_kecamatan` varchar(50) DEFAULT NULL,
  `nama_kabkot` varchar(50) DEFAULT NULL,
  `desakel_kepala_nama` varchar(50) DEFAULT NULL,
  `desakel_kepala_nip` varchar(20) DEFAULT NULL,
  `desakel_sek_nama` varchar(50) DEFAULT NULL,
  `desakel_sek_nip` varchar(20) DEFAULT NULL,
  `desakel_kantor_long` double DEFAULT NULL,
  `desakel_kantor_lat` double DEFAULT NULL,
  `desakel_ket` varchar(200) DEFAULT NULL,
  `desakel_status` tinyint(1) DEFAULT 1 COMMENT '1=aktif; 0 tidak aktif',
  `kode_kemendagri` varchar(15) DEFAULT NULL,
  `kode_nonkemendagri` varchar(15) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `kecamatan_id` (`kecamatan_id`),
  KEY `id_kabkot` (`kabupaten_id`)
) ENGINE=InnoDB AUTO_INCREMENT=82522 DEFAULT CHARSET=latin1;

/*Table structure for table `m_desa_old` */

DROP TABLE IF EXISTS `m_desa_old`;

CREATE TABLE `m_desa_old` (
  `id` char(10) COLLATE utf8_unicode_ci NOT NULL,
  `kecamatan_id` char(7) COLLATE utf8_unicode_ci NOT NULL,
  `nama_desa` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `villages_district_id_index` (`kecamatan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `m_diklat` */

DROP TABLE IF EXISTS `m_diklat`;

CREATE TABLE `m_diklat` (
  `id_diklat` int(10) NOT NULL AUTO_INCREMENT,
  `no_urut` int(10) DEFAULT NULL,
  `nama_diklat` varchar(255) DEFAULT NULL,
  `jenis_diklat_id` int(10) DEFAULT NULL COMMENT 'm_jenis_diklat',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_diklat`)
) ENGINE=InnoDB AUTO_INCREMENT=1389 DEFAULT CHARSET=latin1;

/*Table structure for table `m_examples` */

DROP TABLE IF EXISTS `m_examples`;

CREATE TABLE `m_examples` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `simple_input` varchar(50) DEFAULT NULL,
  `select_option` int(11) DEFAULT NULL,
  `file_upload` varchar(255) DEFAULT NULL,
  `textarea` text DEFAULT NULL,
  `checkbox` varchar(100) DEFAULT NULL,
  `radiobutton` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Table structure for table `m_farmasi_adj` */

DROP TABLE IF EXISTS `m_farmasi_adj`;

CREATE TABLE `m_farmasi_adj` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `nomor` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry/otomatis: nomor ads',
  `tanggal` datetime DEFAULT NULL COMMENT 'entry:tanggal adjusment barang masuk',
  `subunit_id` int(11) DEFAULT NULL COMMENT 'entry:m_subunit_medik;di adjusment',
  `retur_g_id` int(11) DEFAULT NULL COMMENT 'kosong ATAU ini diisi dari m_farmasi_retur_g jika penyesuain stock retur_g',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `status_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT '1' COMMENT 'm_ref 292',
  `status_proof_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL COMMENT 'entry:pegawai_id',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL COMMENT 'entry:pegawai_id',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `subunit_owner_id` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:kode unit/subunit pemilik dokumen ini',
  `jdoc_kode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:m_mo_jdoc',
  `kode_doc` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:prefix di m_mo_jdoc + kode_owner + nomor',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `m_farmasi_adj_g` */

DROP TABLE IF EXISTS `m_farmasi_adj_g`;

CREATE TABLE `m_farmasi_adj_g` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `nomor` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry/otomatis: nomor ads',
  `tanggal` datetime DEFAULT NULL COMMENT 'entry:tanggal adjusment barang masuk',
  `subunit_id` int(11) DEFAULT NULL COMMENT 'entry:m_subunit_medik;di adjusment',
  `retur_g_id` int(11) DEFAULT NULL COMMENT 'kosong ATAU ini diisi dari m_farmasi_retur_g jika penyesuain stock retur_g',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `status_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT '1' COMMENT 'm_ref 292',
  `status_proof_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL COMMENT 'entry:pegawai_id',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL COMMENT 'entry:pegawai_id',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `subunit_owner_id` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:kode unit/subunit pemilik dokumen ini',
  `jdoc_kode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:m_mo_jdoc',
  `kode_doc` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:prefix di m_mo_jdoc + kode_owner + nomor',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `nama_barang` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'entry',
  `nama_generik` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `nama_paten` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `jenis_kode` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref groupid = 282',
  `satuan_kode` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref groupid = 283',
  `kelompok_kode` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref groupid = 284',
  `golongan_kode` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref groupid =  285',
  `komposisi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:ex. mengandung ini itu 5mg',
  `skt_kode` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref groupid = 286',
  `dosis` smallint(6) DEFAULT NULL COMMENT 'entry:ex.120 mg',
  `satuandosis_kode` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref groupid = 287',
  `formula_rs_kode` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref groupid = 288',
  `formula_nas_kode` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref groupid = 289',
  `pabrik_kode` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:m_farmasi_pabrik',
  `harga_hna` double DEFAULT NULL COMMENT 'entry',
  `ppn` int(11) DEFAULT NULL COMMENT 'entry:(min:0, max:100)',
  `tipe_kode` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref groupid = 290',
  `file_gambar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `is_pt` tinyint(4) DEFAULT NULL COMMENT 'entry:m_yesno;protokol terapi apa tidak',
  `alasan_pt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:alasan protokol terapi',
  `kemasan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `is_ditanggung_bpjs` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1224 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `m_farmasi_barang_restriksi` */

DROP TABLE IF EXISTS `m_farmasi_barang_restriksi`;

CREATE TABLE `m_farmasi_barang_restriksi` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `barang_id` int(1) DEFAULT NULL COMMENT 'm_farmasi_barang',
  `restriksi` text DEFAULT NULL COMMENT 'entry; 1 barang bisa banyak restriksi',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Table structure for table `m_farmasi_barang_sediaan` */

DROP TABLE IF EXISTS `m_farmasi_barang_sediaan`;

CREATE TABLE `m_farmasi_barang_sediaan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `barang_id` int(1) DEFAULT NULL COMMENT 'm_farmasi_barang',
  `sediaan` varchar(100) DEFAULT NULL COMMENT 'entry; 1 barang bisa banyak sediaan',
  `peresepan` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Table structure for table `m_farmasi_baranglokasi` */

DROP TABLE IF EXISTS `m_farmasi_baranglokasi`;

CREATE TABLE `m_farmasi_baranglokasi` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lokasi_id` int(11) DEFAULT NULL COMMENT 'entry:m_subunit; bisa gudang;depo;unit lainnya',
  `barang_id` int(11) DEFAULT NULL COMMENT 'entry:m_farmasi_produkarang',
  `batch_no` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `expired_date` date DEFAULT NULL COMMENT 'entry',
  `stock` int(11) DEFAULT 0 COMMENT 'entry',
  `stokmin` smallint(6) DEFAULT NULL,
  `stokmax` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `m_farmasi_distributor` */

DROP TABLE IF EXISTS `m_farmasi_distributor`;

CREATE TABLE `m_farmasi_distributor` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `kode_dis` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:ex. P1',
  `nama_dis` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:ex. PT Sanbefarma Indonesia',
  `nama_dagang` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:ex. Sanbe',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `alamat` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_telp` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_aktif` tinyint(4) DEFAULT NULL COMMENT '1=aktif; 0 = tidak aktif',
  `ijin_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keterangan` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `m_farmasi_distributor_kontak` */

DROP TABLE IF EXISTS `m_farmasi_distributor_kontak`;

CREATE TABLE `m_farmasi_distributor_kontak` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `kontak_id` bigint(20) DEFAULT NULL COMMENT 'm_kontak',
  `distributor_kode` varchar(10) DEFAULT NULL COMMENT 'm_farmasi_distributor',
  `nilai_kontak` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Table structure for table `m_farmasi_etiket_cara` */

DROP TABLE IF EXISTS `m_farmasi_etiket_cara`;

CREATE TABLE `m_farmasi_etiket_cara` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` tinyint(1) DEFAULT NULL,
  `nm_cara` varchar(90) DEFAULT NULL,
  `e_resep` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Table structure for table `m_farmasi_etiket_dosis` */

DROP TABLE IF EXISTS `m_farmasi_etiket_dosis`;

CREATE TABLE `m_farmasi_etiket_dosis` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `dosis` varchar(45) DEFAULT NULL,
  `e_resep` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;

/*Table structure for table `m_farmasi_etiket_habis` */

DROP TABLE IF EXISTS `m_farmasi_etiket_habis`;

CREATE TABLE `m_farmasi_etiket_habis` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(5) DEFAULT NULL,
  `nm_habis` varchar(90) DEFAULT NULL,
  `e_resep` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `m_farmasi_etiket_keterangan` */

DROP TABLE IF EXISTS `m_farmasi_etiket_keterangan`;

CREATE TABLE `m_farmasi_etiket_keterangan` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(5) DEFAULT NULL,
  `keterangan` varchar(150) DEFAULT NULL,
  `e_resep` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

/*Table structure for table `m_farmasi_etiket_makan` */

DROP TABLE IF EXISTS `m_farmasi_etiket_makan`;

CREATE TABLE `m_farmasi_etiket_makan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(5) DEFAULT NULL,
  `nm_makan` varchar(90) DEFAULT NULL,
  `e_resep` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

/*Table structure for table `m_farmasi_etiket_signa` */

DROP TABLE IF EXISTS `m_farmasi_etiket_signa`;

CREATE TABLE `m_farmasi_etiket_signa` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(5) DEFAULT NULL,
  `aturan` varchar(90) DEFAULT NULL,
  `e_resep` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=545 DEFAULT CHARSET=latin1;

/*Table structure for table `m_farmasi_harga_margin` */

DROP TABLE IF EXISTS `m_farmasi_harga_margin`;

CREATE TABLE `m_farmasi_harga_margin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `penjamin_id` int(11) DEFAULT NULL COMMENT 'nilainya ini sama dengan id m_penjamin (sbg default) bagi yang ada di m_penjamin',
  `nama_margin` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `persen_margin` float DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `m_farmasi_konsin` */

DROP TABLE IF EXISTS `m_farmasi_konsin`;

CREATE TABLE `m_farmasi_konsin` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `tanggal` datetime DEFAULT NULL COMMENT 'entry:tanggal konsinyasi barang masuk',
  `nomor` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry/otomatis: nomor preorder',
  `distributor_id` int(11) DEFAULT NULL COMMENT 'entry:m_farmasi_distributor',
  `lokasi_id` int(11) DEFAULT NULL,
  `status_proof_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT '1',
  `status_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT '1',
  `disc` float DEFAULT NULL COMMENT 'entry',
  `ppn` float DEFAULT NULL COMMENT 'entry',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL COMMENT 'entry:pegawai_id',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL COMMENT 'entry:pegawai_id',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `subunit_owner_id` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:kode unit/subunit pemilik dokumen ini',
  `jdoc_kode` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:m_mo_jdoc',
  `kode_doc` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:prefix di m_mo_jdoc + kode_owner + nomor',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `m_farmasi_konsout` */

DROP TABLE IF EXISTS `m_farmasi_konsout`;

CREATE TABLE `m_farmasi_konsout` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `tanggal` datetime DEFAULT NULL COMMENT 'entry:tanggal konsinyasi barang masuk',
  `nomor` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry/otomatis: nomor preorder',
  `distributor_id` int(11) DEFAULT NULL COMMENT 'entry:m_farmasi_distributor',
  `lokasi_id` int(11) DEFAULT NULL COMMENT 'entry:m_subunit',
  `status_proof_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT '1',
  `status_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT '1',
  `disc` float DEFAULT NULL COMMENT 'entry',
  `ppn` float DEFAULT NULL COMMENT 'entry',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL COMMENT 'entry:pegawai_id',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL COMMENT 'entry:pegawai_id',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `subunit_owner_id` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:kode unit/subunit pemilik dokumen ini',
  `jdoc_kode` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:m_mo_jdoc',
  `kode_doc` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:prefix di m_mo_jdoc + kode_owner + nomor',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `m_farmasi_mutasi` */

DROP TABLE IF EXISTS `m_farmasi_mutasi`;

CREATE TABLE `m_farmasi_mutasi` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `tanggal` datetime DEFAULT NULL COMMENT 'entry:tanggal preorder',
  `nomor` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry/otomatis: nomor preorder',
  `subunit_id_a` int(11) DEFAULT NULL COMMENT 'entry:m_subunit_medik asal',
  `subunit_id_t` int(11) DEFAULT NULL COMMENT 'entry:m_subunit_tujuan',
  `status_id` tinyint(4) DEFAULT NULL COMMENT 'entry:1.Barang Keluar; 2. Barang diterima; 3. Selesai',
  `status_proof_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL COMMENT 'entry:m_pegawai;pegawai yang membuat mutasi barang',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `subunit_owner_id` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:kode unit/subunit pemilik dokumen ini',
  `jdoc_kode` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:m_mo_jdoc',
  `kode_doc` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:prefix di m_mo_jdoc + kode_owner + nomor',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `m_farmasi_nota` */

DROP TABLE IF EXISTS `m_farmasi_nota`;

CREATE TABLE `m_farmasi_nota` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `resep_id` int(11) DEFAULT NULL COMMENT 'm_farmasi_resep:id',
  `tanggal_nota` datetime DEFAULT NULL COMMENT 'entry',
  `nomor_nota` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry;ex. untuk namagroup=Jenis, maka nilainya: 1. Obat; 2. Alkes',
  `status_nota` tinyint(4) DEFAULT 0 COMMENT 'entry:m_yesno;nota sudah terkirim ke kasir Ya atau Belum',
  `subunit_farmasi_id` int(11) DEFAULT NULL COMMENT 'm_subunit_medik:farmasi',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'jam masuk resep',
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `m_farmasi_opname` */

DROP TABLE IF EXISTS `m_farmasi_opname`;

CREATE TABLE `m_farmasi_opname` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `nomor` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry/otomatis: nomor opname',
  `tipe_opname_kode` int(11) DEFAULT NULL COMMENT 'm_ref group id = 400',
  `tanggal_mulai` datetime DEFAULT NULL COMMENT 'entry:tanggal konsinyasi barang masuk',
  `tanggal_akhir` datetime DEFAULT NULL COMMENT 'entry:mulai opname',
  `subunit_id` int(11) DEFAULT NULL COMMENT 'entry:m_subunit_medik;diopname',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `so_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno;entry:status update stock;1=Sudah Updated; 0 = Belum Updated; ini dipakai bila update ke stock secara batch untuk slow moving',
  `so_date` datetime DEFAULT NULL COMMENT 'entry:tanggal status update stock',
  `status_kode` tinyint(4) DEFAULT NULL COMMENT 'm_ref group id=401',
  `status_proof_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL COMMENT 'entry:pegawai_id',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL COMMENT 'entry:pegawai_id',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `subunit_owner_id` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:kode unit/subunit pemilik dokumen ini',
  `jdoc_kode` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:m_mo_jdoc',
  `kode_doc` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:prefix di m_mo_jdoc + kode_owner + nomor',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2325 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `m_farmasi_po` */

DROP TABLE IF EXISTS `m_farmasi_po`;

CREATE TABLE `m_farmasi_po` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `tanggal` datetime DEFAULT NULL COMMENT 'entry:tanggal preorder',
  `nomor` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry/otomatis: nomor po',
  `distributor_id` int(11) DEFAULT NULL COMMENT 'entry:m_subunit_medik',
  `disc` float DEFAULT NULL COMMENT 'entry',
  `ppn` float DEFAULT NULL COMMENT 'entry',
  `status_id` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:m_farmasi;status po;0.Belum dipenuhi 0. Belum dipenuhi; 1.Terpenuhi Sebagian; 2. Selesai',
  `status_proof_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT '1' COMMENT 'm_ref group id = 405',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL COMMENT 'entry:pegawai_id',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL COMMENT 'entry:pegawai_id',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `subunit_owner_id` int(11) DEFAULT NULL COMMENT 'subunit id pemilik dokumen ini',
  `jdoc_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:m_mo_jdoc',
  `kode_doc` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:prefix di m_mo_jdoc + kode_owner + nomor',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `m_farmasi_preorder` */

DROP TABLE IF EXISTS `m_farmasi_preorder`;

CREATE TABLE `m_farmasi_preorder` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `tanggal` datetime DEFAULT NULL COMMENT 'entry:tanggal preorder',
  `nomor` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry/otomatis: nomor preorder',
  `subunit_id_a` int(11) DEFAULT NULL COMMENT 'entry:m_subunit_medik yang melakukan preorder',
  `subunit_id_t` int(11) DEFAULT NULL COMMENT 'entry:m_subunit_medik, subunit yang dituju untuk memenuhi permintaan',
  `status_id` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:m_farmasi; 1.Preorder Masuk; 2. Preorder diproses; 3. Terpenuhi sebagian; 4. Selesai',
  `status_proof_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL COMMENT 'entry:m_pegawai;yang membuat preorder',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `subunit_owner_id` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jdoc_kode` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kode_doc` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `m_farmasi_racik` */

DROP TABLE IF EXISTS `m_farmasi_racik`;

CREATE TABLE `m_farmasi_racik` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `mresep_id` int(10) DEFAULT NULL,
  `racik_kode` varchar(10) DEFAULT NULL COMMENT 'm_ref 301',
  `satuan_racik_kode` varchar(10) DEFAULT NULL COMMENT 'm_ref 410',
  `jml` int(10) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

/*Table structure for table `m_farmasi_receiving_mutasi` */

DROP TABLE IF EXISTS `m_farmasi_receiving_mutasi`;

CREATE TABLE `m_farmasi_receiving_mutasi` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `tanggal` datetime DEFAULT NULL COMMENT 'entry:tanggal',
  `nomor` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:otomatis;prefix di m_mo_jdoc +  nomor',
  `subunit_id_a` int(11) DEFAULT NULL COMMENT 'entry:m_subunit_medik',
  `subunit_id_t` int(11) DEFAULT NULL COMMENT 'entry:m_subunit_medik',
  `status_proof_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT '1',
  `status_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT '1',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL COMMENT 'entry:pegawai_id',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL COMMENT 'entry:pegawai_id',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `subunit_owner_id` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:kode unit/subunit pemilik dokumen ini',
  `jdoc_kode` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:m_mo_jdoc',
  `kode_doc` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'entry: nomor_ro',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `m_farmasi_receiving_preorder` */

DROP TABLE IF EXISTS `m_farmasi_receiving_preorder`;

CREATE TABLE `m_farmasi_receiving_preorder` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `tanggal` datetime DEFAULT NULL COMMENT 'entry:tanggal',
  `nomor` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:otomatis;prefix di m_mo_jdoc +  nomor',
  `subunit_id_a` int(11) DEFAULT NULL COMMENT 'entry:m_subunit_medik',
  `subunit_id_t` int(11) DEFAULT NULL COMMENT 'entry:m_subunit_medik',
  `status_proof_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT '1',
  `status_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT '1',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL COMMENT 'entry:pegawai_id',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL COMMENT 'entry:pegawai_id',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `subunit_owner_id` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:kode unit/subunit pemilik dokumen ini',
  `jdoc_kode` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:m_mo_jdoc',
  `kode_doc` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'entry: nomor_ro',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `m_farmasi_receiving_retur_d` */

DROP TABLE IF EXISTS `m_farmasi_receiving_retur_d`;

CREATE TABLE `m_farmasi_receiving_retur_d` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `tanggal` datetime DEFAULT NULL COMMENT 'entry:tanggal',
  `nomor` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:otomatis;prefix di m_mo_jdoc +  nomor',
  `nomor_faktur` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `distributor_id` int(11) DEFAULT NULL COMMENT 'entry:m_subunit_medik',
  `disc` float DEFAULT NULL COMMENT 'entry',
  `ppn` float DEFAULT NULL COMMENT 'entry',
  `carabayar_id` tinyint(4) DEFAULT NULL COMMENT 'entry:m_carabayar, Cara Bayar: 1. Credit; 2. COD; dll',
  `status_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT '1' COMMENT 'entry:m_ref:group_id=296',
  `status_proof_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT '1',
  `tanggal_faktur` date DEFAULT NULL,
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
  `deleted_at` timestamp NULL DEFAULT NULL,
  `subunit_owner_id` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:kode unit/subunit pemilik dokumen ini',
  `jdoc_kode` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:m_mo_jdoc',
  `kode_doc` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'entry: nomor_ro',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `m_farmasi_resep` */

DROP TABLE IF EXISTS `m_farmasi_resep`;

CREATE TABLE `m_farmasi_resep` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `layanan_id` bigint(20) DEFAULT NULL COMMENT 't_layanan',
  `nomor_registrasi` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `no_rm` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal_resep` datetime DEFAULT NULL COMMENT 'entry dri e-resep',
  `nomor_resep` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry ;otomatis',
  `tanggal_nota` datetime DEFAULT NULL COMMENT 'entry',
  `nomor_nota` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry;ex. untuk namagroup=Jenis, maka nilainya: 1. Obat; 2. Alkes',
  `status_nota` tinyint(4) DEFAULT 0 COMMENT 'entry:m_yesno;nota sudah terkirim ke kasir Ya atau Belum',
  `is_kronis` tinyint(4) DEFAULT 0 COMMENT 'm_yesno',
  `is_tr` tinyint(4) DEFAULT 0 COMMENT 'telaah resep:m_yesno',
  `is_to` tinyint(4) DEFAULT 0 COMMENT 'telaah obat:m_yesno',
  `pegawai_id_tr` int(11) DEFAULT NULL COMMENT 'entry:pegawai id telaah resep;m_pegawai',
  `pegawai_id_to` int(11) DEFAULT NULL COMMENT 'entry:pegawai id telaah obat;m_pegawai',
  `waktu_tr` time DEFAULT NULL COMMENT 'entry:waktu telaah resep',
  `waktu_to` time DEFAULT NULL COMMENT 'entry:waktu telaah obat',
  `status_proses_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'entry status proses; m_ref 297',
  `status_resep_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'entry status resep ; m_ref 298',
  `pegawai_id_i` int(11) DEFAULT NULL COMMENT 'entry:m_pegawai;pegawai yang memasukan',
  `pegawai_id_p` int(11) DEFAULT NULL COMMENT 'entry:m_pegawai;pegawai yang memeriksa',
  `pegawai_id_s` int(11) DEFAULT NULL COMMENT 'entry:m_pegawai;pegawai yang menyerahkan',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'jam masuk resep',
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `subunit_farmasi_id` int(11) DEFAULT NULL COMMENT 'subunit apakah depo1, 2 dst;',
  `tgl_kontrol` date DEFAULT NULL COMMENT 'diisi saat bikin e-resep',
  `lama_hari_kontrol` smallint(6) DEFAULT NULL COMMENT 'diisi saat bikin e-resep',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `m_farmasi_retur_d` */

DROP TABLE IF EXISTS `m_farmasi_retur_d`;

CREATE TABLE `m_farmasi_retur_d` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `tanggal` datetime DEFAULT NULL COMMENT 'entry:tanggal retur',
  `nomor` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry/otomatis: nomor retur',
  `subunit_id` int(11) DEFAULT NULL COMMENT 'entry:gudang farmasi, m_subunit_medik asal',
  `distributor_id` int(11) DEFAULT NULL COMMENT 'entry:distributor',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `status_proof_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT '1',
  `status_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL COMMENT 'entry:m_pegawai;pegawai yang membuat mutasi barang',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `subunit_owner_id` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jdoc_kode` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kode_doc` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `m_farmasi_retur_g` */

DROP TABLE IF EXISTS `m_farmasi_retur_g`;

CREATE TABLE `m_farmasi_retur_g` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `tanggal` datetime DEFAULT NULL COMMENT 'entry:tanggal retur',
  `nomor` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry/otomatis: nomor return g',
  `subunit_id_a` int(11) DEFAULT NULL COMMENT 'entry:depo/unit, m_subunit_medik asal',
  `subunit_id_t` int(11) DEFAULT NULL COMMENT 'entry:gudang, m_subunit_medik;gudang yang dituju',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `status_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT '1' COMMENT 'm_ref 295',
  `status_proof_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL COMMENT 'entry:m_pegawai;pegawai yang membuat mutasi barang',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `subunit_owner_id` int(11) DEFAULT NULL,
  `jdoc_kode` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kode_doc` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `m_farmasi_ro` */

DROP TABLE IF EXISTS `m_farmasi_ro`;

CREATE TABLE `m_farmasi_ro` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `tanggal` datetime DEFAULT NULL COMMENT 'entry:tanggal',
  `nomor_ro` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:otomatis;prefix di m_mo_jdoc +  nomor',
  `nomor_faktur` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `distributor_id` int(11) DEFAULT NULL COMMENT 'entry:m_subunit_medik',
  `disc` float DEFAULT NULL COMMENT 'entry',
  `ppn` float DEFAULT NULL COMMENT 'entry',
  `carabayar_id` tinyint(4) DEFAULT NULL COMMENT 'entry:m_carabayar, Cara Bayar: 1. Credit; 2. COD; dll',
  `status_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT '1' COMMENT 'entry:m_ref:group_id=296',
  `status_proof_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT '1',
  `tanggal_faktur` date DEFAULT NULL,
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
  `deleted_at` timestamp NULL DEFAULT NULL,
  `subunit_owner_id` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:kode unit/subunit pemilik dokumen ini',
  `jdoc_kode` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:m_mo_jdoc',
  `kode_doc` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'entry: nomor_ro',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `m_faskes` */

DROP TABLE IF EXISTS `m_faskes`;

CREATE TABLE `m_faskes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'entry',
  `kode_bpjs` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `nama` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry(Puskesmas A,B, Klinik A, B dll)',
  `group_faskes_id` smallint(6) DEFAULT NULL COMMENT 'm_group_faskes',
  `group_bpjs_id` smallint(6) DEFAULT NULL COMMENT 'm_group_rujukan_bpjs',
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
) ENGINE=InnoDB AUTO_INCREMENT=350 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `m_group_faskes` */

DROP TABLE IF EXISTS `m_group_faskes`;

CREATE TABLE `m_group_faskes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `m_group_rujukan_bpjs` */

DROP TABLE IF EXISTS `m_group_rujukan_bpjs`;

CREATE TABLE `m_group_rujukan_bpjs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `istilah` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `m_hd_booking` */

DROP TABLE IF EXISTS `m_hd_booking`;

CREATE TABLE `m_hd_booking` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `layanan_id` bigint(20) DEFAULT NULL COMMENT 't_layanan',
  `nomor_registrasi` varchar(20) DEFAULT NULL COMMENT 't_layanan',
  `no_rm` varchar(20) DEFAULT NULL,
  `tanggal_booking` datetime DEFAULT NULL COMMENT 'terhubung ke group_item_pemeriksaan_penunjang, misal PK1 = Hematologi',
  `kode_booking` varchar(20) DEFAULT NULL COMMENT 'entry:otomatis/kode booking lab',
  `no_hasil` varchar(20) DEFAULT NULL COMMENT 'nomor setelah hasil keluar',
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `subunit_asal_id` int(11) DEFAULT NULL COMMENT 'm_subunit_medik;subunit yang booking',
  `subunit_dituju_id` int(11) DEFAULT NULL COMMENT 'entry:subunit yang dituju (PK, PA, dll)',
  `file_pengantar` varchar(255) DEFAULT NULL COMMENT 'entry:file pengantar dokter',
  `tgl_periksa` date DEFAULT NULL COMMENT 'tanggal pemeriksaan',
  `jam_periksa` time DEFAULT NULL COMMENT 'jam pemeriksaan',
  `is_dokter_luar` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `dokter_dpjp_id` int(11) DEFAULT NULL COMMENT 'm_pegawai, dengan jenis_profesi_id = 5 (baca di m_setup_unit)',
  `dokter_dpjp_nama` varchar(80) DEFAULT NULL COMMENT 'entry;jaga2 dokter luar',
  `keterangan` varchar(255) DEFAULT NULL,
  `diagnosa` text DEFAULT NULL COMMENT 'entry',
  `dokter_hd_id` int(11) DEFAULT NULL COMMENT 'm_pegawai;entry, ada default setup',
  `jenis_tindakan_id` int(11) DEFAULT NULL COMMENT 'm_ref group_id=345',
  `status_verifikasi` tinyint(11) DEFAULT NULL COMMENT 'm_yesno',
  `status_selesai` tinyint(11) DEFAULT NULL COMMENT 'vm_yesno',
  `status_proses` int(11) DEFAULT NULL,
  `jenis_pasien_kode` varchar(5) DEFAULT NULL COMMENT 'm_ref dgn group_id = 399',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;

/*Table structure for table `m_hd_detil` */

DROP TABLE IF EXISTS `m_hd_detil`;

CREATE TABLE `m_hd_detil` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `booking_id` bigint(20) DEFAULT NULL COMMENT 'm_pp_booking',
  `kelas_id` bigint(20) DEFAULT NULL COMMENT 'm_kelas',
  `tindakan_tarif_id` varchar(10) DEFAULT NULL COMMENT 'm_tindakan_tarif',
  `qty` int(11) DEFAULT 1,
  `besar_tarif` float DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `is_ditanggung_bpjs` tinyint(5) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=latin1;

/*Table structure for table `m_hubungankerabat` */

DROP TABLE IF EXISTS `m_hubungankerabat`;

CREATE TABLE `m_hubungankerabat` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hubungan_kerabat` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hubungan_kerabat_en` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_hubungan` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_hubungan_en` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `m_icd` */

DROP TABLE IF EXISTS `m_icd`;

CREATE TABLE `m_icd` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kd_diagnosa` varchar(10) NOT NULL,
  `kd_dtd` varchar(10) NOT NULL,
  `nm_diagnosa` varchar(200) NOT NULL,
  `ket` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12108 DEFAULT CHARSET=latin1;

/*Table structure for table `m_icd9cm` */

DROP TABLE IF EXISTS `m_icd9cm`;

CREATE TABLE `m_icd9cm` (
  `kd_icd9cm` varchar(10) NOT NULL,
  `nm_icd9cm` varchar(200) NOT NULL,
  PRIMARY KEY (`kd_icd9cm`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `m_icons` */

DROP TABLE IF EXISTS `m_icons`;

CREATE TABLE `m_icons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(50) NOT NULL,
  `text` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1375 DEFAULT CHARSET=latin1;

/*Table structure for table `m_iks` */

DROP TABLE IF EXISTS `m_iks`;

CREATE TABLE `m_iks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `penjamin_id` int(11) DEFAULT NULL COMMENT 'm_penjamin',
  `tipe_id` tinyint(4) DEFAULT NULL COMMENT 'm_iks_tipe',
  `status_aktif` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `masa_berlaku_awal` date DEFAULT NULL,
  `masa_berlaku_akhir` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `m_iks_tipe` */

DROP TABLE IF EXISTS `m_iks_tipe`;

CREATE TABLE `m_iks_tipe` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_aktif` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `m_inacbg` */

DROP TABLE IF EXISTS `m_inacbg`;

CREATE TABLE `m_inacbg` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `kode_inacbg` varchar(255) DEFAULT NULL,
  `deskripsi_inacbg` varchar(255) DEFAULT NULL,
  `instalasi_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2048 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `m_inacbg_gabungan` */

DROP TABLE IF EXISTS `m_inacbg_gabungan`;

CREATE TABLE `m_inacbg_gabungan` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'tidak dipakai',
  `no` double DEFAULT NULL,
  `kode_inacbg` varchar(255) DEFAULT NULL,
  `deskripsi_inacbg` varchar(255) DEFAULT NULL,
  `tarif` double DEFAULT NULL,
  `kelas_id` double DEFAULT NULL,
  `instalasi_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2658 DEFAULT CHARSET=utf8;

/*Table structure for table `m_inacbg_ranap` */

DROP TABLE IF EXISTS `m_inacbg_ranap`;

CREATE TABLE `m_inacbg_ranap` (
  `NO` double DEFAULT NULL COMMENT 'sudah dipindah ke m_inacbg',
  `KodeINACBG` varchar(255) DEFAULT NULL COMMENT 'tabel ini tidak dipakai',
  `DeskripsiINACBG` varchar(255) DEFAULT NULL,
  `TarifKelas3` double DEFAULT NULL,
  `TarifKelas2` double DEFAULT NULL,
  `TarifKelas1` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `m_inacbg_tarif` */

DROP TABLE IF EXISTS `m_inacbg_tarif`;

CREATE TABLE `m_inacbg_tarif` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `kode_inacbg` varchar(255) DEFAULT NULL,
  `tarif` double DEFAULT NULL,
  `kelas_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4096 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `m_instalasi_medik` */

DROP TABLE IF EXISTS `m_instalasi_medik`;

CREATE TABLE `m_instalasi_medik` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(5) DEFAULT NULL,
  `nama` varchar(30) DEFAULT NULL COMMENT '1; Rawat Jalan 2; UGD 3; Rawat ini 4; Lab 5; Farmasi 6;Radiologi 7;OK ; 8 VK; 99 Luar',
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Table structure for table `m_instalasi_medik_copy` */

DROP TABLE IF EXISTS `m_instalasi_medik_copy`;

CREATE TABLE `m_instalasi_medik_copy` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(5) DEFAULT NULL,
  `nama` varchar(30) DEFAULT NULL COMMENT '1; Rawat Jalan 2; UGD 3; Rawat ini 4; Lab 5; Farmasi 6;Radiologi 7;OK ; 8 VK; 99 Luar',
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Table structure for table `m_istri_suami` */

DROP TABLE IF EXISTS `m_istri_suami`;

CREATE TABLE `m_istri_suami` (
  `istri_suami_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pegawai_id` int(11) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `tempat_lahir` varchar(255) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `agama_id` int(5) DEFAULT NULL COMMENT 'm_agama',
  `pekerjaan_id` int(11) DEFAULT NULL COMMENT 'm_pekerjaan',
  `jenjang_pendidikan_id` int(5) DEFAULT NULL COMMENT 'm_pendidikan',
  `nik` varchar(30) NOT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `tanggal_nikah` date DEFAULT NULL,
  `pertama` varchar(5) DEFAULT NULL,
  `is_pegawai_balimed` tinyint(1) DEFAULT 0,
  `is_valid` int(1) DEFAULT NULL,
  `is_aktif` int(1) DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `file_foto` varchar(255) DEFAULT NULL,
  `hubungan` enum('Istri','Suami','Pasangan') DEFAULT NULL,
  `jenis_kelamin` tinyint(4) DEFAULT NULL COMMENT 'm_jenis_kelamin',
  `golongan_darah_id` tinyint(4) DEFAULT NULL COMMENT 'm_golongan_darah',
  `akta_cerai` varchar(255) DEFAULT NULL,
  `tgl_cerai` date DEFAULT NULL,
  `akta_menikah` varchar(255) DEFAULT NULL,
  `akta_meninggal` varchar(255) DEFAULT NULL,
  `tgl_meninggal` date DEFAULT NULL,
  `posisi` tinyint(1) DEFAULT NULL,
  `file_akta_menikah` varchar(255) DEFAULT NULL,
  `file_akta_cerai` varchar(255) DEFAULT NULL,
  `file_akta_meninggal` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`istri_suami_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4698 DEFAULT CHARSET=latin1;

/*Table structure for table `m_jabatan_fungsional` */

DROP TABLE IF EXISTS `m_jabatan_fungsional`;

CREATE TABLE `m_jabatan_fungsional` (
  `jabatan_fungsional_id` int(11) NOT NULL AUTO_INCREMENT,
  `jabatan_kum` varchar(255) DEFAULT NULL,
  `jabatan_kategori` varchar(255) DEFAULT NULL,
  `kum` varchar(255) DEFAULT NULL,
  `urut` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`jabatan_fungsional_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `m_jabatan_struktural` */

DROP TABLE IF EXISTS `m_jabatan_struktural`;

CREATE TABLE `m_jabatan_struktural` (
  `jabatan_id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_jabatan_singkat` varchar(255) DEFAULT NULL,
  `nama_jabatan_panjang` varchar(255) DEFAULT NULL,
  `tipe_jabatan` tinyint(4) DEFAULT NULL COMMENT '1 Tugas Tambahan,2 Fungsional',
  `urut` tinyint(3) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `sks_bkd` decimal(10,0) DEFAULT NULL,
  `poin_skp` decimal(5,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `delete_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`jabatan_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

/*Table structure for table `m_jadwal_layanan` */

DROP TABLE IF EXISTS `m_jadwal_layanan`;

CREATE TABLE `m_jadwal_layanan` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `version_id` int(11) unsigned DEFAULT NULL COMMENT 'entry:m_jadwal_version',
  `hari_id` int(11) unsigned DEFAULT NULL COMMENT 'entry:m_hari',
  `dokter_id` bigint(20) unsigned DEFAULT NULL COMMENT 'entry:m_pegawai',
  `subunit_id` int(11) unsigned DEFAULT NULL COMMENT 'entry:m_subunit_medik',
  `kamar_id` int(11) unsigned DEFAULT NULL COMMENT 'entry:m_subunit_ruangan',
  `waktu_awal` time DEFAULT NULL,
  `waktu_akhir` time DEFAULT NULL,
  `status_jadwal` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:m_jadwal_sattus',
  `status_id` tinyint(4) DEFAULT NULL,
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
  KEY `kamar_id` (`kamar_id`),
  CONSTRAINT `m_jadwal_layanan_ibfk_1` FOREIGN KEY (`version_id`) REFERENCES `m_jadwal_version` (`id`),
  CONSTRAINT `m_jadwal_layanan_ibfk_2` FOREIGN KEY (`hari_id`) REFERENCES `m_hari` (`id`),
  CONSTRAINT `m_jadwal_layanan_ibfk_4` FOREIGN KEY (`dokter_id`) REFERENCES `m_pegawai` (`id`),
  CONSTRAINT `m_jadwal_layanan_ibfk_6` FOREIGN KEY (`kamar_id`) REFERENCES `m_subunit_kamar` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `m_jadwal_status` */

DROP TABLE IF EXISTS `m_jadwal_status`;

CREATE TABLE `m_jadwal_status` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:Buka,Tutup,Libur',
  `warna` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `m_jadwal_ugd` */

DROP TABLE IF EXISTS `m_jadwal_ugd`;

CREATE TABLE `m_jadwal_ugd` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `version_id` int(11) DEFAULT NULL COMMENT 'entry:m_jadwal_version',
  `hari_id` int(11) unsigned DEFAULT NULL COMMENT 'entry:m_hari',
  `dokter_id` bigint(20) unsigned DEFAULT NULL COMMENT 'entry:m_pegawai',
  `shift_kode` tinyint(2) DEFAULT NULL,
  `status_jadwal` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:m_jadwal_sattus',
  `status_id` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `m_jenis_diklat` */

DROP TABLE IF EXISTS `m_jenis_diklat`;

CREATE TABLE `m_jenis_diklat` (
  `jenis_diklat_id` int(10) NOT NULL AUTO_INCREMENT,
  `nama_jenis_diklat` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`jenis_diklat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

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

/*Table structure for table `m_jenis_pasien` */

DROP TABLE IF EXISTS `m_jenis_pasien`;

CREATE TABLE `m_jenis_pasien` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `kode` smallint(6) NOT NULL,
  `nama` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `m_jenis_peserta_bpjs` */

DROP TABLE IF EXISTS `m_jenis_peserta_bpjs`;

CREATE TABLE `m_jenis_peserta_bpjs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `m_jenis_profesi` */

DROP TABLE IF EXISTS `m_jenis_profesi`;

CREATE TABLE `m_jenis_profesi` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'entry',
  `nama_profesi` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Dokter;2=Perawat;3=Bidan;4=dst',
  `kelompok_profesi_id` smallint(5) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `m_jenis_sk_pegawai` */

DROP TABLE IF EXISTS `m_jenis_sk_pegawai`;

CREATE TABLE `m_jenis_sk_pegawai` (
  `jenis_sk_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `nama_jenis` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`jenis_sk_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `m_jenis_tenagamedis` */

DROP TABLE IF EXISTS `m_jenis_tenagamedis`;

CREATE TABLE `m_jenis_tenagamedis` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'entry',
  `nama` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Dokter;2=Perawat;3=Bidan;4=dst',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `m_kabupaten` */

DROP TABLE IF EXISTS `m_kabupaten`;

CREATE TABLE `m_kabupaten` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `provinsi_id` int(10) DEFAULT NULL,
  `nama_kabupaten` varchar(255) DEFAULT NULL,
  `kode_kemendagri` varchar(15) DEFAULT NULL,
  `kode_nonkemendagri` varchar(15) DEFAULT NULL,
  `kode_bpjs` varchar(10) DEFAULT NULL,
  `lat` varchar(20) DEFAULT NULL,
  `lng` varchar(50) DEFAULT NULL,
  `order` tinyint(4) DEFAULT NULL,
  `old_id` int(10) unsigned DEFAULT NULL,
  `kode_wilayah` varchar(15) DEFAULT NULL,
  `is_indonesia` char(1) DEFAULT '1',
  `is_bali` char(1) DEFAULT '1',
  `allrecord_userid` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `m_kabkot_ibfk_1` (`provinsi_id`)
) ENGINE=InnoDB AUTO_INCREMENT=515 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `m_kabupaten_old` */

DROP TABLE IF EXISTS `m_kabupaten_old`;

CREATE TABLE `m_kabupaten_old` (
  `id` char(4) COLLATE utf8_unicode_ci NOT NULL,
  `provinsi_id` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `nama_kabupaten` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `regencies_province_id_index` (`provinsi_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `m_kartu` */

DROP TABLE IF EXISTS `m_kartu`;

CREATE TABLE `m_kartu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_aktif` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `m_kasus` */

DROP TABLE IF EXISTS `m_kasus`;

CREATE TABLE `m_kasus` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `kode` tinyint(4) DEFAULT NULL,
  `nama` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `m_kecamatan` */

DROP TABLE IF EXISTS `m_kecamatan`;

CREATE TABLE `m_kecamatan` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `kabupaten_id` smallint(6) unsigned DEFAULT NULL,
  `nama_kecamatan` varchar(50) DEFAULT NULL,
  `kode_kecamatan` varchar(15) DEFAULT NULL,
  `id_kecamatan_lama` int(11) DEFAULT NULL,
  `kode_kemendagri` varchar(15) DEFAULT NULL,
  `kode_nonkemendagri` varchar(15) DEFAULT NULL,
  `kode_bpjs` varchar(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_kabkot` (`kabupaten_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7096 DEFAULT CHARSET=latin1;

/*Table structure for table `m_kecamatan_old` */

DROP TABLE IF EXISTS `m_kecamatan_old`;

CREATE TABLE `m_kecamatan_old` (
  `id` char(7) COLLATE utf8_unicode_ci NOT NULL,
  `kabupaten_id` char(4) COLLATE utf8_unicode_ci NOT NULL,
  `nama_kecamatan` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `districts_id_index` (`kabupaten_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `m_kelas` */

DROP TABLE IF EXISTS `m_kelas`;

CREATE TABLE `m_kelas` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_aktif` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `m_kelas_detil` */

DROP TABLE IF EXISTS `m_kelas_detil`;

CREATE TABLE `m_kelas_detil` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `kelas_id` int(8) DEFAULT NULL,
  `nama_bed` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_aktif` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `m_kelompok_profesi` */

DROP TABLE IF EXISTS `m_kelompok_profesi`;

CREATE TABLE `m_kelompok_profesi` (
  `id` smallint(5) unsigned NOT NULL,
  `nama_kelompok` varchar(30) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `m_kontak` */

DROP TABLE IF EXISTS `m_kontak`;

CREATE TABLE `m_kontak` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_aktif` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

/*Table structure for table `m_lembaga_pendidikan` */

DROP TABLE IF EXISTS `m_lembaga_pendidikan`;

CREATE TABLE `m_lembaga_pendidikan` (
  `lembaga_pendidikan_id` bigint(6) unsigned NOT NULL AUTO_INCREMENT,
  `nama_lembaga` varchar(50) DEFAULT NULL,
  `nama_singkat` varchar(20) DEFAULT NULL,
  `negara` smallint(5) DEFAULT NULL,
  `kota` varchar(20) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `kode_pos` varchar(10) DEFAULT NULL,
  `telepon` varchar(20) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `website` varchar(40) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `jenjang_pendidikan_id` varchar(15) DEFAULT NULL COMMENT 'm_pendidikan',
  `kode_dikti` varchar(6) DEFAULT NULL,
  `dalam_negeri` tinyint(1) DEFAULT 1,
  `negeri_swasta` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`lembaga_pendidikan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8053 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='InnoDB free: 10240 kB';

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `m_menu_master_data` */

DROP TABLE IF EXISTS `m_menu_master_data`;

CREATE TABLE `m_menu_master_data` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `grup_menu_master_data_id` int(10) DEFAULT NULL COMMENT 'm_grup_menu_master_data',
  `nama_menu` varchar(255) DEFAULT NULL,
  `deskripsi` varchar(255) DEFAULT NULL,
  `href` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `grup_master_data_id` (`grup_menu_master_data_id`),
  CONSTRAINT `m_menu_master_data_ibfk_1` FOREIGN KEY (`grup_menu_master_data_id`) REFERENCES `m_grup_menu_master_data` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=latin1;

/*Table structure for table `m_mo_jdoc` */

DROP TABLE IF EXISTS `m_mo_jdoc`;

CREATE TABLE `m_mo_jdoc` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `kode_jdoc` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:D001',
  `nama_jdoc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:Purchase Order',
  `prefix` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keterangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `m_mo_proof` */

DROP TABLE IF EXISTS `m_mo_proof`;

CREATE TABLE `m_mo_proof` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `jdoc_kode` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'entry:jenis dokumen yang diapprove',
  `subunit_owner_id` int(11) NOT NULL COMMENT 'entry:unit/subunit pemilik',
  `kode_jab` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'entry:jabatan yang mengapprove dokumen',
  `order_proof` tinyint(11) NOT NULL COMMENT 'entry:urutan jabatan yang approve',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `m_mo_rs` */

DROP TABLE IF EXISTS `m_mo_rs`;

CREATE TABLE `m_mo_rs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nama_rs` varchar(100) DEFAULT NULL COMMENT 'entry',
  `alamat_rs` varchar(200) DEFAULT NULL COMMENT 'entry',
  `logo_rs` longtext DEFAULT NULL COMMENT 'base64',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Table structure for table `m_mo_rs_kontak` */

DROP TABLE IF EXISTS `m_mo_rs_kontak`;

CREATE TABLE `m_mo_rs_kontak` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `kontak_id` bigint(20) DEFAULT NULL COMMENT 'm_kontak',
  `mors_id` bigint(20) DEFAULT NULL COMMENT 'm_mo_rs:id',
  `nilai_kontak` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `m_mo_struktur` */

DROP TABLE IF EXISTS `m_mo_struktur`;

CREATE TABLE `m_mo_struktur` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `kode_jab` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'entry:J001',
  `nama_jab` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'entry:Direktur',
  `nama_org` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'entry:nama unit organisasi',
  `pegawai_kode` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'entry:pejabat saat ini',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

/*Table structure for table `m_ok_booking` */

DROP TABLE IF EXISTS `m_ok_booking`;

CREATE TABLE `m_ok_booking` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `layanan_id` bigint(20) DEFAULT NULL COMMENT 't_layanan',
  `nomor_registrasi` varchar(20) DEFAULT NULL COMMENT 't_layanan',
  `no_rm` varchar(20) DEFAULT NULL COMMENT 't_layanan',
  `tanggal_booking` datetime DEFAULT NULL COMMENT 'terhubung ke group_item_pemeriksaan_penunjang, misal PK1 = Hematologi',
  `kode_booking` varchar(20) DEFAULT NULL COMMENT 'entry:otomatis/kode booking lab',
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `subunit_asal_id` int(11) DEFAULT NULL COMMENT 'm_subunit_medik;subunit yang booking',
  `subunit_dituju_id` int(11) DEFAULT NULL COMMENT 'entry:subunit yang dituju (PK, PA, dll)',
  `file_pengantar` varchar(255) DEFAULT NULL COMMENT 'entry:file pengantar dokter',
  `tgl_tindakan` date DEFAULT NULL COMMENT 'tanggal pemeriksaan',
  `jam_tindakan` time DEFAULT NULL COMMENT 'jam pemeriksaan',
  `dokter_dpjp_id` int(11) DEFAULT NULL COMMENT 'm_pegawai; dokter konsultasi',
  `diagnosa` text DEFAULT NULL COMMENT 'entry',
  `menu_request` varchar(255) DEFAULT NULL COMMENT 'entry',
  `keterangan` varchar(255) DEFAULT NULL,
  `jenis_tindakan_id` int(11) DEFAULT NULL COMMENT 'm_ref group_id=345',
  `status_verifikasi` int(11) DEFAULT NULL COMMENT 'm_yesno',
  `status_selesai` int(11) DEFAULT NULL COMMENT 'm_yesno',
  `status_proses` int(11) DEFAULT NULL COMMENT 'm_ref dgn group_id = 382',
  `dokter_dpjp_nama` varchar(255) DEFAULT NULL,
  `is_dokter_luar` tinyint(4) DEFAULT 0,
  `kamar_id` int(10) DEFAULT NULL COMMENT 'm_ok_kamar',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

/*Table structure for table `m_ok_kamar` */

DROP TABLE IF EXISTS `m_ok_kamar`;

CREATE TABLE `m_ok_kamar` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `kamar_jenis_id` int(8) DEFAULT NULL COMMENT 'm_ref group id = 383',
  `nama_kamar` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_aktif` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `rata_mak_ok` smallint(6) DEFAULT 8 COMMENT 'ini pakai dasar gradasi warna merah kamar',
  `gradasi_step` smallint(6) DEFAULT 2,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `m_pasien` */

DROP TABLE IF EXISTS `m_pasien`;

CREATE TABLE `m_pasien` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `no_rm` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:no rekam medis',
  `status_dikenal` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `nationality_code1` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_negara',
  `no_kk` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:no kk',
  `is_kepalakeluarga` tinyint(1) DEFAULT NULL COMMENT 'entry:apakah KK',
  `nama_depan` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'entry',
  `nama_belakang` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `nama_panggilan` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gelar_depan` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gelar_belakang` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama_ibu_kandung` varchar(70) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `tempat_lahir` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `tanggal_lahir` date DEFAULT NULL COMMENT 'entry',
  `jenis_kelamin` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `gol_darah` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:m_goldarah',
  `status_menikah` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:m_statusnikah',
  `tingkat_pendidikan` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:m_pendidikan',
  `pekerjaan` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:m_pekerjaan',
  `agama` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:m_agama',
  `bahasa_aktif` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:m_bahasaaktif',
  `status_pasien` tinyint(1) DEFAULT NULL COMMENT '0=hidup;1=meninggal',
  `kartu_id` tinyint(4) DEFAULT NULL COMMENT 'm_kartu',
  `nomor_idcard` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `masa_berlaku_idcard` date DEFAULT NULL,
  `alamat_idcard` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:alamat ktp',
  `provinsi_idcard` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:ktp',
  `kabupaten_idcard` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:ktp',
  `kecamatan_idcard` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:ktp',
  `desa_idcard` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:ktp',
  `dusun_idcard` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:ktp',
  `kodepos_idcard` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:ktp',
  `rt_idcard` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rw_idcard` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamat_domisili` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:domisili',
  `dusun_domisili` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:domisili',
  `desa_domisili` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:domisili',
  `kecamatan_domisili` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:domisili',
  `kabupaten_domisili` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:domisili',
  `provinsi_domisili` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kodepos_domisili` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:domisili',
  `rt_domisili` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rw_domisili` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `file_kartu` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `no_peserta_bpjs` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `asuransi_id` int(11) DEFAULT NULL COMMENT 'entry:m_asuransi',
  `asuransi_no` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `asuransi_penjamin` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `file_ttd` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `suku` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `valid_at` datetime DEFAULT NULL COMMENT 'entry/otomatis',
  `valid_by` int(11) DEFAULT NULL COMMENT 'entry/otomatis',
  `is_valid` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'm_ref group_id=333;0=belum valid;1=valid;2=Tidak Valid',
  `ket_valid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `passcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_passcode',
  `valid_until` datetime DEFAULT NULL COMMENT 'masa berlaku passcode',
  `registered_by` int(11) DEFAULT NULL COMMENT 'diisi khusus untuk regon, id user yg mendaftarkan data diri pasien',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `m_pasien_kerabat` */

DROP TABLE IF EXISTS `m_pasien_kerabat`;

CREATE TABLE `m_pasien_kerabat` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pasien_id` bigint(20) NOT NULL,
  `nama_lengkap` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hubungankerabat_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tempat_lahir` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `jenis_kelamin` int(11) DEFAULT NULL,
  `alamat_tinggal` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pendidikan_id` int(11) DEFAULT NULL,
  `pekerjaan_id` int(11) DEFAULT NULL,
  `kartu_id` int(11) DEFAULT NULL,
  `nomor_kartu` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `masa_berlaku_kartu` date DEFAULT NULL,
  `alamat` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rt` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rw` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kodepos` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provinsi_id` int(11) DEFAULT NULL,
  `kabupaten_id` int(11) DEFAULT NULL,
  `kecamatan_id` int(11) DEFAULT NULL,
  `desa_id` int(11) DEFAULT NULL,
  `dusun` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kontak_id` int(11) DEFAULT NULL,
  `nomor_kontak` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_valid` tinyint(1) DEFAULT NULL,
  `valid_at` datetime DEFAULT NULL,
  `valid_by` int(20) DEFAULT NULL,
  `file_ttd` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `m_pasien_kontak` */

DROP TABLE IF EXISTS `m_pasien_kontak`;

CREATE TABLE `m_pasien_kontak` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `kontak_id` int(11) DEFAULT NULL,
  `pasien_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_aktif` tinyint(4) DEFAULT NULL,
  `nomor_kontak` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `m_passcode` */

DROP TABLE IF EXISTS `m_passcode`;

CREATE TABLE `m_passcode` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `nomor_urut` int(11) DEFAULT NULL COMMENT 'nomor urut untuk dicetak;bila pasien tidak bawa hp',
  `passcode_enkrip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'otomatis generate;bisa didecrip;dihapus bila sudah dikirim ke px',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1725 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `m_pegawai` */

DROP TABLE IF EXISTS `m_pegawai`;

CREATE TABLE `m_pegawai` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'sama dengan nomor_induk',
  `no_induk` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `absen_id` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kode_bpjs` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `nama` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'entry',
  `nama_tercetak` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gelar_depan` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gelar_belakang` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_pegawai_id` tinyint(4) DEFAULT NULL COMMENT 'm_statuspegawai',
  `jenis_profesi_id` int(10) DEFAULT NULL COMMENT 'm_jenis_profesi',
  `spesialisasi_id` smallint(6) DEFAULT NULL COMMENT 'm_spesialisasi',
  `sub_spesialisasi_id` int(10) unsigned DEFAULT NULL COMMENT 'm_subspesialisasi',
  `qualifikasi_id` int(11) unsigned DEFAULT NULL COMMENT 'm_kualifikasi',
  `pendidikan_terakhir_id` int(11) DEFAULT NULL COMMENT 'm_riwayat_pendidikan',
  `jabatan_fungsional_terakhir` int(11) DEFAULT NULL COMMENT 'm_riwayat_fungsional',
  `jabatan_struktural_id` int(11) DEFAULT NULL COMMENT 'm_riwayat_struktural',
  `no_sip_terakhir` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'diambil dari m_riwayat fungsional',
  `unit_id` int(11) DEFAULT NULL COMMENT '(tidak dipakai (m_subunit_dokter))diambil id unit dari riwayat mutasi',
  `subunit_id` int(11) DEFAULT NULL COMMENT '(tidak dipakai (m_subunit_dokter))diambil id unit dari riwayat mutasi',
  `tempat_lahir` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `tanggal_lahir` date DEFAULT NULL COMMENT 'entry',
  `jeniskelamin_id` int(11) unsigned DEFAULT NULL COMMENT 'm_jenis_kelamin',
  `agama_id` int(10) unsigned DEFAULT NULL COMMENT 'm_agama',
  `bahasa_aktif_id` smallint(6) DEFAULT NULL COMMENT 'm_bahasaaktif',
  `alamat` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `dusun` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `desa_id` int(10) DEFAULT NULL COMMENT 'm_desa',
  `kecamatan_id` char(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_kecamatan',
  `kabupaten_id` int(11) DEFAULT NULL COMMENT 'm_kabupaten',
  `provinsi_id` int(11) DEFAULT NULL COMMENT 'm_provinsi',
  `kodepos` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `nik` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `npwp` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `file_photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `file_ktp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `file_kk` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `file_npwp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `status_nikah_id` tinyint(4) DEFAULT NULL COMMENT 'm_statusnikah',
  `status_daftar_id` tinyint(4) DEFAULT NULL COMMENT '1= Terdaftar di Balimed; 2=Tidak Terdaftar',
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `sso_user_id` int(11) DEFAULT NULL COMMENT 'sso',
  `passcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_passcode',
  `valid_until` datetime DEFAULT NULL COMMENT 'masa berlaku passcode',
  PRIMARY KEY (`id`),
  KEY `spesialisasi_id` (`spesialisasi_id`),
  KEY `sub_spesialisasi_id` (`sub_spesialisasi_id`),
  KEY `qualifikasi_id` (`qualifikasi_id`),
  KEY `pendidikan_id` (`pendidikan_terakhir_id`),
  KEY `m_pegawai_ibfk_6` (`jeniskelamin_id`),
  KEY `agama_id` (`agama_id`),
  KEY `bahasa_aktif_id` (`bahasa_aktif_id`),
  CONSTRAINT `m_pegawai_ibfk_1` FOREIGN KEY (`spesialisasi_id`) REFERENCES `m_spesialisasi` (`id`),
  CONSTRAINT `m_pegawai_ibfk_3` FOREIGN KEY (`sub_spesialisasi_id`) REFERENCES `m_subspesialisasi` (`id`),
  CONSTRAINT `m_pegawai_ibfk_4` FOREIGN KEY (`qualifikasi_id`) REFERENCES `m_kualifikasi` (`id`),
  CONSTRAINT `m_pegawai_ibfk_7` FOREIGN KEY (`agama_id`) REFERENCES `m_agama` (`id`),
  CONSTRAINT `m_pegawai_ibfk_8` FOREIGN KEY (`bahasa_aktif_id`) REFERENCES `m_bahasaaktif` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=508 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `m_pegawai_copy` */

DROP TABLE IF EXISTS `m_pegawai_copy`;

CREATE TABLE `m_pegawai_copy` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `no_induk` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `absen_id` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kode_bpjs` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `nama` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'entry',
  `nama_tercetak` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gelar_depan` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gelar_belakang` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_pegawai_id` tinyint(4) DEFAULT NULL COMMENT 'm_statuspegawai',
  `jenis_profesi_id` int(10) DEFAULT NULL COMMENT 'm_jenis_profesi',
  `spesialisasi_id` smallint(6) DEFAULT NULL COMMENT 'm_spesialisasi',
  `sub_spesialisasi_id` int(10) unsigned DEFAULT NULL COMMENT 'm_subspesialisasi',
  `qualifikasi_id` int(11) unsigned DEFAULT NULL COMMENT 'm_kualifikasi',
  `pendidikan_terakhir_id` int(11) DEFAULT NULL COMMENT 'm_riwayat_pendidikan',
  `jabatan_fungsional_terakhir` int(11) DEFAULT NULL COMMENT 'm_riwayat_fungsional',
  `jabatan_struktural_id` int(11) DEFAULT NULL COMMENT 'm_riwayat_struktural',
  `unit_id` int(11) DEFAULT NULL COMMENT '(tidak dipakai (m_subunit_dokter))diambil id unit dari riwayat mutasi',
  `subunit_id` int(11) DEFAULT NULL COMMENT '(tidak dipakai (m_subunit_dokter))diambil id unit dari riwayat mutasi',
  `tempat_lahir` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `tanggal_lahir` date DEFAULT NULL COMMENT 'entry',
  `jeniskelamin_id` int(11) unsigned DEFAULT NULL COMMENT 'm_jenis_kelamin',
  `agama_id` int(10) unsigned DEFAULT NULL COMMENT 'm_agama',
  `bahasa_aktif_id` smallint(6) DEFAULT NULL COMMENT 'm_bahasaaktif',
  `alamat` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `dusun` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `desa_id` int(10) DEFAULT NULL COMMENT 'm_desa',
  `kecamatan_id` char(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_kecamatan',
  `kabupaten_id` int(11) DEFAULT NULL COMMENT 'm_kabupaten',
  `provinsi_id` int(11) DEFAULT NULL COMMENT 'm_provinsi',
  `kodepos` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `nik` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `npwp` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `file_photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `file_ktp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `file_kk` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `file_npwp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `status_nikah_id` tinyint(4) DEFAULT NULL COMMENT 'm_statusnikah',
  `status_daftar_id` tinyint(4) DEFAULT NULL COMMENT '1= Terdaftar di Balimed; 2=Tidak Terdaftar',
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `sso_user_id` int(11) DEFAULT NULL COMMENT 'sso',
  `passcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_passcode',
  `valid_until` datetime DEFAULT NULL COMMENT 'masa berlaku passcode',
  PRIMARY KEY (`id`),
  KEY `spesialisasi_id` (`spesialisasi_id`),
  KEY `sub_spesialisasi_id` (`sub_spesialisasi_id`),
  KEY `qualifikasi_id` (`qualifikasi_id`),
  KEY `pendidikan_id` (`pendidikan_terakhir_id`),
  KEY `m_pegawai_ibfk_6` (`jeniskelamin_id`),
  KEY `agama_id` (`agama_id`),
  KEY `bahasa_aktif_id` (`bahasa_aktif_id`)
) ENGINE=InnoDB AUTO_INCREMENT=460 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `m_pegawai_counter` */

DROP TABLE IF EXISTS `m_pegawai_counter`;

CREATE TABLE `m_pegawai_counter` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pegawai_id` int(11) DEFAULT NULL,
  `antrean_counter_id` int(11) DEFAULT NULL,
  `is_aktif` tinyint(1) DEFAULT 0,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Table structure for table `m_pegawai_dokumen` */

DROP TABLE IF EXISTS `m_pegawai_dokumen`;

CREATE TABLE `m_pegawai_dokumen` (
  `pegawai_dokumen_id` int(11) NOT NULL AUTO_INCREMENT,
  `jenis_sk_pegawai` smallint(6) DEFAULT NULL COMMENT 'm_jenis_sk_pegawai',
  `no_sk` varchar(255) DEFAULT NULL,
  `judul_sk` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`pegawai_dokumen_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `m_pegawai_kontak` */

DROP TABLE IF EXISTS `m_pegawai_kontak`;

CREATE TABLE `m_pegawai_kontak` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `kontak_id` int(11) DEFAULT NULL COMMENT 'm_kontak',
  `pegawai_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_aktif` tinyint(4) DEFAULT NULL,
  `nomor_kontak` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `m_pekerjaan` */

DROP TABLE IF EXISTS `m_pekerjaan`;

CREATE TABLE `m_pekerjaan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pekerjaan` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `m_pemeriksaan_rajal` */

DROP TABLE IF EXISTS `m_pemeriksaan_rajal`;

CREATE TABLE `m_pemeriksaan_rajal` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'apa saja tindakan di rajal, untuk buat list riwayat pemeriksaan suatu pasien',
  `nama_pemeriksaan` varchar(255) DEFAULT NULL,
  `slug_pemeriksaan` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `m_pendidikan` */

DROP TABLE IF EXISTS `m_pendidikan`;

CREATE TABLE `m_pendidikan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `m_penjamin` */

DROP TABLE IF EXISTS `m_penjamin`;

CREATE TABLE `m_penjamin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `nama` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '1=Umum,2=BPJS,3=IKS,4=Karyawan',
  `prefix_antrean` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `m_pp_booking` */

DROP TABLE IF EXISTS `m_pp_booking`;

CREATE TABLE `m_pp_booking` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `layanan_id` bigint(20) DEFAULT NULL COMMENT 't_layanan',
  `nomor_registrasi` varchar(20) DEFAULT NULL COMMENT 't_layanan',
  `no_rm` varchar(20) DEFAULT NULL,
  `tanggal_booking` datetime DEFAULT NULL COMMENT 'terhubung ke group_item_pemeriksaan_penunjang, misal PK1 = Hematologi',
  `kode_booking` varchar(20) DEFAULT NULL COMMENT 'entry:otomatis/kode booking lab',
  `no_lab` varchar(20) DEFAULT NULL COMMENT 'nomor setelah hasil keluar',
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `subunit_asal_id` int(11) DEFAULT NULL COMMENT 'm_subunit_medik;subunit yang booking',
  `subunit_dituju_id` int(11) DEFAULT NULL COMMENT 'entry:subunit yang dituju (PK, PA, dll)',
  `status_verifikasi` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `tanggal_verifikasi` date DEFAULT NULL COMMENT 'entry:tgl diverifikasi',
  `pegawai_verifikasi_kode` varchar(20) DEFAULT NULL COMMENT 'entry:petugas yang memverif',
  `tanggal_spesimen` datetime DEFAULT NULL COMMENT 'entry:tgl spesimen dditerima',
  `tanggal_selesai` date DEFAULT NULL COMMENT 'entry:tgl selesai dientry petugas',
  `status_selesai` tinyint(4) DEFAULT NULL COMMENT '0=belum;1 = selesai',
  `file_pengantar` varchar(255) DEFAULT NULL COMMENT 'entry:file pengantar dokter',
  `pegawai_pj_kode` varchar(20) DEFAULT NULL COMMENT 'entry:dokter penandatangan',
  `status_std` tinyint(4) DEFAULT NULL COMMENT 'entry:status send to LIS',
  `tanggal_std` date DEFAULT NULL COMMENT 'entry:tgl send to device',
  `status_rfd` tinyint(4) DEFAULT NULL COMMENT 'entry:status  receive from device',
  `tanggal_rfd` date DEFAULT NULL COMMENT 'entry:tgl receive from evice',
  `status_proses` tinyint(4) DEFAULT NULL COMMENT 'entry mm_pp_proses; 1=booking;2=Terverif;3=Persetujuan/menunggu deposit; 4= Sudah Deposit 5=Proses Lab; 6=Proses Lab Selesai; 7 = Ambil Hasil',
  `format_hl7_kirim` text DEFAULT NULL COMMENT 'otomatis, formah HL7 data yang diperiksa lab',
  `format_hl7_hasil` text DEFAULT NULL COMMENT 'otomatis LIS, format HL7 dari hasil lab',
  `tgl_periksa` date DEFAULT NULL COMMENT 'tanggal pemeriksaan',
  `jam_periksa` time DEFAULT NULL COMMENT 'jam pemeriksaan',
  `dokter_dpjp_id` int(11) DEFAULT NULL COMMENT 'm_pegawai',
  `dokter_dpjp_nama` varchar(80) DEFAULT NULL COMMENT 'entry;jaga2 dokter luar',
  `cito` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `puasa` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `alergi` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `hamil` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `keterangan` varchar(255) DEFAULT NULL,
  `diagnosa` text DEFAULT NULL COMMENT 'entry',
  `pemeriksaan_tambahan` text DEFAULT NULL COMMENT 'entry',
  `dokter_lab_id` int(11) DEFAULT NULL COMMENT 'm_pegawai;entry, ada default setup',
  `is_dokter_luar` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `jenis_tindakan_id` int(11) DEFAULT NULL COMMENT 'm_ref group_id=345',
  `keterangan_klinik` varchar(30) DEFAULT NULL COMMENT 'field tambahan patalogi sub unit anatomi',
  `keluhan_penderita` varchar(30) DEFAULT NULL COMMENT 'field tambahan patalogi sub unit anatomi',
  `status_lokalis` varchar(30) DEFAULT NULL COMMENT 'field tambahan patalogi sub unit anatomi',
  `nomor_sediaan` varchar(30) DEFAULT NULL COMMENT 'field tambahan patalogi sub unit anatomi',
  `bahan_sediaan` varchar(255) DEFAULT NULL COMMENT 'field tambahan patalogi sub unit anatomi',
  `lokasi_pengambilan_bahan` varchar(255) DEFAULT NULL COMMENT 'field tambahan patalogi sub unit anatomi',
  `lama_menikah` varchar(30) DEFAULT NULL COMMENT 'field tambahan sub unit andrologi',
  `jumlah_anak` int(11) DEFAULT NULL COMMENT 'field tambahan sub unit andrologi',
  `absinensia` varchar(30) DEFAULT NULL COMMENT 'field tambahan sub unit andrologi',
  `kadar_hemogoblin` varchar(30) DEFAULT NULL COMMENT 'field tambahan sub unit bank darah',
  `abortus` tinyint(4) DEFAULT NULL COMMENT 'field tambahan sub unit bank darah',
  `reaksi_transfusi` tinyint(4) DEFAULT NULL COMMENT 'field tambahan sub unit bank darah',
  `tranfusi_sebelumnya` tinyint(4) DEFAULT NULL COMMENT 'field tambahan sub unit bank darah',
  `gejala_tranfusi` varchar(30) DEFAULT NULL COMMENT 'field tambahan sub unit bank darah',
  `tanggal_tranfusi_sebelumnya` date DEFAULT NULL COMMENT 'field tambahan sub unit bank darah',
  `jumlah_kehamilan` int(11) DEFAULT NULL COMMENT 'field tambahan sub unit bank darah',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=latin1;

/*Table structure for table `m_pp_detil` */

DROP TABLE IF EXISTS `m_pp_detil`;

CREATE TABLE `m_pp_detil` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `booking_id` bigint(20) DEFAULT NULL COMMENT 'm_pp_booking',
  `kelas_id` bigint(20) DEFAULT NULL COMMENT 'm_kelas',
  `tindakan_tarif_id` varchar(10) DEFAULT NULL COMMENT 'm_tindakan_tarif',
  `qty` int(11) DEFAULT 1,
  `besar_tarif` float DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `is_ditanggung_bpjs` tinyint(5) DEFAULT NULL COMMENT 'di tanggung bpjs atau tidak (otomatis di cek dari m_tindakan_tarif)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=681 DEFAULT CHARSET=latin1;

/*Table structure for table `m_pp_persetujuan` */

DROP TABLE IF EXISTS `m_pp_persetujuan`;

CREATE TABLE `m_pp_persetujuan` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `layanan_id` bigint(20) DEFAULT NULL,
  `no_rm` varchar(20) DEFAULT NULL,
  `nomor_registrasi` varchar(20) DEFAULT NULL,
  `kode_booking` varchar(20) DEFAULT NULL COMMENT 'm_pp_booking',
  `subunit_id` int(11) DEFAULT NULL COMMENT 'subunit_lab_dituju',
  `tanggal_persetujuan` datetime DEFAULT NULL COMMENT 'entry',
  `teks_persetujuan` text DEFAULT NULL COMMENT 'entry;default',
  `biaya_persetujuan` float DEFAULT NULL COMMENT 'entry:otomatis dihitung dari list pemeriksaan',
  `kode_status_persetujuan` tinyint(4) DEFAULT 1 COMMENT 'm_ref,group_id=346',
  `detil_pemeriksaan` longtext DEFAULT NULL COMMENT 'menyimpan id detil booking apa saja yag di book',
  `passcode_pasien` varchar(255) DEFAULT NULL,
  `ttd_pasien_url` varchar(255) DEFAULT NULL,
  `passcode_rs` varchar(255) DEFAULT NULL,
  `ttd_rs_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;

/*Table structure for table `m_pp_proses` */

DROP TABLE IF EXISTS `m_pp_proses`;

CREATE TABLE `m_pp_proses` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `kode` smallint(6) DEFAULT NULL COMMENT 'ex:1,2,3,4,5,,,',
  `nama_proses` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '1=booking;2=Terverif;3=Persetujuan; 4= Sudah Deposit 5= Send To LIST; 6= Read From LIS; 7 = Ambil Hasil; 8 = Selesai',
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `regencies_province_id_index` (`nama_proses`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `m_provinsi` */

DROP TABLE IF EXISTS `m_provinsi`;

CREATE TABLE `m_provinsi` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `negara_id` int(10) DEFAULT NULL,
  `nama_provinsi` varchar(255) DEFAULT NULL,
  `kode_kemendagri` varchar(15) DEFAULT NULL,
  `kode_nonkemendagri` varchar(15) DEFAULT NULL,
  `kode_bpjs` varchar(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

/*Table structure for table `m_provinsi_old` */

DROP TABLE IF EXISTS `m_provinsi_old`;

CREATE TABLE `m_provinsi_old` (
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

/*Table structure for table `m_rajal_generate_form` */

DROP TABLE IF EXISTS `m_rajal_generate_form`;

CREATE TABLE `m_rajal_generate_form` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'setting form yang akan di generate di rajal',
  `nama_form` varchar(255) DEFAULT NULL COMMENT 'nama form',
  `identifier` varchar(255) DEFAULT NULL COMMENT 'nama unik, akan di hardcode',
  `is_umum` tinyint(1) DEFAULT 0 COMMENT 'penjamin umum',
  `is_bpjs` tinyint(1) DEFAULT 0 COMMENT 'yesno, jika pasien bpjs',
  `is_bpjs_kontrol` tinyint(1) DEFAULT 0 COMMENT 'bpjs dan disposisi boleh pulang',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `m_ref` */

DROP TABLE IF EXISTS `m_ref`;

CREATE TABLE `m_ref` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL COMMENT 'm_ref_group',
  `kode` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'entry',
  `nama` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'entry;ex. untuk namagroup=Jenis, maka nilainya: 1. Obat; 2. Alkes',
  `keterangan` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2772 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `m_ref_group` */

DROP TABLE IF EXISTS `m_ref_group`;

CREATE TABLE `m_ref_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `group_a` varchar(40) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=443 DEFAULT CHARSET=utf8mb4;

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
  `farmasi` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '4',
  `lab` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '5',
  `radiologi` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '6',
  `ok` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '8',
  `intensif` varchar(10) DEFAULT '9',
  `vk` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '11',
  `hemodialisa` varchar(10) DEFAULT '12',
  `idjenisdokter` tinyint(4) DEFAULT NULL,
  `pre_noreg` varchar(10) DEFAULT NULL COMMENT 'nomor registrasi pasien',
  `pre_order_lab` varchar(10) DEFAULT NULL COMMENT 'nomor order pp lab',
  `pre_order_rad` varchar(10) DEFAULT NULL COMMENT 'nomor order pp radiologi',
  `pre_order_ok` varchar(10) DEFAULT NULL COMMENT 'nomor order pp ok operasi',
  `pre_order_vk` varchar(10) DEFAULT NULL COMMENT 'nomor order pp vk bersalin',
  `pre_order_hd` varchar(10) DEFAULT NULL COMMENT 'nomor order pp hemodialisa',
  `pre_ref_tindakan` varchar(10) DEFAULT NULL COMMENT 'nomor referensi tindakna',
  `pre_norm` varchar(10) DEFAULT NULL COMMENT 'nomor rekam medis',
  `jdoc_pof_id` varchar(10) DEFAULT NULL COMMENT 'm_mo_Jdoc:id',
  `jdoc_rof_id` varchar(10) DEFAULT NULL COMMENT 'm_mo_jdoc:id',
  `jdoc_prf_id` varchar(10) DEFAULT NULL COMMENT 'm_mo_jdoc:id',
  `jdoc_rprf_id` varchar(10) DEFAULT NULL COMMENT 'm_mo_Jdoc:id',
  `jdoc_bkmf_id` varchar(10) DEFAULT NULL COMMENT 'm_mo_Jdoc:id',
  `jdoc_bkkf_id` varchar(10) DEFAULT NULL COMMENT 'm_mo_Jdoc:id',
  `jdoc_poad_id` varchar(10) DEFAULT NULL,
  `jdoc_radf_id` varchar(10) DEFAULT NULL,
  `jdoc_sof_id` varchar(10) DEFAULT NULL,
  `jdoc_adjf_id` varchar(10) DEFAULT NULL,
  `jdoc_rdf_id` varchar(10) DEFAULT NULL,
  `jdoc_rrdf_id` varchar(10) DEFAULT NULL,
  `jdoc_rgf_id` varchar(10) DEFAULT NULL,
  `jdoc_adjgf_id` varchar(10) DEFAULT NULL,
  `jdoc_nrf_id` varchar(10) DEFAULT NULL,
  `nationality_lokal` varchar(5) DEFAULT NULL,
  `minute_schedule_ant` int(11) DEFAULT NULL COMMENT 'Untuk meyeting berapa menit schedule yang dipakai di briding',
  `umum` varchar(5) DEFAULT '1' COMMENT 'penjamin umum',
  `bpjs` varchar(5) DEFAULT '2' COMMENT 'penjamin bpjs',
  `iks` varchar(5) DEFAULT '3' COMMENT 'penjamin iks',
  `karyawan` varchar(5) DEFAULT '4' COMMENT 'penjamin karyawan',
  `instalasi_admisi` text DEFAULT NULL,
  `tindakan_administrasi` varchar(5) DEFAULT '16' COMMENT 'kategori tindakan administrasi',
  `tindakan_on_admisi` text DEFAULT NULL,
  `secret_passcode` text DEFAULT NULL COMMENT 'secret key passcode',
  `fail_passcode` tinyint(2) DEFAULT 3,
  `passcode_pasien_valid` tinyint(4) DEFAULT 24 COMMENT 'lama passcode berlaku, dalam jam',
  `unit_ugd` varchar(5) DEFAULT NULL,
  `subunit_ugd` varchar(5) DEFAULT NULL,
  `url_booking` text DEFAULT NULL,
  `url_rajal` text DEFAULT NULL,
  `aplicares_cons_id` varchar(10) DEFAULT NULL,
  `aplicares_secretkey` varchar(30) DEFAULT NULL,
  `aplicares_userkey` varchar(200) DEFAULT NULL,
  `aplicares_baseurl` varchar(200) DEFAULT NULL,
  `antrean_cons_id` varchar(10) DEFAULT NULL,
  `antrean_secretkey` varchar(30) DEFAULT NULL,
  `antrean_userkey` varchar(100) DEFAULT NULL,
  `antrean_baseurl` varchar(200) DEFAULT NULL,
  `apotek_cons_id` varchar(10) DEFAULT NULL,
  `apotek_secretkey` varchar(30) DEFAULT NULL,
  `apotek_userkey` varchar(100) DEFAULT NULL,
  `apotek_baseurl` varchar(200) DEFAULT NULL,
  `prefix_kode_tarif` varchar(10) DEFAULT NULL,
  `panjang_kode_tarif` tinyint(4) DEFAULT 6 COMMENT 'panjang nomor, diluar prefix',
  `prefix_no_e_resep` varchar(10) DEFAULT NULL,
  `panjang_no_e_resep` tinyint(6) DEFAULT 6,
  `minimal_persentase_deposit` float DEFAULT NULL COMMENT 'minimal presentasi deposit yang harus di bayarkan di kasir',
  `depo_farmasi_rajal` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

/*Table structure for table `m_status_antrean_rajal` */

DROP TABLE IF EXISTS `m_status_antrean_rajal`;

CREATE TABLE `m_status_antrean_rajal` (
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
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `m_status_keaktifan` */

DROP TABLE IF EXISTS `m_status_keaktifan`;

CREATE TABLE `m_status_keaktifan` (
  `status_keaktipan_id` int(10) NOT NULL AUTO_INCREMENT,
  `nama_keaktifan` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`status_keaktipan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

/*Table structure for table `m_subunit_dokter` */

DROP TABLE IF EXISTS `m_subunit_dokter`;

CREATE TABLE `m_subunit_dokter` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `subunit_id` int(11) DEFAULT NULL COMMENT 'm_subunit_medik',
  `pegawai_id` int(11) DEFAULT NULL COMMENT 'm_pegawai',
  `is_aktif` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `m_subunit_kamar` */

DROP TABLE IF EXISTS `m_subunit_kamar`;

CREATE TABLE `m_subunit_kamar` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `subunit_id` int(11) DEFAULT NULL,
  `kelas_id` smallint(6) DEFAULT NULL COMMENT 'm_kelas',
  `namakamar` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_aktif` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `m_subunit_komponen` */

DROP TABLE IF EXISTS `m_subunit_komponen`;

CREATE TABLE `m_subunit_komponen` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `subunit_id` int(11) DEFAULT NULL COMMENT 'm_subunit_medik',
  `komponen_id` int(20) DEFAULT NULL COMMENT 'm_tarif_komponen',
  `is_aktif` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=777 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `m_subunit_medik` */

DROP TABLE IF EXISTS `m_subunit_medik`;

CREATE TABLE `m_subunit_medik` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `unit_id` int(11) unsigned DEFAULT NULL,
  `kode_subunit` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kode_subunit_bpjs` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama_subunit` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_spesialis_id` int(11) DEFAULT NULL,
  `kelas_id` smallint(6) DEFAULT NULL COMMENT 'entry:m_kelas',
  `prefix_antrean` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `inacbgs_id` int(11) DEFAULT NULL COMMENT 'entry:bpjs_inacbgs',
  `txt_ktg` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `prefix_nomor` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `allow_add_komponen` tinyint(4) DEFAULT 0 COMMENT 'apakah disubunit ini diijinkan menambah komponen tarif',
  `allow_duplicate_komponen` tinyint(4) DEFAULT 0 COMMENT 'apakah subunit ini diijinkan menduplikasi komponen tarif',
  PRIMARY KEY (`id`),
  KEY `unit_id` (`unit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `m_subunit_paramedis` */

DROP TABLE IF EXISTS `m_subunit_paramedis`;

CREATE TABLE `m_subunit_paramedis` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `subunit_id` int(11) DEFAULT NULL COMMENT 'm_subunit_medik',
  `pegawai_id` int(11) DEFAULT NULL COMMENT 'm_pegawai',
  `is_aktif` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

/*Table structure for table `m_subunit_spesialis` */

DROP TABLE IF EXISTS `m_subunit_spesialis`;

CREATE TABLE `m_subunit_spesialis` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `subunit_id` int(11) DEFAULT NULL COMMENT 'm_subunit_medik',
  `spesialisasi_id` int(11) DEFAULT NULL COMMENT 'm_spesialisasi',
  `is_aktif` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Table structure for table `m_subunit_staff` */

DROP TABLE IF EXISTS `m_subunit_staff`;

CREATE TABLE `m_subunit_staff` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `subunit_id` int(11) DEFAULT NULL COMMENT 'm_subunit_medik',
  `pegawai_id` int(11) DEFAULT NULL COMMENT 'm_pegawai',
  `is_aktif` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `m_subunit_tindakan` */

DROP TABLE IF EXISTS `m_subunit_tindakan`;

CREATE TABLE `m_subunit_tindakan` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `subunit_id` int(11) DEFAULT NULL COMMENT 'm_subunit_medik',
  `tindakan_id` bigint(20) DEFAULT NULL COMMENT 'm_tindakan',
  `status_aktif` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=798 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `m_suku` */

DROP TABLE IF EXISTS `m_suku`;

CREATE TABLE `m_suku` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `kode` smallint(6) NOT NULL,
  `nama` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `m_tarif_komponen` */

DROP TABLE IF EXISTS `m_tarif_komponen`;

CREATE TABLE `m_tarif_komponen` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `kode` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT 'entry',
  `nama` varchar(150) COLLATE utf8_unicode_ci NOT NULL COMMENT 'entry',
  `status_aktif` tinyint(4) DEFAULT NULL COMMENT 'entry',
  `is_mapping_pegawai` tinyint(4) DEFAULT NULL COMMENT 'entry',
  `nilai_default` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `allow_oncall` tinyint(4) DEFAULT 0 COMMENT 'diijinkan oncall apa tidak',
  `allow_onduty` tinyint(4) DEFAULT 0 COMMENT 'diijinkan yang bertugas dapat honor',
  `allow_duplicate` tinyint(4) DEFAULT 0 COMMENT 'diijinkan diduplikasi',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `m_tarif_komponen_default` */

DROP TABLE IF EXISTS `m_tarif_komponen_default`;

CREATE TABLE `m_tarif_komponen_default` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `kode` int(20) NOT NULL COMMENT 'entry',
  `nama` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'entry;ex. untuk namagroup=Jenis, maka nilainya: 1. Obat; 2. Alkes',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `m_tarif_komponen_tmp` */

DROP TABLE IF EXISTS `m_tarif_komponen_tmp`;

CREATE TABLE `m_tarif_komponen_tmp` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `kode` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT 'entry',
  `nama` varchar(150) COLLATE utf8_unicode_ci NOT NULL COMMENT 'entry;nama template',
  `status_aktif` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `m_tarif_komponen_tmp_d` */

DROP TABLE IF EXISTS `m_tarif_komponen_tmp_d`;

CREATE TABLE `m_tarif_komponen_tmp_d` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `template_id` int(11) DEFAULT NULL COMMENT 'm_tarif_komponen_tmp',
  `komponen_id` int(20) DEFAULT NULL COMMENT 'm_tarif_komponen',
  `is_aktif` tinyint(1) DEFAULT 1 COMMENT 'm_yesno',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=775 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `m_tarif_versi` */

DROP TABLE IF EXISTS `m_tarif_versi`;

CREATE TABLE `m_tarif_versi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode_versi` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama_versi` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_aktif` tinyint(4) DEFAULT NULL COMMENT '1=aktif 2=tidak aktif',
  `nomor_sk` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tgl_sk` date DEFAULT NULL,
  `fx_lokal` float DEFAULT 1,
  `fx_kitas` float DEFAULT 1.5,
  `fx_wna` float DEFAULT 2 COMMENT 'faktor pengali tarif',
  `cito` float DEFAULT 25 COMMENT 'entry',
  `file_tarif` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'bisa SK Tim, dll',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `status_proof_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref group id = 405',
  `subunit_owner_id` int(11) DEFAULT NULL,
  `jdoc_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_mo_jdoc',
  `kode_doc` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:prefix di m_mo_jdoc + kode_owner + nomor',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `m_template_penandaan` */

DROP TABLE IF EXISTS `m_template_penandaan`;

CREATE TABLE `m_template_penandaan` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT COMMENT 'gambar untuk penandaan di rekam medis dokter',
  `subunit_id` int(10) DEFAULT NULL COMMENT 'm_subunit_medik',
  `img` text DEFAULT NULL COMMENT 'url img',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) DEFAULT NULL,
  `updated_by` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Table structure for table `m_template_rajal_rmd` */

DROP TABLE IF EXISTS `m_template_rajal_rmd`;

CREATE TABLE `m_template_rajal_rmd` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'template pengisian form rajal rmd. t_layanan_rajal_rmd',
  `nama_template` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `keluhan_utama` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `penyakit_sekarang` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `riwayat_pengobatan` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `riwayat_penyakit_keluarga` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `alergi_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `alergi_obat_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `alergi_makanan_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `alergi_udara_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `alergi_debu_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `alergi_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `hipertensi_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `diabetes_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `jantung_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `stroke_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `ginjal_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `asma_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `kejang_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `liver_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `cancer_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `tbc_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `glukoma_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `std_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `pendarahan_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `lainnya_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `riwayat_penyakit_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `operasi_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `operasi_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `tranfusi_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `reaksi_transfusi_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `reaksi_transfusi_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `diagnosa_primer` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `icd10_primer_kode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_icd',
  `diagnosa_banding` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `icd10_banding_kode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:m_icd',
  `pemeriksaan_penunjang` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `rencana_asuhan` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `rekomendasi_dokter` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `disposisi_id` tinyint(1) DEFAULT NULL COMMENT '1=pulang, 2=kontrol, 3=rawat, 4=rujuk',
  `pulang_id` tinyint(4) DEFAULT NULL COMMENT 'tidak dipakai, m_yesno',
  `pulang_datetime` datetime DEFAULT NULL COMMENT 'entry',
  `kontrol_id` tinyint(4) DEFAULT NULL COMMENT 'tidak dipakai, m_yesno',
  `kontrol_kronis_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `kontrol_datetime` datetime DEFAULT NULL COMMENT 'entry',
  `rawat_id` tinyint(4) DEFAULT NULL COMMENT 'tidak dipakai, m_yesno',
  `rawat_subunit_id` int(11) DEFAULT NULL COMMENT 'm_subunit_medik',
  `rawat_ruangan` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry;m_subunit_medik',
  `rujuk_id` tinyint(4) DEFAULT NULL COMMENT 'tidak dipakai, m_yesno',
  `alergi_lainnya_id` tinyint(4) DEFAULT NULL,
  `fu_td_sistole` int(11) DEFAULT NULL COMMENT 'entry',
  `fu_td_diastole` int(11) DEFAULT NULL COMMENT 'entry',
  `fu_rr` int(11) DEFAULT NULL COMMENT 'entry',
  `fu_nadi` int(11) DEFAULT NULL COMMENT 'entry',
  `fu_suhu` float DEFAULT NULL COMMENT 'entry',
  `fu_keadaan_umum_id` tinyint(4) DEFAULT NULL COMMENT 'm_ref group_id=337',
  `fu_gizi_id` tinyint(4) DEFAULT NULL COMMENT 'm_ref group_id=338',
  `fu_gcs_e` smallint(6) DEFAULT NULL COMMENT 'entry',
  `fu_gcs_v` smallint(6) DEFAULT NULL COMMENT 'entry',
  `fu_gcs_m` smallint(6) DEFAULT NULL COMMENT 'entry',
  `fu_kepala_normal` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_kepala_mikro` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_kepala_makro` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_kepala_lainnya` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_kepala_ket` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `fu_mata_a` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_mata_i` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_mata_r` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_mata_o` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_mata_ket` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `fu_tht_te` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_tht_hi` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_tht_fa` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_tht_to` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_tht_ket` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `fu_gigi_no` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_gigi_lu` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_gigi_bd` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_gigi_gp` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_gigi_ket` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `fu_leher_k` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_leher_j` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_leher_l` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_leher_p` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_leher_ket` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `fu_thorax_sim` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_thorax_ket` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `fu_cor_s1s2` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `fu_cor_reg` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_pulmo_s` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_pulmo_r` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_pulmo_w` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_pulmo_l` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_pulmo_ket` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `fu_abdomen_dis` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_abdomen_dis_pm` tinyint(4) DEFAULT NULL COMMENT 'm_yesno;pilih plus (+) atau minus (-);pakai optionbox',
  `fu_abdomen_met` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_abdomen_met_pm` tinyint(4) DEFAULT NULL COMMENT 'm_yesno;pilih plus (+) atau minus (-);pakai optionbox',
  `fu_abdomen_per` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_abdomen_nmm` tinyint(4) DEFAULT NULL COMMENT 'm_ref group_id=344',
  `fu_abdomen_asc` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_abdomen_asc_pm` tinyint(4) DEFAULT NULL COMMENT 'm_yesno;pilih plus (+) atau minus (-);pakai optionbox',
  `fu_abdomen_nyeri` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_abdomen_nyeri_pm` tinyint(4) DEFAULT NULL COMMENT 'm_yesno;pilih plus (+) atau minus (-);pakai optionbox',
  `fu_abdomen_lokasi` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `fu_abdomen_hepar` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `fu_abdomen_lien` tinyint(100) DEFAULT NULL COMMENT 'm_yesno',
  `fu_abdomen_lien_ket` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `fu_extrim_h` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_extrim_o` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_extrim_r` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_extrim_l` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_extrim_ket` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `fu_des` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'json data pemeriksaan fisik masing2 poli',
  `kontrol_subunit` int(10) DEFAULT NULL COMMENT 'm_subunit_medik',
  `kontrol_dokter_id` int(10) DEFAULT NULL COMMENT 'm_pegawai',
  `kontrol_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pulang_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_ttd_dokter` tinyint(1) DEFAULT 0,
  `keterangan_template` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `m_template_rajal_rmp` */

DROP TABLE IF EXISTS `m_template_rajal_rmp`;

CREATE TABLE `m_template_rajal_rmp` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'template pengisian form. kolom harus sama dengan t_layanan_rajal_rmp',
  `nama_template` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `td_s` int(4) DEFAULT NULL COMMENT 'entry',
  `td_d` int(4) DEFAULT NULL,
  `rr` float DEFAULT NULL COMMENT 'entry',
  `nadi` float DEFAULT NULL COMMENT 'entry',
  `suhu` float DEFAULT NULL COMMENT 'entry',
  `bb` float DEFAULT NULL COMMENT 'entry',
  `tb` float DEFAULT NULL COMMENT 'entry',
  `nyeri_is` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `nyeri_kode` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=323;',
  `nyeri_lokasi_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `nyeri_onset_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `nyeri_pencetus_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `nyeri_kualitas_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=324',
  `nyeri_kualitas_lainnya` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `nyeri_menjalar_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=325',
  `nyeri_menjalar_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `nyeri_tingkatan_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=326',
  `nyeri_waktu_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=327',
  `nyeri_waktu_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `nyeri_skoring_kode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=328',
  `nyeri_skoring_skor_1` smallint(6) DEFAULT NULL COMMENT 'entry',
  `nyeri_skoring_skor_2` smallint(6) DEFAULT NULL,
  `nyeri_skoring_skor_3` smallint(6) DEFAULT NULL,
  `sumber_data_kode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=329',
  `sumber_data_lainnya` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keluhan_utama_p` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `psi_status_nikah_id` tinyint(4) DEFAULT NULL COMMENT 'm_statusnikah',
  `psi_punya_anak_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `psi_jumlah_anak` tinyint(4) DEFAULT NULL COMMENT 'entry',
  `psi_pendidikan_id` tinyint(4) DEFAULT NULL COMMENT 'm_pasien',
  `psi_pendidikan_lainnya` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `psi_warganegara_id` tinyint(4) DEFAULT NULL COMMENT 'm_pasien',
  `psi_pekerjaan_id` tinyint(4) DEFAULT NULL COMMENT 'm_pasien',
  `psi_tinggal_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=330',
  `psi_tinggal_lainnya` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `psi_tinggal_nama` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `psi_tinggal_telp` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `psi_kebiasaan_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=331',
  `psi_kebiasaan_des` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `psi_kebiasaan_lainnya` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `psi_agama_id` tinyint(4) DEFAULT NULL COMMENT 'm_pasien',
  `psi_berbicara_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `psi_berbicara_des` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `psi_bahasa` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `psi_penerjemah_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `psi_penerjemah_des` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `bicara_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=332',
  `bicara_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `hb_bahasa_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `hb_pendengaran_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `hb_memori_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `hb_motivasi_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `hb_penglihatan_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `hb_tidakada_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `hb_cemas_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `hb_emosi_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `hb_kognitif_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `hb_bicara_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `hb_partisipasi_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `hb_fisiologi_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `kajian_budaya_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `kajian_budaya_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `edukasi_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `potensial_proses_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `potensial_pengobatan_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `potensial_terapi_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `potensial_edukasi_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `nutrisi_diet_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `nutrisi_bb_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `nutrisi_bb_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `cb_menulis_id` tinyint(4) DEFAULT NULL COMMENT 'cara belajar disukai yesno',
  `cb_audio_id` tinyint(4) DEFAULT NULL,
  `cb_diskusi_id` tinyint(4) DEFAULT NULL,
  `cb_membaca_id` tinyint(4) DEFAULT NULL,
  `cb_demo_id` tinyint(4) DEFAULT NULL,
  `mens_siklus_id` tinyint(1) DEFAULT NULL COMMENT 'obstetri, m_yesno',
  `mens_siklus_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'obstetri',
  `mens_menarche_id` tinyint(4) DEFAULT NULL COMMENT 'obstetri',
  `mens_menarche_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'obstetri',
  `mens_akhir_id` tinyint(4) DEFAULT NULL COMMENT 'obstetri',
  `mens_akhir_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'obstetri',
  `mens_haid_id` tinyint(4) DEFAULT NULL COMMENT 'obstetri',
  `mens_haid_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'obstetri',
  `mens_banyak_id` tinyint(4) DEFAULT NULL COMMENT 'obstetri',
  `mens_banyak_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'obstetri',
  `mens_teratur_id` tinyint(4) DEFAULT NULL COMMENT 'obstetri',
  `mens_teratur_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'obstetri',
  `mens_lama_id` tinyint(4) DEFAULT NULL COMMENT 'obstetri',
  `mens_lama_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'obstetri',
  `mens_tgl_persalinan_id` tinyint(4) DEFAULT NULL,
  `mens_tgl_persalinan_des` date DEFAULT NULL COMMENT 'obstetri',
  `kwn_status_id` tinyint(4) DEFAULT NULL COMMENT 'obstetri 1=belum,2=cerai,3=kawin',
  `kwn_status_jumlah` int(4) DEFAULT NULL COMMENT 'obstetri',
  `kwn_pertama_umur` float DEFAULT NULL COMMENT 'obstetri',
  `is_ttd_perawat` tinyint(1) DEFAULT 0,
  `keterangan_template` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `m_tindakan` */

DROP TABLE IF EXISTS `m_tindakan`;

CREATE TABLE `m_tindakan` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `katagori_id` int(11) DEFAULT NULL COMMENT 'm_tindakan_katagori',
  `group_id` int(11) DEFAULT NULL COMMENT 'm_tindakan_group',
  `group_kode` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'm_tindakan_group',
  `kode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'entry: kode tindakan',
  `nama` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'entry: nama tindakan',
  `deskripsi` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'entry',
  `is_canggih` tinyint(4) DEFAULT 0 COMMENT 'm_yesno',
  `status_aktif` int(11) DEFAULT 1 COMMENT 'm_yesno',
  `kd_icd9cm` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_administrasi` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `regencies_province_id_index` (`nama`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1040 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `m_tindakan_group` */

DROP TABLE IF EXISTS `m_tindakan_group`;

CREATE TABLE `m_tindakan_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=latin1;

/*Table structure for table `m_tindakan_katagori` */

DROP TABLE IF EXISTS `m_tindakan_katagori`;

CREATE TABLE `m_tindakan_katagori` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `kode` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'entry: kode katagori tindakan',
  `nama` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'entry: nama katagori tindakan',
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `regencies_province_id_index` (`nama`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `m_tindakan_kriteria` */

DROP TABLE IF EXISTS `m_tindakan_kriteria`;

CREATE TABLE `m_tindakan_kriteria` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ex:ringan, sedang, berat',
  `caption` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_aktif` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `m_tindakan_tarif` */

DROP TABLE IF EXISTS `m_tindakan_tarif`;

CREATE TABLE `m_tindakan_tarif` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `versi_id` int(11) DEFAULT NULL COMMENT 'm_tarif_versi',
  `tindakan_id` int(11) DEFAULT NULL COMMENT 'm_tindakan',
  `kriteria_id` smallint(6) DEFAULT NULL COMMENT 'm_tindakan_kriteria',
  `kode_tarif` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT 'entry',
  `nama_tarif` varchar(150) COLLATE utf8_unicode_ci NOT NULL COMMENT 'entry: namatindakan + nama kriteria',
  `valid_until` date DEFAULT NULL COMMENT 'tarif berlaku sampai kapan',
  `paket_jenis_id` int(11) DEFAULT NULL COMMENT 'entry:m_paket_jenis',
  `tindakan_group_id` int(11) DEFAULT NULL,
  `is_ditanggung_bpjs` tinyint(4) DEFAULT 1 COMMENT 'm_yesno',
  `helper_template` int(1) DEFAULT 0 COMMENT 'kolom bantu, default 0',
  `helper_template_map` int(1) DEFAULT 0 COMMENT 'kolom bantu mapping subunit, atau template atau bebas',
  `helper_kelas` varchar(255) COLLATE utf8_unicode_ci DEFAULT '[]' COMMENT 'kolom bantu',
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `tgl_sk` date DEFAULT NULL,
  `nomor_sk` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `kode_inacbg` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'entry;',
  PRIMARY KEY (`kode_tarif`,`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1038 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `m_tindakan_tarif_komponen` */

DROP TABLE IF EXISTS `m_tindakan_tarif_komponen`;

CREATE TABLE `m_tindakan_tarif_komponen` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tindakan_tarif_id` bigint(10) NOT NULL COMMENT 'm_tindakan_tarif',
  `kelas_id` int(11) DEFAULT NULL COMMENT 'm_kelas',
  `tarif_komponen_id` int(11) NOT NULL COMMENT 'm_tarif_komponen',
  `besartarif_lokal` float DEFAULT NULL COMMENT 'nilai rp tarif lokal',
  `besartarif_kitas` float DEFAULT NULL COMMENT 'nilai rp tarif kitas',
  `besartarif_wna` float DEFAULT NULL COMMENT 'nilai rp tarif wna',
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `m_tindakan_totaltarif` */

DROP TABLE IF EXISTS `m_tindakan_totaltarif`;

CREATE TABLE `m_tindakan_totaltarif` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tindakan_tarif_id` bigint(20) DEFAULT NULL,
  `kelas_id` int(11) DEFAULT NULL COMMENT 'm_tindakan',
  `totaltarif` float DEFAULT NULL COMMENT 'lokal',
  `totaltarif_kitas` float DEFAULT NULL COMMENT 'kitas',
  `totaltarif_wna` float DEFAULT NULL COMMENT 'wna',
  `totaltarif_inacbg` float DEFAULT NULL COMMENT 'bpjs',
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`tindakan_tarif_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2450 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `m_ugd_bed` */

DROP TABLE IF EXISTS `m_ugd_bed`;

CREATE TABLE `m_ugd_bed` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `m_unit_medik` */

DROP TABLE IF EXISTS `m_unit_medik`;

CREATE TABLE `m_unit_medik` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `instalasi_id` smallint(6) DEFAULT NULL COMMENT 'm_instalasi_medik',
  `kode` varchar(5) DEFAULT NULL,
  `nama` varchar(30) DEFAULT NULL COMMENT '1; Rawat Jalan 2; UGD 3; Rawat ini 4; Lab 5; Farmasi 6;Radiologi 7;OK ; 8 VK; 99 Luar',
  `is_non_medik` tinyint(4) DEFAULT 0 COMMENT '0; Unit Medik 1; Unit Non Medik',
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

/*Table structure for table `m_unit_medik_copy` */

DROP TABLE IF EXISTS `m_unit_medik_copy`;

CREATE TABLE `m_unit_medik_copy` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `instalasi_id` smallint(6) DEFAULT NULL COMMENT 'm_instalasi_medik',
  `kode` varchar(5) DEFAULT NULL,
  `nama` varchar(30) DEFAULT NULL COMMENT '1; Rawat Jalan 2; UGD 3; Rawat ini 4; Lab 5; Farmasi 6;Radiologi 7;OK ; 8 VK; 99 Luar',
  `is_non_medik` tinyint(4) DEFAULT 0 COMMENT '0; Unit Medik 1; Unit Non Medik',
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

/*Table structure for table `m_vk_booking` */

DROP TABLE IF EXISTS `m_vk_booking`;

CREATE TABLE `m_vk_booking` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `layanan_id` bigint(20) DEFAULT NULL COMMENT 't_layanan',
  `nomor_registrasi` varchar(20) DEFAULT NULL COMMENT 't_layanan',
  `no_rm` varchar(20) DEFAULT NULL,
  `tanggal_booking` datetime DEFAULT NULL COMMENT 'terhubung ke group_item_pemeriksaan_penunjang, misal PK1 = Hematologi',
  `kode_booking` varchar(20) DEFAULT NULL COMMENT 'entry:otomatis/kode booking lab',
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `subunit_asal_id` int(11) DEFAULT NULL COMMENT 'm_subunit_medik;subunit yang booking',
  `subunit_dituju_id` int(11) DEFAULT NULL COMMENT 'entry:subunit yang dituju (PK, PA, dll)',
  `file_pengantar` varchar(255) DEFAULT NULL COMMENT 'entry:file pengantar dokter',
  `tgl_tindakan` date DEFAULT NULL COMMENT 'tanggal pemeriksaan',
  `jam_tindakan` time DEFAULT NULL COMMENT 'jam pemeriksaan',
  `dokter_dpjp_id` int(11) DEFAULT NULL COMMENT 'm_pegawai',
  `diagnosa` text DEFAULT NULL COMMENT 'entry',
  `keterangan` varchar(255) DEFAULT NULL,
  `jenis_tindakan_id` int(11) DEFAULT NULL COMMENT 'm_ref group_id=345',
  `dokter_dpjp_nama` varchar(80) DEFAULT NULL,
  `is_dokter_luar` tinyint(1) DEFAULT NULL,
  `status_selesai` int(11) DEFAULT NULL,
  `status_verifikasi` int(11) DEFAULT NULL,
  `status_proses` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `otp_token` */

DROP TABLE IF EXISTS `otp_token`;

CREATE TABLE `otp_token` (
  `otp_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `otp_token` int(11) DEFAULT NULL,
  `expired_at` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`otp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `rbac_menus` */

DROP TABLE IF EXISTS `rbac_menus`;

CREATE TABLE `rbac_menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(255) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=latin1;

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

/*Table structure for table `rbac_roles` */

DROP TABLE IF EXISTS `rbac_roles`;

CREATE TABLE `rbac_roles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `sso_role_id` int(11) DEFAULT NULL,
  `role_name` varchar(255) NOT NULL,
  `role_desc` varchar(255) NOT NULL,
  `is_default` smallint(2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

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
  `active` int(1) DEFAULT 0,
  KEY `id` (`id`),
  KEY `user_id` (`user_id`,`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=259 DEFAULT CHARSET=latin1;

/*Table structure for table `rbac_users` */

DROP TABLE IF EXISTS `rbac_users`;

CREATE TABLE `rbac_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `phone_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `sub_tarif` */

DROP TABLE IF EXISTS `sub_tarif`;

CREATE TABLE `sub_tarif` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kd_tarif` varchar(30) NOT NULL,
  `kd_komponen` varchar(10) NOT NULL,
  `nm_komponen` varchar(30) NOT NULL,
  `harga_pokok` decimal(12,2) NOT NULL,
  `satuan` varchar(10) NOT NULL,
  `qty` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84756 DEFAULT CHARSET=latin1;

/*Table structure for table `t_antrean_layanan` */

DROP TABLE IF EXISTS `t_antrean_layanan`;

CREATE TABLE `t_antrean_layanan` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `antrean_layanan_id` int(11) DEFAULT NULL COMMENT 'm_antrean_layanan',
  `tgl_antrean` date DEFAULT NULL COMMENT 'tangal mendapatkan nomor antrean',
  `jam_antrean` time DEFAULT NULL COMMENT 'jam mendapatkan nomor antrean',
  `jam_mulai` time DEFAULT NULL COMMENT 'jam mulai dilayani counter',
  `jam_selesai` time DEFAULT NULL COMMENT 'jam selesai dilayani counter',
  `nomor_antrean` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'nomor antrean yang dilayani',
  `kode_counter` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'counter yang melayani',
  `status_dilayani` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref 420;1-belum,2=sedang;3=sudah; 4-batal',
  `pegawai_id` int(11) DEFAULT NULL COMMENT 'm_pegawai;pegawai yang bertugas di layanan',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `t_billing_bayar` */

DROP TABLE IF EXISTS `t_billing_bayar`;

CREATE TABLE `t_billing_bayar` (
  `id` bigint(20) NOT NULL,
  `billing_id` bigint(20) NOT NULL COMMENT 'm_billing',
  `no_ref` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '-' COMMENT 'bisa kosong atau t_layanan_tindakan_group;ini dipakai penghubung ke layanan sumber data',
  `layanan_tindakan_group_id` bigint(20) DEFAULT NULL COMMENT 't_layanan_tindakan_group_id',
  `tanggal_bayar` datetime DEFAULT NULL,
  `carabayar_id` smallint(6) NOT NULL COMMENT 'm_carabayar',
  `provider_id` int(11) DEFAULT NULL COMMENT 'm_ref 419',
  `nomor_kartu` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'entry',
  `tipe_bayar` tinyint(4) DEFAULT NULL COMMENT 'mref 418 ;1. Deposit; 2. Pelunasan',
  `besar_bayar` double NOT NULL COMMENT 'besar rp',
  `note_bayar` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'entry:keterangan',
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `regencies_province_id_index` (`no_ref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `t_farmasi_adj` */

DROP TABLE IF EXISTS `t_farmasi_adj`;

CREATE TABLE `t_farmasi_adj` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `adj_id` int(11) DEFAULT NULL COMMENT 'entry:m_farmasi_adj',
  `barang_id` int(11) DEFAULT NULL COMMENT 'entry:m_farmasi_barang',
  `stock_c` int(11) DEFAULT NULL COMMENT 'entry:stock komputer',
  `stock_a` int(11) DEFAULT NULL COMMENT 'entry:besar stock yang di adjusment',
  `harga_hna` double DEFAULT NULL COMMENT 'entry:m_farmasi_barang',
  `batchno` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `alasan_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref 411',
  `aksi_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref 412',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `t_farmasi_adj_g` */

DROP TABLE IF EXISTS `t_farmasi_adj_g`;

CREATE TABLE `t_farmasi_adj_g` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `adj_id` int(11) DEFAULT NULL COMMENT 'entry:m_farmasi_adj',
  `barang_id` int(11) DEFAULT NULL COMMENT 'entry:m_farmasi_barang',
  `stock_c` int(11) DEFAULT 0 COMMENT 'entry:stock komputer',
  `stock_a` int(11) DEFAULT NULL COMMENT 'entry:besar stock yang di adjusment',
  `harga_hna` double DEFAULT NULL COMMENT 'entry:m_farmasi_barang',
  `batchno` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `alasan_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref 411',
  `aksi_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref 412',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `t_farmasi_konsin` */

DROP TABLE IF EXISTS `t_farmasi_konsin`;

CREATE TABLE `t_farmasi_konsin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
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
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `t_farmasi_konsout` */

DROP TABLE IF EXISTS `t_farmasi_konsout`;

CREATE TABLE `t_farmasi_konsout` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `konsout_id` int(11) DEFAULT NULL COMMENT 'entry:m_farmasi_konsin',
  `barang_id` int(11) DEFAULT NULL COMMENT 'entry:m_farmasi_barang',
  `qty_ff` int(11) DEFAULT NULL COMMENT 'entry:qty fullfil/terpenuhi',
  `satuan_id` smallint(6) DEFAULT NULL,
  `harga_hna` double DEFAULT NULL COMMENT 'entry:m_farmasi_barang',
  `no_batch` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `t_farmasi_mutasi` */

DROP TABLE IF EXISTS `t_farmasi_mutasi`;

CREATE TABLE `t_farmasi_mutasi` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mutasi_id` bigint(20) DEFAULT NULL COMMENT 'entry:m_farmasi_mutasi',
  `barang_id` bigint(20) DEFAULT NULL COMMENT 'entry:m_farmasi_barang',
  `qty_rq` int(11) DEFAULT NULL COMMENT 'preorder_id mana yang dipenuhi dari mutasi ini',
  `qty_ff` int(11) DEFAULT NULL COMMENT 'qty dipenuhi;update ke preorder, update stok di subunit2',
  `stok_saat_ini` int(11) DEFAULT NULL COMMENT 'm_farmasi',
  `stokmin` int(11) DEFAULT NULL COMMENT 'm_farmasi',
  `stokmax` int(11) DEFAULT NULL COMMENT 'entry',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `t_farmasi_nota` */

DROP TABLE IF EXISTS `t_farmasi_nota`;

CREATE TABLE `t_farmasi_nota` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `mresep_id` bigint(20) NOT NULL COMMENT 'entry:m_farmasi_resep',
  `nota_id` bigint(20) DEFAULT NULL,
  `no_urut` int(4) DEFAULT NULL,
  `barang_id` int(11) DEFAULT NULL COMMENT 'entry:m_farmasi_barang',
  `satuan_id` int(11) DEFAULT NULL COMMENT 'm_ref 283',
  `qty_a` smallint(6) DEFAULT NULL COMMENT 'entry:qty request',
  `qty_b` smallint(6) DEFAULT NULL COMMENT 'entry:qty terpenuhi',
  `signa_id` int(11) DEFAULT NULL COMMENT 'm_ref 299',
  `aturan_pakai_id` int(11) DEFAULT NULL COMMENT 'm_ref 300',
  `aturan_dosis_id` int(11) DEFAULT NULL COMMENT 'm_ref 406',
  `aturan_makan_id` int(11) DEFAULT NULL COMMENT 'm_ref 407',
  `aturan_habis_id` int(11) DEFAULT NULL COMMENT 'm_ref 408',
  `aturan_keterangan_id` int(11) DEFAULT NULL COMMENT 'm_ref 409',
  `harga_hna` float DEFAULT NULL COMMENT 'entry:m_farmasi_barang',
  `harga_jual` float DEFAULT NULL COMMENT 'hna + perhitungan',
  `status_resep_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry; m_ref group_id 298',
  `racik_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref 301, m_farmasi_racik',
  `is_pt` tinyint(4) DEFAULT NULL COMMENT 'm_farmasi_barang;obat ini protokol terapi apa tidak',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `t_farmasi_opname` */

DROP TABLE IF EXISTS `t_farmasi_opname`;

CREATE TABLE `t_farmasi_opname` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `opname_id` int(11) DEFAULT NULL COMMENT 'entry:m_farmasi_opname',
  `barang_id` int(11) DEFAULT NULL COMMENT 'entry:m_farmasi_barang',
  `stock_c` int(11) DEFAULT NULL COMMENT 'entry:stock komputer',
  `stock_o` int(11) DEFAULT NULL COMMENT 'entry:stock opname',
  `qty_in` int(11) DEFAULT NULL COMMENT 'entry/otomatis:barang masuk selama opname utk slow moving',
  `qty_out` int(11) DEFAULT NULL COMMENT 'entry/otomatis:barang keluar selama opname untuk slow moving',
  `so_id` tinyint(4) DEFAULT NULL COMMENT 'untuk fast moving, set 1 ketika tekan tombol update stok saat opname',
  `so_date` datetime DEFAULT NULL COMMENT 'entry:tanggal status opname',
  `harga_hna` double DEFAULT NULL COMMENT 'entry:m_farmasi_barang',
  `no_batch` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `t_farmasi_po` */

DROP TABLE IF EXISTS `t_farmasi_po`;

CREATE TABLE `t_farmasi_po` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `po_id` int(11) DEFAULT NULL COMMENT 'entry:m_farmasi_po',
  `barang_id` int(11) DEFAULT NULL COMMENT 'entry:m_farmasi_barang',
  `qty_rq` int(11) DEFAULT 0 COMMENT 'entry:qty reguest/permintaan',
  `qty_ff` int(11) DEFAULT 0 COMMENT 'entry:qty fullfil/terpenuhi',
  `stok_saat_ini` smallint(6) DEFAULT NULL COMMENT 'stok saat ini di seluruh lokasi',
  `stokmin` smallint(4) DEFAULT NULL,
  `stokmax` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `satuan_kode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'otomatis:m_farmasi_barang',
  `harga_hna` double DEFAULT NULL COMMENT 'entry:m_farmasi_barang',
  `disc` float DEFAULT NULL COMMENT 'entry',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `t_farmasi_preorder` */

DROP TABLE IF EXISTS `t_farmasi_preorder`;

CREATE TABLE `t_farmasi_preorder` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `preorder_id` int(11) DEFAULT NULL COMMENT 'entry:m_farmasi_preorder',
  `barang_id` int(11) DEFAULT NULL COMMENT 'entry:m_farmasi_barang',
  `qty_rq` int(11) DEFAULT NULL COMMENT 'entry:qty reguest/permintaan',
  `qty_ff` int(11) DEFAULT 0 COMMENT 'entry:qty fullfil/terpenuhi',
  `stok_saat_ini` int(11) DEFAULT NULL COMMENT 'stok subunit pengusul saat ini',
  `stokmin` int(11) DEFAULT NULL,
  `stokmax` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `t_farmasi_receiving_mutasi` */

DROP TABLE IF EXISTS `t_farmasi_receiving_mutasi`;

CREATE TABLE `t_farmasi_receiving_mutasi` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `receiving_mutasi_id` bigint(20) NOT NULL COMMENT 'entry:m_farmasi_receiving_preorder',
  `barang_id` bigint(20) NOT NULL COMMENT 'entry:m_farmasi_barang',
  `satuan_id` smallint(6) NOT NULL COMMENT 'm_farmasi',
  `qty_ff` int(11) NOT NULL COMMENT 'qty dipenuhi;update ke preorder, update stok di subunit2',
  `mutasi_id` bigint(20) NOT NULL COMMENT 'preorder_id mana yang dipenuhi dari receiving order ini',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `t_farmasi_receiving_preorder` */

DROP TABLE IF EXISTS `t_farmasi_receiving_preorder`;

CREATE TABLE `t_farmasi_receiving_preorder` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `receiving_preorder_id` bigint(20) NOT NULL COMMENT 'entry:m_farmasi_receiving_preorder',
  `barang_id` bigint(20) NOT NULL COMMENT 'entry:m_farmasi_barang',
  `satuan_id` smallint(6) NOT NULL COMMENT 'm_farmasi',
  `qty_ff` int(11) NOT NULL COMMENT 'qty dipenuhi;update ke preorder, update stok di subunit2',
  `preorder_id` bigint(20) NOT NULL COMMENT 'preorder_id mana yang dipenuhi dari receiving order ini',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `t_farmasi_receiving_retur_d` */

DROP TABLE IF EXISTS `t_farmasi_receiving_retur_d`;

CREATE TABLE `t_farmasi_receiving_retur_d` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `receivingreturd_id` bigint(20) NOT NULL COMMENT 'entry:m_farmasi_receiving_retur_d',
  `barang_id` bigint(20) NOT NULL COMMENT 'entry:m_farmasi_barang',
  `satuan_id` smallint(6) NOT NULL COMMENT 'm_farmasi',
  `qty_ff` int(11) NOT NULL COMMENT 'qty dipenuhi;update ke preorder, update stok di subunit2',
  `harga_hna` double NOT NULL COMMENT 'm_farmasi',
  `no_batch` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `ed` date DEFAULT NULL COMMENT 'entry',
  `returd_id` bigint(20) NOT NULL COMMENT 'retur_d_id mana yang dipenuhi dari receipt ini',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `t_farmasi_resep` */

DROP TABLE IF EXISTS `t_farmasi_resep`;

CREATE TABLE `t_farmasi_resep` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `mresep_id` bigint(20) NOT NULL COMMENT 'entry:m_farmasi_resep',
  `no_urut` int(4) DEFAULT NULL,
  `barang_id` int(11) DEFAULT NULL COMMENT 'entry:m_farmasi_barang',
  `satuan_id` int(11) DEFAULT NULL COMMENT 'm_ref 283',
  `qty_a` smallint(6) DEFAULT NULL COMMENT 'entry:qty request',
  `qty_b` smallint(6) DEFAULT NULL COMMENT 'entry:qty terpenuhi',
  `signa_id` int(11) DEFAULT NULL COMMENT 'm_ref 299',
  `aturan_pakai_id` int(11) DEFAULT NULL COMMENT 'm_ref 300',
  `aturan_dosis_id` int(11) DEFAULT NULL COMMENT 'm_ref 406',
  `aturan_makan_id` int(11) DEFAULT NULL COMMENT 'm_ref 407',
  `aturan_habis_id` int(11) DEFAULT NULL COMMENT 'm_ref 408',
  `aturan_keterangan_id` int(11) DEFAULT NULL COMMENT 'm_ref 409',
  `harga_hna` float DEFAULT NULL COMMENT 'entry:m_farmasi_barang',
  `harga_jual` float DEFAULT NULL COMMENT 'hna + perhitungan',
  `status_resep_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry; m_ref group_id 298',
  `racik_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref 301, m_farmasi_racik',
  `is_pt` tinyint(4) DEFAULT NULL COMMENT 'm_farmasi_barang;obat ini protokol terapi apa tidak',
  `is_kronis` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `subunit_farmasi_id` int(11) DEFAULT NULL COMMENT 'entry:m_subunit_medik unit_id 4 & 5',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `t_farmasi_retur_d` */

DROP TABLE IF EXISTS `t_farmasi_retur_d`;

CREATE TABLE `t_farmasi_retur_d` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `retur_id` bigint(20) DEFAULT NULL COMMENT 'entry:m_farmasi_retur_d',
  `barang_id` bigint(20) DEFAULT NULL COMMENT 'entry:m_farmasi_barang',
  `qty` int(11) DEFAULT NULL COMMENT 'jumlah retur, entry',
  `qty_ff` int(11) DEFAULT 0,
  `harga_hna` double DEFAULT NULL COMMENT 'entry:otomatis harga hpp dari m_farmasi_barang',
  `satuan_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alasan_kode` tinyint(4) DEFAULT NULL COMMENT 'entry:m_farmasi; 1. Barang Rusak; 2. Barang Expired Dated; dll',
  `batchno` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `t_farmasi_retur_g` */

DROP TABLE IF EXISTS `t_farmasi_retur_g`;

CREATE TABLE `t_farmasi_retur_g` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `retur_id` bigint(20) NOT NULL COMMENT 'entry:m_farmasi_retur_g',
  `barang_id` int(11) NOT NULL COMMENT 'entry:m_farmasi_barang',
  `qty` int(11) NOT NULL COMMENT 'qty dipenuhi;update ke preorder, update stok di subunit2',
  `harga_hna` double NOT NULL COMMENT 'entry:otomatis harga hpp dari m_farmasi_barang',
  `satuan_kode` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'm_ref',
  `batchno` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `alasan_kode` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'm_ref 411',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `t_farmasi_ro` */

DROP TABLE IF EXISTS `t_farmasi_ro`;

CREATE TABLE `t_farmasi_ro` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ro_id` bigint(20) NOT NULL COMMENT 'entry:m_farmasi_ro',
  `barang_id` bigint(20) NOT NULL COMMENT 'entry:m_farmasi_barang',
  `satuan_id` smallint(6) NOT NULL COMMENT 'm_farmasi',
  `qty_ff` int(11) NOT NULL COMMENT 'qty dipenuhi;update ke preorder, update stok di subunit2',
  `harga_hna` double NOT NULL COMMENT 'm_farmasi',
  `no_batch` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `ed` date DEFAULT NULL COMMENT 'entry',
  `po_id` bigint(20) NOT NULL COMMENT 'po_id mana yang dipenuhi dari ro ini',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `t_farmasi_telaah` */

DROP TABLE IF EXISTS `t_farmasi_telaah`;

CREATE TABLE `t_farmasi_telaah` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `mresep_id` bigint(20) NOT NULL COMMENT 'entry:m_farmasi_resep',
  `nama_group` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'm_ref_group 302/302',
  `kode_t` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'm_ref 302/303',
  `nilai_t` tinyint(6) NOT NULL COMMENT 'entry:m_yesno',
  `note_t` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `t_inform_consent` */

DROP TABLE IF EXISTS `t_inform_consent`;

CREATE TABLE `t_inform_consent` (
  `id` bigint(20) NOT NULL,
  `nomor_registrasi` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 't_layanan',
  `note` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `regencies_province_id_index` (`nomor_registrasi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `t_jadwal_layanan_ubah` */

DROP TABLE IF EXISTS `t_jadwal_layanan_ubah`;

CREATE TABLE `t_jadwal_layanan_ubah` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `jadwal_id_old` int(11) unsigned DEFAULT NULL,
  `hari_id` int(11) unsigned DEFAULT NULL COMMENT 'entry:m_hari',
  `dokter_id` bigint(20) unsigned DEFAULT NULL COMMENT 'entry:m_pegawai',
  `subunit_id` int(11) unsigned DEFAULT NULL COMMENT 'entry:m_subunit_medik',
  `kamar_id` int(11) DEFAULT NULL,
  `status_jadwal` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:m_jadwal_sattus',
  `keterangan_jadwal` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `status_id` tinyint(4) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `t_jadwal_ugd_tukar` */

DROP TABLE IF EXISTS `t_jadwal_ugd_tukar`;

CREATE TABLE `t_jadwal_ugd_tukar` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `jadwal_utama_id` int(11) DEFAULT NULL COMMENT 'jadwal utama',
  `jadwal_tukar_id` int(11) DEFAULT NULL COMMENT 'jadwal tukar',
  `version_id` int(11) DEFAULT NULL COMMENT 'entry:m_jadwal_version',
  `hari_id` int(11) unsigned DEFAULT NULL COMMENT 'entry:m_hari',
  `dokter_id` bigint(20) unsigned DEFAULT NULL COMMENT 'entry:m_pegawai',
  `shift_kode` tinyint(2) DEFAULT NULL,
  `status_jadwal` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:m_jadwal_sattus',
  `status_id` tinyint(4) DEFAULT NULL,
  `tanggal_tukar` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `t_lab_hasil` */

DROP TABLE IF EXISTS `t_lab_hasil`;

CREATE TABLE `t_lab_hasil` (
  `noid` int(11) NOT NULL AUTO_INCREMENT,
  `ID` char(30) NOT NULL,
  `ONO` char(20) NOT NULL,
  `SEQNO` char(6) NOT NULL,
  `TEST_CD` char(20) NOT NULL,
  `TEST_NM` varchar(30) NOT NULL,
  `DATA_TYP` varchar(2) NOT NULL,
  `RESULT_VALUE` varchar(40) NOT NULL,
  `RESULT_FT` text NOT NULL,
  `UNIT` varchar(15) NOT NULL,
  `FLAG` varchar(2) NOT NULL,
  `REF_RANGE` varchar(30) NOT NULL,
  `STATUS` varchar(1) NOT NULL,
  `TEST_COMMENT` text NOT NULL,
  `VALIDATE_BY` varchar(60) NOT NULL,
  `VALIDATE_ON` varchar(14) NOT NULL,
  `DISP_SEQ` varchar(15) NOT NULL,
  `ORDER_TESTID` varchar(6) NOT NULL,
  `ORDER_TESTNM` varchar(30) NOT NULL,
  `TEST_GROUP` varchar(20) NOT NULL,
  `ITEM_PARENT` varchar(6) NOT NULL,
  `IMAGE` blob DEFAULT NULL,
  `notifikasi` tinyint(1) NOT NULL,
  `METODE` varchar(100) DEFAULT NULL,
  `WARNA_TEST` varchar(100) DEFAULT NULL,
  `WARNA_HASIL` varchar(100) DEFAULT NULL,
  `FLAG_ANZ` varchar(2) DEFAULT NULL,
  `FLAG_EDIT` varchar(2) DEFAULT NULL,
  `LNO` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`noid`) USING BTREE,
  KEY `ID` (`ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2539750 DEFAULT CHARSET=latin1;

/*Table structure for table `t_layanan` */

DROP TABLE IF EXISTS `t_layanan`;

CREATE TABLE `t_layanan` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `pasien_id` bigint(20) NOT NULL COMMENT 'm_pasien',
  `no_rm` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'm_pasien',
  `nomor_registrasi` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'saat registrasi/otomatis',
  `nomor_antrian` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'saat registrasi/otomatis',
  `tanggal_masuk` datetime NOT NULL COMMENT 'tgl periksa',
  `tanggal_keluar` datetime DEFAULT NULL COMMENT 'tgl keluar utk rawat jalan = tgl masuk',
  `is_pasien_baru` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `is_kontrol` tinyint(6) DEFAULT NULL COMMENT 'm_yesno',
  `waktu_awal` time DEFAULT NULL COMMENT 'm_jadwal_layanan',
  `waktu_akhir` time DEFAULT NULL COMMENT 'm_jadwal_layanan',
  `subunit_id` tinyint(4) DEFAULT NULL COMMENT 'm_subunit_medik;',
  `dokter_id` int(11) DEFAULT NULL COMMENT 'm_pegawai',
  `ners_id` int(11) DEFAULT NULL COMMENT 'm_pegawai;ners pendamping dokter',
  `penjamin_id` tinyint(4) DEFAULT NULL COMMENT 'jon:sementara biar gak error rajal nya',
  `jenis_kedatangan` tinyint(2) DEFAULT NULL COMMENT 'jenis kedatangan pasien, m_ref group_id 413',
  `faskes_id` int(11) DEFAULT NULL COMMENT 'm_faskes',
  `is_rujukan` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `nomor_rujukan` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'dientry diadmisi BPJS',
  `tanggal_rujukan` date DEFAULT NULL COMMENT 'dientry diadmisi bpjs',
  `nama_dokter_perujuk` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'dientry diadmisi BPJS',
  `nama_smf_perujuk` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `diagnosa_rujukan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icd_rujukan_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_icd',
  `mulai_berlaku_rujukan` date DEFAULT NULL COMMENT 'dientry diadmisi BPJS',
  `akhir_berlaku_rujukan` date DEFAULT NULL,
  `is_cito` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `is_resikojatuh` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `tujuan_kunjungan_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref dengan group_id=314',
  `datang_rs` datetime DEFAULT NULL COMMENT 'saat pasien check in di rs',
  `mulai_admisi` datetime DEFAULT NULL COMMENT 'dientry admisi bpjs/iks, saat pasien mulai dilayanan diadmisi',
  `akhir_admisi` datetime DEFAULT NULL COMMENT 'dientry admisi bpjs/iks, saat selesai diadmisi',
  `mulai_layan_poli` datetime DEFAULT NULL COMMENT 'dientry perawat poli, saat px mulai dilayanan poli',
  `akhir_layan_poli` datetime DEFAULT NULL COMMENT 'dientry perawat poli, saat px selesai layanan poli',
  `mulai_buat_obat` datetime DEFAULT NULL COMMENT 'dientry farmasi saat selesai Nota farmasi',
  `akhir_selesai_obat` datetime DEFAULT NULL COMMENT 'dientry farmasi saat px ambil obat',
  `akhir_kasir` datetime DEFAULT NULL COMMENT 'dientry kasir saat selesai dikasir',
  `akhir_ambil_obat` datetime DEFAULT NULL COMMENT 'dientry farmasi saat pasien ambil obat',
  `status_antrian` smallint(6) DEFAULT NULL COMMENT 'm_status_antrean_rajal:id',
  `status_antrian_ugd` smallint(6) DEFAULT 1 COMMENT 'm_ref 423',
  `nationality_code1` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'kode nasionality 3 digit',
  `is_tarif_lokal` tinyint(4) DEFAULT NULL COMMENT '0=wna;1=lokal;2=kitas;',
  `status_kronis` tinyint(4) DEFAULT NULL COMMENT 'm_yesno; Ya/Tidak, diisi dokter poli',
  `status_transaksi` int(11) DEFAULT 0 COMMENT 'm_ref group_id = 334;0=Open,1=Closed,2=Pending',
  `kelas_id` int(11) DEFAULT NULL,
  `nomor_kamar` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'untuk rawat inap,nomor ruangan terakhir',
  `nomor_kamar_titip` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nomor_bed` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `registered_by` int(11) DEFAULT NULL COMMENT 'khusus regon, user id pendaftar',
  `nomor_sep` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'dientry diadmisi BPJS',
  `nomor_bpjs` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_cob` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `is_katarak` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `is_kecelakaan` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `jenis_kecelakaan_id` int(5) DEFAULT NULL COMMENT 'm_ref_group 403',
  `keterangan_kecelakaan` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal_kecelakaan` date DEFAULT NULL,
  `asuransi_id` int(11) DEFAULT NULL COMMENT 'm_iks dengan tipe m_iks_tipe=asuransi',
  `is_suplesi_kecelakaan` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `nomor_suplesi_kecelakaan` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provinsi_kecelakaan_id` int(11) DEFAULT NULL COMMENT 'm_provinsi',
  `kabupaten_kecelakaan_id` int(11) DEFAULT NULL COMMENT 'm_kabupaten',
  `kecamatan_kecelakaan_id` int(11) DEFAULT NULL COMMENT 'm_kecamatan',
  `instalasi_id` int(11) DEFAULT NULL COMMENT 'm_instalasi_medik',
  `unit_id` int(11) DEFAULT NULL COMMENT 'm_unit_medik',
  `kanal_id` tinyint(4) DEFAULT 1 COMMENT 'm_ref group_id = 335;1=Admisi,2=Online Web',
  `dpjp_id` int(11) DEFAULT NULL COMMENT 'm_pegawai katagori dokter',
  `alamat_ditemukan` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tgl_ditemukan` date DEFAULT NULL,
  `tanggal_rujukan_awal` date DEFAULT NULL COMMENT 'jon',
  `tanggal_rujukan_akhir` date DEFAULT NULL COMMENT 'jon',
  `status_pinlan` tinyint(4) DEFAULT 0 COMMENT 'm_yesno; status perpindahan dari rawat jalan ke rawat inap',
  `dokter_dpjp_id` int(11) DEFAULT NULL COMMENT 'isi jika dokter internal balimed',
  `dokter_dpjp` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `t_layanan_backup` */

DROP TABLE IF EXISTS `t_layanan_backup`;

CREATE TABLE `t_layanan_backup` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `pasien_id` bigint(20) NOT NULL COMMENT 'm_pasien',
  `no_rm` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'm_pasien',
  `nomor_registrasi` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'saat registrasi/otomatis',
  `nomor_antrian` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'saat registrasi/otomatis',
  `tanggal_masuk` datetime NOT NULL COMMENT 'tgl periksa',
  `tanggal_keluar` datetime DEFAULT NULL COMMENT 'tgl keluar utk rawat jalan = tgl masuk',
  `is_pasien_baru` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `is_kontrol` tinyint(6) DEFAULT NULL COMMENT 'm_yesno',
  `waktu_awal` time DEFAULT NULL COMMENT 'm_jadwal_layanan',
  `waktu_akhir` time DEFAULT NULL COMMENT 'm_jadwal_layanan',
  `subunit_id` tinyint(4) DEFAULT NULL COMMENT 'm_subunit_medik;',
  `dokter_id` int(11) DEFAULT NULL COMMENT 'm_pegawai',
  `ners_id` int(11) DEFAULT NULL COMMENT 'm_pegawai;ners pendamping dokter',
  `penjamin_id` tinyint(4) DEFAULT NULL COMMENT 'jon:sementara biar gak error rajal nya',
  `jenis_kedatangan` tinyint(2) DEFAULT NULL COMMENT 'jenis kedatangan pasien, m_ref group_id 413',
  `faskes_id` int(11) DEFAULT NULL COMMENT 'm_faskes',
  `is_rujukan` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `nomor_rujukan` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'dientry diadmisi BPJS',
  `tanggal_rujukan` date DEFAULT NULL COMMENT 'dientry diadmisi bpjs',
  `nama_dokter_perujuk` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'dientry diadmisi BPJS',
  `nama_smf_perujuk` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `diagnosa_rujukan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icd_rujukan_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_icd',
  `mulai_berlaku_rujukan` date DEFAULT NULL COMMENT 'dientry diadmisi BPJS',
  `akhir_berlaku_rujukan` date DEFAULT NULL,
  `is_cito` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `is_resikojatuh` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `tujuan_kunjungan_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref dengan group_id=314',
  `datang_rs` datetime DEFAULT NULL COMMENT 'saat pasien check in di rs',
  `mulai_admisi` datetime DEFAULT NULL COMMENT 'dientry admisi bpjs/iks, saat pasien mulai dilayanan diadmisi',
  `akhir_admisi` datetime DEFAULT NULL COMMENT 'dientry admisi bpjs/iks, saat selesai diadmisi',
  `mulai_layan_poli` datetime DEFAULT NULL COMMENT 'dientry perawat poli, saat px mulai dilayanan poli',
  `akhir_layan_poli` datetime DEFAULT NULL COMMENT 'dientry perawat poli, saat px selesai layanan poli',
  `mulai_buat_obat` datetime DEFAULT NULL COMMENT 'dientry farmasi saat selesai Nota farmasi',
  `akhir_selesai_obat` datetime DEFAULT NULL COMMENT 'dientry farmasi saat px ambil obat',
  `akhir_kasir` datetime DEFAULT NULL COMMENT 'dientry kasir saat selesai dikasir',
  `akhir_ambil_obat` datetime DEFAULT NULL COMMENT 'dientry farmasi saat pasien ambil obat',
  `status_antrian` smallint(6) DEFAULT NULL COMMENT 'm_status_antrean_rajal:id',
  `nationality_code1` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'kode nasionality 3 digit',
  `is_tarif_lokal` tinyint(4) DEFAULT NULL COMMENT '0=wna;1=lokal;2=kitas;',
  `status_kronis` tinyint(4) DEFAULT NULL COMMENT 'm_yesno; Ya/Tidak, diisi dokter poli',
  `status_transaksi` int(11) DEFAULT 0 COMMENT 'm_ref group_id = 334;0=Open,1=Closed,2=Pending',
  `kelas_id` int(11) DEFAULT NULL,
  `nomor_kamar` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'untuk rawat inap,nomor ruangan terakhir',
  `nomor_kamar_titip` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nomor_bed` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `registered_by` int(11) DEFAULT NULL COMMENT 'khusus regon, user id pendaftar',
  `nomor_sep` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'dientry diadmisi BPJS',
  `nomor_bpjs` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_cob` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `is_katarak` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `is_kecelakaan` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `jenis_kecelakaan_id` int(5) DEFAULT NULL COMMENT 'm_ref_group 403',
  `keterangan_kecelakaan` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal_kecelakaan` date DEFAULT NULL,
  `asuransi_id` int(11) DEFAULT NULL COMMENT 'm_iks dengan tipe m_iks_tipe=asuransi',
  `is_suplesi_kecelakaan` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `nomor_suplesi_kecelakaan` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provinsi_kecelakaan_id` int(11) DEFAULT NULL COMMENT 'm_provinsi',
  `kabupaten_kecelakaan_id` int(11) DEFAULT NULL COMMENT 'm_kabupaten',
  `kecamatan_kecelakaan_id` int(11) DEFAULT NULL COMMENT 'm_kecamatan',
  `instalasi_id` int(11) DEFAULT NULL COMMENT 'm_instalasi_medik',
  `unit_id` int(11) DEFAULT NULL COMMENT 'm_unit_medik',
  `kanal_id` tinyint(4) DEFAULT 1 COMMENT 'm_ref group_id = 335;1=Admisi,2=Online Web',
  `dpjp_id` int(11) DEFAULT NULL COMMENT 'm_pegawai katagori dokter',
  `alamat_ditemukan` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tgl_ditemukan` date DEFAULT NULL,
  `tanggal_rujukan_awal` date DEFAULT NULL COMMENT 'jon',
  `tanggal_rujukan_akhir` date DEFAULT NULL COMMENT 'jon',
  `status_pinlan` tinyint(4) DEFAULT 0 COMMENT 'm_yesno; status perpindahan dari rawat jalan ke rawat inap',
  `dokter_dpjp_id` int(11) DEFAULT NULL COMMENT 'isi jika dokter internal balimed',
  `dokter_dpjp` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `t_layanan_diagnosis_sekunder` */

DROP TABLE IF EXISTS `t_layanan_diagnosis_sekunder`;

CREATE TABLE `t_layanan_diagnosis_sekunder` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `no_rm` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_pasien',
  `layanan_id` bigint(20) DEFAULT NULL COMMENT 't_layanan',
  `rmd_id` bigint(20) DEFAULT NULL COMMENT 't_layanan_rajal_rmd',
  `ugd_rmd_id` bigint(20) DEFAULT NULL COMMENT 't_layanan_ugd_rmd',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `diagnosa_skunder` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `icd10_skunder_kode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_icd',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=218 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `t_layanan_dokumen` */

DROP TABLE IF EXISTS `t_layanan_dokumen`;

CREATE TABLE `t_layanan_dokumen` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `layanan_id` int(11) DEFAULT NULL,
  `dokumen_id` int(11) DEFAULT NULL,
  `nomor_registrasi` varchar(20) DEFAULT NULL,
  `no_rm` varchar(20) DEFAULT NULL,
  `waktu_ttd` datetime DEFAULT NULL,
  `status_ttd` tinyint(1) DEFAULT 0 COMMENT 'm_yesno; sudah ttd atau belum',
  `passcode` varchar(255) DEFAULT NULL,
  `file_ttd` varchar(255) DEFAULT NULL,
  `waktu_ttd_2` datetime DEFAULT NULL,
  `passcode_2` varchar(255) DEFAULT NULL COMMENT 'jika ada field ttd tambahan (diluar pasien dan petugas)',
  `file_ttd_2` varchar(255) DEFAULT NULL COMMENT 'jika ada field ttd tambahan (diluar pasien dan petugas)',
  `detail` longtext DEFAULT NULL COMMENT 'json untuk isian dokumen',
  `is_setuju` tinyint(1) DEFAULT 1 COMMENT 'setuju atau tolak',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `waktu_ttd_petugas` datetime DEFAULT NULL,
  `ttd_petugas` varchar(255) DEFAULT NULL,
  `passcode_petugas` varchar(255) DEFAULT NULL,
  `ttd_dokter` varchar(255) DEFAULT NULL,
  `passcode_dokter` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

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

/*Table structure for table `t_layanan_penandaan` */

DROP TABLE IF EXISTS `t_layanan_penandaan`;

CREATE TABLE `t_layanan_penandaan` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `no_rm` varchar(20) DEFAULT NULL,
  `layanan_id` bigint(20) DEFAULT NULL COMMENT 't_layanan',
  `rmd_id` bigint(20) DEFAULT NULL COMMENT 't_layanan_rajal_rmd',
  `template_id` bigint(20) DEFAULT NULL COMMENT 'm_template_penandaan',
  `no` tinyint(4) DEFAULT 1,
  `desc` varchar(255) DEFAULT NULL,
  `x` float DEFAULT NULL COMMENT 'from left',
  `y` float DEFAULT NULL COMMENT 'from top',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) DEFAULT NULL,
  `updated_by` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=latin1;

/*Table structure for table `t_layanan_penanggungjawab` */

DROP TABLE IF EXISTS `t_layanan_penanggungjawab`;

CREATE TABLE `t_layanan_penanggungjawab` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `layanan_id` bigint(20) NOT NULL,
  `hubunganpasien_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'hubungan dengan pasien',
  `nama_lengkap` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'nama tanpa gelar',
  `jenis_kelamin` int(11) DEFAULT NULL,
  `pendidikan_id` int(11) DEFAULT NULL,
  `pekerjaan_id` int(11) DEFAULT NULL,
  `alamat_domisili` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kartu_id` int(11) DEFAULT NULL,
  `nomor_kartu` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamat_kartu` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rt` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rw` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provinsi_id` int(11) DEFAULT NULL,
  `kabupaten_id` int(11) DEFAULT NULL,
  `kecamatan_id` int(11) DEFAULT NULL,
  `desa_id` int(11) DEFAULT NULL,
  `dusun` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kontak_id` int(11) DEFAULT NULL,
  `nomor_kontak` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `t_layanan_pengantar` */

DROP TABLE IF EXISTS `t_layanan_pengantar`;

CREATE TABLE `t_layanan_pengantar` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `layanan_id` bigint(20) NOT NULL,
  `hubunganpasien_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'hubungan dengan pasien',
  `nama_lengkap` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'nama tanpa gelar',
  `jenis_kelamin` int(11) DEFAULT NULL,
  `pendidikan_id` int(11) DEFAULT NULL,
  `pekerjaan_id` int(11) DEFAULT NULL,
  `alamat_domisili` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kartu_id` int(11) DEFAULT NULL,
  `nomor_kartu` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamat_kartu` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rt` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rw` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provinsi_id` int(11) DEFAULT NULL,
  `kabupaten_id` int(11) DEFAULT NULL,
  `kecamatan_id` int(11) DEFAULT NULL,
  `desa_id` int(11) DEFAULT NULL,
  `dusun` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kontak_id` int(11) DEFAULT NULL,
  `nomor_kontak` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `t_layanan_penjamin` */

DROP TABLE IF EXISTS `t_layanan_penjamin`;

CREATE TABLE `t_layanan_penjamin` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `layanan_id` bigint(20) NOT NULL,
  `penjamin_id` tinyint(4) NOT NULL COMMENT 'm_penjamin; 1=Umum;2=BPJS;3=IKS;4=Karyawan',
  `kode_iks` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'kode_iks, jika penjamin adalah IKS atau karyawan',
  `is_cob_bpjs` tinyint(4) DEFAULT NULL,
  `is_katarak_bpjs` tinyint(4) DEFAULT NULL,
  `nomor_kartu_bpjs` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nomor_sep_bpjs` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kelas_bpjs` smallint(6) DEFAULT NULL COMMENT 'm_kelas',
  `jenis_peserta_bpjs_id` int(11) DEFAULT NULL COMMENT 'm_ref dengan group_id = 313',
  `naik_kelas_bpjs` smallint(6) DEFAULT NULL COMMENT 'm_kelas',
  `nomor_skdp_bpjs` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prosedur_id` tinyint(2) DEFAULT NULL,
  `penunjang_id` tinyint(2) DEFAULT NULL,
  `assesment_id` tinyint(2) DEFAULT NULL,
  `keterangan_bpjs` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

/*Table structure for table `t_layanan_rajal_rmd` */

DROP TABLE IF EXISTS `t_layanan_rajal_rmd`;

CREATE TABLE `t_layanan_rajal_rmd` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `no_rm` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_pasien',
  `layanan_id` bigint(20) DEFAULT NULL COMMENT 't_layanan',
  `nomor_registrasi` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `keluhan_utama` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `penyakit_sekarang` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `riwayat_pengobatan` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `riwayat_penyakit_keluarga` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `alergi_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `alergi_obat_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `alergi_makanan_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `alergi_udara_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `alergi_debu_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `alergi_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `hipertensi_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `diabetes_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `jantung_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `stroke_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `ginjal_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `asma_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `kejang_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `liver_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `cancer_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `tbc_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `glukoma_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `std_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `pendarahan_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `lainnya_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `riwayat_penyakit_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `operasi_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `operasi_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `tranfusi_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `reaksi_transfusi_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `reaksi_transfusi_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `diagnosa_primer` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `icd10_primer_kode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_icd',
  `diagnosa_banding` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `icd10_banding_kode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:m_icd',
  `pemeriksaan_penunjang` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `rencana_asuhan` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `rekomendasi_dokter` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `disposisi_id` tinyint(1) DEFAULT NULL COMMENT '1=pulang, 2=kontrol, 3=rawat, 4=rujuk',
  `pulang_id` tinyint(4) DEFAULT NULL COMMENT 'tidak dipakai, m_yesno',
  `pulang_datetime` datetime DEFAULT NULL COMMENT 'entry',
  `kontrol_id` tinyint(4) DEFAULT NULL COMMENT 'tidak dipakai, m_yesno',
  `kontrol_kronis_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `kontrol_datetime` datetime DEFAULT NULL COMMENT 'entry',
  `rawat_id` tinyint(4) DEFAULT NULL COMMENT 'tidak dipakai, m_yesno',
  `rawat_subunit_id` int(11) DEFAULT NULL COMMENT 'm_subunit_medik',
  `rawat_ruangan` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry;m_subunit_medik',
  `rujuk_id` tinyint(4) DEFAULT NULL COMMENT 'tidak dipakai, m_yesno',
  `alergi_lainnya_id` tinyint(4) DEFAULT NULL,
  `fu_td_sistole` int(11) DEFAULT NULL COMMENT 'entry',
  `fu_td_diastole` int(11) DEFAULT NULL COMMENT 'entry',
  `fu_rr` int(11) DEFAULT NULL COMMENT 'entry',
  `fu_nadi` int(11) DEFAULT NULL COMMENT 'entry',
  `fu_suhu` float DEFAULT NULL COMMENT 'entry',
  `fu_keadaan_umum_id` tinyint(4) DEFAULT NULL COMMENT 'm_ref group_id=337',
  `fu_gizi_id` tinyint(4) DEFAULT NULL COMMENT 'm_ref group_id=338',
  `fu_gcs_e` smallint(6) DEFAULT NULL COMMENT 'entry',
  `fu_gcs_v` smallint(6) DEFAULT NULL COMMENT 'entry',
  `fu_gcs_m` smallint(6) DEFAULT NULL COMMENT 'entry',
  `fu_kepala_normal` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_kepala_mikro` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_kepala_makro` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_kepala_lainnya` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_kepala_ket` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `fu_mata_a` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_mata_i` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_mata_r` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_mata_o` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_mata_ket` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `fu_tht_te` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_tht_hi` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_tht_fa` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_tht_to` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_tht_ket` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `fu_gigi_no` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_gigi_lu` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_gigi_bd` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_gigi_gp` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_gigi_ket` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `fu_leher_k` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_leher_j` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_leher_l` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_leher_p` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_leher_ket` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `fu_thorax_sim` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_thorax_ket` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `fu_cor_s1s2` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `fu_cor_reg` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_pulmo_s` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_pulmo_r` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_pulmo_w` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_pulmo_l` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_pulmo_ket` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `fu_abdomen_dis` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_abdomen_dis_pm` tinyint(4) DEFAULT NULL COMMENT 'm_yesno;pilih plus (+) atau minus (-);pakai optionbox',
  `fu_abdomen_met` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_abdomen_met_pm` tinyint(4) DEFAULT NULL COMMENT 'm_yesno;pilih plus (+) atau minus (-);pakai optionbox',
  `fu_abdomen_per` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_abdomen_nmm` tinyint(4) DEFAULT NULL COMMENT 'm_ref group_id=344',
  `fu_abdomen_asc` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_abdomen_asc_pm` tinyint(4) DEFAULT NULL COMMENT 'm_yesno;pilih plus (+) atau minus (-);pakai optionbox',
  `fu_abdomen_nyeri` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_abdomen_nyeri_pm` tinyint(4) DEFAULT NULL COMMENT 'm_yesno;pilih plus (+) atau minus (-);pakai optionbox',
  `fu_abdomen_lokasi` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `fu_abdomen_hepar` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `fu_abdomen_lien` tinyint(100) DEFAULT NULL COMMENT 'm_yesno',
  `fu_abdomen_lien_ket` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `fu_extrim_h` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_extrim_o` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_extrim_r` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_extrim_l` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_extrim_ket` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `fu_des` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'json data pemeriksaan fisik masing2 poli',
  `kontrol_subunit` int(10) DEFAULT NULL COMMENT 'm_subunit_medik',
  `kontrol_dokter_id` int(10) DEFAULT NULL COMMENT 'm_pegawai',
  `kontrol_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pulang_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_ttd_dokter` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `t_layanan_rajal_rmp` */

DROP TABLE IF EXISTS `t_layanan_rajal_rmp`;

CREATE TABLE `t_layanan_rajal_rmp` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `no_rm` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_pasien',
  `nomor_registrasi` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `layanan_id` bigint(20) DEFAULT NULL COMMENT 't_layanan',
  `td_s` int(4) DEFAULT NULL COMMENT 'entry',
  `td_d` int(4) DEFAULT NULL,
  `rr` float DEFAULT NULL COMMENT 'entry',
  `nadi` float DEFAULT NULL COMMENT 'entry',
  `suhu` float DEFAULT NULL COMMENT 'entry',
  `bb` float DEFAULT NULL COMMENT 'entry',
  `tb` float DEFAULT NULL COMMENT 'entry',
  `nyeri_is` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `nyeri_kode` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=323;',
  `nyeri_lokasi_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `nyeri_onset_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `nyeri_pencetus_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `nyeri_kualitas_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=324',
  `nyeri_kualitas_lainnya` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `nyeri_menjalar_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=325',
  `nyeri_menjalar_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `nyeri_tingkatan_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=326',
  `nyeri_waktu_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=327',
  `nyeri_waktu_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `nyeri_skoring_kode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=328',
  `nyeri_skoring_skor_1` smallint(6) DEFAULT NULL COMMENT 'entry',
  `nyeri_skoring_skor_2` smallint(6) DEFAULT NULL,
  `nyeri_skoring_skor_3` smallint(6) DEFAULT NULL,
  `sumber_data_kode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=329',
  `sumber_data_lainnya` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keluhan_utama_p` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `psi_status_nikah_id` tinyint(4) DEFAULT NULL COMMENT 'm_statusnikah',
  `psi_punya_anak_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `psi_jumlah_anak` tinyint(4) DEFAULT NULL COMMENT 'entry',
  `psi_pendidikan_id` tinyint(4) DEFAULT NULL COMMENT 'm_pasien',
  `psi_pendidikan_lainnya` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `psi_warganegara_id` tinyint(4) DEFAULT NULL COMMENT 'm_pasien',
  `psi_pekerjaan_id` tinyint(4) DEFAULT NULL COMMENT 'm_pasien',
  `psi_tinggal_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=330',
  `psi_tinggal_lainnya` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `psi_tinggal_nama` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `psi_tinggal_telp` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `psi_kebiasaan_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=331',
  `psi_kebiasaan_des` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `psi_kebiasaan_lainnya` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `psi_agama_id` tinyint(4) DEFAULT NULL COMMENT 'm_pasien',
  `psi_berbicara_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `psi_berbicara_des` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `psi_bahasa` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `psi_penerjemah_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `psi_penerjemah_des` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `bicara_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=332',
  `bicara_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `hb_bahasa_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `hb_pendengaran_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `hb_memori_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `hb_motivasi_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `hb_penglihatan_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `hb_tidakada_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `hb_cemas_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `hb_emosi_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `hb_kognitif_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `hb_bicara_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `hb_partisipasi_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `hb_fisiologi_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `kajian_budaya_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `kajian_budaya_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `edukasi_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `potensial_proses_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `potensial_pengobatan_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `potensial_terapi_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `potensial_edukasi_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `nutrisi_diet_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `nutrisi_bb_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `nutrisi_bb_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `cb_menulis_id` tinyint(4) DEFAULT NULL COMMENT 'cara belajar disukai yesno',
  `cb_audio_id` tinyint(4) DEFAULT NULL,
  `cb_diskusi_id` tinyint(4) DEFAULT NULL,
  `cb_membaca_id` tinyint(4) DEFAULT NULL,
  `cb_demo_id` tinyint(4) DEFAULT NULL,
  `mens_siklus_id` tinyint(1) DEFAULT NULL COMMENT 'obstetri, m_yesno',
  `mens_siklus_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'obstetri',
  `mens_menarche_id` tinyint(4) DEFAULT NULL COMMENT 'obstetri',
  `mens_menarche_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'obstetri',
  `mens_akhir_id` tinyint(4) DEFAULT NULL COMMENT 'obstetri',
  `mens_akhir_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'obstetri',
  `mens_haid_id` tinyint(4) DEFAULT NULL COMMENT 'obstetri',
  `mens_haid_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'obstetri',
  `mens_banyak_id` tinyint(4) DEFAULT NULL COMMENT 'obstetri',
  `mens_banyak_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'obstetri',
  `mens_teratur_id` tinyint(4) DEFAULT NULL COMMENT 'obstetri',
  `mens_teratur_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'obstetri',
  `mens_lama_id` tinyint(4) DEFAULT NULL COMMENT 'obstetri',
  `mens_lama_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'obstetri',
  `mens_tgl_persalinan_id` tinyint(4) DEFAULT NULL,
  `mens_tgl_persalinan_des` date DEFAULT NULL COMMENT 'obstetri',
  `kwn_status_id` tinyint(4) DEFAULT NULL COMMENT 'obstetri 1=belum,2=cerai,3=kawin',
  `kwn_status_jumlah` int(4) DEFAULT NULL COMMENT 'obstetri',
  `kwn_pertama_umur` float DEFAULT NULL COMMENT 'obstetri',
  `is_ttd_perawat` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `t_layanan_ranap_rmd` */

DROP TABLE IF EXISTS `t_layanan_ranap_rmd`;

CREATE TABLE `t_layanan_ranap_rmd` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `no_rm` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_pasien',
  `layanan_id` bigint(20) DEFAULT NULL COMMENT 't_layanan',
  `nomor_registrasi` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `keluhan_utama` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `penyakit_sekarang` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `riwayat_pengobatan` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `riwayat_penyakit_keluarga` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `diagnosa_primer` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `icd10_primer_kode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_icd',
  `diagnosa_banding` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `icd10_banding_kode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:m_icd',
  `pemeriksaan_penunjang` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `rencana_asuhan` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `rekomendasi_dokter` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `disposisi_id` tinyint(1) DEFAULT NULL COMMENT '1=pulang, 2=kontrol, 3=rawat, 4=rujuk',
  `pulang_id` tinyint(4) DEFAULT NULL COMMENT 'tidak dipakai, m_yesno',
  `pulang_datetime` datetime DEFAULT NULL COMMENT 'entry',
  `kontrol_id` tinyint(4) DEFAULT NULL COMMENT 'tidak dipakai, m_yesno',
  `kontrol_kronis_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `kontrol_datetime` datetime DEFAULT NULL COMMENT 'entry',
  `rawat_id` tinyint(4) DEFAULT NULL COMMENT 'tidak dipakai, m_yesno',
  `rawat_subunit_id` int(11) DEFAULT NULL COMMENT 'm_subunit_medik',
  `rawat_ruangan` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry;m_subunit_medik',
  `rujuk_id` tinyint(4) DEFAULT NULL COMMENT 'tidak dipakai, m_yesno',
  `alergi_lainnya_id` tinyint(4) DEFAULT NULL,
  `fu_td_sistole` int(11) DEFAULT NULL COMMENT 'entry',
  `fu_td_diastole` int(11) DEFAULT NULL COMMENT 'entry',
  `fu_rr` int(11) DEFAULT NULL COMMENT 'entry',
  `fu_nadi` int(11) DEFAULT NULL COMMENT 'entry',
  `fu_suhu` float DEFAULT NULL COMMENT 'entry',
  `fu_keadaan_umum_id` tinyint(4) DEFAULT NULL COMMENT 'm_ref group_id=337',
  `fu_gizi_id` tinyint(4) DEFAULT NULL COMMENT 'm_ref group_id=338',
  `fu_gcs_e` smallint(6) DEFAULT NULL COMMENT 'entry',
  `fu_gcs_v` smallint(6) DEFAULT NULL COMMENT 'entry',
  `fu_gcs_m` smallint(6) DEFAULT NULL COMMENT 'entry',
  `fu_kepala_normal` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_kepala_mikro` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_kepala_makro` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_kepala_lainnya` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_kepala_ket` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `fu_mata_a` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_mata_i` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_mata_r` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_mata_o` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_mata_ket` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `fu_tht_te` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_tht_hi` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_tht_fa` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_tht_to` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_tht_ket` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `fu_gigi_no` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_gigi_lu` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_gigi_bd` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_gigi_gp` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_gigi_ket` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `fu_leher_k` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_leher_j` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_leher_l` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_leher_p` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_leher_ket` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `fu_thorax_sim` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_thorax_ket` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `fu_cor_s1s2` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `fu_cor_reg` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_pulmo_s` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_pulmo_r` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_pulmo_w` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_pulmo_l` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_pulmo_ket` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `fu_abdomen_dis` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_abdomen_dis_pm` tinyint(4) DEFAULT NULL COMMENT 'm_yesno;pilih plus (+) atau minus (-);pakai optionbox',
  `fu_abdomen_met` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_abdomen_met_pm` tinyint(4) DEFAULT NULL COMMENT 'm_yesno;pilih plus (+) atau minus (-);pakai optionbox',
  `fu_abdomen_per` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_abdomen_nmm` tinyint(4) DEFAULT NULL COMMENT 'm_ref group_id=344',
  `fu_abdomen_asc` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_abdomen_asc_pm` tinyint(4) DEFAULT NULL COMMENT 'm_yesno;pilih plus (+) atau minus (-);pakai optionbox',
  `fu_abdomen_nyeri` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_abdomen_nyeri_pm` tinyint(4) DEFAULT NULL COMMENT 'm_yesno;pilih plus (+) atau minus (-);pakai optionbox',
  `fu_abdomen_lokasi` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `fu_abdomen_hepar` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `fu_abdomen_lien` tinyint(100) DEFAULT NULL COMMENT 'm_yesno',
  `fu_abdomen_lien_ket` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `fu_extrim_h` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_extrim_o` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_extrim_r` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_extrim_l` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_extrim_ket` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `fu_des` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'json data pemeriksaan fisik masing2 poli',
  `kontrol_subunit` int(10) DEFAULT NULL COMMENT 'm_subunit_medik',
  `kontrol_dokter_id` int(10) DEFAULT NULL COMMENT 'm_pegawai',
  `kontrol_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pulang_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keluarga_status_ttd` tinyint(4) DEFAULT NULL,
  `keluarga_passcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keluarga_file_ttd` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `perawat_id` int(11) DEFAULT NULL COMMENT 'pegawai_id',
  `perawat_status_ttd` tinyint(4) DEFAULT NULL,
  `perawat_passcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `perawat_file_ttd` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kepala_id` int(11) DEFAULT NULL COMMENT 'pegawai_id',
  `kepala_status_ttd` tinyint(4) DEFAULT NULL,
  `kepala_passcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kepala_file_ttd` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dpjp_id` int(11) DEFAULT NULL COMMENT 'pegawai_id; jenis profesi 5',
  `dpjp_status_ttd` tinyint(4) DEFAULT NULL,
  `dpjp_passcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dpjp_file_ttd` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `t_layanan_ranap_rmp` */

DROP TABLE IF EXISTS `t_layanan_ranap_rmp`;

CREATE TABLE `t_layanan_ranap_rmp` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `no_rm` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_pasien',
  `nomor_registrasi` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `layanan_id` bigint(20) DEFAULT NULL COMMENT 't_layanan',
  `td_s` int(4) DEFAULT NULL COMMENT 'entry',
  `td_d` int(4) DEFAULT NULL,
  `rr` float DEFAULT NULL COMMENT 'entry',
  `nadi` float DEFAULT NULL COMMENT 'entry',
  `suhu` float DEFAULT NULL COMMENT 'entry',
  `bb_biasa` float DEFAULT NULL COMMENT 'entry',
  `bb_sekrang` float DEFAULT NULL COMMENT 'entry',
  `tb` float DEFAULT NULL COMMENT 'entry',
  `nyeri_is` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `nyeri_kode` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=323;',
  `nyeri_lokasi_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `nyeri_onset_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `nyeri_pencetus_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `nyeri_kualitas_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=324',
  `nyeri_kualitas_lainnya` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `nyeri_menjalar_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=325',
  `nyeri_menjalar_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `nyeri_tingkatan_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=326',
  `nyeri_waktu_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=327',
  `nyeri_waktu_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `nyeri_skoring_kode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=328',
  `nyeri_skoring_skor_1` smallint(6) DEFAULT NULL COMMENT 'entry',
  `nyeri_skoring_skor_2` smallint(6) DEFAULT NULL COMMENT 'entry',
  `nyeri_skoring_skor_3` smallint(6) DEFAULT NULL COMMENT 'entry',
  `sumber_data_kode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=329',
  `sumber_data_lainnya` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keluhan_utama_p` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `psi_status_nikah_id` tinyint(4) DEFAULT NULL COMMENT 'm_statusnikah',
  `psi_punya_anak_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `psi_jumlah_anak` tinyint(4) DEFAULT NULL COMMENT 'entry',
  `psi_pendidikan_id` tinyint(4) DEFAULT NULL COMMENT 'm_pasien',
  `psi_pendidikan_lainnya` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `psi_warganegara_id` tinyint(4) DEFAULT NULL COMMENT 'm_pasien',
  `psi_pekerjaan_id` tinyint(4) DEFAULT NULL COMMENT 'm_pasien',
  `psi_tinggal_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=330',
  `psi_tinggal_lainnya` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `psi_tinggal_nama` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `psi_tinggal_telp` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `psi_kebiasaan_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=331',
  `psi_kebiasaan_des` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `psi_kebiasaan_lainnya` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `psi_agama_id` tinyint(4) DEFAULT NULL COMMENT 'm_pasien',
  `psi_berbicara_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `psi_berbicara_des` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `psi_bahasa` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `psi_penerjemah_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `psi_penerjemah_des` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `bicara_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=332',
  `bicara_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `hb_bahasa_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `hb_pendengaran_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `hb_memori_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `hb_motivasi_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `hb_penglihatan_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `hb_tidakada_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `hb_cemas_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `hb_emosi_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `hb_kognitif_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `hb_bicara_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `hb_partisipasi_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `hb_fisiologi_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `kajian_budaya_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `kajian_budaya_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `edukasi_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `potensial_proses_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `potensial_pengobatan_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `potensial_terapi_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `potensial_edukasi_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `nutrisi_diet_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `nutrisi_bb_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `nutrisi_bb_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `cb_menulis_id` tinyint(4) DEFAULT NULL COMMENT 'cara belajar disukai yesno',
  `cb_audio_id` tinyint(4) DEFAULT NULL,
  `cb_diskusi_id` tinyint(4) DEFAULT NULL,
  `cb_membaca_id` tinyint(4) DEFAULT NULL,
  `cb_demo_id` tinyint(4) DEFAULT NULL,
  `alergi_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `alergi_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hipertensi_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `diabetes_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `jantung_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `stroke_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `ginjal_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `asma_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `kejang_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `liver_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `cancer_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `tbc_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `glukoma_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `std_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `pendarahan_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `lainnya_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `riwayat_penyakit_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `operasi_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `operasi_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `tranfusi_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `reaksi_transfusi_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `reaksi_transfusi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `sadar_compos_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `sadar_apatis_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `sadar_somnolen_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `sadar_soporo_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `sadar_coma_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `infeksi_tidak_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `infeksi_suspect_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `infeksi_diketahui_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `infeksi_mrsa_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `infeksi_vre_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `infeksi_tb_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `infeksi_oportunistik_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `infeksi_lainynya_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `risiko_infeksi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `precaution_droplet_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `precaution_airborn_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `precaution_contact_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `precaution_skin_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `precaution_crmo_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `personal_hygiene` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=363',
  `toileting` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=363',
  `bergerak_tempat_tidur` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=363',
  `berpakaian` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=363',
  `mobilisasi` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=363',
  `makan_minum` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=363',
  `alat_bantu_id` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=364',
  `alat_bantu_desc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `bb_turun` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `bb_menurun_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=365',
  `nafsu_makan` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `mens_siklus_id` tinyint(1) DEFAULT NULL COMMENT 'obstetri, m_yesno',
  `mens_siklus_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'obstetri',
  `mens_menarche_id` tinyint(4) DEFAULT NULL COMMENT 'obstetri',
  `mens_menarche_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'obstetri',
  `mens_akhir_id` tinyint(4) DEFAULT NULL COMMENT 'obstetri',
  `mens_akhir_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'obstetri',
  `mens_haid_id` tinyint(4) DEFAULT NULL COMMENT 'obstetri',
  `mens_haid_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'obstetri',
  `mens_banyak_id` tinyint(4) DEFAULT NULL COMMENT 'obstetri',
  `mens_banyak_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'obstetri',
  `mens_teratur_id` tinyint(4) DEFAULT NULL COMMENT 'obstetri',
  `mens_teratur_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'obstetri',
  `mens_lama_id` tinyint(4) DEFAULT NULL COMMENT 'obstetri',
  `mens_lama_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'obstetri',
  `mens_tgl_persalinan_id` tinyint(4) DEFAULT NULL,
  `mens_tgl_persalinan_des` date DEFAULT NULL COMMENT 'obstetri',
  `kwn_status_id` tinyint(4) DEFAULT NULL COMMENT 'obstetri 1=belum,2=cerai,3=kawin',
  `kwn_status_jumlah` int(4) DEFAULT NULL COMMENT 'obstetri',
  `kwn_pertama_umur` float DEFAULT NULL COMMENT 'obstetri',
  `irama_nafas_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=366',
  `jenis_nafas_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=367',
  `pola_nafas_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=368',
  `suara_nafas_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=369',
  `keadaan_nafas_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=370',
  `sulit_bernapas` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `pakai_o2` float DEFAULT NULL COMMENT 'entry',
  `alat_nafas_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=371',
  `keluh_nafas_lain` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `masalah_nafas_1` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `masalah_nafas_2` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `masalah_nafas_3` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `masalah_nafas_4` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `masalah_nafas_other` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `irama_jantung_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=385',
  `akral` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=386',
  `crt_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=387',
  `oedem_desc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `masalah_blood_1` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `masalah_blood_2` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `masalah_blood_3` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `masalah_blood_4` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `masalah_blood_other` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `sadar_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=388',
  `gcs_e` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `gcs_v` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `gcs_m` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `reflek_cahaya_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=389',
  `paresa` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `kejang_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=390',
  `keluhan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `masalah_brain_1` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `masalah_brain_2` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `masalah_brain_3` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `masalah_brain_4` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `masalah_brain_other` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `bak` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `warna_urin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `is_nyeri_tekan` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `gangguan_kemih` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=391',
  `keluhan_kemih_lain` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `masalah_bleader_1` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `masalah_bleader_2` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `masalah_bleader_3` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `masalah_bleader_4` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `masalah_bleader_other` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `nafsu_makan_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=392',
  `mukosa_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=393',
  `abdomen_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=394',
  `lokasi_desc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `jum_bab` tinyint(4) DEFAULT NULL COMMENT 'entry',
  `warna_bab` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `keluhan_lain` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `masalah_bowel_1` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `masalah_bowel_2` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `masalah_bowel_3` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `masalah_bowel_4` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `masalah_bowel_other` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `is_axilla` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `is_rertal` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `is_oral` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `pergerakan_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=395',
  `faktur_desc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `warna_kulit_kode` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=396',
  `otot_kode` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=397',
  `turgon_desc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `oedem` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `berkeringat_banyak` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `resiko_dekubitus` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `braden_score` float DEFAULT NULL COMMENT 'entry',
  `is_luka` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `lokasi_luka` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `perawatan_luka` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `keluhan_lain_bone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `masalah_bone_1` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `masalah_bone_2` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `masalah_bone_3` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `masalah_bone_4` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `masalah_bone_5` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `masalah_bone_6` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `masalah_bone_other` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `taat_beribadah` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `orang_terdekat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `perasaan_saat_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=398',
  `gangguan_desc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `keluhan_lain_psiko` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `masalah_psiko_1` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `masalah_psiko_2` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `masalah_psiko_3` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `masalah_psiko_4` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `masalah_psiko_other` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `t_layanan_riwayat_kehamilan` */

DROP TABLE IF EXISTS `t_layanan_riwayat_kehamilan`;

CREATE TABLE `t_layanan_riwayat_kehamilan` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `no_rm` varchar(255) DEFAULT NULL,
  `layanan_id` bigint(20) DEFAULT NULL,
  `rmp_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `hamil_ke` int(4) DEFAULT NULL,
  `is_abortus` tinyint(4) DEFAULT NULL COMMENT '1: abortus; 2: Prematur; 3: Aterm',
  `umur_minggu` int(4) DEFAULT NULL COMMENT 'minggu',
  `umur_hari` int(4) DEFAULT NULL COMMENT 'hari',
  `berat` float DEFAULT NULL COMMENT 'kg',
  `sex` tinyint(4) DEFAULT NULL COMMENT 'jenis kelamin',
  `cara_persalinan` varchar(255) DEFAULT NULL,
  `penolong_persalinan` varchar(255) DEFAULT NULL,
  `tempat_persalinan` varchar(255) DEFAULT NULL,
  `keadaan_anak` tinyint(1) DEFAULT NULL COMMENT '1: hidup; 2: meninggal',
  `keterangan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Table structure for table `t_layanan_tindakan` */

DROP TABLE IF EXISTS `t_layanan_tindakan`;

CREATE TABLE `t_layanan_tindakan` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `layanan_id` bigint(20) DEFAULT NULL COMMENT 't_layanan',
  `nomor_registrasi` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 't_layanan',
  `no_rm` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 't_layanan',
  `layanan_tindakan_group_id` bigint(20) DEFAULT NULL COMMENT 't_layanan_tindakan_group',
  `kelas_id` bigint(20) DEFAULT NULL COMMENT 'kelas',
  `tindakan_tarif_id` bigint(20) DEFAULT NULL COMMENT 'm_tindakan_tarif',
  `tindakan_tarif_nama` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_tindakan_tarif',
  `tarif` double DEFAULT NULL COMMENT 'masing-masing layanan',
  `qty` smallint(6) DEFAULT NULL COMMENT 'diinput',
  `disc` float DEFAULT NULL COMMENT 'diinput/set',
  `ditanggung` double DEFAULT NULL COMMENT 'rupiah',
  `status_verifikasi` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `t_layanan_tindakan_group` */

DROP TABLE IF EXISTS `t_layanan_tindakan_group`;

CREATE TABLE `t_layanan_tindakan_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `layanan_id` bigint(20) DEFAULT NULL COMMENT 't_layanan',
  `nomor_registrasi` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_rm` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subunit_id` bigint(20) DEFAULT NULL COMMENT 'kode subunit terjadinya tindakan',
  `no_ref` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'otomatis harus UNIK;nomor referensi;bisa nomor nota;nomor pmrks lab;nomor pmrks radiologi dll',
  `tgl_transaksi` datetime DEFAULT NULL COMMENT 'utk rawat jalan = tgl masuk;utk rawat inap beda2',
  `deskripsi` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'nama group transaksi:ex. Farmasi Nota.3421;Lab #2321;bisa dibuat otomatis',
  `jenis_tindakan_id` int(11) DEFAULT NULL COMMENT 'm_ref group_id=345',
  `status_verifikasi` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `butuh_persetujuan` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `status_persetujuan` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `t_layanan_tindakan_komponen` */

DROP TABLE IF EXISTS `t_layanan_tindakan_komponen`;

CREATE TABLE `t_layanan_tindakan_komponen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layanan_tindakan_id` bigint(20) DEFAULT NULL COMMENT 't_layanan_tindakan',
  `tarif_komponen_id` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_tindakan_tarif_komponen',
  `kelas_id` int(11) DEFAULT NULL,
  `default_komponen_id` int(11) DEFAULT 0 COMMENT 'm_tarif_komponen_default',
  `tarif_asli` float DEFAULT NULL COMMENT 'm_tindakan_tarif_komponen',
  `tarif_ubah` float DEFAULT NULL COMMENT 'defaul = tarif_asli;namun bisa diubah;',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `pegawai_id` int(11) DEFAULT 0 COMMENT 'm_pegawai',
  `is_oncall` tinyint(4) DEFAULT NULL COMMENT 'entry',
  `persentase` float DEFAULT 100 COMMENT 'entry',
  `is_onduty` tinyint(4) DEFAULT NULL COMMENT 'entry',
  `allow_oncall` tinyint(4) DEFAULT NULL COMMENT 'ambil dari',
  `allow_onduty` tinyint(4) DEFAULT NULL,
  `allow_add` tinyint(4) DEFAULT NULL,
  `is_temp` tinyint(4) DEFAULT NULL COMMENT 'urusan titip',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `t_layanan_ugd_rmd` */

DROP TABLE IF EXISTS `t_layanan_ugd_rmd`;

CREATE TABLE `t_layanan_ugd_rmd` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `layanan_id` bigint(20) DEFAULT NULL COMMENT 't_layanan',
  `nomor_registrasi` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `no_rm` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_pasien',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `nyeri_is` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `nyeri_kode` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=323;',
  `nyeri_lokasi_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `nyeri_onset_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `nyeri_pencetus_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `nyeri_kualitas_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=324',
  `nyeri_kualitas_lainnya` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `nyeri_menjalar_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=325',
  `nyeri_menjalar_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `nyeri_tingkatan_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=326',
  `nyeri_waktu_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=327',
  `nyeri_waktu_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `nyeri_skoring_kode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=328',
  `nyeri_skoring_skor_1` smallint(6) DEFAULT NULL COMMENT 'entry',
  `nyeri_skoring_skor_2` smallint(6) DEFAULT NULL,
  `nyeri_skoring_skor_3` smallint(6) DEFAULT NULL,
  `psi_status_nikah_id` tinyint(4) DEFAULT NULL COMMENT 'm_statusnikah',
  `psi_tinggal_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=330',
  `psi_tinggal_lainnya` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `psi_tinggal_nama` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `psi_tinggal_telp` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `psi_kebiasaan_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=331',
  `psi_kebiasaan_des` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `psi_kebiasaan_lainnya` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `psi_mencederai` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `ds_auto` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `ds_allo` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `ds_riwayat_penyakit_skrg` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `ds_riwayat_penyakit_dulu` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `ds_riwayat_pengobatan` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `ds_riwayat_operasi` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `ds_riwayat_transfusi` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `ds_riwayat_penyakit_klrg` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `ds_alergi_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `ds_alergi_obat_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `ds_alergi_makanan_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `ds_alergi_udara_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `ds_alergi_debu_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `ds_alergi_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `kasus_bedah_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `kasus_nonbedah_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `kasus_anak_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `kasus_trauma_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `kasus_interna_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `kasus_mata_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `kasus_nontrauma_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `kasus_tht_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `kasus_psikiatri_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `kasus_obgyn_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `kasus_neuro_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `kasus_lain_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `kasus_lain_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_yesno',
  `doa_bersih_hambatan_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno;1=bersih;0=ada hambatan',
  `doa_dys_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `doa_ngorok_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `doa_kumur_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `doa_siul_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `doa_bersih_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `doa_posisi_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `doa_intubasi_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `doa_nebul_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `dob_normal_gangguan_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno;1=normal;0=ada gangguan',
  `dob_freknafas_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `dob_freknafas_nilai` int(11) DEFAULT NULL COMMENT 'entry',
  `dob_saturasi_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `dob_gerakdada_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `dob_gerakdada_nilai` tinyint(4) DEFAULT NULL COMMENT '1=simetris;0=asimetris',
  `dob_pernafasan_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `dob_pernafasan_nilai` tinyint(4) DEFAULT NULL COMMENT '1=dalam;0=dangkal',
  `dob_o2_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `dob_o2_nilai` int(11) DEFAULT NULL COMMENT 'entry',
  `dob_ventilator_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `dob_chest_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `dob_observasi_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `doc_stabil_tidak_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno;1=stabil;0=tidak',
  `doc_td_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `doc_td_sistol` smallint(6) DEFAULT NULL COMMENT 'entry',
  `doc_td_diastol` smallint(6) DEFAULT NULL COMMENT 'entry',
  `doc_nadi_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `doc_nadi_nilai` smallint(6) DEFAULT NULL COMMENT 'entry',
  `doc_akral_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `doc_akral_hangat_id` tinyint(4) DEFAULT NULL COMMENT '1=hangat;0=dingin',
  `doc_akral_nilai` float DEFAULT NULL COMMENT 'entry',
  `doc_cap_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `doc_cap_nilai` tinyint(4) DEFAULT NULL COMMENT '1=normal;0=melebar',
  `doc_infus_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `doc_infus_nilai` smallint(6) DEFAULT NULL COMMENT 'entry',
  `doc_infus_kec_nilai` smallint(6) DEFAULT NULL COMMENT 'entry',
  `doc_ngt_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `doc_ngt_nilai` smallint(6) DEFAULT NULL COMMENT 'entry',
  `doc_ekg_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `doc_shock_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `dod_sadar_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno;1=sadar;0=menurun',
  `dod_gcs_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `dod_gcs_e` smallint(6) DEFAULT NULL COMMENT 'entry',
  `dod_gcs_v` smallint(6) DEFAULT NULL COMMENT 'entry',
  `dod_gcs_m` smallint(6) DEFAULT NULL COMMENT 'entry',
  `dod_pupil_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `dod_pupil_nilai` tinyint(4) DEFAULT NULL COMMENT '1=isokor,0=anisokor',
  `dod_pupul_reflek` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `dod_defisit_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `dod_defisit_nilai` tinyint(4) DEFAULT NULL COMMENT '1=mono;2=para;3=hemi',
  `dod_kaku_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `dod_kaku_nilai` tinyint(4) DEFAULT NULL COMMENT '1=plus(+);0=minus(-)',
  `dod_neck_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `dod_fiksasi_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `dod_obat_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `bb` float DEFAULT NULL COMMENT 'entry',
  `tb` float DEFAULT NULL COMMENT 'entry',
  `kepala` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `leher` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `thorax` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `punggung` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `abdomen` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `pervis_genital` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `extrimitas` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `pp_lab_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `pp_radio_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `pp_lain_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `pp_lab_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `pp_radio_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `pp_lain_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `diagnosa_primer` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `diagnosa_skunder` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `diagnosa_banding` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `konsultasi` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `konsultasi_dokter_id` int(11) DEFAULT NULL COMMENT 'm_pegawai dokter',
  `asuhan_medis` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `rawat_lanjutan_nilai` tinyint(4) DEFAULT NULL COMMENT 'm_ref group id =352',
  `jenis_kasus_id` tinyint(4) DEFAULT NULL COMMENT 'm_ref group id=345',
  `dokter_jaga_id` int(11) DEFAULT NULL COMMENT 'm_pegawai dokter',
  `tgl_pemeriksaan` date DEFAULT NULL COMMENT 'entry',
  `jam_pemeriksaan` time DEFAULT NULL COMMENT 'entry',
  `psi_kebiasaan_merokok` tinyint(4) DEFAULT NULL,
  `psi_kebiasaan_alkohol` tinyint(4) DEFAULT NULL,
  `psi_kebiasaan_lainnya_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `t_layanan_ugd_rmp` */

DROP TABLE IF EXISTS `t_layanan_ugd_rmp`;

CREATE TABLE `t_layanan_ugd_rmp` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `layanan_id` bigint(20) DEFAULT NULL,
  `nomor_registrasi` varchar(20) DEFAULT NULL,
  `no_rm` varchar(20) DEFAULT NULL,
  `keluhan` text DEFAULT NULL,
  `riwayat_penyakit_dulu` text DEFAULT NULL,
  `alergi_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `alergi_obat_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `alergi_makanan_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `alergi_udara_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `alergi_debu_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `alergi_des` varchar(255) DEFAULT NULL,
  `a_bebas` tinyint(4) DEFAULT NULL COMMENT 'prefix a: ref_group 433',
  `a_gargling` tinyint(4) DEFAULT NULL,
  `a_stridor` tinyint(4) DEFAULT NULL,
  `a_wheezing` tinyint(4) DEFAULT NULL,
  `a_ronchi` tinyint(4) DEFAULT NULL,
  `a_terintubasi` tinyint(4) DEFAULT NULL,
  `b_spontan` tinyint(4) DEFAULT NULL COMMENT 'prefix b: ref_grup 434',
  `b_tachipneu` tinyint(4) DEFAULT NULL,
  `b_dispneu` tinyint(4) DEFAULT NULL,
  `b_apneu` tinyint(4) DEFAULT NULL,
  `b_vent_mekanik` tinyint(4) DEFAULT NULL,
  `b_memakai_vent` tinyint(4) DEFAULT NULL,
  `c_nadi` tinyint(4) DEFAULT NULL COMMENT 'prefix c: ref group 435',
  `c_crt` tinyint(4) DEFAULT NULL,
  `c_warna_normal` tinyint(4) DEFAULT NULL,
  `c_warna_pucat` tinyint(4) DEFAULT NULL,
  `c_warna_kuning` tinyint(4) DEFAULT NULL,
  `d_respon_alert` tinyint(4) DEFAULT NULL,
  `d_respon_pain` tinyint(4) DEFAULT NULL,
  `d_respon_verbal` tinyint(4) DEFAULT NULL,
  `d_respon_un` tinyint(4) DEFAULT NULL,
  `d_pupil_iso` tinyint(4) DEFAULT NULL,
  `d_pupil_aniso` tinyint(4) DEFAULT NULL,
  `d_pupil_pain` tinyint(4) DEFAULT NULL,
  `d_pupil_medriasis` tinyint(4) DEFAULT NULL,
  `d_refleks_a` varchar(20) DEFAULT NULL,
  `d_refleks_b` varchar(20) DEFAULT NULL,
  `d_gcs_e` float DEFAULT NULL,
  `d_gcs_v` float DEFAULT NULL,
  `d_gcs_m` float DEFAULT NULL,
  `td_s` float DEFAULT NULL,
  `td_d` float DEFAULT NULL,
  `nadi` int(4) DEFAULT NULL,
  `rr` int(4) DEFAULT NULL,
  `suhu` float DEFAULT NULL,
  `b_nyeri` tinyint(4) DEFAULT NULL,
  `b_terbatas_gerak` tinyint(4) DEFAULT NULL,
  `b_deformitas` tinyint(4) DEFAULT NULL,
  `b_abrasi` tinyint(4) DEFAULT NULL,
  `b_laserasi` tinyint(4) DEFAULT NULL,
  `b_kantusio` tinyint(4) DEFAULT NULL,
  `c_luka_bakar` tinyint(4) DEFAULT NULL,
  `c_gigitan` tinyint(4) DEFAULT NULL,
  `c_tusuk` tinyint(4) DEFAULT NULL,
  `c_nyeri` tinyint(4) DEFAULT NULL,
  `c_vulnus` tinyint(4) DEFAULT NULL,
  `c_ptichiae` tinyint(4) DEFAULT NULL,
  `c_lainnya` tinyint(4) DEFAULT NULL,
  `c_lainnya_des` varchar(255) DEFAULT NULL,
  `d_nyeri_lokasi` varchar(255) DEFAULT NULL,
  `d_nyeri_skoring_kode` varchar(10) DEFAULT NULL,
  `d_nyeri_skoring_skor_1` int(4) DEFAULT NULL,
  `d_nyeri_skoring_skor_2` int(4) DEFAULT NULL,
  `d_nyeri_skoring_skor_3` int(4) DEFAULT NULL,
  `diagnosa_medis` text DEFAULT NULL,
  `rj_skor_dewasa` float DEFAULT NULL COMMENT 'resiko jatuh',
  `rj_skor_anak` float DEFAULT NULL,
  `rj_d_kelas_rendah` tinyint(4) DEFAULT NULL COMMENT 'resiko jatuh dewasa, text: ref_group 436',
  `rj_d_kelas_tinggi` tinyint(4) DEFAULT NULL,
  `rj_d_kelas_sangat_tinggi` tinyint(4) DEFAULT NULL,
  `rj_a_kelas_rendah` tinyint(4) DEFAULT NULL COMMENT 'text: m_ref_group 437',
  `rj_a_kelas_ringgi` tinyint(4) DEFAULT NULL,
  `datetime_kajian` datetime DEFAULT NULL,
  `perawat_pengkaji_id` int(11) DEFAULT NULL COMMENT 'm_pegawai',
  `dkgd_1` tinyint(4) DEFAULT NULL COMMENT 'yesno. text: ref_group 439 diagnosa keperawatan gawat darurat',
  `dkgd_2` tinyint(4) DEFAULT NULL,
  `dkgd_3` tinyint(4) DEFAULT NULL,
  `dkgd_4` tinyint(4) DEFAULT NULL,
  `dkgd_5` tinyint(4) DEFAULT NULL,
  `dkgd_6` tinyint(4) DEFAULT NULL,
  `dkgd_7` tinyint(4) DEFAULT NULL,
  `dkgd_8` tinyint(4) DEFAULT NULL,
  `dkgd_9` tinyint(4) DEFAULT NULL,
  `dkgd_10` tinyint(4) DEFAULT NULL,
  `dkgd_11` tinyint(4) DEFAULT NULL,
  `dkgd_12` tinyint(4) DEFAULT NULL,
  `dkgd_13` tinyint(4) DEFAULT NULL,
  `dkgd_14` tinyint(4) DEFAULT NULL,
  `dkgd_15` tinyint(4) DEFAULT NULL,
  `dkgd_16` tinyint(4) DEFAULT NULL,
  `dkgd_17` tinyint(4) DEFAULT NULL,
  `rkgd_1` tinyint(4) DEFAULT NULL,
  `rkgd_2` tinyint(4) DEFAULT NULL,
  `rkgd_3` tinyint(4) DEFAULT NULL,
  `rkgd_4` tinyint(4) DEFAULT NULL,
  `rkgd_5` tinyint(4) DEFAULT NULL,
  `rkgd_6` tinyint(4) DEFAULT NULL,
  `rkgd_7` tinyint(4) DEFAULT NULL,
  `rkgd_8` tinyint(4) DEFAULT NULL,
  `rkgd_9` tinyint(4) DEFAULT NULL,
  `rkgd_10` tinyint(4) DEFAULT NULL,
  `rkgd_11` tinyint(4) DEFAULT NULL,
  `rkgd_12` tinyint(4) DEFAULT NULL,
  `rkgd_13` tinyint(4) DEFAULT NULL,
  `rkgd_14` tinyint(4) DEFAULT NULL,
  `rkgd_15` tinyint(4) DEFAULT NULL,
  `rkgd_16` tinyint(4) DEFAULT NULL,
  `rkgd_17` tinyint(4) DEFAULT NULL,
  `rkgd_18` tinyint(4) DEFAULT NULL,
  `rkgd_19` tinyint(4) DEFAULT NULL,
  `rkgd_20` tinyint(4) DEFAULT NULL,
  `rkgd_21` tinyint(4) DEFAULT NULL,
  `rkgd_22` tinyint(4) DEFAULT NULL,
  `rkgd_23` tinyint(4) DEFAULT NULL,
  `rkgd_24` tinyint(4) DEFAULT NULL,
  `rkgd_25` tinyint(4) DEFAULT NULL,
  `rkgd_26` tinyint(4) DEFAULT NULL,
  `rkgd_27` tinyint(4) DEFAULT NULL,
  `rkgd_28` tinyint(4) DEFAULT NULL,
  `alergi_lainnya_id` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `t_log` */

DROP TABLE IF EXISTS `t_log`;

CREATE TABLE `t_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `aksi` varchar(255) DEFAULT NULL,
  `nama_tabel` varchar(255) DEFAULT NULL,
  `before` longtext DEFAULT NULL,
  `after` longtext DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=601 DEFAULT CHARSET=latin1;

/*Table structure for table `t_mo_proof` */

DROP TABLE IF EXISTS `t_mo_proof`;

CREATE TABLE `t_mo_proof` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `kode_doc` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'entry:dokumen yang di approve',
  `nomor_doc` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:nomor dokumen',
  `tanggal_doc` date DEFAULT NULL COMMENT 'entry:tanggal dokumen kode_doc',
  `jdoc_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:jenis dokumen yang diapprove',
  `subunit_owner_id` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:unit/subunit pemilik',
  `kode_jab` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:jabatan yang mengapprove dokumen',
  `order_proof` tinyint(11) DEFAULT NULL COMMENT 'entry:urutan jabatan yang approve',
  `pegawai_kode` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:m_pegawai;pegawai yang approve',
  `tanggal_proof` datetime DEFAULT NULL COMMENT 'entry:tanggal approved',
  `status_proof` tinyint(4) DEFAULT 0 COMMENT 'entry:1=approved;0=belum approved',
  `link_doc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:link url dokumen yang diaaprove',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

/*Table structure for table `t_ok_detil` */

DROP TABLE IF EXISTS `t_ok_detil`;

CREATE TABLE `t_ok_detil` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `booking_id` bigint(20) DEFAULT NULL COMMENT 'm_pp_booking',
  `kelas_id` bigint(20) DEFAULT NULL COMMENT 'm_kelas',
  `tindakan_tarif_id` varchar(10) DEFAULT NULL COMMENT 'm_tindakan_tarif',
  `besar_tarif` float DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=latin1;

/*Table structure for table `t_ok_kesiapan_kamar` */

DROP TABLE IF EXISTS `t_ok_kesiapan_kamar`;

CREATE TABLE `t_ok_kesiapan_kamar` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tgl_perubahan` date DEFAULT NULL,
  `jam_perubahan` time DEFAULT NULL,
  `kamar_id` int(11) DEFAULT NULL COMMENT 'm_ok_kamar',
  `status_kamar` int(11) DEFAULT NULL COMMENT 'm_ref not yet set',
  `pegawai_id` int(11) DEFAULT NULL COMMENT 'm_pegawai',
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

/*Table structure for table `t_ok_status` */

DROP TABLE IF EXISTS `t_ok_status`;

CREATE TABLE `t_ok_status` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ok_booking_id` bigint(20) DEFAULT NULL COMMENT 'm_ok_booking',
  `status_proses` smallint(11) DEFAULT NULL COMMENT 'm_ref dgn group_id = 382',
  `tgl_akhir` date DEFAULT NULL COMMENT 'entry',
  `jam_akhir` time DEFAULT NULL COMMENT 'entry',
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

/*Table structure for table `t_ok_tim` */

DROP TABLE IF EXISTS `t_ok_tim`;

CREATE TABLE `t_ok_tim` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ok_booking_id` bigint(20) DEFAULT NULL COMMENT 'm_ok_booking',
  `petugas_id` int(11) DEFAULT NULL COMMENT 'm_pegawai',
  `posisi_id` smallint(6) DEFAULT NULL COMMENT 'm_ref group id = 384',
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Table structure for table `t_pasien_ttd_surat_rajal` */

DROP TABLE IF EXISTS `t_pasien_ttd_surat_rajal`;

CREATE TABLE `t_pasien_ttd_surat_rajal` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `layanan_id` bigint(10) DEFAULT NULL,
  `is_ttd` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Table structure for table `t_pulang_kontrol` */

DROP TABLE IF EXISTS `t_pulang_kontrol`;

CREATE TABLE `t_pulang_kontrol` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `layanan_id` bigint(20) DEFAULT NULL COMMENT 't_layanan',
  `nomor_registrasi` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 't_layanan',
  `no_rm` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 't_layanan',
  `nomor` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'otomatis;buat prefis di m_setup_unit',
  `tgl_pulang` date DEFAULT NULL COMMENT 'entry',
  `jam_pulang` time DEFAULT NULL COMMENT 'entry',
  `kondisi_pulang_id` tinyint(4) DEFAULT NULL COMMENT 'm_ref groupid=361',
  `keterangan_pulang` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `is_kontrol` tinyint(1) DEFAULT 0 COMMENT 'm_yesno',
  `is_resep_kronis` tinyint(1) DEFAULT 0 COMMENT 'm_yesno',
  `subunit_dituju_id` int(11) DEFAULT NULL COMMENT 'm_subunit_medik;default poli saat ini',
  `dokter_dituju_id` int(11) DEFAULT NULL COMMENT 'm_pegawai; default dokter poli saat ini',
  `tanggal_kontrol` datetime DEFAULT NULL COMMENT 'sesuaikan perhitungannya untuk BPJS kronis',
  `keterangan_kontrol` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `waktu_awal_jadwal_dokter` time DEFAULT NULL,
  `waktu_akhir_jadwal_dokter` time DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `t_ranap_pasien_dilayani_pegawai` */

DROP TABLE IF EXISTS `t_ranap_pasien_dilayani_pegawai`;

CREATE TABLE `t_ranap_pasien_dilayani_pegawai` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT COMMENT 'Menyimpan data pasien yang sedang dilayani Perawat. Supaya tidak bolak balik ke tabel pasien',
  `layanan_id` int(10) DEFAULT NULL COMMENT 't_layanan',
  `pegawai_id` int(10) DEFAULT NULL COMMENT 'm_pegawai. bisa perawat/dokter',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'tidak isi deleted_at, karena data akan insert-hapus terus',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Table structure for table `t_rawat_ruang` */

DROP TABLE IF EXISTS `t_rawat_ruang`;

CREATE TABLE `t_rawat_ruang` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `layanan_id` bigint(20) DEFAULT NULL COMMENT 't_layanan',
  `nomor_registrasi` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 't_layanan',
  `no_rm` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 't_layanan',
  `subunit_asal_id` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT 'entry:t_Layanan',
  `instalasi_tujuan_id` int(11) DEFAULT NULL COMMENT 'm_instalasi_medik',
  `unit_tujuan_id` int(11) DEFAULT NULL COMMENT 'm_unit_medik',
  `subunit_tujuan_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'entry:m_subunit',
  `tanggal_pindah` date DEFAULT NULL,
  `jam_pindah` time DEFAULT NULL,
  `keterangan` text COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'entry',
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `regencies_province_id_index` (`nomor_registrasi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `t_riwayat_diklat` */

DROP TABLE IF EXISTS `t_riwayat_diklat`;

CREATE TABLE `t_riwayat_diklat` (
  `id_t_diklat` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pegawai_id` int(10) DEFAULT NULL,
  `diklat_id` int(10) DEFAULT NULL COMMENT 'm_diklat',
  `nama_kursus` varchar(255) DEFAULT NULL,
  `tempat` varchar(255) DEFAULT NULL,
  `jumlah_jam` float DEFAULT NULL,
  `tanggal_kursus` date DEFAULT NULL,
  `institusi_penyelenggara` varchar(255) DEFAULT NULL,
  `nomor_sertifikat` varchar(255) DEFAULT NULL,
  `tgl_sertifikat` date DEFAULT NULL,
  `tanggal_selesai_kursus` date DEFAULT NULL,
  `jabatan_ttd_sertifikat` varchar(255) DEFAULT NULL,
  `is_aktif` tinyint(1) DEFAULT 1,
  `is_valid` tinyint(1) DEFAULT 0,
  `keterangan` text DEFAULT NULL,
  `file_sertifikat` varchar(225) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_t_diklat`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `t_riwayat_fungsional` */

DROP TABLE IF EXISTS `t_riwayat_fungsional`;

CREATE TABLE `t_riwayat_fungsional` (
  `id_riwayat_fungsional` int(11) NOT NULL AUTO_INCREMENT,
  `pegawai_id` int(11) DEFAULT NULL,
  `jabatan fungsional_id` int(11) DEFAULT NULL COMMENT 'm_jabatan_fungsional',
  `unit_id` int(11) DEFAULT NULL,
  `subunit_id` int(11) DEFAULT NULL,
  `bidang_ilmu_id` int(11) DEFAULT NULL,
  `no_sk` varchar(255) DEFAULT NULL,
  `tgl_sk` date DEFAULT NULL,
  `tmt_sk` date DEFAULT NULL,
  `jumlah_kum_lama` float DEFAULT NULL,
  `jumlah_kum_capaian` float DEFAULT NULL,
  `no_str` varchar(50) DEFAULT NULL,
  `no_sip` varchar(50) DEFAULT NULL,
  `nama_penanda_tangan` varchar(255) DEFAULT NULL,
  `jabatan_penanda_tangan` varchar(255) DEFAULT NULL,
  `nip_penanda_tangan` varchar(255) DEFAULT NULL,
  `file_riwayat_fungsional` varchar(255) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `status_data_valid` varchar(1) DEFAULT '0' COMMENT '0 = belum divalidasi, 1 = valid, 2 tidak valid',
  `status_file_valid` varchar(1) DEFAULT '0' COMMENT '0 = belum diverifikasi, 1 = valid, 2 tidak valid',
  `keterangan_validasi` varchar(255) DEFAULT NULL,
  `flag_terakhir` tinyint(1) DEFAULT 0,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `delete_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_riwayat_fungsional`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

/*Table structure for table `t_riwayat_keaktifan` */

DROP TABLE IF EXISTS `t_riwayat_keaktifan`;

CREATE TABLE `t_riwayat_keaktifan` (
  `riwayat_keaktifan_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pegawai_id` int(11) DEFAULT NULL,
  `status_keaktifan_id` int(11) DEFAULT NULL COMMENT 'm_status_keaktifan',
  `no_sk` varchar(255) DEFAULT NULL,
  `tgl_sk` date DEFAULT NULL,
  `tmt_sk` date DEFAULT NULL,
  `nama_penanda_tangan` varchar(255) DEFAULT NULL,
  `jabatan_penanda_tangan` varchar(255) DEFAULT NULL,
  `nip_penanda_tangan` varchar(255) DEFAULT NULL,
  `file_riwayat_keaktifan` varchar(255) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `m_unit` int(11) DEFAULT NULL COMMENT 'm_unitmedik',
  `m_subunit` int(11) DEFAULT NULL COMMENT 'm_subunitmedik',
  `status_data_valid` int(11) DEFAULT 0,
  `status_file_valid` varchar(1) DEFAULT '0' COMMENT '0 = belum diverifikasi, 1 = valid, 2 tidak valid',
  `keterangan_validasi` varchar(255) DEFAULT NULL,
  `flag_terakhir` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`riwayat_keaktifan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `t_riwayat_pendidikan` */

DROP TABLE IF EXISTS `t_riwayat_pendidikan`;

CREATE TABLE `t_riwayat_pendidikan` (
  `riwayat_pendidikan_id` int(11) NOT NULL AUTO_INCREMENT,
  `pegawai_id` int(11) DEFAULT NULL,
  `jenjang_pendidikan_id` int(11) DEFAULT NULL COMMENT 'm_pendidikan',
  `instansi_id` int(11) DEFAULT NULL,
  `flag_dalam_negeri` enum('Dalam Negeri','Luar Negeri') DEFAULT NULL,
  `lokasi_institusi` varchar(255) DEFAULT NULL,
  `jurusan_pendidikan` int(11) DEFAULT NULL,
  `bidang_ilmu_id` int(11) DEFAULT NULL,
  `nomor_ijazah` varchar(255) DEFAULT NULL,
  `gelar_singkat` varchar(255) DEFAULT NULL,
  `gelar_panjang` varchar(255) DEFAULT NULL,
  `tgl_mulai` date DEFAULT NULL,
  `tgl_selesai` date DEFAULT NULL,
  `tgl_ijasah` date DEFAULT NULL,
  `predikat_kelulusan_id` int(11) DEFAULT NULL COMMENT 'LOV Predikat Kelulusan',
  `judul_tugas_akhir` varchar(255) DEFAULT NULL,
  `nama_p1` varchar(255) DEFAULT NULL COMMENT 'nama_pembimbing_1',
  `nama_p2` varchar(255) DEFAULT NULL COMMENT 'nama_pembimbing_2',
  `nama_p3` varchar(255) DEFAULT NULL COMMENT 'nama_pembimbing_3',
  `flag_terpakai_pangkat` tinyint(1) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `status_data_valid` tinyint(1) DEFAULT 0 COMMENT '0 = belum divalidasi, 1 = valid, 2 tidak valid',
  `status_file_valid` tinyint(1) DEFAULT 0 COMMENT '0 = belum diverifikasi, 1 = valid, 2 tidak valid',
  `file_riwayat_pendidikan` varchar(255) DEFAULT NULL,
  `file_riwayat_pendidikan_transkrip` varchar(255) DEFAULT NULL,
  `file_riwayat_pendidikan_penyetaraan_ijazah` varchar(255) DEFAULT NULL,
  `terpakai_pendidikan` tinyint(4) DEFAULT 0 COMMENT 'langsung set ke profil pendidikannya',
  `keterangan_validasi` varchar(255) DEFAULT NULL,
  `flag_terakhir` tinyint(1) DEFAULT 0 COMMENT 'riwayat terakhir',
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `delete_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`riwayat_pendidikan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

/*Table structure for table `t_riwayat_struktural` */

DROP TABLE IF EXISTS `t_riwayat_struktural`;

CREATE TABLE `t_riwayat_struktural` (
  `riwayat_struktural_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pegawai_id` int(11) DEFAULT NULL,
  `jabatan_struktural_id` int(11) DEFAULT NULL COMMENT 'm_jabatan_struktural',
  `unit_id` int(11) DEFAULT NULL,
  `sub_unit_id` int(11) DEFAULT NULL,
  `no_sk_diangkat` varchar(255) DEFAULT NULL,
  `tmt_sk_diangkat` date DEFAULT NULL,
  `tgl_sk_diangkat` date DEFAULT NULL,
  `no_sk_berhenti` varchar(255) DEFAULT NULL,
  `tmt_sk_berhenti` date DEFAULT NULL,
  `tgl_sk_berhenti` date DEFAULT NULL,
  `tgl_sk_berakhir` date DEFAULT NULL,
  `nama_penanda_tangan_pengangkat` varchar(255) DEFAULT NULL,
  `jabatan_penanda_tangan_pengangkat` varchar(255) DEFAULT NULL,
  `nip_penanda_tangan_pengangkat` varchar(255) DEFAULT NULL,
  `nama_penanda_tangan_berhenti` varchar(255) DEFAULT NULL,
  `jabatan_penanda_tangan_berhenti` varchar(255) DEFAULT NULL,
  `nip_penanda_tangan_berhenti` varchar(255) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `status_data_valid` tinyint(1) DEFAULT 0 COMMENT '0 = belum divalidasi, 1 = valid, 2 tidak valid',
  `file_sk_diangkat` varchar(255) DEFAULT NULL,
  `file_sk_berhenti` varchar(255) DEFAULT NULL,
  `status_file_valid` tinyint(1) DEFAULT 0,
  `keterangan_validasi` varchar(255) DEFAULT NULL,
  `is_aktif` tinyint(4) DEFAULT 1,
  `flag_terakhir` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `delete_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`riwayat_struktural_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

/*Table structure for table `t_rujukan` */

DROP TABLE IF EXISTS `t_rujukan`;

CREATE TABLE `t_rujukan` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `layanan_id` bigint(20) DEFAULT NULL COMMENT 't_layanan',
  `nomor_registrasi` varchar(20) DEFAULT NULL COMMENT 't_layanan',
  `no_rm` varchar(20) DEFAULT NULL COMMENT 't_layanan',
  `nomor_rujukan` varchar(20) DEFAULT NULL COMMENT 'entry;otomatis',
  `tgl_keluar` date DEFAULT NULL COMMENT 'entry',
  `jam_keluar` time DEFAULT NULL COMMENT 'entry',
  `tgl_kunjungan` date DEFAULT NULL COMMENT 'entry',
  `jam_kunjungan` time DEFAULT NULL COMMENT 'entry',
  `jenis_rujukan_id` int(11) DEFAULT NULL COMMENT 'm_ref group id = 351',
  `faskes_dituju_id` int(11) DEFAULT NULL COMMENT 'm_group_faskes;m_group_rujukan_bpjs;m_faskes',
  `subunit_perujuk_id` int(11) DEFAULT NULL COMMENT 'm_subunit_medik; sub unit saat ini',
  `dokter_perujuk_id` int(11) DEFAULT NULL COMMENT 'dokter m_pegawai; dokter saat ini',
  `dokter_dituju` varchar(255) DEFAULT NULL,
  `diagnosa` text DEFAULT NULL COMMENT 'entry;mengambil dari assesment medik',
  `icd10_kode` varchar(10) DEFAULT NULL COMMENT 'm_icd;kode_diagnosa',
  `alasan_dirujuk` text DEFAULT NULL COMMENT 'entry',
  `kondisi_pasien` varchar(255) DEFAULT NULL COMMENT 'entry',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1390 DEFAULT CHARSET=latin1;

/*Table structure for table `t_surat_bukti_permintaan_pelayanan_canggih` */

DROP TABLE IF EXISTS `t_surat_bukti_permintaan_pelayanan_canggih`;

CREATE TABLE `t_surat_bukti_permintaan_pelayanan_canggih` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `layanan_id` int(10) DEFAULT NULL,
  `nomor_registrasi` varchar(30) DEFAULT NULL,
  `nama_penderita` varchar(255) DEFAULT NULL,
  `no_rm` varchar(30) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `umur_penderita` varchar(255) DEFAULT NULL,
  `jenis_kelamin_penderita` varchar(255) DEFAULT NULL,
  `nama_peserta` varchar(255) DEFAULT NULL,
  `hubungan_keluarga` varchar(255) DEFAULT NULL,
  `no_kartu` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `riwayat_penyakit` text DEFAULT NULL,
  `diagnosa` text DEFAULT NULL,
  `terapi` text DEFAULT NULL,
  `pronosa` text DEFAULT NULL,
  `jaminan_pelayanan` text DEFAULT NULL,
  `nama_dokter` varchar(255) DEFAULT NULL,
  `tanggal_surat` date DEFAULT NULL,
  `is_ttd_pasien` tinyint(1) DEFAULT 0,
  `is_ttd_dokter` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `t_surat_pemakaian_obat_khusus` */

DROP TABLE IF EXISTS `t_surat_pemakaian_obat_khusus`;

CREATE TABLE `t_surat_pemakaian_obat_khusus` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `layanan_id` int(10) DEFAULT NULL,
  `nomor_registrasi` varchar(30) DEFAULT NULL,
  `no_rm` varchar(30) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `tanggal_surat` date DEFAULT NULL,
  `nama_dokter` varchar(255) DEFAULT NULL,
  `nama_penderita` varchar(255) DEFAULT NULL,
  `spesialisasi_dokter` varchar(255) DEFAULT NULL,
  `jabatan_dokter` varchar(255) DEFAULT NULL,
  `umur_penderita` varchar(255) DEFAULT NULL,
  `jenis_kelamin_penderita` varchar(255) DEFAULT NULL,
  `no_kartu` varchar(255) DEFAULT NULL,
  `diagnosa_primer` text DEFAULT NULL,
  `obat_protokol_terapi` text DEFAULT NULL,
  `lama_hari` varchar(5) DEFAULT NULL,
  `dosis_obat` text DEFAULT NULL,
  `alasan_pemberian` text DEFAULT NULL,
  `is_ttd_dokter` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `t_surat_sk_diagnosa_tindakan` */

DROP TABLE IF EXISTS `t_surat_sk_diagnosa_tindakan`;

CREATE TABLE `t_surat_sk_diagnosa_tindakan` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `layanan_id` bigint(20) DEFAULT NULL,
  `nomor_registrasi` varchar(30) DEFAULT NULL,
  `no_rm` varchar(30) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `jenis_kelamin` varchar(255) DEFAULT NULL COMMENT 'm_pasien Laki, Perempuan',
  `umur` varchar(255) DEFAULT NULL COMMENT 'mis:1 tahun 3 bulan 5 hari',
  `nama_unit` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `diagnosa` text DEFAULT NULL,
  `tindakan` text DEFAULT NULL,
  `nama_dokter` varchar(255) DEFAULT NULL,
  `nama_perawat` varchar(255) DEFAULT NULL,
  `is_ttd_pasien` tinyint(1) DEFAULT 0,
  `is_ttd_dokter` tinyint(1) DEFAULT 0,
  `is_ttd_perawat` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `t_surat_sk_masih_dalam_perawatan` */

DROP TABLE IF EXISTS `t_surat_sk_masih_dalam_perawatan`;

CREATE TABLE `t_surat_sk_masih_dalam_perawatan` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `layanan_id` int(10) DEFAULT NULL,
  `nomor_registrasi` varchar(30) DEFAULT NULL,
  `no_rm` varchar(30) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `yang_bertandatangan` varchar(255) DEFAULT 'Dokter',
  `no_peserta` varchar(255) DEFAULT NULL COMMENT 'no kartu bpjs',
  `umur` varchar(255) DEFAULT NULL,
  `jenis_kelamin` varchar(255) DEFAULT NULL,
  `diagnosa` text DEFAULT NULL,
  `tindakan` text DEFAULT NULL,
  `terapi` varchar(255) DEFAULT NULL COMMENT 'rekomendasi dokter',
  `tanggal_surat` date DEFAULT NULL,
  `tanggal_kontrol` date DEFAULT NULL,
  `nama_dokter` varchar(255) DEFAULT NULL,
  `is_ttd_dokter` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `t_ugd_observasi_cairan` */

DROP TABLE IF EXISTS `t_ugd_observasi_cairan`;

CREATE TABLE `t_ugd_observasi_cairan` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `layanan_id` bigint(20) DEFAULT NULL,
  `no_rm` varchar(255) DEFAULT NULL,
  `nomor_registrasi` varchar(255) DEFAULT NULL,
  `ugd_rmp_id` bigint(20) DEFAULT NULL COMMENT 't_layanan_ugd_rmp',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Table structure for table `t_ugd_observasi_cairan_d` */

DROP TABLE IF EXISTS `t_ugd_observasi_cairan_d`;

CREATE TABLE `t_ugd_observasi_cairan_d` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `master_id` bigint(20) DEFAULT NULL COMMENT 't_ugd_observasi_cairan',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `jam` time DEFAULT NULL,
  `jenis_cairan_kode` varchar(255) DEFAULT NULL COMMENT 'ref_group 442',
  `no_botol` varchar(20) DEFAULT NULL,
  `iv` varchar(20) DEFAULT NULL,
  `oral_ngt` tinyint(1) DEFAULT NULL COMMENT '1=oral,2=ngt',
  `drain` varchar(20) DEFAULT NULL,
  `ngt` varchar(20) DEFAULT NULL,
  `bab` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Table structure for table `t_vk_detil` */

DROP TABLE IF EXISTS `t_vk_detil`;

CREATE TABLE `t_vk_detil` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `booking_id` bigint(20) DEFAULT NULL COMMENT 'm_pp_booking',
  `kelas_id` bigint(20) DEFAULT NULL COMMENT 'm_kelas',
  `tindakan_tarif_id` varchar(10) DEFAULT NULL COMMENT 'm_tindakan_tarif',
  `besar_tarif` float DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=latin1;

/*Table structure for table `tb_gaji_detail_payroll` */

DROP TABLE IF EXISTS `tb_gaji_detail_payroll`;

CREATE TABLE `tb_gaji_detail_payroll` (
  `peg_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `peg_unit_id` smallint(6) DEFAULT NULL,
  `peg_npwp` char(15) DEFAULT NULL,
  `gj_bulan` tinyint(4) DEFAULT NULL,
  `gj_tahun` tinyint(4) DEFAULT NULL,
  `gj_poin` float DEFAULT NULL,
  `gj_gapok` int(11) DEFAULT NULL,
  `gj_jaspel` int(11) DEFAULT NULL,
  `gj_lembur` int(11) DEFAULT NULL,
  `gj_oncall` int(11) DEFAULT NULL,
  `gj_tunj_pend` int(11) DEFAULT NULL,
  `gj_tunj_makan` int(11) DEFAULT NULL,
  `gj_tunj_trans` int(11) DEFAULT NULL,
  `gj_hadir` int(11) DEFAULT NULL,
  `gj_tunj_jab` int(11) DEFAULT NULL,
  `gj_tunj_masker` int(11) DEFAULT NULL,
  `gj_tunj_resiko` int(11) DEFAULT NULL,
  `gj_tunj_fung` int(11) DEFAULT NULL,
  `gj_tunj_karier` int(11) DEFAULT NULL,
  `gj_UMK` int(11) DEFAULT NULL,
  `gj_bpjs_jkk` int(11) DEFAULT NULL,
  `gj_bpjs_jkm` int(11) DEFAULT NULL,
  `gj_bpjs_jht_rs` int(11) DEFAULT NULL,
  `gj_bpjs_rsbm` int(11) DEFAULT NULL,
  `gj_bpjs_jht_peg` int(11) DEFAULT NULL,
  `gj_bpjs_kes_rs` int(11) DEFAULT NULL,
  `gj_bpjs_kes_peg` int(11) DEFAULT NULL,
  `gj_pph_ptkp_status` int(11) DEFAULT NULL,
  `gj_pph_hasil_bruto` int(11) DEFAULT NULL,
  `gj_pph_biaya_jabatan` int(11) DEFAULT NULL,
  `gj_pph_hasil_netto` int(11) DEFAULT NULL,
  `gj_pph_ptkp` int(11) DEFAULT NULL,
  `gj_pph_pkp` int(11) DEFAULT NULL,
  `gj_pph_terhutang` int(11) DEFAULT NULL,
  `gj_pph_isbayar` tinyint(4) DEFAULT 1,
  `gj_pot_simpan_kop` int(11) DEFAULT NULL,
  `gj_pot_minimarket` int(11) DEFAULT NULL,
  `gj_pot_premikes` int(11) DEFAULT NULL,
  `gj_pot_jtrus` int(11) DEFAULT NULL,
  `gj_pot_bri` int(11) DEFAULT NULL,
  `gj_pot_bpd` int(11) DEFAULT NULL,
  `gj_pot_obat` int(11) DEFAULT NULL,
  `gj_pot_arisan` int(11) DEFAULT NULL,
  `gj_pot_lainnya` int(11) DEFAULT NULL,
  `gj_insentif_bulan_lalu` int(11) DEFAULT NULL,
  `gj_bonus` int(11) DEFAULT NULL,
  `gj_thr` int(11) DEFAULT NULL,
  `gj_insentif_pajak` int(11) DEFAULT NULL,
  `gj_takehomepay` int(11) DEFAULT NULL,
  PRIMARY KEY (`peg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `tb_gaji_tetapan_payroll` */

DROP TABLE IF EXISTS `tb_gaji_tetapan_payroll`;

CREATE TABLE `tb_gaji_tetapan_payroll` (
  `peg_id` int(11) NOT NULL,
  `peg_unit_id` smallint(6) DEFAULT NULL,
  `gjt_gapok` int(11) DEFAULT NULL,
  `gjt_gapok_tmt` date DEFAULT NULL,
  `gjt_gapok_isaktif` tinyint(1) DEFAULT 1 COMMENT 'Penanda Gaji Pokok yang sedang aktif atau dipergunakan, Aktif = 1, Tidak Aktif = 0',
  `gjt_isjaspel` tinyint(1) DEFAULT 1 COMMENT 'Jasa pelayanan, khusus untuk dokter umum, dapat = 1, Tidak = 0',
  `gjt_islembur` tinyint(1) DEFAULT 1 COMMENT 'Uang Lembur, dapat = 1, Tidak = 0',
  `gjt_oncall` tinyint(1) DEFAULT NULL,
  `gjt_tunj_pend` int(11) DEFAULT NULL COMMENT 'Tunjangan Pendidikan Lainnya',
  `gjt_tunj_pend_tmt` date DEFAULT NULL COMMENT 'Tunjangan Pendidikan Lainnya',
  `gjt_tunj_pend_isaktif` tinyint(1) DEFAULT NULL COMMENT 'Tunjangan Pendidikan Lainnya',
  `gjt_tunj_makan` int(11) DEFAULT NULL COMMENT 'Tunjangan Makan',
  `gjt_tunj_trans` int(11) DEFAULT NULL COMMENT 'Tunjangan Transportasi',
  `gjt_hadir` int(11) DEFAULT NULL COMMENT 'kehadiran',
  `gjt_tunj_jab` int(11) DEFAULT NULL COMMENT 'Tunjangan Jabatan',
  `gjt_tunj_masker` int(11) DEFAULT NULL COMMENT 'Tunjangan Masa Kerja',
  `gjt_tunj_resiko` int(11) DEFAULT NULL COMMENT 'Tunjangan Resiko',
  `gjt_tunj_fung` int(11) DEFAULT NULL COMMENT 'Tunjangan Fungsional',
  `gjt_tunj_karier` int(11) DEFAULT NULL COMMENT 'Tunjangan Karier',
  `gjt_umk` int(11) DEFAULT NULL COMMENT 'Jasa pelayanan, khusus untuk dokter umum',
  `gjt_bpjs_jkk` int(11) DEFAULT NULL COMMENT 'BPJS Jaminan Kecelakaan Kerja',
  `gjt_bpjs_jkm` int(11) DEFAULT NULL COMMENT 'BPJS Jaminan Kematian',
  `gjt_bpjs_jht_rs` int(11) DEFAULT NULL COMMENT 'BPJS Jaminan Hari Tua yang dibayarkan Perusahan',
  `gjt_bpjs_rsbm` int(11) DEFAULT NULL COMMENT 'Total iuran BPJS yang dibayar perusahaan',
  `gjt_bpjs_jht_peg` int(11) DEFAULT NULL COMMENT 'BPJS Jaminan Hari Tua yang dibayarkan Pegawai',
  `gjt_bpjs_kes_rs` int(11) DEFAULT NULL COMMENT 'BPJS Jaminan Kesehatan yang dibayarkan Perusahan',
  `gjt_bpjs_kes_peg` int(11) DEFAULT NULL COMMENT 'BPJS Jaminan Kesehatan yang dibayarkan Pegawai',
  `gjt_pph_ptkp_status` int(11) DEFAULT NULL,
  `gjt_pph_hasil_bruto` int(11) DEFAULT NULL,
  `gjt_pph_biaya_jabatan` int(11) DEFAULT NULL,
  `gjt_pph_hasil_netto` int(11) DEFAULT NULL,
  `gjt_pph_ptkp` int(11) DEFAULT NULL COMMENT 'Penghasilan Tidak Kena Pajak',
  `gjt_pph_pkp` int(11) DEFAULT NULL COMMENT 'Penghasilan Kena Pajak',
  `gjt_pph_terhutang` int(11) DEFAULT NULL,
  `gjt_pph_isbayar` tinyint(4) DEFAULT 0 COMMENT 'Kondisi defaul = 0 -->  pph belum terbayar',
  `gjt_pot_simpan_kop` int(11) DEFAULT NULL COMMENT 'Simpanan pokok dan simpanan wajib koperasi',
  `gjt_pot_minimarket` int(11) DEFAULT NULL,
  `gjt_pot_premikes` int(11) DEFAULT NULL COMMENT 'Premi Kesehatan',
  `gjt_pot_jtrus` int(11) DEFAULT NULL,
  `gjt_pot_bri` int(11) DEFAULT NULL,
  `gjt_pot_bpd` int(11) DEFAULT NULL,
  `gjt_pot_obat` int(11) DEFAULT NULL,
  `gjt_pot_arisan` int(11) DEFAULT NULL,
  `gjt_pot_lainnya` int(11) DEFAULT NULL,
  `gj_insentif_bulan_lalu` int(11) DEFAULT NULL,
  `gj_bonus` int(11) DEFAULT NULL,
  `gj_thr` int(11) DEFAULT NULL,
  `gj_insentif_pajak` int(11) DEFAULT NULL,
  `gj_takehomepay` int(11) DEFAULT NULL,
  PRIMARY KEY (`peg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `tb_insentif_payroll` */

DROP TABLE IF EXISTS `tb_insentif_payroll`;

CREATE TABLE `tb_insentif_payroll` (
  `insentif_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `in_bulan` tinyint(4) DEFAULT NULL,
  `in_tahun` tinyint(4) DEFAULT NULL,
  `in_total` int(11) DEFAULT NULL COMMENT 'Total nilai insentif bulan ini',
  `in_persen_penghasil` tinyint(4) DEFAULT NULL,
  `in_persen_penunjang` tinyint(4) DEFAULT NULL,
  `in_persen_backoffice` tinyint(4) DEFAULT NULL,
  `in_peg_penghasil` smallint(6) DEFAULT NULL COMMENT 'Jumlah Karyawan Unit Penghasil',
  `in_peg_penunjang` smallint(6) DEFAULT NULL COMMENT 'Jumlah Karyawan Unit Penunjang',
  `in_peg_backoffice` smallint(6) DEFAULT NULL COMMENT 'Jumlah Karyawan Unit Back Office',
  `in_nominal_penghasil` int(11) DEFAULT NULL COMMENT 'Nominal Insentif untuk Pegawai Unit Penghasil',
  `in_nominal_peg_penunjang` int(11) DEFAULT NULL COMMENT 'Nominal Insentif untuk Pegawai Unit Penunjang',
  `in_nominal_peg_backoffice` int(11) DEFAULT NULL COMMENT 'Nominal Insentif untuk Pegawai Unit Back Office',
  PRIMARY KEY (`insentif_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `tb_setup_bpjs_payroll` */

DROP TABLE IF EXISTS `tb_setup_bpjs_payroll`;

CREATE TABLE `tb_setup_bpjs_payroll` (
  `bpjs_jkk` float DEFAULT NULL COMMENT 'Prosentase Jaminan Kecelakaan Kerja',
  `bpjs_jkm` float DEFAULT NULL COMMENT 'Prosentase Jaminan Kematian',
  `bpjs_jht_rs` float DEFAULT NULL COMMENT 'Prosentase Jaminan Hari Tua yang dibayarkan Perusahaan',
  `bpjs_jht_peg` float DEFAULT NULL COMMENT 'Prosentase Jaminan Hari Tua yang dibayarkan Pegawai',
  `bpjs_kes_rs` float DEFAULT NULL COMMENT 'Prosentase Iuran Jaminan Kesehatan yang dibayarkan Perusahaan',
  `bpjs_kes_peg` float DEFAULT NULL COMMENT 'Prosentase Iuran Jaminan Kesehatan yang dibayarkan Pegawai',
  `bpjs_isaktif` tinyint(4) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `tb_setup_pkp_payroll` */

DROP TABLE IF EXISTS `tb_setup_pkp_payroll`;

CREATE TABLE `tb_setup_pkp_payroll` (
  `pkp_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `pkp_tahun` year(4) DEFAULT NULL,
  `pkp_tarif1` int(11) DEFAULT NULL,
  `pkp_batas1` int(11) DEFAULT NULL,
  `pkp_tarif2` int(11) DEFAULT NULL,
  `pkp_batas2` int(11) DEFAULT NULL,
  `pkp_tarif3` int(11) DEFAULT NULL,
  `pkp_batas3` int(11) DEFAULT NULL,
  `pkp_tarif4` int(11) DEFAULT NULL,
  `pkp_batas4` int(11) DEFAULT NULL,
  `pkp_tarif5` int(11) DEFAULT NULL,
  `pkp_batas5` int(11) DEFAULT NULL,
  `pkp_non_npwp` int(11) DEFAULT NULL,
  `pkp_isaktif` tinyint(4) DEFAULT 1,
  PRIMARY KEY (`pkp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Table structure for table `tb_setup_ptkp_payroll` */

DROP TABLE IF EXISTS `tb_setup_ptkp_payroll`;

CREATE TABLE `tb_setup_ptkp_payroll` (
  `ptkp_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `ptkp_tahun` year(4) DEFAULT NULL,
  `ptkp_tk0` int(11) DEFAULT NULL,
  `ptkp_tk1` int(11) DEFAULT NULL,
  `ptkp_tk2` int(11) DEFAULT NULL,
  `ptkp_tk3` int(11) DEFAULT NULL,
  `ptkp_k0` int(11) DEFAULT NULL,
  `ptkp_k1` int(11) DEFAULT NULL,
  `ptkp_k2` int(11) DEFAULT NULL,
  `ptkp_k3` int(11) DEFAULT NULL,
  `ptkp_ki0` int(11) DEFAULT NULL,
  `ptkp_ki1` int(11) DEFAULT NULL,
  `ptkp_ki2` int(11) DEFAULT NULL,
  `ptkp_ki3` int(11) DEFAULT NULL,
  `ptkp_isaktif` tinyint(4) DEFAULT 1,
  PRIMARY KEY (`ptkp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Table structure for table `tb_thr_payroll` */

DROP TABLE IF EXISTS `tb_thr_payroll`;

CREATE TABLE `tb_thr_payroll` (
  `peg_id` int(11) NOT NULL,
  `peg_unit_id` smallint(6) DEFAULT NULL,
  `peg_npwp` int(11) DEFAULT NULL,
  `thr_bulan` int(11) DEFAULT NULL,
  `thr_tahun` int(11) DEFAULT NULL,
  `thr_gapok` int(11) DEFAULT NULL,
  `thr_lembur` int(11) DEFAULT NULL,
  `thr_oncall` int(11) DEFAULT NULL,
  `thr_tunj_pend` int(11) DEFAULT NULL COMMENT 'Tunjangan Pendidikan Lainnya',
  `thr_tunj_makan` int(11) DEFAULT NULL COMMENT 'Tunjangan Makan',
  `thr_tunj_trans` int(11) DEFAULT NULL COMMENT 'Tunjangan Transportasi',
  `thr_hadir` int(11) DEFAULT NULL COMMENT 'Kehadiram',
  `thr_tunj_jab` int(11) DEFAULT NULL COMMENT 'Tunjangan Jabatan',
  `thr_tunj_masker` int(11) DEFAULT NULL COMMENT 'Tunjangan Masa Kerja',
  `thr_tunj_resiko` int(11) DEFAULT NULL COMMENT 'Tunjangan Resiko',
  `thr_tunj_fung` int(11) DEFAULT NULL COMMENT 'Tunjangan Fungsional',
  `thr_tunj_karier` int(11) DEFAULT NULL COMMENT 'Tunjangan Karier',
  `thr_UMK` int(11) DEFAULT NULL COMMENT 'Jasa pelayanan, khusus untuk dokter umum',
  `thr_pph_ptkp_status` int(11) DEFAULT NULL,
  `thr_pph_hasil_bruto` int(11) DEFAULT NULL,
  `thr_pph_biaya_jabatan` int(11) DEFAULT NULL,
  `thr_pph_hasil_netto` int(11) DEFAULT NULL,
  `thr_pph_ptkp` int(11) DEFAULT NULL COMMENT 'Penghasilan Tidak Kena Pajak',
  `thr_pph_pkp` int(11) DEFAULT NULL COMMENT 'Penghasilan Kena Pajak',
  `thr_pph_terhutang` int(11) DEFAULT NULL,
  `thr_pph_isbayar` tinyint(4) DEFAULT NULL COMMENT 'Kondisi defaul = 0 -->  pph belum terbayar',
  PRIMARY KEY (`peg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `temp_form_contoh` */

DROP TABLE IF EXISTS `temp_form_contoh`;

CREATE TABLE `temp_form_contoh` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `no_rm` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_pasien',
  `layanan_id` bigint(20) DEFAULT NULL COMMENT 't_layanan',
  `nomor_registrasi` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `keluhan_utama` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `alergi_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `alergi_obat_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `alergi_makanan_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `alergi_udara_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `alergi_debu_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `alergi_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `fu_gizi_id` tinyint(4) DEFAULT NULL COMMENT 'm_ref group_id=338',
  `riwayat_penyakit_keluarga` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `riwayat_pengobatan` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `penyakit_sekarang` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `hipertensi_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `diabetes_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `jantung_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `stroke_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `ginjal_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `asma_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `kejang_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `liver_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `cancer_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `tbc_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `glukoma_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `std_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `pendarahan_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `lainnya_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `riwayat_penyakit_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `operasi_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `operasi_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `tranfusi_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `reaksi_transfusi_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `reaksi_transfusi_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `diagnosa_primer` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `icd10_primer_kode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_icd',
  `diagnosa_banding` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `icd10_banding_kode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry:m_icd',
  `pemeriksaan_penunjang` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `rencana_asuhan` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `rekomendasi_dokter` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `disposisi_id` tinyint(1) DEFAULT NULL COMMENT '1=pulang, 2=kontrol, 3=rawat, 4=rujuk',
  `pulang_id` tinyint(4) DEFAULT NULL COMMENT 'tidak dipakai, m_yesno',
  `pulang_datetime` datetime DEFAULT NULL COMMENT 'entry',
  `kontrol_id` tinyint(4) DEFAULT NULL COMMENT 'tidak dipakai, m_yesno',
  `kontrol_kronis_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `kontrol_datetime` datetime DEFAULT NULL COMMENT 'entry',
  `rawat_id` tinyint(4) DEFAULT NULL COMMENT 'tidak dipakai, m_yesno',
  `rawat_subunit_id` int(11) DEFAULT NULL COMMENT 'm_subunit_medik',
  `rawat_ruangan` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry;m_subunit_medik',
  `rujuk_id` tinyint(4) DEFAULT NULL COMMENT 'tidak dipakai, m_yesno',
  `alergi_lainnya_id` tinyint(4) DEFAULT NULL,
  `fu_td_sistole` int(11) DEFAULT NULL COMMENT 'entry',
  `fu_td_diastole` int(11) DEFAULT NULL COMMENT 'entry',
  `fu_rr` int(11) DEFAULT NULL COMMENT 'entry',
  `fu_nadi` int(11) DEFAULT NULL COMMENT 'entry',
  `fu_suhu` float DEFAULT NULL COMMENT 'entry',
  `fu_keadaan_umum_id` tinyint(4) DEFAULT NULL COMMENT 'm_ref group_id=337',
  `fu_gcs_e` smallint(6) DEFAULT NULL COMMENT 'entry',
  `fu_gcs_v` smallint(6) DEFAULT NULL COMMENT 'entry',
  `fu_gcs_m` smallint(6) DEFAULT NULL COMMENT 'entry',
  `fu_kepala_normal` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_kepala_mikro` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_kepala_makro` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_kepala_lainnya` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_kepala_ket` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `fu_mata_a` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_mata_i` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_mata_r` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_mata_o` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_mata_ket` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `fu_tht_te` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_tht_hi` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_tht_fa` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_tht_to` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_tht_ket` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `fu_gigi_no` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_gigi_lu` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_gigi_bd` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_gigi_gp` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_gigi_ket` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `fu_leher_k` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_leher_j` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_leher_l` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_leher_p` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_leher_ket` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `fu_thorax_sim` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_thorax_ket` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `fu_cor_s1s2` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `fu_cor_reg` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_pulmo_s` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_pulmo_r` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_pulmo_w` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_pulmo_l` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_pulmo_ket` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `fu_abdomen_dis` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_abdomen_dis_pm` tinyint(4) DEFAULT NULL COMMENT 'm_yesno;pilih plus (+) atau minus (-);pakai optionbox',
  `fu_abdomen_met` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_abdomen_met_pm` tinyint(4) DEFAULT NULL COMMENT 'm_yesno;pilih plus (+) atau minus (-);pakai optionbox',
  `fu_abdomen_per` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_abdomen_nmm` tinyint(4) DEFAULT NULL COMMENT 'm_ref group_id=344',
  `fu_abdomen_asc` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_abdomen_asc_pm` tinyint(4) DEFAULT NULL COMMENT 'm_yesno;pilih plus (+) atau minus (-);pakai optionbox',
  `fu_abdomen_nyeri` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_abdomen_nyeri_pm` tinyint(4) DEFAULT NULL COMMENT 'm_yesno;pilih plus (+) atau minus (-);pakai optionbox',
  `fu_abdomen_lokasi` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `fu_abdomen_hepar` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `fu_abdomen_lien` tinyint(100) DEFAULT NULL COMMENT 'm_yesno',
  `fu_abdomen_lien_ket` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `fu_extrim_h` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_extrim_o` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_extrim_r` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_extrim_l` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `fu_extrim_ket` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `fu_des` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'json data pemeriksaan fisik masing2 poli',
  `kontrol_subunit` int(10) DEFAULT NULL COMMENT 'm_subunit_medik',
  `kontrol_dokter_id` int(10) DEFAULT NULL COMMENT 'm_pegawai',
  `kontrol_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pulang_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `template_tabel` */

DROP TABLE IF EXISTS `template_tabel`;

CREATE TABLE `template_tabel` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `layanan_id` bigint(20) DEFAULT NULL,
  `no_rm` varchar(255) DEFAULT NULL,
  `nomor_registrasi` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `tri_catatan_perencanan_edukasi_terintegrasi` */

DROP TABLE IF EXISTS `tri_catatan_perencanan_edukasi_terintegrasi`;

CREATE TABLE `tri_catatan_perencanan_edukasi_terintegrasi` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `no_rm` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'dari tabel t_layanan',
  `nomor_registrasi` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'dari tabel t_layanan',
  `layanan_id` bigint(20) unsigned NOT NULL COMMENT 'dari tabel t_layanan',
  `subunit_id` int(11) NOT NULL COMMENT 'FK dari tabel dr m_subunit_medik, default nilai subunit_id di t_layanan',
  `kamar` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dokter_pa` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'PENJELASAN : Diagnosis (diagnosis kerja) dan dasar diagnosis, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `dokter_pb` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'PENJELASAN : Kondisi pasien, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `dokter_pc` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'PENJELASAN : Tindakan yang diusulkan, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `dokter_pd` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'PENJELASAN : Tata cara dan tujuan tindakan, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `dokter_pe` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'PENJELASAN : Manfaat dan resiko tindakan, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `dokter_pf` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'PENJELASAN : Mengenalkan pemberi tindakan, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `dokter_pg` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'PENJELASAN : Kemungkinan dan alternatif tindakan, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `dokter_ph` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'PENJELASAN : Prognosis dari tindakan, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `dokter_pi` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'PENJELASAN : Kemungkinan hasil yang tidak terduga, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `dokter_pj` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'PENJELASAN : Kemungkinan hasil bila tidak dilakukan tindakan, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `dokter_pk` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Penjelasan tambahan 1',
  `dokter_pl` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Penjelasan tambahan 2',
  `dokter_tanggal` date NOT NULL COMMENT 'Tanggal diberikannya catatan oleh dokter',
  `dokter_metode` enum('D (Diskusi)','Demo (Demonstrasi','C (Ceramah','S (Simulasi','O (Observasi','PL (Praktek Langsung)') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Metode edukasi oleh dokter, FK : tabel m_ref dengan group id 378',
  `dokter_durasi` int(11) NOT NULL COMMENT 'Durasi edukasi oleh dokter',
  `dokter_er1` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'KETERANGAN & EVALUASI RESPON : Tidak respon sama sekali, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `dokter_er2` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'KETERANGAN & EVALUASI RESPON : Tidak rpaham, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `dokter_er3` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'KETERANGAN & EVALUASI RESPON : Paham yang diajarkan tapi tidak bisa menjelaskan sendiri, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `dokter_er4` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'KETERANGAN & EVALUASI RESPON : Dapat menjelaskan apa yang diajarkan tapi dibantu, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `dokter_er5` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'KETERANGAN & EVALUASI RESPON : Dapat menjelaskan apa yang diajarkan tanpa dibantu, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `dokter_er6` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'KETERANGAN & EVALUASI RESPON : Mampu mendemonstrasikan, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `dokter_er7` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Keterangan tambahan 1',
  `dokter_er8` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Keterangan tambahan 2',
  `dokter_id` bigint(20) unsigned NOT NULL COMMENT 'Select dari m_pegawai, dengan id_jenis_profesi = 5',
  `dokter_status_ttd` tinyint(3) unsigned NOT NULL COMMENT '0-False/Tidak dittd dokter, 1-True/Ya sudah di ttd dokter',
  `dokter_fastcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Kode fastcode',
  `dokter_file_ttd` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'File tanda tangan',
  `dokter_keluarga_status_ttd_` tinyint(3) unsigned NOT NULL COMMENT '0-False/Tidak dittd, 1-True/Ya sudah di ttd',
  `dokter_keluarga_nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Nama pasien keluarga',
  `dokter_keluarga_fastcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Kode fastcode',
  `dokter_keluarga_file_ttd` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'File tanda tangan',
  `farmasi_pa` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'PENJELASAN : Nama obat dan kegunaannya, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `farmasi_pb` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'PENJELASAN : Aturan pemakaian dan dosis obat, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `farmasi_pc` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'PENJELASAN : Cara penyimpanan obat, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `farmasi_pd` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'PENJELASAN : Efek samping obat yang diberikan, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `farmasi_pe` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'PENJELASAN : Kontradiksi obat yang diberikan, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `farmasi_erf` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Keterangan tambahan 1',
  `farmasi_erg` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Keterangan tambahan 2',
  `farmasi_tanggal` date NOT NULL COMMENT 'Tanggal diberikannya catatan oleh farmasi',
  `farmasi_metode` enum('D (Diskusi)','Demo (Demonstrasi','C (Ceramah','S (Simulasi','O (Observasi','PL (Praktek Langsung)') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Metode edukasi oleh dokter, FK : tabel m_ref dengan group id 378',
  `farmasi_durasi` int(11) NOT NULL COMMENT 'Durasi edukasi oleh farmasi',
  `farmasi_er1` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'KETERANGAN & EVALUASI RESPON : Tidak respon sama sekali, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `farmasi_er2` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'KETERANGAN & EVALUASI RESPON : Tidak rpaham, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `farmasi_er3` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'KETERANGAN & EVALUASI RESPON : Paham yang diajarkan tapi tidak bisa menjelaskan sendiri, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `farmasi_er4` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'KETERANGAN & EVALUASI RESPON : Dapat menjelaskan apa yang diajarkan tapi dibantu, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `farmasi_er5` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'KETERANGAN & EVALUASI RESPON : Dapat menjelaskan apa yang diajarkan tanpa dibantu, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `farmasi_er6` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'KETERANGAN & EVALUASI RESPON : Mampu mendemonstrasikan, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `farmasi_er7` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT 'Keterangan tambahan 1',
  `farmasi_er8` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT 'Keterangan tambahan 2',
  `farmasi_id` bigint(20) unsigned NOT NULL COMMENT 'Select dari m_pegawai, dengan id_jenis_profesi = 5',
  `farmasi_status_ttd` tinyint(3) unsigned NOT NULL COMMENT '0-False/Tidak dittd dokter, 1-True/Ya sudah di ttd farmasi',
  `farmasi_fastcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Kode fastcode',
  `farmasi_file_ttd` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'File tanda tangan',
  `farmasi_keluarga_status_ttd_` tinyint(3) unsigned NOT NULL COMMENT '0-False/Tidak dittd, 1-True/Ya sudah di ttd keluarga',
  `farmasi_keluarga_nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Nama pasien keluarga',
  `farmasi_keluarga_fastcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Kode fastcode',
  `farmasi_keluarga_file_ttd` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'File tanda tangan',
  `perawat_bidan_pa` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'PENJELASAN : Pendidikan kesehatan tentang asuhan keperawatan, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `perawat_bidan_pa_ket1` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Keterangan 1',
  `perawat_bidan_pa_ket2` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Keterangan 2',
  `perawat_bidan_pb` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'PENJELASAN : Penanganan dan cara perawatan dirumaht, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `perawat_bidan_pc` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'PENJELASAN : Perawatan luka, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `perawat_bidan_pd` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'PENJELASAN : Alat-alat yang perlu disiapkan dirumah, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `perawat_bidan_pe` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'PENJELASAN : Keamatan penggunaan alat-alat kesehatan, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `perawat_bidan_pf` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'PENJELASAN : Keamatan lingkungan perawatan dirumah, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `perawat_bidan_tanggal` date NOT NULL COMMENT 'Tanggal diberikannya catatan oleh perawat_bidan',
  `perawat_bidan_metode` enum('D (Diskusi)','Demo (Demonstrasi','C (Ceramah','S (Simulasi','O (Observasi','PL (Praktek Langsung)') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Metode edukasi oleh dokter, FK : tabel m_ref dengan group id 378',
  `perawat_bidan_durasi` int(11) NOT NULL COMMENT 'Durasi edukasi oleh perawat_bidan',
  `perawat_bidan_er1` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'KETERANGAN & EVALUASI RESPON : Tidak respon sama sekali, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `perawat_bidan_er2` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'KETERANGAN & EVALUASI RESPON : Tidak rpaham, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `perawat_bidan_er3` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'KETERANGAN & EVALUASI RESPON : Paham yang diajarkan tapi tidak bisa menjelaskan sendiri, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `perawat_bidan_er4` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'KETERANGAN & EVALUASI RESPON : Dapat menjelaskan apa yang diajarkan tapi dibantu, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `perawat_bidan_er5` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'KETERANGAN & EVALUASI RESPON : Dapat menjelaskan apa yang diajarkan tanpa dibantu, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `perawat_bidan_er6` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'KETERANGAN & EVALUASI RESPON : Mampu mendemonstrasikan, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `perawat_bidan_er7` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT 'Keterangan tambahan 1',
  `perawat_bidan_er8` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT 'Keterangan tambahan 2',
  `perawat_bidan_id` bigint(20) unsigned NOT NULL COMMENT 'Select dari m_pegawai, dengan id_jenis_profesi = 5',
  `perawat_bidan_status_ttd` tinyint(3) unsigned NOT NULL COMMENT '0-False/Tidak dittd dokter, 1-True/Ya sudah di ttd perawat_bidan',
  `perawat_bidan_fastcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Kode fastcode',
  `perawat_bidan_file_ttd` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'File tanda tangan',
  `perawat_bidan_keluarga_status_ttd_` tinyint(3) unsigned NOT NULL COMMENT '0-False/Tidak dittd, 1-True/Ya sudah di ttd',
  `perawat_bidan_keluarga_nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Pasien nama keluarga',
  `perawat_bidan_keluarga_fastcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Kode fastcode',
  `perawat_bidan_keluarga_file_ttd` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'File tanda tangan',
  `hand_hygine` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'PENJELASAN : Pendidikan kesehatan tentang asuhan keperawatan, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `hand_hygine_tanggal` date NOT NULL COMMENT 'Tanggal diberikannya catatan oleh perawat_bidan',
  `hand_hygine_metode` enum('D (Diskusi)','Demo (Demonstrasi','C (Ceramah','S (Simulasi','O (Observasi','PL (Praktek Langsung)') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Metode edukasi oleh hand_hygine, FK : tabel m_ref dengan group id 378',
  `hand_hygine_durasi` int(11) NOT NULL COMMENT 'Durasi edukasi oleh perawat_bidan',
  `hand_hygine_er1` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'KETERANGAN & EVALUASI RESPON : Tidak respon sama sekali, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `hand_hygine_er2` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'KETERANGAN & EVALUASI RESPON : Tidak rpaham, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `hand_hygine_er3` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'KETERANGAN & EVALUASI RESPON : Paham yang diajarkan tapi tidak bisa menjelaskan sendiri, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `hand_hygine_er4` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'KETERANGAN & EVALUASI RESPON : Dapat menjelaskan apa yang diajarkan tapi dibantu, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `hand_hygine_er5` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'KETERANGAN & EVALUASI RESPON : Dapat menjelaskan apa yang diajarkan tanpa dibantu, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `hand_hygine_er6` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'KETERANGAN & EVALUASI RESPON : Mampu mendemonstrasikan, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `hand_hygine_er7` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT 'Keterangan tambahan 1',
  `hand_hygine_er8` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT 'Keterangan tambahan 2',
  `hand_hygine_id` bigint(20) unsigned NOT NULL COMMENT 'Select dari m_pegawai, dengan id_jenis_profesi = 5',
  `hand_hygine_status_ttd` tinyint(3) unsigned NOT NULL COMMENT '0-False/Tidak dittd hand_hygine, 1-True/Ya sudah di ttd hand_hygine',
  `hand_hygine_fastcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Kode fastcode',
  `hand_hygine_file_ttd` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'File tanda tangan',
  `hand_hygine_keluarga_status_ttd_` tinyint(3) unsigned NOT NULL COMMENT '0-False/Tidak dittd, 1-True/Ya sudah di ttd',
  `hand_hygine_keluarga_nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Pasien nama keluarga',
  `hand_hygine_keluarga_fastcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Kode fastcode',
  `hand_hygine_keluarga_file_ttd` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'File tanda tangan',
  `nutrisi_gizi_pa` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'PENJELASAN : Diet dan nutrisi/spesifik dengan penyakit yang diderita, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `nutrisi_gizi_pb` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'PENJELASAN : Penyuluhan nutrisi, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `nutrisi_gizi_pc` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'PENJELASAN : Konseling laktasi, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `nutrisi_gizi_pd` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT 'Keterangan tambahan 1',
  `nutrisi_gizi_pe` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT 'Keterangan tambahan 2',
  `nutrisi_gizi_tanggal` date NOT NULL COMMENT 'Tanggal diberikannya catatan oleh nutrisi_gizi',
  `nutrisi_gizi_metode` enum('D (Diskusi)','Demo (Demonstrasi','C (Ceramah','S (Simulasi','O (Observasi','PL (Praktek Langsung)') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Metode edukasi oleh nutrisi_gizi, FK : tabel m_ref dengan group id 378',
  `nutrisi_gizi_durasi` int(11) NOT NULL COMMENT 'Durasi edukasi oleh nutrisi_gizi',
  `nutrisi_gizi_er1` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'KETERANGAN & EVALUASI RESPON : Tidak respon sama sekali, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `nutrisi_gizi_er2` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'KETERANGAN & EVALUASI RESPON : Tidak paham, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `nutrisi_gizi_er3` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'KETERANGAN & EVALUASI RESPON : Dapat menjelaskan apa yang diajarkan tentang nutrisi dan kebutuhan diet, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `nutrisi_gizi_er4` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'KETERANGAN & EVALUASI RESPON : Mampu mendemonstrasikan, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `nutrisi_gizi_er5` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT 'Keterangan tambahan 1',
  `nutrisi_gizi_er6` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT 'Keterangan tambahan 2',
  `nutrisi_gizi_id` bigint(20) unsigned NOT NULL COMMENT 'Select dari m_pegawai, dengan id_jenis_profesi = 5',
  `nutrisi_gizi_status_ttd` tinyint(3) unsigned NOT NULL COMMENT '0-False/Tidak dittd nutrisi_gizi, 1-True/Ya sudah di ttd nutrisi_gizi',
  `nutrisi_gizi_fastcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Kode fastcode',
  `nutrisi_gizi_file_ttd` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'File tanda tangan',
  `nutrisi_gizi_status_ttd_` tinyint(3) unsigned NOT NULL COMMENT '0-False/Tidak dittd, 1-True/Ya sudah di ttd',
  `nutrisi_gizi_keluarga_nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Pasien nama keluarga',
  `nutrisi_gizi_keluarga_fastcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Kode fastcode',
  `nutrisi_gizi_keluarga_file_ttd` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'File tanda tangan',
  `manajemen_nyeri_pa` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'PENJELASAN : Farmakologi, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `manajemen_nyeri_pb` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'PENJELASAN : Non Farmakologi, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `manajemen_nyeri_tanggal` date NOT NULL COMMENT 'Tanggal diberikannya catatan oleh nutrisi_gizi',
  `manajemen_nyeri_metode` enum('D (Diskusi)','Demo (Demonstrasi','C (Ceramah','S (Simulasi','O (Observasi','PL (Praktek Langsung)') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Metode edukasi oleh nutrisi_gizi, FK : tabel m_ref dengan group id 378',
  `manajemen_nyeri_durasi` int(11) NOT NULL COMMENT 'Durasi edukasi oleh nutrisi_gizi',
  `manajemen_nyeri_er1` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'KETERANGAN & EVALUASI RESPON : Tidak respon sama sekali, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `manajemen_nyeri_er2` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'KETERANGAN & EVALUASI RESPON : Tidak paham, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `manajemen_nyeri_er3` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'KETERANGAN & EVALUASI RESPON : Dapat menjelaskan apa yang diajarkan tentang manajemen nyeri, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `manajemen_nyeri_er4` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'KETERANGAN & EVALUASI RESPON : Mampu mendemonstrasikan, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `manajemen_nyeri_er5` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT 'Keterangan tambahan 1',
  `manajemen_nyeri_er6` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT 'Keterangan tambahan 2',
  `manajemen_nyeri_id` bigint(20) unsigned NOT NULL COMMENT 'Select dari m_pegawai, dengan id_jenis_profesi = 5',
  `manajemen_nyeri_status_ttd` tinyint(3) unsigned NOT NULL COMMENT '0-False/Tidak dittd nutrisi_gizi, 1-True/Ya sudah di ttd manajemen_nyeri',
  `manajemen_nyeri_fastcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Kode fastcode',
  `manajemen_nyeri_file_ttd` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'File tanda tangan',
  `manajemen_nyeri_status_ttd_` tinyint(3) unsigned NOT NULL COMMENT '0-False/Tidak dittd, 1-True/Ya sudah di ttd',
  `manajemen_keluarga_nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Pasien nama keluarga',
  `manajemen_nyeri_keluarga_fastcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Kode fastcode',
  `manajemen_nyeri_keluarga_file_ttd` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'File tanda tangan',
  `manajemen_resiko_pa` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'PENJELASAN : Keselamatan dan keamanan, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `manajemen_resiko_pb` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'PENJELASAN : B3 dan limbahnya, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `manajemen_resiko_pc` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'PENJELASAN : Penanggulangan bencana, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `manajemen_resiko_pd` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'PENJELASAN : Proteksi Kebakaran, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `manajemen_resiko_pe` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'PENJELASAN : Peralatan Medis, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `manajemen_resiko_pf` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'PENJELASAN : Sistem penunjang, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `manajemen_resiko_tanggal` date NOT NULL COMMENT 'Tanggal diberikannya catatan oleh manajemen_resiko',
  `manajemen_resiko_metode` enum('D (Diskusi)','Demo (Demonstrasi','C (Ceramah','S (Simulasi','O (Observasi','PL (Praktek Langsung)') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Metode edukasi oleh manajemen_resiko, FK : tabel m_ref dengan group id 378',
  `manajemen_resiko_durasi` int(11) NOT NULL COMMENT 'Durasi edukasi oleh manajemen_resiko',
  `manajemen_resiko_er1` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'KETERANGAN & EVALUASI RESPON : Tidak respon sama sekali, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `manajemen_resiko_er2` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'KETERANGAN & EVALUASI RESPON : Tidak rpaham, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `manajemen_resiko_er3` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'KETERANGAN & EVALUASI RESPON : Paham yang diajarkan tapi tidak bisa menjelaskan sendiri, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `manajemen_resiko_er4` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'KETERANGAN & EVALUASI RESPON : Dapat menjelaskan apa yang diajarkan tapi dibantu, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `manajemen_resiko_er5` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'KETERANGAN & EVALUASI RESPON : Dapat menjelaskan apa yang diajarkan tanpa dibantu, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `manajemen_resiko_er6` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'KETERANGAN & EVALUASI RESPON : Mampu mendemonstrasikan, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `manajemen_resiko_er7` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT 'Keterangan tambahan 1',
  `manajemen_resiko_er8` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT 'Keterangan tambahan 2',
  `manajemen_resiko_id` bigint(20) unsigned NOT NULL COMMENT 'Select dari m_pegawai, dengan id_jenis_profesi = 5',
  `manajemen_resiko_status_ttd` tinyint(3) unsigned NOT NULL COMMENT '0-False/Tidak dittd nutrisi_gizi, 1-True/Ya sudah di ttd manajemen_resiko',
  `manajemen_resiko_fastcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Kode fastcode',
  `manajemen_resiko_file_ttd` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'File tanda tangan',
  `manajemen_resiko_status_ttd_` tinyint(3) unsigned NOT NULL COMMENT '0-False/Tidak dittd, 1-True/Ya sudah di ttd',
  `manajemen_resiko_keluarga_nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Pasien nama keluarga',
  `manajemen_resiko_keluarga_fastcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Kode fastcode',
  `manajemen_resiko_keluarga_file_ttd` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'File tanda tangan',
  `rehabilitasi_medis_pa` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'PENJELASAN : FT/fisioterapi, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `rehabilitasi_medis_pb` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'PENJELASAN : UV terapi, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `rehabilitasi_medis_pc` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'PENJELASAN : Terapi occupasi, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `rehabilitasi_medis_tanggal` date NOT NULL COMMENT 'Tanggal diberikannya catatan oleh rehabilitasi_medis',
  `rehabilitasi_medis_metode` enum('D (Diskusi)','Demo (Demonstrasi','C (Ceramah','S (Simulasi','O (Observasi','PL (Praktek Langsung)') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Metode edukasi oleh rehabilitasi_medis, FK : tabel m_ref dengan group id 378',
  `rehabilitasi_medis_durasi` int(11) NOT NULL COMMENT 'Durasi edukasi oleh rehabilitasi_medis',
  `rehabilitasi_medis_er1` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'KETERANGAN & EVALUASI RESPON : Tidak respon sama sekali, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `rehabilitasi_medis_er2` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'KETERANGAN & EVALUASI RESPON : Tidak rpaham, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `rehabilitasi_medis_er3` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'KETERANGAN & EVALUASI RESPON : Paham yang diajarkan tapi tidak bisa menjelaskan sendiri, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `rehabilitasi_medis_er4` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'KETERANGAN & EVALUASI RESPON : Dapat menjelaskan apa yang diajarkan tapi dibantu, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `rehabilitasi_medis_er5` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'KETERANGAN & EVALUASI RESPON : Dapat menjelaskan apa yang diajarkan tanpa dibantu, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `rehabilitasi_medis_er6` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'KETERANGAN & EVALUASI RESPON : Mampu mendemonstrasikan, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `rehabilitasi_medis_er7` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT 'Keterangan tambahan 1',
  `rehabilitasi_medis_er8` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT 'Keterangan tambahan 2',
  `rehabilitasi_medis_id` bigint(20) unsigned NOT NULL COMMENT 'Select dari m_pegawai, dengan id_jenis_profesi = 5',
  `rehabilitasi_medis_status_ttd` tinyint(3) unsigned NOT NULL COMMENT '0-False/Tidak dittd nutrisi_gizi, 1-True/Ya sudah di ttd rehabilitasi_medis',
  `rehabilitasi_medis_fastcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Kode fastcode',
  `rehabilitasi_medis_file_ttd` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'File tanda tangan',
  `rehabilitasi_medis_status_ttd_` tinyint(3) unsigned NOT NULL COMMENT '0-False/Tidak dittd, 1-True/Ya sudah di ttd',
  `rehabilitasi_medis_keluarga_nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Pasien nama keluarga',
  `rehabilitasi_medis_keluarga_fastcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Kode fastcode',
  `rehabilitasi_medis_keluarga_file_ttd` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'File tanda tangan',
  `rohaniawan_pa` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'PENJELASAN : Bimbingan rohani, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `rohaniawan_pb` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'PENJELASAN : Konseling rohani, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `rohaniawan_tanggal` date NOT NULL COMMENT 'Tanggal diberikannya catatan oleh rehabilitasi_medis',
  `rohaniawan_metode` enum('D (Diskusi)','Demo (Demonstrasi','C (Ceramah','S (Simulasi','O (Observasi','PL (Praktek Langsung)') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Metode edukasi oleh rohaniawan, FK : tabel m_ref dengan group id 378',
  `rohaniawan_durasi` int(11) NOT NULL COMMENT 'Durasi edukasi oleh rohaniawan',
  `rohaniawan_er1` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'KETERANGAN & EVALUASI RESPON : Dapat menjelaskan bimbingan yang diberikan, nilai 1 (jika dipilih) dan 0 (jika tidak dipilih)',
  `rohaniawan_id` bigint(20) unsigned NOT NULL COMMENT 'Select dari m_pegawai, dengan id_jenis_profesi = 5',
  `rohaniawan_status_ttd` tinyint(3) unsigned NOT NULL COMMENT '0-False/Tidak dittd nutrisi_gizi, 1-True/Ya sudah di ttd rohaniawan',
  `rohaniawan_fastcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Kode fastcode',
  `rohaniawan_file_ttd` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'File tanda tangan',
  `rohaniawan_status_ttd_` tinyint(3) unsigned NOT NULL COMMENT '0-False/Tidak dittd, 1-True/Ya sudah di ttd',
  `rohaniawan_keluarga_nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Pasien nama keluarga',
  `rohaniawan_keluarga_fastcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Kode fastcode',
  `rohaniawan_keluarga_file_ttd` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'File tanda tangan',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tri_catatan_perencanan_edukasi_terintegrasi_d` */

DROP TABLE IF EXISTS `tri_catatan_perencanan_edukasi_terintegrasi_d`;

CREATE TABLE `tri_catatan_perencanan_edukasi_terintegrasi_d` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tri_catatan_perencanan_edukasi_terintegrasi_id` bigint(20) NOT NULL,
  `tanggal` date NOT NULL,
  `edukasi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `edukasi_id` int(11) NOT NULL COMMENT 'Siapa yang diedukasi, FK diambil dari table m_ref dengan group_id=377',
  `tempat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Tempat dilakukan edukasi',
  `metode_id` int(11) NOT NULL COMMENT 'Metode media edukasi, FK diambil dari table m_ref dengan group_id=378',
  `respon_id` int(11) NOT NULL COMMENT 'Respon edukasi, FK diambil dari table m_ref dengan group_id=379',
  `edukator_id` int(11) NOT NULL COMMENT 'FK dari table m_pegawai',
  `edukator_status_ttd` tinyint(3) unsigned NOT NULL COMMENT '0-False/Tidak dittd dokter, 1-True/Ya sudah di ttd dokter',
  `edukator_fastcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Kode fastcode',
  `edukator_file_ttd` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'File tanda tangan',
  `edukator_bidang_disiplin` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Bidang disiplin dari edukator',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tri_cppt` */

DROP TABLE IF EXISTS `tri_cppt`;

CREATE TABLE `tri_cppt` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `layanan_id` bigint(20) DEFAULT NULL COMMENT 't_layanan',
  `nomor_registrasi` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 't_layanan',
  `no_rm` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 't_layanan',
  `tanggal` date DEFAULT NULL COMMENT 'entry',
  `jam` time DEFAULT NULL COMMENT 'entry',
  `profesi_id` int(11) DEFAULT NULL COMMENT 'm_jenis_profesi dengan kelompok_profesi_id = 5',
  `petugas_id` int(11) DEFAULT NULL COMMENT 'm_pegawai dengan kelompok_jenis_profesi_Id = 1; default petugas saaat ini',
  `subjektif` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `objektif` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `assesment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `plan` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `intruksi` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `statut_ttd` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `passcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `file_ttd` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tri_dokter_pengganti` */

DROP TABLE IF EXISTS `tri_dokter_pengganti`;

CREATE TABLE `tri_dokter_pengganti` (
  `t_fdp_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `layanan_id` varchar(20) DEFAULT NULL,
  `no_registrasi` varchar(20) DEFAULT NULL,
  `no_rm` varchar(20) DEFAULT NULL,
  `subunit_id` int(11) DEFAULT NULL COMMENT 'FK dari m_subunit_medik',
  `kamar` varchar(6) DEFAULT NULL,
  `t_fdp_alasan` varchar(255) DEFAULT NULL COMMENT 'Alasan mengganti dokter DPJP',
  `t_fdp_tgl_surat` date DEFAULT NULL COMMENT 'Tanggal Surat',
  `t_fdp_tgl_mulai` date DEFAULT NULL COMMENT 'Tanggal mulai diganti',
  `t_fdp_tgl_sampai` date DEFAULT NULL COMMENT 'Tanggal diganti sampai',
  `dpjp_petugas_id` int(11) DEFAULT NULL COMMENT 'm_pegawai, Dokter yang merawat / DPJP, id = 5',
  `dpjp_petugas_status_ttd` tinyint(4) DEFAULT NULL,
  `dpjp_petugas_passcode` varchar(255) DEFAULT NULL,
  `dpjp_petugas_file_ttd` varchar(255) DEFAULT NULL,
  `pengganti_petugas_id` int(11) DEFAULT NULL COMMENT 'm_pegawai, Dokter Pengganti, id = 5',
  `pengganti_petugas_status_ttd` tinyint(4) DEFAULT NULL,
  `pengganti_petugas_passcode` varchar(255) DEFAULT NULL,
  `pengganti_petugas_file_ttd` varchar(255) DEFAULT NULL,
  `manajemnrs_pegawai_id` int(11) DEFAULT NULL COMMENT 'm_pegawai, Manajemen Rumah Sakit',
  `manajemnrs_status_ttd` tinyint(4) DEFAULT NULL,
  `manajemnrs_pegawai_passcode` varchar(255) DEFAULT NULL,
  `manajemnrs_pegawai_file_ttd` varchar(255) DEFAULT NULL,
  `t_fdp_hubungan_kerabat_id` tinyint(4) DEFAULT 0 COMMENT 'FK Tabel m_hubungan_kerabat, 0 = Saya (Pasien sendiri);',
  `t_fdp_nama_penandatangan` varchar(50) DEFAULT NULL COMMENT 'Pihak Penandatangan, kalau pasien, otomatis diisi nama pasien',
  `penandatangan_status_ttd` tinyint(4) DEFAULT NULL,
  `penandatangan_passcode` varchar(255) DEFAULT NULL,
  `penandatangan_file_ttd` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`t_fdp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `tri_ijin_pulang_sementara` */

DROP TABLE IF EXISTS `tri_ijin_pulang_sementara`;

CREATE TABLE `tri_ijin_pulang_sementara` (
  `t_ips_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `layanan_id` varchar(20) DEFAULT NULL,
  `no_registrasi` varchar(20) DEFAULT NULL,
  `no_rm` varchar(20) DEFAULT NULL,
  `subunit_id` int(11) DEFAULT NULL COMMENT 'FK dari m_subunit_medik',
  `kamar` varchar(6) DEFAULT NULL,
  `t_ips_kepentingan` varchar(100) DEFAULT NULL COMMENT 'Kepentingan',
  `t_ips_lama` tinyint(4) DEFAULT NULL COMMENT 'lama kepulangan dalam satuan jam',
  `t_ips_tgl` date DEFAULT NULL,
  `petugas_id` int(11) DEFAULT NULL COMMENT 'm_pegawai, Dokter yang merawat / DPJP, id = 5',
  `petugas_status_ttd` tinyint(4) DEFAULT NULL,
  `petugas_passcode` varchar(255) DEFAULT NULL,
  `petugas_file_ttd` varchar(255) DEFAULT NULL,
  `t_ips_hubungan_kerabat_id` tinyint(4) DEFAULT 0 COMMENT 'FK Tabel m_hubungan_kerabat, 0 = Saya (Pasien sendiri);',
  `t_ips_nama_ttd` varchar(50) DEFAULT NULL COMMENT 'Nama penandatangan, kalau pasien langsung bisa diisi nama pasien',
  `penandatangan_status_ttd` tinyint(4) DEFAULT NULL,
  `penandatangan_passcode` varchar(255) DEFAULT NULL,
  `penandatangan_file_ttd` varchar(255) DEFAULT NULL,
  `kaunit__id` int(11) DEFAULT NULL COMMENT 'm_pegawai, Kepala Unit',
  `kaunit_status_ttd` tinyint(4) DEFAULT NULL,
  `kaunit_passcode` varchar(255) DEFAULT NULL,
  `kaunit_file_ttd` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`t_ips_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `tri_ijin_pulang_waktutertentu` */

DROP TABLE IF EXISTS `tri_ijin_pulang_waktutertentu`;

CREATE TABLE `tri_ijin_pulang_waktutertentu` (
  `t_ipjwt_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `layanan_id` varchar(20) DEFAULT NULL,
  `no_registrasi` varchar(20) DEFAULT NULL,
  `no_rm` varchar(20) DEFAULT NULL,
  `subunit_id` int(11) DEFAULT NULL COMMENT 'FK dari m_subunit_medik',
  `kamar` varchar(6) DEFAULT NULL,
  `t_ipjwt_kepentingan` varchar(100) DEFAULT NULL COMMENT 'Kepentingan',
  `t_ipjwt_lama` tinyint(4) DEFAULT NULL COMMENT 'lama kepulangan dalam satuan hari',
  `t_ipjwt_tgl` date DEFAULT NULL,
  `petugas_id` int(11) DEFAULT NULL COMMENT 'm_pegawai, Dokter yang merawat / DPJP, id = 5',
  `petugas_status_ttd` tinyint(4) DEFAULT NULL,
  `petugas_passcode` varchar(255) DEFAULT NULL,
  `petugas_file_ttd` varchar(255) DEFAULT NULL,
  `kaunit_pegawai_id` int(11) DEFAULT NULL COMMENT 'm_pegawai, Kepala Unit',
  `kaunit_status_ttd` tinyint(4) DEFAULT NULL,
  `kaunit_passcode` varchar(255) DEFAULT NULL,
  `kaunit_file_ttd` varchar(255) DEFAULT NULL,
  `t_ipjwt_penerima_keluarga` varchar(50) DEFAULT NULL COMMENT 'Pihak Penerima pasien, pihak kluarga pasien',
  `keluarga_status_ttd` tinyint(4) DEFAULT NULL,
  `keluarga_passcode` varchar(255) DEFAULT NULL,
  `keluarga_file_ttd` varchar(255) DEFAULT NULL,
  `t_ipjwt_penerima_petugas_id` varchar(50) DEFAULT NULL COMMENT 'Pihak Penerima Pasien, pihak Petugas',
  `penerima_petugas_status_ttd` tinyint(4) DEFAULT NULL,
  `penerima_petugas_passcode` varchar(255) DEFAULT NULL,
  `penerima_petugas_file_ttd` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`t_ipjwt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `tri_kie` */

DROP TABLE IF EXISTS `tri_kie`;

CREATE TABLE `tri_kie` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `layanan_id` bigint(20) DEFAULT NULL COMMENT 't_layanan',
  `nomor_registrasi` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 't_layanan',
  `no_rm` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 't_layanan',
  `tanggal` date DEFAULT NULL COMMENT 'entry',
  `jam` time DEFAULT NULL COMMENT 'entry',
  `kie` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `profesi_id` int(11) DEFAULT NULL COMMENT 'm_pegawai dengan kelompok_jenis_profesi_Id = 5; default petugas saaat ini',
  `petugas_id` int(11) DEFAULT NULL COMMENT 'm_pegawai dengan kelompok_jenis_profesi_Id = 5; default petugas saaat ini',
  `penerima_kie` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry (bisa pasien, keluarga)',
  `dokter_status_ttd` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `dokter_passcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `dokter_file_ttd` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `penerima_status_ttd` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `penerima_passcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `penerima_file_ttd` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tri_m_dx` */

DROP TABLE IF EXISTS `tri_m_dx`;

CREATE TABLE `tri_m_dx` (
  `mdx_id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT 'id diagnosa',
  `mdx_nama` varchar(100) DEFAULT NULL COMMENT 'Nama Diagnosa',
  `mdx_ket` varchar(255) DEFAULT NULL COMMENT 'Keterangan',
  `mdx_isaktif` tinyint(4) DEFAULT 1,
  PRIMARY KEY (`mdx_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `tri_m_ncp_head` */

DROP TABLE IF EXISTS `tri_m_ncp_head`;

CREATE TABLE `tri_m_ncp_head` (
  `mncphead_id` tinyint(4) NOT NULL AUTO_INCREMENT COMMENT 'id NCP Header',
  `mncphead_name` varchar(100) DEFAULT NULL COMMENT 'Header NCP',
  `ncp_isaktif` tinyint(4) DEFAULT 1,
  PRIMARY KEY (`mncphead_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `tri_mncp_intervensi_jenis` */

DROP TABLE IF EXISTS `tri_mncp_intervensi_jenis`;

CREATE TABLE `tri_mncp_intervensi_jenis` (
  `mncp_intervensi_jenis_id` tinyint(4) NOT NULL,
  `mncp_intervensi_jenis_nama` varchar(100) DEFAULT NULL,
  `mncp_isaktif` tinyint(4) DEFAULT 1,
  PRIMARY KEY (`mncp_intervensi_jenis_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `tri_mncp_tujuan` */

DROP TABLE IF EXISTS `tri_mncp_tujuan`;

CREATE TABLE `tri_mncp_tujuan` (
  `mncp_item_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id Intervensi NCP',
  `mdx_id` smallint(6) DEFAULT NULL COMMENT 'id diagnosa, FK dari m_dx',
  `mncp_head_id` tinyint(4) DEFAULT 0 COMMENT 'FK dari tri_mncp_head',
  `mncp_intervensi_jenis_id` tinyint(4) DEFAULT 0 COMMENT 'FK dari tri_mncp_intervensi_jenis',
  `mncp_item_note` varchar(255) DEFAULT NULL COMMENT 'Keterangan yang tercantum',
  `mncp_item_isvalue` tinyint(4) DEFAULT 0 COMMENT 'Jika 0 merupakan header tanpa nilai, jika 1 = checbox, 2= angka/kalimat',
  `mncp_item_isaktif` tinyint(4) DEFAULT 1,
  PRIMARY KEY (`mncp_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `tri_nyeri` */

DROP TABLE IF EXISTS `tri_nyeri`;

CREATE TABLE `tri_nyeri` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `layanan_id` bigint(20) DEFAULT NULL,
  `nomor_registrasi` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_rm` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `global_id` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'id unik untuk bisa dipakai oleh seluruh dokumen',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `nyeri_is` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `nyeri_kode` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=323;',
  `nyeri_lokasi_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `nyeri_onset_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `nyeri_pencetus_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `nyeri_kualitas_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=324',
  `nyeri_kualitas_lainnya` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `nyeri_menjalar_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=325',
  `nyeri_menjalar_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `nyeri_tingkatan_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=326',
  `nyeri_waktu_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=327',
  `nyeri_waktu_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `nyeri_skoring_kode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=328',
  `nyeri_skoring_skor_1` smallint(6) DEFAULT NULL COMMENT 'entry',
  `nyeri_skoring_skor_2` smallint(6) DEFAULT NULL,
  `nyeri_skoring_skor_3` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tri_orientasi_d` */

DROP TABLE IF EXISTS `tri_orientasi_d`;

CREATE TABLE `tri_orientasi_d` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `orientasi_id` int(11) DEFAULT NULL,
  `orientasi_nilai` tinyint(4) DEFAULT 1 COMMENT 'm_yesno',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `penerima_orientasi` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `petugas_id` int(11) DEFAULT NULL COMMENT 'm_pegawai dengan id_jenis_profesi = 7; default perawat yang login saat ini',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tri_orientasi_m` */

DROP TABLE IF EXISTS `tri_orientasi_m`;

CREATE TABLE `tri_orientasi_m` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `materi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_aktif` tinyint(4) DEFAULT 1 COMMENT 'm_yesno',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tri_pemberian_obat_d` */

DROP TABLE IF EXISTS `tri_pemberian_obat_d`;

CREATE TABLE `tri_pemberian_obat_d` (
  `id_pemberian_obat` bigint(20) DEFAULT NULL COMMENT 'tr_pemberian_obat fk id_pemberian_obat',
  `id_log` bigint(20) NOT NULL AUTO_INCREMENT,
  `tgl` date DEFAULT NULL,
  `jam` time DEFAULT NULL,
  `tanda` int(11) DEFAULT NULL COMMENT 'm_ref kode_group=376',
  `reaksi` varchar(250) DEFAULT NULL,
  `pk_nama_pasien` varchar(100) DEFAULT NULL COMMENT 'nama pasien/keluarga pasien',
  `pk_status_ttd_pasien` tinyint(4) DEFAULT NULL COMMENT '1=sudah, 0=belum',
  `pk_pascode_pasien` varchar(255) DEFAULT NULL,
  `pk_file_ttd_pasien` varchar(255) DEFAULT NULL,
  `petugas_id_farmasi` int(11) DEFAULT NULL COMMENT 'ngambil dari m_pegawai, dengan id_jenis_profesi = 7',
  `petugas_status_ttd_farmasi` tinyint(4) DEFAULT NULL COMMENT '1=sudah, 0=belum',
  `petugas_pascode_farmasi` varchar(255) DEFAULT NULL,
  `petugas_file_ttd_farmasi` varchar(255) DEFAULT NULL,
  `petugas_id_perawat` int(11) DEFAULT NULL COMMENT 'ngambil dari m_pegawai, dengan id_jenis_profesi = 7',
  `petugas_status_ttd_perawat` tinyint(4) DEFAULT NULL COMMENT '1=sudah, 0=belum',
  `petugas_pascode_perawat` varchar(255) DEFAULT NULL,
  `petugas_file_ttd_perawat` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_log`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tri_pemberian_obat_m` */

DROP TABLE IF EXISTS `tri_pemberian_obat_m`;

CREATE TABLE `tri_pemberian_obat_m` (
  `id_pemberian_obat` bigint(20) NOT NULL AUTO_INCREMENT,
  `layanan_id` bigint(20) DEFAULT NULL,
  `nomor_registrasi` varchar(20) DEFAULT NULL,
  `no_rm` varchar(20) DEFAULT NULL,
  `subunit_id` int(11) DEFAULT NULL,
  `kamar` varchar(6) DEFAULT NULL,
  `kode_barang` varchar(10) DEFAULT NULL,
  `dosis` varchar(12) DEFAULT NULL,
  `id_aturan_pakai` int(11) DEFAULT NULL COMMENT 'm ref dengan group  id=300',
  `cara_pemberian` int(11) DEFAULT NULL COMMENT 'm ref dengan group  id=373',
  PRIMARY KEY (`id_pemberian_obat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tri_perubahan_dokter` */

DROP TABLE IF EXISTS `tri_perubahan_dokter`;

CREATE TABLE `tri_perubahan_dokter` (
  `t_ubahdr_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `layanan_id` varchar(20) DEFAULT NULL,
  `no_registrasi` varchar(20) DEFAULT NULL,
  `no_rm` varchar(20) DEFAULT NULL,
  `subunit_id` int(11) DEFAULT NULL COMMENT 'FK dari m_subunit_medik',
  `kamar` varchar(6) DEFAULT NULL,
  `t_ubahdr_hubungan_kerabat_id` tinyint(4) DEFAULT 0 COMMENT 'FK Tabel m_hubungan_kerabat, 0 = Saya (Pasien sendiri);',
  `t_ubahdr_kerabat_nama` varchar(255) DEFAULT NULL COMMENT 'Nama kerabat yang meminta perubahan dokter',
  `t_ubahdr_kerabat_umur` tinyint(4) DEFAULT NULL COMMENT 'Umur kerabat yang meminta perubahan dokter',
  `t_ubahdr_kerabat_jk` enum('Laki-laki','Perempuan') DEFAULT NULL COMMENT '"Laki-laki"; "Perempuan"',
  `t_ubahdr_kerabat_alamat` varchar(255) DEFAULT NULL COMMENT 'Alamat kerabat yang meminta perubahan dokter',
  `t_ubahdr_kerabat_noktp_sim` varchar(20) DEFAULT NULL COMMENT 'Nomor Identitas kerabat yang meminta perubahan dokter',
  `kerabat_status_ttd` tinyint(4) DEFAULT NULL,
  `kerabat_passcode` varchar(255) DEFAULT NULL,
  `kerabat_file_ttd` varchar(255) DEFAULT NULL,
  `t_ubahdr_tgl_surat` date DEFAULT NULL COMMENT 'Tanggal Surat',
  `t_ubahdr_dokter_awal` date DEFAULT NULL COMMENT 'm_pegawai, Dokter Pengganti, id = 5',
  `t_ubahdr_dokter_pengganti` date DEFAULT NULL COMMENT 'm_pegawai, Dokter Pengganti, id = 5',
  `manajemnrs_pegawai_id` int(11) DEFAULT NULL COMMENT 'm_pegawai, Manajemen Rumah Sakit',
  `manajemnrs_status_ttd` tinyint(4) DEFAULT NULL,
  `manajemnrs_pegawai_passcode` varchar(255) DEFAULT NULL,
  `manajemnrs_pegawai_file_ttd` varchar(255) DEFAULT NULL,
  `saksi2_nama` varchar(50) DEFAULT NULL COMMENT 'Saksi 2 dari Pihak Keluarga atau Kerabat Pasien',
  `saksi2_status_ttd` tinyint(4) DEFAULT NULL,
  `saksi2_passcode` varchar(255) DEFAULT NULL,
  `saksi2_file_ttd` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`t_ubahdr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `tri_pindah_ruang` */

DROP TABLE IF EXISTS `tri_pindah_ruang`;

CREATE TABLE `tri_pindah_ruang` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `layanan_id` bigint(20) DEFAULT NULL,
  `nomor_registrasi` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_rm` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipe_pindah` tinyint(4) DEFAULT NULL COMMENT 'm_ref group_id = 350; 1=Perpindahan dari Rajal ke Ranap; 2. Perpindahan antar ruangan ranap',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `subunit_id_a` int(11) DEFAULT NULL COMMENT 'subunit_medik;entry',
  `subunit_id_t` int(11) DEFAULT NULL COMMENT 'subunit_medik;entry',
  `nomor_kamar` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_subunit_kamar',
  `nomor_bed` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry;m_kelas_detil',
  `tanggal_pindah` date DEFAULT NULL COMMENT 'entry',
  `waktu_pindah` time DEFAULT NULL COMMENT 'entry',
  `dokter_merawat_id` int(11) DEFAULT NULL COMMENT 'entry;default dokter unit asal',
  `diagnosis_medis` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry;otomatis dari assesment medis',
  `sudah_dijelaskan` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `prosedur_invasif_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `prosedur_invasif_tanggal` date DEFAULT NULL COMMENT 'entry',
  `masalah_keperawatan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `alergi_obat` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `nama_obat_alergi` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry;ambil bila sudah ada di assesment medis',
  `riwayat_reaksi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry;ambil bila sudah ada di ass medis',
  `intervensi_medik` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `hasil_investigasi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `kewaspadaan_standar` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `kewaspadaan_contact` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `kewaspadaan_airbone` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `kewaspadaan_droplet` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `observasi_terakhir` time DEFAULT NULL COMMENT 'entry',
  `gcs_E` int(11) DEFAULT NULL,
  `gcs_V` int(11) DEFAULT NULL,
  `gcs_M` int(11) DEFAULT NULL,
  `reaksi_cahaya_kanan` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry;+ atau -',
  `reaksi_cahaya_kiri` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry;+ atau -',
  `td_s` int(11) DEFAULT NULL COMMENT 'entry',
  `td_d` int(11) DEFAULT NULL COMMENT 'entry',
  `nadi` int(11) DEFAULT NULL COMMENT 'entry',
  `rr` int(11) DEFAULT NULL COMMENT 'entry',
  `sp02` int(11) DEFAULT NULL COMMENT 'entry',
  `suhu` float DEFAULT NULL COMMENT 'entry',
  `skala_nyeri_vas` int(11) DEFAULT NULL COMMENT 'entry',
  `diet_oral` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `diet_ngt` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `diet_batasan_cairan` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `diet_batasan_des` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `diet_khusus` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `diet_khusus_des` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `diet_puasa` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `diet_puasa_pukul` time DEFAULT NULL COMMENT 'entry',
  `bab_normal` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `bab_colos` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `bab_inkon_urin` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `bab_inkon_alvi` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `bab_lain` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `bab_lain_des` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_yesno',
  `bak_normal` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `bak_kateter` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `bak_jenis_kateter` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `bak_no_kateter` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `bak_tgl_pasang` date DEFAULT NULL COMMENT 'entry',
  `mob_jalan` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `mob_tidur` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `mod_duduk` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `trans_mandiri` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `trans_sebagian` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `trans_penuh` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `gangguan_indra_t` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `gangguan_indra_b` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `gangguan_indra_d` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `gangguan_indra_l` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `gangguan_indra_c` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `gangguan_indra_r` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `alat_bantu_t` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `alat_bantu_g` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `alat_bantu_k` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `alat_bantu_d` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `alat_bantu_n` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `alat_bantu_n_des` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `luka` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `luka_kondisi` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `luka_lokasi` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `luka_ukuran` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `infus_cvc` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `infus_cvc_des` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `infus_pivas` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `infus_pivas_des` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `infus_tanggal` date DEFAULT NULL COMMENT 'entry',
  `tindakan_khusus_j` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `tindakan_khusus_r` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `tindakan_khusus_l` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `tindakan_khusus_h` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `alat_khusus` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hal_istimewa` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `konsultasi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `rencana_lab` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `terapi_oral` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `terapi_parenteral` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `fisioterapi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `rencana_tindak_lanjut` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `lab` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `xray` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `ctscan` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `usg` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `echocardiografi` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `penunjang_lainnya` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `ecg` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `obat` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `admision_form` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `konsultasi_form` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `konfirmasi` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `gelang_nama` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `catatan_medis` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `surat_rujukan` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `inform_concent` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `lainnya` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `gigi_palsu` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `kaca_mata` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `alat_bantu_dengar` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `lab_ket` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `xray_ket` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ctscan_ket` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `usg_ket` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `echocardiografi_ket` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `penunjang_lainnya_ket` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ecg_ket` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `obat_ket` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admision_form_ket` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `konsultasi_form_ket` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `konfirmasi_ket` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gelang_nama_ket` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `catatan_medis_ket` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `surat_rujukan_ket` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `inform_concent_ket` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lainnya_ket` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gigi_palsu_ket` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kaca_mata_ket` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alat_bantu_ket` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tri_pindah_ruang_alat` */

DROP TABLE IF EXISTS `tri_pindah_ruang_alat`;

CREATE TABLE `tri_pindah_ruang_alat` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pindah_ruang_id` bigint(20) DEFAULT NULL COMMENT 't_pindah_ruang',
  `alat_id` int(11) NOT NULL COMMENT 'm_ref, group_id =349',
  `lama_pakai` smallint(6) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tri_pindah_ruang_diagnosa_keperawatan` */

DROP TABLE IF EXISTS `tri_pindah_ruang_diagnosa_keperawatan`;

CREATE TABLE `tri_pindah_ruang_diagnosa_keperawatan` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pindah_ruang_id` bigint(20) DEFAULT NULL COMMENT 't_pindah_ruang',
  `diagnosa` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'entry',
  `teratasi` tinyint(4) NOT NULL COMMENT 'm_yesno',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tri_rekam_asuhan_keperawatan_observasi_cairan` */

DROP TABLE IF EXISTS `tri_rekam_asuhan_keperawatan_observasi_cairan`;

CREATE TABLE `tri_rekam_asuhan_keperawatan_observasi_cairan` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `no_rm` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'dari tabel t_layanan',
  `nomor_registrasi` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'dari tabel t_layanan',
  `layanan_id` bigint(20) DEFAULT NULL COMMENT 'dari tabel t_layanan',
  `subunit_id` int(11) DEFAULT NULL COMMENT 'FK dari tabel dr m_subunit_medik, default nilai subunit_id di t_layanan',
  `kamar` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal` date DEFAULT NULL COMMENT 'tanggal pencatanan rekam_asuhan_keperawatan_observasi_cairan',
  `tv_temperatur_6` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Nilai pengukuran tanda vital temperatur pada jam 6 pagi',
  `tv_temperatur_12` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Nilai pengukuran tanda vital temperatur pada jam 12 siang',
  `tv_temperatur_16` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Nilai pengukuran tanda vital temperatur pada jam 16 sore',
  `tv_temperatur_20` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Nilai pengukuran tanda vital temperatur pada jam 20 malam',
  `tv_temperatur_keterangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Keterangan pengukuran tanda vital temperatur',
  `tv_tekanan_darah_6` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Nilai pengukuran tanda vital tekanan_darah pada jam 6 pagi',
  `tv_tekanan_darah_12` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Nilai pengukuran tanda vital tekanan_darah pada jam 12 siang',
  `tv_tekanan_darah_16` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Nilai pengukuran tanda vital tekanan_darah pada jam 16 sore',
  `tv_tekanan_darah_20` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Nilai pengukuran tanda vital tekanan_darah pada jam 20 malam',
  `tv_tekanan_darah_keterangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Keterangan pengukuran tanda vital tekanan_darah',
  `tv_nadi_pulsa_6` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Nilai pengukuran tanda vital nadi_pulsa pada jam 6 pagi',
  `tv_nadi_pulsa_12` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Nilai pengukuran tanda vital nadi_pulsa pada jam 12 siang',
  `tv_nadi_pulsa_16` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Nilai pengukuran tanda vital nadi_pulsa pada jam 16 sore',
  `tv_nadi_pulsa_20` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Nilai pengukuran tanda vital nadi_pulsa pada jam 20 malam',
  `tv_nadi_pulsa_keterangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Keterangan pengukuran tanda vital nadi_pulsa',
  `tv_pernapasan_6` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Nilai pengukuran tanda vital pernapasan pada jam 6 pagi',
  `tv_pernapasan_12` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Nilai pengukuran tanda vital pernapasan pada jam 12 siang',
  `tv_pernapasan_16` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Nilai pengukuran tanda vital pernapasan pada jam 16 sore',
  `tv_pernapasan_20` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Nilai pengukuran tanda vital pernapasan pada jam 20 malam',
  `tv_pernapasan_keterangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Keterangan pengukuran tanda vital pernapasan',
  `cm_minum_p` double DEFAULT NULL COMMENT 'Volume cairan masuk MINUM pada pagi hari',
  `cm_minum_s` double DEFAULT NULL COMMENT 'Volume cairan masuk MINUM pada siang hari',
  `cm_minum_m` double DEFAULT NULL COMMENT 'Volume cairan masuk MINUM pada malam hari',
  `cm_minum_jumlah` double DEFAULT NULL COMMENT 'Total Volume cairan masuk MINUM dalam sehari',
  `cm_minum_keterangan` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Keterangan Volume cairan masuk MINUM',
  `cm_ngt_p` double DEFAULT NULL COMMENT 'Volume cairan masuk MAKAN LEWAT PIPA/NGT pada pagi hari',
  `cm_ngt_p_waktu` time DEFAULT NULL COMMENT 'Waktu pasang/Aff MAKAN LEWAT PIPA/NGT pada pagi hari',
  `cm_ngt_s` double DEFAULT NULL COMMENT 'Volume cairan masuk MAKAN LEWAT PIPA/NGT pada siang hari',
  `cm_ngt_s_waktu` time DEFAULT NULL COMMENT 'Waktu pasang/Aff MAKAN LEWAT PIPA/NGT pada siang hari',
  `cm_ngt_m` double DEFAULT NULL COMMENT 'Volume cairan masuk MAKAN LEWAT PIPA/NGT pada malam hari',
  `cm_ngt_m_waktu` time DEFAULT NULL COMMENT 'Waktu pasang/Aff MAKAN LEWAT PIPA/NGT pada malam hari',
  `cm_ngt_jumlah` double DEFAULT NULL COMMENT 'Total Volume cairan masuk MAKAN LEWAT PIPA/NGT dalam sehari',
  `cm_ngt_keterangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Keterangan Volume cairan masuk MAKAN LEWAT PIPA/NGT',
  `cm_infus_p` double DEFAULT NULL COMMENT 'Volume cairan masuk MAKAN LEWAT INFUS pada pagi hari',
  `cm_infus_p_waktu` time DEFAULT NULL COMMENT 'Waktu pasang/Aff MAKAN LEWAT INFUS pada pagi hari',
  `cm_infus_s` double DEFAULT NULL COMMENT 'Volume cairan masuk MAKAN LEWAT INFUS pada siang hari',
  `cm_infus_s_waktu` time DEFAULT NULL COMMENT 'Waktu pasang/Aff MAKAN LEWAT INFUS pada siang hari',
  `cm_infus_m` double DEFAULT NULL COMMENT 'Volume cairan masuk MAKAN LEWAT INFUS pada malam hari',
  `cm_infus_m_waktu` time DEFAULT NULL COMMENT 'Waktu pasang/Aff MAKAN LEWAT INFUS pada malam hari',
  `cm_infus_jumlah` double DEFAULT NULL COMMENT 'Total Volume cairan masuk MAKAN LEWAT INFUS dalam sehari',
  `cm_infus_keterangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Keterangan Volume cairan masuk MAKAN LEWAT INFUS',
  `cm_tranfusi_p` double DEFAULT NULL COMMENT 'Volume cairan masuk MAKAN LEWAT TRANFUSI pada pagi hari',
  `cm_tranfusi_p_waktu` time DEFAULT NULL COMMENT 'Waktu pasang/Aff MAKAN LEWAT TRANFUSI pada pagi hari',
  `cm_tranfusi_s` double DEFAULT NULL COMMENT 'Volume cairan masuk MAKAN LEWAT TRANFUSI pada siang hari',
  `cm_tranfusi_s_waktu` time DEFAULT NULL COMMENT 'Waktu pasang/Aff MAKAN LEWAT TRANFUSI pada siang hari',
  `cm_tranfusi_m` double DEFAULT NULL COMMENT 'Volume cairan masuk MAKAN LEWAT TRANFUSI pada malam hari',
  `cm_tranfusi_m_waktu` time DEFAULT NULL COMMENT 'Waktu pasang/Aff MAKAN LEWAT TRANFUSI pada malam hari',
  `cm_tranfusi_jumlah` double DEFAULT NULL COMMENT 'Total Volume cairan masuk MAKAN LEWAT TRANFUSI dalam sehari',
  `cm_tranfusi_keterangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Keterangan Volume cairan masuk MAKAN LEWAT INFUS',
  `ck_urine_catheter_p` double DEFAULT NULL COMMENT 'Volume cairan keluar LEWAT URINE/CATHETER pada pagi hari',
  `ck_urine_catheter_p_waktu` time DEFAULT NULL COMMENT 'Waktu pasang/Aff URINE/CATHETER pada pagi hari',
  `ck_urine_catheter_s` double DEFAULT NULL COMMENT 'Volume cairan keluar LEWAT URINE/CATHETER pada siang hari',
  `ck_urine_catheter_s_waktu` time DEFAULT NULL COMMENT 'Waktu pasang/Aff URINE/CATHETER pada siang hari',
  `ck_urine_catheter_m` double DEFAULT NULL COMMENT 'Volume cairan keluar LEWAT URINE/CATHETER pada malam hari',
  `ck_urine_catheter_m_waktu` time DEFAULT NULL COMMENT 'Waktu pasang/Aff URINE/CATHETER  pada malam hari',
  `ck_urine_catheter_jumlah` double DEFAULT NULL COMMENT 'Total Volume cairan keluar LEWAT URINE/CATHETER dalam sehari',
  `ck_urine_catheter_keterangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Keterangan Volume cairan keluar LEWAT URINE/CATHETER',
  `ck_ngt_p` double DEFAULT NULL COMMENT 'Volume cairan keluar LEWAT PIPA/NGT pada pagi hari',
  `ck_ngt_p_waktu` time DEFAULT NULL COMMENT 'Waktu pasang/Aff  PIPA/NGT pada pagi hari',
  `ck_ngt_s` double DEFAULT NULL COMMENT 'Volume cairan keluar LEWAT  PIPA/NGT pada siang hari',
  `ck_ngt_s_waktu` time DEFAULT NULL COMMENT 'Waktu pasang/Aff  PIPA/NGT pada siang hari',
  `ck_ngt_m` double DEFAULT NULL COMMENT 'Volume cairan keluar LEWAT PIPA/NGT pada malam hari',
  `ck_ngt_m_waktu` time DEFAULT NULL COMMENT 'Waktu pasang/Aff  PIPA/NGT  pada malam hari',
  `ck_ngt_jumlah` double DEFAULT NULL COMMENT 'Total Volume cairan keluar LEWAT  PIPA/NGT dalam sehari',
  `ck_ngt_keterangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Keterangan Volume cairan keluar LEWAT PIPA/NGT',
  `ck_drainage_p` double DEFAULT NULL COMMENT 'Volume cairan keluar LEWAT DRAINAGE/WSD pada pagi hari',
  `ck_drainage_p_waktu` time DEFAULT NULL COMMENT 'Waktu pasang/Aff  DRAINAGE/WSD pada pagi hari',
  `ck_drainage_s` double DEFAULT NULL COMMENT 'Volume cairan keluar LEWAT DRAINAGE/WSD pada siang hari',
  `ck_drainage_s_waktu` time DEFAULT NULL COMMENT 'Waktu pasang/Aff DRAINAGE/WSD pada siang hari',
  `ck_drainage_m` double DEFAULT NULL COMMENT 'Volume cairan keluar LEWAT DRAINAGE/WSD pada malam hari',
  `ck_drainage_m_waktu` time DEFAULT NULL COMMENT 'Waktu pasang/Aff DRAINAGE/WSD pada malam hari',
  `ck_drainage_jumlah` double DEFAULT NULL COMMENT 'Total Volume cairan keluar LEWAT DRAINAGE/WSD dalam sehari',
  `ck_drainage_keterangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Keterangan Volume cairan keluar LEWATDRAINAGE/WSD',
  `ck_muntah_p` double DEFAULT NULL COMMENT 'Volume cairan keluar LEWAT MUNTAH pada pagi hari',
  `ck_muntah_s` double DEFAULT NULL COMMENT 'Volume cairan keluar LEWAT MUNTAH pada siang hari',
  `ck_muntah_m` double DEFAULT NULL COMMENT 'Volume cairan keluar LEWAT MUNTAH pada malam hari',
  `ck_muntah_jumlah` double DEFAULT NULL COMMENT 'Total Volume cairan keluar LEWAT MUNTAH dalam sehari',
  `ck_muntah_keterangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Keterangan Volume cairan keluar MUNTAH',
  `ck_defekasi_p` double DEFAULT NULL COMMENT 'Volume cairan keluar LEWAT DEFEKASI pada pagi hari',
  `ck_defekasi_s` double DEFAULT NULL COMMENT 'Volume cairan keluar LEWAT DEFEKASI pada siang hari',
  `ck_defekasi_m` double DEFAULT NULL COMMENT 'Volume cairan keluar LEWAT DEFEKASI pada malam hari',
  `ck_defekasi_jumlah` double DEFAULT NULL COMMENT 'Total Volume cairan keluar LEWAT DEFEKASI dalam sehari',
  `ck_defekasi_keterangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Keterangan Volume cairan keluar DEFEKASI',
  `ck_iwl_p` double DEFAULT NULL COMMENT 'Volume cairan keluar LEWAT IWL pada pagi hari',
  `ck_iwl_s` double DEFAULT NULL COMMENT 'Volume cairan keluar LEWAT IWL pada siang hari',
  `ck_iwl_m` double DEFAULT NULL COMMENT 'Volume cairan keluar LEWAT IWL pada malam hari',
  `ck_iwl_jumlah` double DEFAULT NULL COMMENT 'Total Volume cairan keluar LEWAT IWL dalam sehari',
  `ck_iwl_balance` double DEFAULT NULL COMMENT 'Balance cairan keluar LEWAT IWL dalam CC',
  `ck_iwl_keterangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Keterangan Volume cairan keluar IWL',
  `oksigen_p` double DEFAULT NULL COMMENT 'Volume pemakaian oksigen pada pagi hari',
  `oksigen_s` double DEFAULT NULL COMMENT 'Volume pemakaian oksigen pada siang hari',
  `oksigen_m` double DEFAULT NULL COMMENT 'Volume pemakaian oksigen pada malam hari',
  `oksigen_keterangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Keterangan pemakaian oksigen',
  `diet_p` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Diet pada pagi hari',
  `diet_s` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Diet pada siang hari',
  `diet_m` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Diet pada malam hari',
  `diet_keterangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Keterangan diet',
  `pemeriksaan_tindakan` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Keterangan pemeriksaan/tindakan',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tri_rekam_asuhan_keperawatan_observasi_cairan_d` */

DROP TABLE IF EXISTS `tri_rekam_asuhan_keperawatan_observasi_cairan_d`;

CREATE TABLE `tri_rekam_asuhan_keperawatan_observasi_cairan_d` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tri_rekam_asuhan_keperawatan_observasi_cairan_id` bigint(20) DEFAULT NULL COMMENT 'FK dari table tri_rekam_asuhan_keperawatan_observasi_cairan',
  `waktu` time DEFAULT NULL,
  `program_infus` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jenis_id` bigint(20) DEFAULT NULL COMMENT 'dari master tabel mana ?',
  `jumlah` int(11) DEFAULT NULL COMMENT 'jumlah ampul infus ?',
  `tetes` int(11) DEFAULT NULL COMMENT 'jumlah tetes per menit ?',
  `keterangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tri_rekon_obat_d` */

DROP TABLE IF EXISTS `tri_rekon_obat_d`;

CREATE TABLE `tri_rekon_obat_d` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `rekon_obat_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'tri_rekon_obat_m',
  `nama_obat` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `dosis` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_pegawai ; default petugas saaat ini',
  `lama_pemberian` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry (bisa pasien, keluarga)',
  `jml` int(11) DEFAULT NULL COMMENT 'entry',
  `status_lanjut` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `keterangan` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tri_rekon_obat_m` */

DROP TABLE IF EXISTS `tri_rekon_obat_m`;

CREATE TABLE `tri_rekon_obat_m` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `layanan_id` bigint(20) DEFAULT NULL COMMENT 't_layanan',
  `nomor_registrasi` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 't_layanan',
  `no_rm` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 't_layanan',
  `tanggal` date DEFAULT NULL COMMENT 'entry',
  `jam` time DEFAULT NULL COMMENT 'entry',
  `tempat_rekon` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `petugas_id` int(11) DEFAULT NULL COMMENT 'm_pegawai ; default petugas saaat ini',
  `pasien_klrg` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry (bisa pasien, keluarga)',
  `riwayat_alergi` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `petugas_status_ttd` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `petugas_passcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `petugas_file_ttd` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `pk_status_ttd` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `pk_passcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `pk_file_ttd` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tri_rencana_pulang_d` */

DROP TABLE IF EXISTS `tri_rencana_pulang_d`;

CREATE TABLE `tri_rencana_pulang_d` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `rencana_pulang_id` bigint(20) DEFAULT NULL COMMENT 'tri_rencana_pulang_m',
  `pengaruh_ranap_a` tinyint(4) DEFAULT NULL COMMENT 'm_Yesno',
  `pengaruh_ranap_b` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `pengaruh_ranap_c` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `aktifitas_tbl` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `aktifitas_tbl_ya` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `bantuan_perlu_mo` tinyint(4) DEFAULT NULL COMMENT 'm_yesno;minum obat',
  `bantuan_perlu_mk` tinyint(4) DEFAULT NULL COMMENT 'm_yesno;makan',
  `bantuan_perlu_mm` tinyint(4) DEFAULT NULL COMMENT 'm_yesno;menyiapkan makanan',
  `bantuan_perlu_ek` tinyint(4) DEFAULT NULL COMMENT 'm_yesno;edukasi kesehatan',
  `bantuan_perlu_md` tinyint(4) DEFAULT NULL COMMENT 'm_yesno;mandi',
  `bantuan_perlu_di` tinyint(4) DEFAULT NULL COMMENT 'm_yesno;diet',
  `bantuan_perlu_bp` tinyint(4) DEFAULT NULL COMMENT 'm_yesno; berpakaian',
  `bantuan_perlu_tr` tinyint(4) DEFAULT NULL COMMENT 'm_yesno;transportasi',
  `bantu_perlu` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `bantu_perlu_ya` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `pasien_tinggal` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `pasien_tinggal_ya` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `pasien_alat_medis` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `pasien_alat_medis_ya` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `pasien_alat_bantu` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `pasien_alat_bantu_ya` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'tinyint',
  `pasien_rawat_khusus` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `pasien_rawat_khusus_ya` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `pasien_masalah` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `pasien_masalah_ya` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `pasien_penyakit` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `pasien_penyakit_ya` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `pasien_edukasi` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `pasien_edukasi_ya` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `pasien_trampil` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `pasien_trampil_ya` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `rencana_pemulangan` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tri_rencana_pulang_m` */

DROP TABLE IF EXISTS `tri_rencana_pulang_m`;

CREATE TABLE `tri_rencana_pulang_m` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `layanan_id` bigint(20) DEFAULT NULL COMMENT 't_layanan',
  `nomor_registrasi` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 't_layanan',
  `no_rm` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 't_layanan',
  `tgl_mrs` datetime DEFAULT NULL COMMENT 't_layanan;tanggal masuk rumah sakit',
  `diagnosa_mrs` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `tgl_rencana_krs` date DEFAULT NULL COMMENT 'entry;tgl keluar rumah sakit',
  `diagnosa_rencana_krs` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `tanggal_perencanaan` date DEFAULT NULL COMMENT 'entry',
  `jam_perencanaan` time DEFAULT NULL COMMENT 'entry',
  `dpjp_id` int(10) DEFAULT NULL COMMENT 'm_pegawai ; jenis_profesi_id = 5; default petugas saaat ini',
  `dpjp_passcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `dpjp_file_ttd` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `pk_status_ttd` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `pk_passcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `pk_file_ttd` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tri_resiko_jatuh_anak` */

DROP TABLE IF EXISTS `tri_resiko_jatuh_anak`;

CREATE TABLE `tri_resiko_jatuh_anak` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `no_rm` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'dari tabel t_layanan',
  `nomor_registrasi` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'dari tabel t_layanan',
  `layanan_id` bigint(20) unsigned NOT NULL COMMENT 'dari tabel t_layanan',
  `doc_id` bigint(20) DEFAULT NULL,
  `doc_kode` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'id global dari seluruh dokumen yg membutuhkan',
  `subunit_id` int(11) NOT NULL COMMENT 'FK dari tabel dr m_subunit_medik, default nilai subunit_id di t_layanan',
  `kamar` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal` date NOT NULL,
  `jam` time NOT NULL,
  `usia_pilihan` int(11) NOT NULL COMMENT 'Nomor PILIHAN USIA : (1) usia < 3 th, (2) 3th sd 7th, (3) 7th sd 13th, (4) usia >= 13th',
  `usia_skor` int(11) NOT NULL COMMENT 'USIA : (1) skor 4 -> usia < 3 th, (2) skor 3 -> 3th sd 7th, (3) skor 2 -> 7th sd 13th, (4) skor 1 -> usia >= 13th',
  `jenis_kelamin_pilihan` int(11) NOT NULL COMMENT 'Nomor pilihan JENIS KELAMIN : (1) laki, (2) perempuan',
  `jenis_kelamin_skor` int(11) NOT NULL COMMENT 'JENIS KELAMIN : (1) skor 2 -> laki, (2) skor 1 -> perempuan ; ambil data jenis kelamin dari table m_pasien',
  `diagnosis_pilihan` int(11) NOT NULL COMMENT 'Nomor Pilihan DIAGNOSIS : (1) Diagnosis neurologi, (2) Perubahan oksigenasi (diagnosis respiratorik, dehidrasi, sinkop, anemia, anoreksia, dsb), (3) Gangguan perilaku/psikiatri, (4) Diagnosa lainnya',
  `diagnosis_skor` int(11) NOT NULL COMMENT 'DIAGNOSIS : (1) skor 4 -> Diagnosis neurologi, (2) skor 3 -> Perubahan oksigenasi (diagnosis respiratorik, dehidrasi, sinkop, anemia, anoreksia, dsb), (3) skor 2 -> Gangguan perilaku/psikiatri, (4) skor 1 -> Diagnosa lainnya',
  `gangguan_kognitif_pilihan` int(11) NOT NULL COMMENT 'Nomor Pilihan GANGGUAN KOGNITIF : (1) Tidak menyadari keterbatasan dirinya, (2) Lupa akan adanya keterbatasan, (3) Orientasi baik terhadap diri sendiri',
  `gangguan_kognitif_skor` int(11) NOT NULL COMMENT 'GANGGUAN KOGNITIF : (1) skor 3 -> Tidak menyadari keterbatasan dirinya, (2) skor 2 -> Lupa akan adanya keterbatasan, (3) skor 1 -> Orientasi baik terhadap diri sendiri',
  `faktor_lingkungan_pilihan` int(11) NOT NULL COMMENT 'Nomor Pilihan FAKTOR LINGKUNGAN : (1) Riwayat jatuh/bayi diletakkan ditempat tidur dewasa, (2) Pasien menggunakan alat bantu/ bayi diletakkan dalam tempat tidur bayi/ perabot rumah(3) Pasien diletakkan ditempat tidur, (4) Area rumah sakit',
  `faktor_lingkungan_skor` int(11) NOT NULL COMMENT 'FAKTOR LINGKUNGAN : (1) skor 4 -> Riwayat jatuh/bayi diletakkan ditempat tidur dewasa, (2) skor 3 -> Pasien menggunakan alat bantu/ bayi diletakkan dalam tempat tidur bayi/ perabot rumah(3) skor 2 -> Pasien diletakkan ditempat tidur, (4) skor 1 -> Area rumah sakit',
  `respon1_pilihan` int(11) NOT NULL COMMENT 'Nomor Pilihan RESPON TERHADAP PEMBEDAHAN/SEDASI/ANESTESI/PENGGUNAAN MEDIKAMENTOSA : (1) Dalam 24 jam, (2) Dalam 48 jam, (3) >48 jam atau tidak menjalani pembedahan/sedasi/anestesi',
  `respon1_skor` int(11) NOT NULL COMMENT 'RESPON TERHADAP PEMBEDAHAN/SEDASI/ANESTESI/PENGGUNAAN MEDIKAMENTOSA : (1) skor 3 -> Dalam 24 jam, (2) skor 2 -> Dalam 48 jam, (3) skor 1 -> >48 jam atau tidak menjalani pembedahan/sedasi/anestesi',
  `respon2_pilihan` int(11) NOT NULL COMMENT 'Nomor Pilihan RESPON2 TERHADAP PEMBEDAHAN/SEDASI/ANESTESI/PENGGUNAAN MEDIKAMENTOSA : (4) Penggunaan multipel : sedatif, obat hipnosis, barbiturat, fenotiazin, anti depresan, pencahar, diuretik, narkose ,(5) Penggunaan salahsatu obat diatas(6) Penggunaan medikasi lainnya/tidak ada medikasi',
  `respon2_skor` int(11) NOT NULL COMMENT 'RESPON2 TERHADAP PEMBEDAHAN/SEDASI/ANESTESI/PENGGUNAAN MEDIKAMENTOSA : (4) skor 3 -> Penggunaan multipel : sedatif, obat hipnosis, barbiturat, fenotiazin, anti depresan, pencahar, diuretik, narkose ,(5) skor 2 -> Penggunaan salahsatu obat diatas(6) skor 1 -> Penggunaan medikasi lainnya/tidak ada medikasi',
  `jumlah_skor` int(11) NOT NULL COMMENT 'Skor dihitung dari penjumlahan semua skor dari elemen diatas',
  `keterangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resiko` int(11) NOT NULL DEFAULT 0 COMMENT '0 -> resiko rendah, 1->resiko tinggi :resiko rendah jika total skor antara 7 sd 11, resiko tinggi jika total skor >=12',
  `petugas_id` bigint(20) unsigned NOT NULL COMMENT 'Select dari m_pegawai, dengan id_jenis_profesi = 7',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tri_resiko_jatuh_anak_d` */

DROP TABLE IF EXISTS `tri_resiko_jatuh_anak_d`;

CREATE TABLE `tri_resiko_jatuh_anak_d` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tri_resiko_jatuh_anak_id` bigint(20) NOT NULL COMMENT 'FK dari tabel tri_resiko_jatuh_anak',
  `tanggal` date NOT NULL,
  `jam` time NOT NULL,
  `std_rr1` int(11) NOT NULL COMMENT 'Orientasi pasien pada lingkungan kamar/bangsal',
  `std_rr2` int(11) NOT NULL COMMENT 'Pastikan rem tempat tidur terkunci',
  `std_rr3` int(11) NOT NULL COMMENT 'Pastikan bel pasien terjangkau',
  `std_rr4` int(11) NOT NULL COMMENT 'Singkirkan barang yang berbahaya terutama pada malam hari (kursi tambahan dll)',
  `std_rr5` int(11) NOT NULL COMMENT 'Minta persetujuan pasien agar lampu malam tetap menyala karen lingkungan masih asing',
  `std_rr6` int(11) NOT NULL COMMENT 'Pastikan alat bantu jalan dalam jangkauan (bila menggunakan)',
  `std_rr7` int(11) NOT NULL COMMENT 'Pastikan alas kaki tidak licin',
  `std_rr8` int(11) NOT NULL COMMENT 'Pastikan kebutuhan pribadi dalam jangkauan',
  `std_rr9` int(11) NOT NULL COMMENT 'Tempatkan meja pasien dengan baik agar tidak menghalangi',
  `std_rr10` int(11) NOT NULL COMMENT 'Tempatkan pasien sesuai dengan tinggi badannya',
  `std_rt1` int(11) NOT NULL COMMENT 'Pasang gelang kuning dan penanda / simbol resiko jatuh diluar kamar',
  `std_rt2` int(11) NOT NULL COMMENT 'Menjelaskan kepada pasien dan keluarga kemungkinan resiko jatuh',
  `std_rt3` int(11) NOT NULL COMMENT 'Minta agar pasien segera memencet bel bila perlu bantuan',
  `std_rt4` int(11) NOT NULL COMMENT 'Awasi atau bantu sebagian ADL pasien',
  `std_rt5` int(11) NOT NULL COMMENT 'Cepat menanggapi bel',
  `std_rt6` int(11) NOT NULL COMMENT 'Review kembali obat-obatan yang beresiko',
  `std_rt7` int(11) NOT NULL COMMENT 'Beritahu pasien agar mobilisasi secara bertahap duduk perlahan sebelum berdiri',
  `std_rt8` int(11) NOT NULL COMMENT 'Pasang penanda resiko jatuh diluar kamar',
  `std_rst1` int(11) NOT NULL COMMENT 'Kajian kebutuhan BAB/BAK secara teratur setiap 2-3 jam',
  `std_rst2` int(11) NOT NULL COMMENT 'Kolaborasi dengan fisioterapi/case manager',
  `std_rst3` int(11) NOT NULL COMMENT 'Bila memungkinkan pindahkan pasien dekat nurse station',
  `std_rst4` int(11) NOT NULL COMMENT 'Kaji kebutuhan dengan menggunakan pagar tempat tidur',
  `std_rst5` int(11) NOT NULL COMMENT 'Orientasi ulang bila perlu',
  `evaluasi` int(11) NOT NULL COMMENT 'Apakah terjadi insiden jatuh ?',
  `petugas_id` bigint(20) unsigned NOT NULL COMMENT 'Select dari m_pegawai, dengan id_jenis_profesi = 7',
  `keterangan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Catatan : (1) Pada kolom keterangan beri kode waktu dilakukannya asesment IA: saat assesment pertama kali, WT: saat transfer antar ruangan, CC: saat terjadi perubahan kondisi pasien, ES:saat pergantian shift jaga (pagi hari)(2) Pada item monitoring berikan "ya" apabila monitor dilakukan dan jawaban "tidak" apabila monitoring tidak dilakukan pada kolom tanggal sesuai skor resiko jatuh pasien(3) Pada kolom evaluasi, berilah tanda cawang pada pilihan ya atau tidak',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tri_resiko_jatuh_dewasa` */

DROP TABLE IF EXISTS `tri_resiko_jatuh_dewasa`;

CREATE TABLE `tri_resiko_jatuh_dewasa` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `no_rm` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'dari tabel t_layanan',
  `nomor_registrasi` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'dari tabel t_layanan',
  `layanan_id` bigint(20) unsigned NOT NULL COMMENT 'dari tabel t_layanan',
  `doc_id` bigint(20) DEFAULT NULL COMMENT 'dari id triage, dlll',
  `doc_kode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `subunit_id` int(11) NOT NULL COMMENT 'FK dari tabel dr m_subunit_medik, default nilai subunit_id di t_layanan',
  `kamar` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `petugas_id` bigint(20) unsigned NOT NULL COMMENT 'Select dari m_pegawai, dengan id_jenis_profesi = 7',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tri_resiko_jatuh_dewasa_d` */

DROP TABLE IF EXISTS `tri_resiko_jatuh_dewasa_d`;

CREATE TABLE `tri_resiko_jatuh_dewasa_d` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tri_resiko_jatuh_dewasa_id` bigint(20) NOT NULL COMMENT 'FK dari tabel tri_resiko_jatuh_dewasa',
  `tanggal` date NOT NULL,
  `jam` time NOT NULL,
  `std_rr1` int(11) NOT NULL COMMENT 'Orientasi pasien pada lingkungan kamar/bangsal',
  `std_rr2` int(11) NOT NULL COMMENT 'Pastikan rem tempat tidur terkunci',
  `std_rr3` int(11) NOT NULL COMMENT 'Pastikan bel pasien terjangkau',
  `std_rr4` int(11) NOT NULL COMMENT 'Singkirkan barang yang berbahaya terutama pada malam hari (kursi tambahan dll)',
  `std_rr5` int(11) NOT NULL COMMENT 'Minta persetujuan pasien agar lampu malam tetap menyala karen lingkungan masih asing',
  `std_rr6` int(11) NOT NULL COMMENT 'Pastikan alat bantu jalan dalam jangkauan (bila menggunakan)',
  `std_rr7` int(11) NOT NULL COMMENT 'Pastikan alas kaki tidak licin',
  `std_rr8` int(11) NOT NULL COMMENT 'Pastikan kebutuhan pribadi dalam jangkauan',
  `std_rr9` int(11) NOT NULL COMMENT 'Tempatkan meja pasien dengan baik agar tidak menghalangi',
  `std_rr10` int(11) NOT NULL COMMENT 'Tempatkan pasien sesuai dengan tinggi badannya',
  `std_rt1` int(11) NOT NULL COMMENT 'Pasang gelang kuning dan penanda / simbol resiko jatuh diluar kamar',
  `std_rt2` int(11) NOT NULL COMMENT 'Menjelaskan kepada pasien dan keluarga kemungkinan resiko jatuh',
  `std_rt3` int(11) NOT NULL COMMENT 'Minta agar pasien segera memencet bel bila perlu bantuan',
  `std_rt4` int(11) NOT NULL COMMENT 'Awasi atau bantu sebagian ADL pasien',
  `std_rt5` int(11) NOT NULL COMMENT 'Cepat menanggapi bel',
  `std_rt6` int(11) NOT NULL COMMENT 'Review kembali obat-obatan yang beresiko',
  `std_rt7` int(11) NOT NULL COMMENT 'Beritahu pasien agar mobilisasi secara bertahap duduk perlahan sebelum berdiri',
  `std_rt8` int(11) NOT NULL COMMENT 'Pasang penanda resiko jatuh diluar kamar',
  `std_rst1` int(11) NOT NULL COMMENT 'Kajian kebutuhan BAB/BAK secara teratur setiap 2-3 jam',
  `std_rst2` int(11) NOT NULL COMMENT 'Kolaborasi dengan fisioterapi/case manager',
  `std_rst3` int(11) NOT NULL COMMENT 'Bila memungkinkan pindahkan pasien dekat nurse station',
  `std_rst4` int(11) NOT NULL COMMENT 'Kaji kebutuhan dengan menggunakan pagar tempat tidur',
  `std_rst5` int(11) NOT NULL COMMENT 'Orientasi ulang bila perlu',
  `evaluasi` int(11) NOT NULL COMMENT 'Apakah terjadi insiden jatuh ?',
  `petugas_id` bigint(20) unsigned NOT NULL COMMENT 'Select dari m_pegawai, dengan id_jenis_profesi = 7',
  `keterangan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Catatan : (1) Pada kolom keterangan beri kode waktu dilakukannya asesment IA: saat assesment pertama kali, WT: saat transfer antar ruangan, CC: saat terjadi perubahan kondisi pasien, ES:saat pergantian shift jaga (pagi hari)(2) Pada item monitoring berikan "ya" apabila monitor dilakukan dan jawaban "tidak" apabila monitoring tidak dilakukan pada kolom tanggal sesuai skor resiko jatuh pasien(3) Pada kolom evaluasi, berilah tanda cawang pada pilihan ya atau tidak',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tri_suket_forcedischard` */

DROP TABLE IF EXISTS `tri_suket_forcedischard`;

CREATE TABLE `tri_suket_forcedischard` (
  `t_forcedischard_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `layanan_id` varchar(20) DEFAULT NULL,
  `no_registrasi` varchar(20) DEFAULT NULL,
  `no_rm` varchar(20) DEFAULT NULL,
  `subunit_id` int(11) DEFAULT NULL COMMENT 'FK dari m_subunit_medik',
  `kamar` varchar(6) DEFAULT NULL,
  `t_forcedischard_tgl` date DEFAULT NULL COMMENT 'Tanggal permintaan surat',
  `petugas_id` int(11) DEFAULT NULL COMMENT 'm_pegawai, bisa dokter atau perawat',
  `petugas_status_ttd` tinyint(4) DEFAULT NULL,
  `petugas_passcode` varchar(255) DEFAULT NULL,
  `petugas_file_ttd` varchar(255) DEFAULT NULL,
  `t_forcedishcard_hubungan_kerabat_id` tinyint(4) DEFAULT 0 COMMENT 'FK Tabel m_hubungan_kerabat, 0 = Saya (Pasien sendiri);',
  `t_forcedischard_nama_ttd` varchar(50) DEFAULT NULL COMMENT 'Nama penandatangan, kalau pasien langsung bisa diisi nama pasien',
  `penandatangan_status_ttd` tinyint(4) DEFAULT NULL,
  `penandatangan_passcode` varchar(255) DEFAULT NULL,
  `penandatangan_file_ttd` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`t_forcedischard_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `tri_terminal_evaluasi_pelayanan` */

DROP TABLE IF EXISTS `tri_terminal_evaluasi_pelayanan`;

CREATE TABLE `tri_terminal_evaluasi_pelayanan` (
  `id_terminal_evaluasi` bigint(20) NOT NULL AUTO_INCREMENT,
  `layanan_id` bigint(20) DEFAULT NULL,
  `tgl` date DEFAULT NULL,
  `nomer_registrasi` varchar(20) DEFAULT NULL,
  `no_rm` varchar(20) DEFAULT NULL,
  `kamar` varchar(6) DEFAULT NULL,
  `subunit_id` int(250) DEFAULT NULL,
  `pk_nama_pasien` varchar(100) DEFAULT NULL COMMENT 'nama pasien/keluarga pasien',
  `pk_status_ttd_pasien` tinyint(4) DEFAULT NULL COMMENT '1=sudah, 0=belum',
  `pk_pascode_pasien` varchar(255) DEFAULT NULL,
  `pk_file_ttd_pasien` varchar(255) DEFAULT NULL,
  `penjelasan_medik_dokter` tinyint(4) DEFAULT NULL,
  `penjelasan_layanan_selanjutnya` tinyint(4) DEFAULT NULL,
  `orientasi_spiritual_pasien` tinyint(4) DEFAULT NULL,
  `kelonggaran_keluarga` tinyint(4) DEFAULT NULL,
  `kebutuhan_alternative` tinyint(4) DEFAULT NULL,
  `saran_keluarga` text DEFAULT NULL,
  PRIMARY KEY (`id_terminal_evaluasi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tri_terminal_pengkajian` */

DROP TABLE IF EXISTS `tri_terminal_pengkajian`;

CREATE TABLE `tri_terminal_pengkajian` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `no_rm` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_pasien',
  `nomor_registrasi` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `layanan_id` bigint(20) DEFAULT NULL COMMENT 't_layanan',
  `nyeri_is` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `nyeri_kode` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=323;',
  `nyeri_lokasi_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `nyeri_onset_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `nyeri_pencetus_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `nyeri_kualitas_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=324',
  `nyeri_kualitas_lainnya` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `nyeri_menjalar_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=325',
  `nyeri_menjalar_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `nyeri_tingkatan_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=326',
  `nyeri_waktu_kode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=327',
  `nyeri_waktu_des` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'entry',
  `nyeri_skoring_kode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm_ref;group_id=328',
  `nyeri_skoring_skor_1` smallint(6) DEFAULT NULL COMMENT 'entry',
  `nyeri_skoring_skor_2` smallint(6) DEFAULT NULL,
  `nyeri_skoring_skor_3` smallint(6) DEFAULT NULL,
  `tgl_asesment` datetime DEFAULT NULL,
  `nafas_dyspnoe` tinyint(4) DEFAULT NULL COMMENT 'tb_yesno',
  `nafas_takteratur` tinyint(4) DEFAULT NULL COMMENT 'tb_yesno',
  `nafas_adasekret` tinyint(4) DEFAULT NULL,
  `nafas_cepatdangkal` tinyint(4) DEFAULT NULL,
  `nafas_mll_mulut` tinyint(4) DEFAULT NULL,
  `spO296` tinyint(4) DEFAULT NULL,
  `nafas_lambat` tinyint(4) DEFAULT NULL,
  `mukosa_oral_kering` tinyint(4) DEFAULT NULL,
  `nafas_tidakad_akelainan` tinyint(4) DEFAULT NULL,
  `tonus_otot_mual` tinyint(4) DEFAULT NULL,
  `tonus_otot_sulitmenelan` tinyint(4) DEFAULT NULL,
  `tonus_otot_inkontinensia_alvi` tinyint(4) DEFAULT NULL,
  `tonus_otot_penurunan_pergerakantubuh` tinyint(4) DEFAULT NULL,
  `tonus_otot_distensi_abdomen` tinyint(4) DEFAULT NULL,
  `tonus_otot_sulit_bicara` tinyint(4) DEFAULT NULL,
  `tonus_otot_inkontinensia_urine` tinyint(4) DEFAULT NULL,
  `tonus_otot_tidak_adakelainan` tinyint(4) DEFAULT NULL,
  `ps_bercak_sinosis` tinyint(4) DEFAULT NULL,
  `ps_gelisah` tinyint(4) DEFAULT NULL,
  `ps_lemas` tinyint(4) DEFAULT NULL,
  `ps_kulitdingin_berkeringat` tinyint(4) DEFAULT NULL,
  `ps_tekanan_darahmenurun` tinyint(4) DEFAULT NULL,
  `ps_nadi_lambat_lemah` tinyint(4) DEFAULT NULL,
  `pd_tidak_ada_kelainan` tinyint(4) DEFAULT NULL,
  `gf_melakukan_aktivitas_fisik` tinyint(4) DEFAULT NULL,
  `gf_pindah_posisi` tinyint(4) DEFAULT NULL,
  `gf_lainnya` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mk_mual` tinyint(4) DEFAULT NULL,
  `mk_perubahan_persepsi_sensori` tinyint(4) DEFAULT NULL,
  `mk_nyeri_akut` tinyint(4) DEFAULT NULL,
  `mk_polanafas_tidakefektif` tinyint(4) DEFAULT NULL,
  `mk_konstipasi` tinyint(4) DEFAULT NULL,
  `mk_nyeri_kronis` tinyint(4) DEFAULT NULL,
  `mk_bersihan_jalannafastidakefektif` tinyint(4) DEFAULT NULL,
  `mk_defisit_perawatandiri` tinyint(4) DEFAULT NULL,
  `os_agama_pasien` tinyint(4) DEFAULT NULL COMMENT 'dari RM',
  `os_perlu_layananspiritual_sesuai_agama` tinyint(4) DEFAULT NULL,
  `os_oleh` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `perlu_didoakan` tinyint(4) DEFAULT NULL,
  `perlu_bimbinganrohani` tinyint(4) DEFAULT NULL,
  `perlu_pendampinganrohani` tinyint(4) DEFAULT NULL,
  `sp_ingin_hubungi_orang` tinyint(4) DEFAULT NULL,
  `sp_siapa` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sp_hubungan` tinyint(4) DEFAULT NULL COMMENT 'm_hubungan_kerabat',
  `sp_dimana` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sp_hp` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rp_tetap_dirs` tinyint(4) DEFAULT NULL,
  `rp_rumah_sudah_dissiapkan` tinyint(4) DEFAULT NULL,
  `rp_rumah_ada_merawat` tinyint(4) DEFAULT NULL,
  `rp_rumah_siapamerawat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rp_perlu_homecare` tinyint(4) DEFAULT NULL,
  `rp_ai_menyangkal` tinyint(4) DEFAULT NULL,
  `rp_ai_marah` tinyint(4) DEFAULT NULL,
  `rp_ai_takut` tinyint(4) DEFAULT NULL,
  `rp_ai_sedih` tinyint(4) DEFAULT NULL,
  `rp_ai_rasa_bersalah` tinyint(4) DEFAULT NULL,
  `rp_ai_ketidakberdayaan` tinyint(4) DEFAULT NULL,
  `rp_mk_anxietas` tinyint(4) DEFAULT NULL,
  `rp_mk_distress_spiritual` tinyint(4) DEFAULT NULL,
  `rk_ai_marah` tinyint(4) DEFAULT NULL,
  `rk_ai_gangguantidur` tinyint(4) DEFAULT NULL,
  `rk_aiturunkonsentrasi` tinyint(4) DEFAULT NULL,
  `rk_aigagal_peran` tinyint(4) DEFAULT NULL,
  `rk_ai_keluarga_kurangkomunikasi` tinyint(4) DEFAULT NULL,
  `rk_ai_letih` tinyint(4) DEFAULT NULL,
  `rk_ai_rasabersalah` tinyint(4) DEFAULT NULL,
  `rk_aiperubahan_kebiasaan_pola_k` tinyint(4) DEFAULT NULL,
  `rk_ai_keluarga_kurang_partisipasi` tinyint(4) DEFAULT NULL,
  `rk_mk_kopingindovidutidakefektif` tinyint(4) DEFAULT NULL,
  `rk_mk_distress_spiritual` tinyint(4) DEFAULT NULL,
  `kd_pasien_perlu_didampingi_le;uarga` tinyint(4) DEFAULT NULL,
  `kd_keluarga_dpt_mengunjungi_pasien_diluarwaktu_kunjung` tinyint(4) DEFAULT NULL,
  `kd_sahabat_dpt_mengunjungi_pasien_diluarwaktu_kunjung` tinyint(4) DEFAULT NULL,
  `kd_lainnya` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ka_kebutuhan_alternatif_lain` tinyint(4) DEFAULT NULL COMMENT 'yesno',
  `ka_donasi_organ` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ka_autopsi` tinyint(4) DEFAULT NULL,
  `ka_lainnya` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fr_ai_marah` tinyint(4) DEFAULT NULL,
  `fr_ai_depresi` tinyint(4) DEFAULT NULL,
  `fr_ai_rasa_bersalah` tinyint(4) DEFAULT NULL,
  `fr_ai_komunikasi` tinyint(4) DEFAULT NULL,
  `fr_ai_gagal_peran` tinyint(4) DEFAULT NULL,
  `fr_ai_letih` tinyint(4) DEFAULT NULL,
  `fr_ai_gangguan_tidur` tinyint(4) DEFAULT NULL,
  `fr_ai_sedih` tinyint(4) DEFAULT NULL,
  `fr_ai_konsentrasi` tinyint(4) DEFAULT NULL,
  `fr_mk_koping_individu` tinyint(4) DEFAULT NULL,
  `fr_mk_distress_spiritual` tinyint(4) DEFAULT NULL,
  `petugas_id_perawat` int(11) DEFAULT NULL,
  `petugas_status_ttd_perawat` tinyint(4) DEFAULT NULL,
  `petugas_pascode_perawat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `petugas_file_ttd_perawat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `petugas_id_dokter` tinyint(4) DEFAULT NULL,
  `petugas_status_ttd_dokter` tinyint(4) DEFAULT NULL,
  `petugas_pascode_dokter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `petugas_file_ttd_dokter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `tri_tnc_implemen_det` */

DROP TABLE IF EXISTS `tri_tnc_implemen_det`;

CREATE TABLE `tri_tnc_implemen_det` (
  `tnci_det_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id  NCP detail',
  `tncp_laphead_id` bigint(20) DEFAULT NULL COMMENT 'id  NCP Header, FK dari tri_tncp_lap_header',
  `mdx_id` smallint(6) DEFAULT NULL COMMENT 'FK dari tri_master_dx',
  `mncp_item_id` int(11) DEFAULT NULL COMMENT 'FK dari tabel tri_mncp_item where mncp_head_id = 3, khusus intervensi',
  `tnci_det_tgl` date DEFAULT NULL,
  `tnci_det_shift` enum('Pagi','Siang','Malam') DEFAULT NULL,
  `tnci_det_nilai` tinyint(4) DEFAULT 0,
  `tnci_det_status_ttd` tinyint(4) DEFAULT NULL,
  `tnci_det_passcode` varchar(255) DEFAULT NULL,
  `tnci_det_file_ttd` varchar(255) DEFAULT NULL,
  `tnci_petugas_id` int(11) DEFAULT NULL COMMENT 'm_pegawai',
  PRIMARY KEY (`tnci_det_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `tri_tncp_lap_detail` */

DROP TABLE IF EXISTS `tri_tncp_lap_detail`;

CREATE TABLE `tri_tncp_lap_detail` (
  `tncp_lapdet_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id  NCP detail',
  `tncp_laphead_id` bigint(20) DEFAULT NULL COMMENT 'id  NCP Header, FK dari tri_tncp_lap_header',
  `mdx_id` smallint(6) DEFAULT NULL COMMENT 'FK dari Master_dx',
  `mncp_head_id` tinyint(4) DEFAULT NULL COMMENT 'FK dari tri_mncp_head, 1 = Diagnosa Keperawatan, 2 = Tujuan dan Kriteria Hasil, 3 = Intervensi',
  `mncp_item_id` int(11) DEFAULT NULL COMMENT 'FK dari tabel tri_mncp_item',
  `tncp_det_nilai` smallint(6) DEFAULT 0,
  PRIMARY KEY (`tncp_lapdet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `tri_tncp_lap_header` */

DROP TABLE IF EXISTS `tri_tncp_lap_header`;

CREATE TABLE `tri_tncp_lap_header` (
  `tncp_laphead_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id  NCP Header',
  `layanan_id` varchar(20) DEFAULT NULL,
  `no_registrasi` varchar(20) DEFAULT NULL,
  `no_rm` varchar(20) DEFAULT NULL,
  `subunit_id` int(11) DEFAULT NULL COMMENT 'FK dari m_subunit_medik',
  `kamar` varchar(6) DEFAULT NULL,
  `mdx_id` smallint(6) DEFAULT NULL COMMENT 'FK dari tri_master_dx',
  `tncp_laphead_tgl_buat` date DEFAULT NULL,
  `tncp_laphead_tgl_teratasi` date DEFAULT NULL,
  `tncp_laphead_status_ttd` tinyint(4) DEFAULT NULL,
  `tncp_laphead_passcode` varchar(255) DEFAULT NULL,
  `tncp_laphead_file_ttd` varchar(255) DEFAULT NULL,
  `tnci_petugas_id` int(11) DEFAULT NULL COMMENT 'm_pegawai',
  `tncp_isaktif` tinyint(4) DEFAULT 1,
  PRIMARY KEY (`tncp_laphead_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `tri_totv_obstandavital_d` */

DROP TABLE IF EXISTS `tri_totv_obstandavital_d`;

CREATE TABLE `tri_totv_obstandavital_d` (
  `totv_header_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id  NCP Header',
  `totv_master_id` bigint(20) DEFAULT NULL COMMENT 'tri_totv_obstandavital_m',
  `totv_tgl_periksa` date DEFAULT NULL,
  `totv_shift_periksa` varchar(5) DEFAULT NULL COMMENT 'm_ref 372',
  `totv_jam_periksa` time DEFAULT NULL,
  `totv_nadi` tinyint(4) DEFAULT NULL COMMENT 'Denyut Nadi',
  `totv_suhu` float DEFAULT NULL COMMENT 'Suhu badan',
  `totv_tensi_sistol` smallint(6) DEFAULT NULL COMMENT 'Tekanan Darah Sistolik',
  `totv_tensi_diastol` smallint(6) DEFAULT NULL COMMENT 'Tekanan Darah Diastolik',
  `totv_skala_nyeri` smallint(4) DEFAULT NULL COMMENT 'Skala Nyeri',
  `totv_skor_jatuh` smallint(4) DEFAULT NULL COMMENT 'Skor Jatuh',
  `totv_berat_badan` smallint(4) DEFAULT NULL COMMENT 'Berat Badan',
  `totv_tinggi_badan` smallint(4) DEFAULT NULL COMMENT 'Tinggi Badan',
  `totv_respirasi` smallint(6) DEFAULT NULL,
  `totv_cgs_e` smallint(6) DEFAULT NULL,
  `totv_status_ttd` tinyint(4) DEFAULT NULL,
  `totv_cgs_v` smallint(6) DEFAULT NULL,
  `totv_cgs_m` smallint(6) DEFAULT NULL,
  `totv_pupil_kaki` varchar(5) DEFAULT NULL COMMENT 'mref 416',
  `totv_passcode` varchar(255) DEFAULT NULL,
  `totv_file_ttd` varchar(255) DEFAULT NULL,
  `totv_petugas_id` int(11) DEFAULT NULL COMMENT 'm_pegawai',
  `totv_isaktif` tinyint(4) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`totv_header_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `tri_totv_obstandavital_m` */

DROP TABLE IF EXISTS `tri_totv_obstandavital_m`;

CREATE TABLE `tri_totv_obstandavital_m` (
  `totv_header_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id  NCP Header',
  `layanan_id` varchar(20) DEFAULT NULL,
  `no_registrasi` varchar(20) DEFAULT NULL,
  `no_rm` varchar(20) DEFAULT NULL,
  `subunit_id` int(11) DEFAULT NULL COMMENT 'FK dari m_subunit_medik',
  `doc_kode` varchar(20) DEFAULT NULL,
  `doc_id` bigint(20) DEFAULT NULL,
  `kamar` varchar(6) DEFAULT NULL,
  `isaktif` tinyint(4) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`totv_header_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `ugd_triage` */

DROP TABLE IF EXISTS `ugd_triage`;

CREATE TABLE `ugd_triage` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `layanan_id` bigint(20) DEFAULT NULL COMMENT 't_layanan',
  `nomor_registrasi` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 't_layanan',
  `no_rm` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 't_layanan',
  `tanggal_datang` date DEFAULT NULL,
  `jam_datang` time DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `keluhan_utama` text COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'otomatis',
  `riwayat_penyakit_dahulu` text COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'otomatis',
  `alergi_id` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `alergi_obat_id` tinyint(4) DEFAULT NULL COMMENT 'entry;m_yesno',
  `alergi_makanan_id` tinyint(4) DEFAULT NULL COMMENT 'entry;m_yesno',
  `alergi_udara_id` tinyint(4) DEFAULT NULL COMMENT 'entry;m_yesno',
  `alergi_debu_id` tinyint(4) DEFAULT NULL COMMENT 'entry;m_yesno',
  `alergi_des` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'entry;',
  `doa_tanda_hidup_minus` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `doa_tidak_ada_denyut` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `doa_rc_minmin` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `doa_ekg_flat` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `doa_waktu` time DEFAULT NULL COMMENT 'entry',
  `doa_trauma_obsetri` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'm_ref 414',
  `tv_td_sistol` int(11) DEFAULT NULL COMMENT 'entry',
  `tv_td_diastol` int(11) DEFAULT NULL COMMENT 'entry',
  `tv_rr` int(11) DEFAULT NULL COMMENT 'entry',
  `tv_nadi` int(11) DEFAULT NULL COMMENT 'entry',
  `tv_suhu` float DEFAULT NULL COMMENT 'entry',
  `status_psi_nilai` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'm_ref groupid=353',
  `nyeri_nilai` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'm_ref groupid=354',
  `nyeri_lokasi` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'entry atau ambil dari tri_nyeri',
  `nyeri_durasi` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'm_ref groupid=327 atau ambil dari ugd_nyeri',
  `resiko_jatuh` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'm_ref groupid=355 atau dari tri_resiko_jatuh_anak atau dewasa',
  `jalan_nafas` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'm_ref groupid=356',
  `pernafasan` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'm_ref groupid=357',
  `sirkulasi` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'm_ref groupid=358',
  `kesadaran` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'm_ref groupid=359',
  `gcs_e` smallint(6) DEFAULT NULL COMMENT 'entry',
  `gcs_v` smallint(6) DEFAULT NULL COMMENT 'entry',
  `gcs_m` smallint(6) DEFAULT NULL COMMENT 'entry',
  `keterangan` text COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'entry',
  `kesimpulan_triage` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'm_ref 415',
  `perawat_id` int(11) DEFAULT NULL COMMENT 'm_pegawai perawat',
  `dokter_id` int(11) DEFAULT NULL COMMENT 'm_pegawai dokter',
  `jn_obstruksi` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `jn_parsial_obstruksi` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `jn_paten` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `pn_henti_nafas` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `pn_distres_berat` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `pn_nafas_berat` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `pn_distres_ringan` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `pn_nafas_normal` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `sk_henti_jantung` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `sk_gangguan_hmd` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `sk_pendarahan_tt` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `sk_gangguan_hmd_rs` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `sk_nadi_kuat` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `sk_frek_nadi_normal` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `sk_td_normal` tinyint(4) DEFAULT NULL COMMENT 'm_yesno',
  `ksd_gcs` smallint(6) DEFAULT NULL COMMENT 'otomatis dari gcs_e, gcs_v, gcs_m m_ref groupid=359',
  PRIMARY KEY (`id`),
  KEY `regencies_province_id_index` (`nomor_registrasi`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

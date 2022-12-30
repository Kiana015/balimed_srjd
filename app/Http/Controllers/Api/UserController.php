<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Auth;
use App\Models\Log;

use App\Models\Menus;
use App\Models\Pegawai;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        /**
         * Karena ini mode tanpa auth, tak kasi kredensial ku
         */
        return response()->json(json_decode('{"status":true,"message":"ok","data":{"user":{"id":38,"name":"Jhonarendra","firstname":null,"lastname":null,"email":"jhonarendra","phone":"08563870242","file_photo":null,"email_verified_at":null,"phone_verified_at":null,"created_at":"2022-12-14T04:55:04.000000Z","updated_at":"2022-12-14T04:55:04.000000Z"},"pegawai":{"id":403,"kode":null,"no_induk":"0819811","absen_id":"2","kode_bpjs":"PER","nama":"Jon Perawat","nama_tercetak":null,"gelar_depan":null,"gelar_belakang":null,"status_pegawai_id":null,"jenis_profesi_id":7,"spesialisasi_id":null,"sub_spesialisasi_id":null,"qualifikasi_id":null,"pendidikan_terakhir_id":null,"jabatan_fungsional_terakhir":null,"jabatan_struktural_id":null,"no_sip_terakhir":null,"unit_id":null,"subunit_id":null,"tempat_lahir":null,"tanggal_lahir":null,"jeniskelamin_id":null,"agama_id":null,"bahasa_aktif_id":null,"alamat":null,"dusun":null,"desa_id":null,"kecamatan_id":null,"kabupaten_id":null,"provinsi_id":null,"kodepos":null,"nik":null,"npwp":null,"file_photo":null,"file_ktp":null,"file_kk":null,"file_npwp":null,"status_nikah_id":null,"status_daftar_id":null,"created_at":null,"created_by":null,"updated_at":null,"updated_by":null,"deleted_at":null,"sso_user_id":38,"passcode":null,"valid_until":null,"subunit":null},"roles":[{"role_id":31,"role_name":"Admin","ability":"admin"},{"role_id":32,"role_name":"User","ability":"user"}],"active_role":{"role_id":31,"role_name":"Admin","ability":"admin"},"menu":[{"id":1,"text":"Dashboard","desc":"dashboard pengguna","link":"\/spa","icon":"ti-pie-chart","children":[]},{"id":211,"text":"Triage","desc":"Contoh Form (Triage)","link":"\/spa\/triage","icon":"ti-list","children":[]},{"id":196,"text":"E-Resep","desc":"E-Resep","link":"\/spa\/resep","icon":"ti-book","children":[]},{"id":193,"text":"Laboratorium","desc":"Laboratorium","link":"\/spa\/laboratorium","icon":"ti-tablet","children":[]},{"id":195,"text":"Tindakan","desc":"Tindakan","link":"\/spa\/tindakan","icon":"ti-hand-stop","children":[]},{"id":6,"text":"Master RBAC","desc":"Role Base Access Control","link":"-","icon":"ti-lock","children":[{"id":7,"text":"RBAC Menus","desc":"setting role akses pengguna","link":"\/rbac\/menu","icon":"ti-lock"},{"id":8,"text":"RBAC Permission","desc":"setting role permission","link":"\/rbac\/permission","icon":"ti-lock"},{"id":9,"text":"RBAC Role","desc":"RBAC Role","link":"\/rbac\/role","icon":"ti-lock"},{"id":10,"text":"RBAC Role Permission","desc":"RBAC Role Permission","link":"\/rbac\/rolepermission","icon":"ti-lock"},{"id":11,"text":"RBAC User Role","desc":"RBAC User Role","link":"\/rbac\/userrole","icon":"ti-lock"}]}],"permission":[{"perm_id":1,"perm_desc":"View Dashboard"},{"perm_id":6,"perm_desc":"View Master RBAC"},{"perm_id":7,"perm_desc":"View RBAC Menu"},{"perm_id":8,"perm_desc":"View RBAC Permission"},{"perm_id":9,"perm_desc":"View RBAC Role"},{"perm_id":10,"perm_desc":"View RBAC Role Permission"},{"perm_id":11,"perm_desc":"View RBAC User Role"},{"perm_id":12,"perm_desc":"Change Role Active"},{"perm_id":187,"perm_desc":"View Antrian"},{"perm_id":188,"perm_desc":"View Assessment Keperawatan"},{"perm_id":190,"perm_desc":"View Assessment Medis"},{"perm_id":191,"perm_desc":"View Laboratorium"},{"perm_id":192,"perm_desc":"View Radiologi"},{"perm_id":193,"perm_desc":"View Tindakan"},{"perm_id":194,"perm_desc":"View Resep"},{"perm_id":197,"perm_desc":"View Kamar Operasi"},{"perm_id":198,"perm_desc":"View Kamar Bersalin"},{"perm_id":200,"perm_desc":"View Hemodialisa"},{"perm_id":202,"perm_desc":"View Dokumen"},{"perm_id":204,"perm_desc":"Memilih Dokter Aktif"},{"perm_id":205,"perm_desc":"View Pasien"},{"perm_id":208,"perm_desc":"View Perpindahan"},{"perm_id":209,"perm_desc":"View Triage"},{"perm_id":210,"perm_desc":"View Observasi"}]}}'));
        $menuDb = Menus::all()->toArray();

        $menuSes = session('menu');

        $menu = [];

        foreach ($menuSes as $m) {
            $index = array_search($m['id'], array_map(function($e) {
                return $e['id'];
            }, $menuDb));
            $find = $menuDb[$index];

            $row = array(
                'id' => $find['id'],
                'text' => $find['text'],
                'desc' => $find['desc'],
                'link' => $find['link'],
                'icon' => $find['icon'],
                'children' => []
            );

            foreach($m['children'] as $c) {
                $index = array_search($c['id'], array_map(function($e) {
                    return $e['id'];
                }, $menuDb));
                $find = $menuDb[$index];
                
                $rowC = array(
                    'id' => $find['id'],
                    'text' => $find['text'],
                    'desc' => $find['desc'],
                    'link' => $find['link'],
                    'icon' => $find['icon'],
                );
                array_push($row['children'], $rowC);
            }
            array_push($menu, $row);
        }

        $pegawai = $this->getPegawaiUser();

        Log::create([
            'id_user' => Auth::user()->id,
            'keterangan' => 'Get User'
        ]);

        return response()->json([
            'status' => true,
            'message' => 'ok',
            'data' => array(
                'user' => Auth::user(),
                'pegawai' => $pegawai,
                'roles' => session('roles'),
                'active_role' => session('role_active'),
                'menu' => $menu,
                'permission' => session('permissions')
            )
        ]);
    }


    /**
     * 
     * Fungsi ini shareable ke berbagai controller yang membutuhkan pegawai user
     * 
     */
    public function getPegawaiUser()
    {
        /**
         * Bisa saja akunnya berelasi ke pegawai
         * Tidak tahu apakah semua sistem akunnya berelasi ke pegawai atau tidak
         * 
         * Admin: pegawai jenis prodesi id = 7
         * Dokter: pegawai jenis profesi id = 5
         * Perawat: pegawai jenis profesdi id = 7
         */
        $currentRole = session('role_active')['ability'];
        
        $filterPegawai = array(
            'sso_user_id' => Auth::user()->id,
        );

        $pegawai = null;
        if (in_array($currentRole, ['admin', 'dokter', 'perawat'])) {
            if ($currentRole === 'dokter') {
                $filterPegawai['jenis_profesi_id'] = 5;
            } else if ($currentRole === 'perawat' || $currentRole === 'admin') {
                $filterPegawai['jenis_profesi_id'] = 7;
            }
            $pegawai = Pegawai::with([
                'subunit' => function($q) {
                    $q->select('id', 'unit_id', 'kode_subunit', 'nama_subunit');
                }
            ])
            ->where($filterPegawai)
            ->first();
        }
        return $pegawai;
    }
}

<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use DB;
use Auth;
use App\Models\Log;
use App\Models\Icd;

class MasterController extends Controller
{
    /**
     * Display a listing of the resource.
     * ada param 'kode' untuk merujuk ke master mana
     *
     * @return \Illuminate\Http\Response
     */
    public function index($id)
    {
        $data = DB::connection('mysql2');
        
        $whereDeletedAtAndGet = true;
        switch ($id) {
            case 'ya-tidak':
                $data = $data->table('m_yesno');
                break;
            case 'jenis-nyeri':
                $data = $data->table('m_ref')->where('group_id', 323);
                break;
            case 'kualitas-nyeri':
                $data = $data->table('m_ref')->where('group_id', 324);
                break;
            case 'menjalar-nyeri':
                $data = $data->table('m_ref')->where('group_id', 325);
                break;
            case 'tingkatan-nyeri':
                $data = $data->table('m_ref')->where('group_id', 326);
                break;
            case 'waktu-nyeri':
                $data = $data->table('m_ref')->where('group_id', 327);
                break;
            case 'sistem-scoring-nyeri':
                $data = $data->table('m_ref')->where('group_id', 328);
                break;
            case 'sumber-data-medis':
                $data = $data->table('m_ref')->where('group_id', 329);
                break;
            case 'pendidikan':
                $data = $data->table('m_pendidikan');
                break;
            case 'pekerjaan':
                $data = $data->table('m_pekerjaan');
                break;
            case 'tinggal-bersama':
                $data = $data->table('m_ref')->where('group_id', 330);
                break;
            case 'kebiasaan':
                $data = $data->table('m_ref')->where('group_id', 331);
                break;
            case 'agama':
                $data = $data->table('m_agama');
                break;
            case 'data-medis-bicara':
                $data = $data->table('m_ref')->where('group_id', 332);
                break;
            case 'kondisi-pulang':
                $data = $data->table('m_ref')->where('group_id', 361);
                break;
            case 'status-nikah':
                $data = $data->table('m_statusnikah');
                break;
            case 'icd':
                $data = $data->table('m_icd')->selectRaw('kd_diagnosa, kd_dtd, concat(kd_diagnosa, " - ", kd_dtd, " - ", nm_diagnosa) as label');
                break;
            case 'subunit-medik':
                $data = $data->table('m_subunit_medik');
                break;
            case 'subunit-medik-rawat-inap':
                $data = $data->table('m_subunit_medik')
                ->select('m_subunit_medik.*')
                ->join('m_unit_medik', 'm_unit_medik.id', 'm_subunit_medik.unit_id')
                ->join('m_instalasi_medik', 'm_instalasi_medik.id', 'm_unit_medik.instalasi_id')
                ->whereIn('instalasi_id', [2, 3, 9])
                ->where('m_subunit_medik.deleted_at', null)->get();
                $whereDeletedAtAndGet = false;
                break;
            case 'subunit-kamar':
                $data = $data->table('m_subunit_kamar');
                break;
            case 'poliklinik':
                $data = $data->table('m_subunit_medik')->select('id', 'kode_subunit', 'nama_subunit')->where('unit_id', 1);
                break;
            case 'dokter':
                $data = $data->table('m_pegawai');
                break;
            case 'keadaan-umum':
                $data = $data->table('m_ref')->where('group_id', 337);
                break;
            case 'gizi':
                $data = $data->table('m_ref')->where('group_id', 338);
                break;
            case 'abdomen-peristaltik':
                $data = $data->table('m_ref')->where('group_id', 344);
                break;
            case 'jenis-rujukan':
                $data = $data->table('m_ref')->where('group_id', 351);
                break;
            case 'jenis-rujukan-kedatangan':
                $data = $data->table('m_ref')->where('group_id', 428);
                break;
            case 'rawat-lanjutan':
                $data = $data->table('m_ref')->where('group_id', 352);
                break;
            case 'jenis-kasus':
                $data = $data->table('m_ref')->where('group_id', 345);
                break;
            case 'data-obyektif-jalan-nafas':
                $data = $data->table('m_ref')->where('group_id', 429);
                break;
            case 'data-obyektif-pernafasan':
                $data = $data->table('m_ref')->where('group_id', 430);
                break;
            case 'data-obyektif-jantung':
                $data = $data->table('m_ref')->where('group_id', 431);
                break;
            case 'data-obyektif-neurologis':
                $data = $data->table('m_ref')->where('group_id', 432);
                break;
            case 'group-faskes':
                $data = $data->table('m_group_faskes');
                break;
            case 'subunit-rawat-inap':
                $data = $data->table('m_subunit_medik')->where('unit_id', 3);
                break;
            case 'kedatangan-ugd':
                $data = $data->table('m_ref')->where('group_id', 413);
                break;
            case 'doa-trauma-obstetri':
                $data = $data->table('m_ref')->where('group_id', 414);
                break;
            case 'status-psikologi':
                $data = $data->table('m_ref')->where('group_id', 353);
                break;
            case 'nyeri-nilai':
                $data = $data->table('m_ref')->where('group_id', 354);
                break;
            case 'resiko-jatuh':
                $data = $data->table('m_ref')->where('group_id', 355);
                break;
            case 'jalan-nafas':
                $data = $data->table('m_ref')->where('group_id', 356);
                break;
            case 'pernafasan':
                $data = $data->table('m_ref')->where('group_id', 357);
                break;
            case 'sirkulasi':
                $data = $data->table('m_ref')->where('group_id', 358);
                break;
            case 'kesadaran':
                $data = $data->table('m_ref')->where('group_id', 359);
                break;
            case 'kesimpulan-triage':
                $data = $data->table('m_ref')->where('group_id', 415);
                break;
            case 'askep-airway':
                $data = $data->table('m_ref')->where('group_id', 433);
                break;
            case 'askep-breathing':
                $data = $data->table('m_ref')->where('group_id', 434);
                break;
            case 'askep-circulation':
                $data = $data->table('m_ref')->where('group_id', 435);
                break;
            case 'askep-kelas-rjd':
                $data = $data->table('m_ref')->where('group_id', 436);
                break;
            case 'askep-kelas-rja':
                $data = $data->table('m_ref')->where('group_id', 437);
                break;
            case 'kasus-ugd':
                $data = $data->table('m_ref')->where('group_id', 438);
                break;
            case 'dkgd':
                $data = $data->table('m_ref')->where('group_id', 439);
                break;
            case 'rkgd':
                $data = $data->table('m_ref')->where('group_id', 440);
                break;
            default:
                $data = null;
        }
        if ($whereDeletedAtAndGet && $data) {
            $data = $data->where('deleted_at', null)->get();
        }
        

        return response()->json([
            'status' => true,
            'message' => 'Berhasil mengambil data',
            'data' => $data
        ]);
    }


    public function getFaskes(Request $req)
    {
        if (!isset($req->group_faskes_id)) {
            return response()->json([
                'status' => false,
                'message' => 'Group Faskes Wajib Diisi',
                'data' => null
            ]);
        }
        
        $data = DB::connection('mysql2');
        
        $data = $data->table('m_faskes')
        ->where('group_faskes_id', $req->group_faskes_id)
        ->get();

        return response()->json([
            'status' => true,
            'message' => 'Berhasil mengambil data',
            'data' => $data
        ]);
    }

    /**
     * Ambil master sekaligus
     * $slug comma separated
     */
    public function getMulti($slug)
    {
        $dataSlug = explode(',', $slug);
        $data = array();
        foreach ($dataSlug as $s) {
            $dataMaster = $this->index($s);
            $dataMaster = json_decode($dataMaster->content(), true);
            $data[$s] = $dataMaster['data'];
        }
        return response()->json([
            'status' => true,
            'message' => 'Berhasil mengambil data',
            'data' => $data
        ]);
    }


    /**
     * icd10
     */
    public function paginateIcd (Request $req)
    {
        // validasi request
        $input = $req->all();
        $rules = [
            'sort_by' => 'required',
            'sort_order' => 'required',
            'per_page' => 'required'
        ];
        $validator = Validator::make($input, $rules)->messages()->toArray();

        if (!empty($validator)) {
            return response()->json([
                'status' => false,
                'message' => 'Perbaiki Isian',
                'data' => $validator
            ]);
        }

        

        $data = DB::connection('mysql2')->table('m_icd')
        ->when($req->q, function ($q) use ($req) {
			$q->where('m_icd.nm_diagnosa', 'LIKE', '%' . $req->q . '%')
			->orWhere('m_icd.ket', 'LIKE', '%' . $req->q . '%')
			->orWhere('m_icd.kd_diagnosa', 'LIKE', '%' . $req->q . '%');
		})
		->orderBy($req->sort_by, $req->sort_order)
        ->paginate($req->per_page);

        return response()->json([
            'status' => true,
            'message' => 'Berhasil mengambil data',
            'data' => $data
        ]);
    }
}  

<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\resikoJatuhDewasa;
use Illuminate\Support\Facades\Validator;

class resikoJatuhDewasaController extends Controller
{
    public function showData()
    {
        $data = resikoJatuhDewasa::orderBy('tanggal','asc')
            ->orderBy('jam','asc')
            ->get();
        return response()->json([
            'data' => $data
        ]);
    }
    public function showSpecData($id)
    {
        $data = resikoJatuhDewasa::where('id',$id)->get();
        return response()->json([
            'data' => $data
        ]);
    }
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'usia_pilihan'   => 'required',
            'defisit_sensoris_pilihan' => 'required',
            'aktivitas_pilihan'   => 'required',
            'riwayat_jatuh_pilihan' => 'required',
            'kognisi_pilihan'   => 'required',
            'pengobatan_pilihan' => 'required',
            'mobilitas_pilihan'   => 'required',
            'pola_bab_bak_pilihan' => 'required',
            'komorbiditas_pilihan'   => 'required',
            'keterangan' => 'required',
            // 'tanggal' => 'required',
            // 'jam' => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        }
        $skor = 0;
        $usia_skor; $defisit_sensoris_skor; $aktivitas_skor; $riwayat_jatuh_skor;
        $kognisi_skor; $pengobatan_skor; $mobilitas_skor; $pola_bab_bak_skor; $komorbiditas_skor; $resiko;
        switch ($request->usia_pilihan) {
            case 1:
                $usia_skor = 0;
                break;
            case 2:
                $usia_skor = 1;
                $skor = $skor + 1;
                break;
            case 3:
                $usia_skor = 2;
                $skor = $skor + 2;
                break;
        }
        switch ($request->defisit_sensoris_pilihan) {
            case 1:
                $defisit_sensoris_skor = 0;
                break;
            case ($request->defisit_sensoris_pilihan > 1 && $request->defisit_sensoris_pilihan < 4):
                $defisit_sensoris_skor = 1;
                $skor = $skor + 1;
                break;
            case ($request->defisit_sensoris_pilihan > 4):
                $defisit_sensoris_skor = 2;
                $skor = $skor + 2;
                break;
        }
        switch ($request->aktivitas_pilihan) {
            case 1:
                $aktivitas_skor = 0;
                break;
            case 2:
                $aktivitas_skor = 2;
                $skor = $skor + 2;
                break;
            case 3:
                $aktivitas_skor = 3;
                $skor = $skor + 3;
                break;
        }
        switch ($request->riwayat_jatuh_pilihan) {
            case 1:
                $riwayat_jatuh_skor = 0;
                break;
            case 2:
                $riwayat_jatuh_skor = 1;
                $skor = $skor + 1;
                break;
            case 3:
                $riwayat_jatuh_skor = 2;
                $skor = $skor + 2;
                break;
            case 4:
                $riwayat_jatuh_skor = 3;
                $skor = $skor + 3;
                break;
        }
        switch ($request->kognisi_pilihan) {
            case 1:
                $kognisi_skor = 0;
                break;
            case ($request->kognisi_pilihan > 1 && $request->kognisi_pilihan < 4):
                $kognisi_skor = 2;
                $skor = $skor + 2;
                break;
            case ($request->kognisi_pilihan > 4):
                $kognisi_skor = 3;
                $skor = $skor + 2;
                break;
        }
        switch ($request->pengobatan_pilihan) {
            case 1:
                $pengobatan_skor = 1;
                $skor = $skor + 1;
                break;
            case ($request->pengobatan_pilihan > 1):
                $pengobatan_skor = 2;
                $skor = $skor + 2;
                break;
        }
        switch ($request->mobilitas_pilihan) {
            case 1:
                $mobilitas_skor = 0;
                break;
            case 2:
                $mobilitas_skor = 1;
                $skor = $skor + 1;
                break;
            case 3:
                $mobilitas_skor = 2;
                $skor = $skor + 2;
                break;
            case 4:
                $mobilitas_skor = 2;
                $skor = $skor + 3;
                break;
            case ($request->mobilitas_pilihan > 4):
                $mobilitas_skor = 4;
                $skor = $skor + 4;
                break;
        }
        switch ($request->pola_bab_bak_pilihan) {
            case 1:
                $pola_bab_bak_skor = 0;
                break;
            case 2:
                $pola_bab_bak_skor = 1;
                $skor = $skor + 1;
                break;
            case 3:
                $pola_bab_bak_skor = 2;
                $skor = $skor + 2;
                break;
            case 4:
                $pola_bab_bak_skor = 3;
                $skor = $skor + 3;
                break;
        }
        switch ($request->komorbiditas_pilihan) {
            case 1:
                $komorbiditas_skor = 2;
                $skor = $skor + 2;
                break;
            case ($request->komorbiditas_pilihan > 1):
                $komorbiditas_skor = 3;
                $skor = $skor + 3;
                break;
        }
        $jumlah_skor = $skor;
        switch($skor){
            case ($skor < 8):
                $resiko = 1;
                break;
            case ($skor >= 8 && $skor <= 13):
                $resiko = 2;
                break;
            case ($skor >= 14):
                $resiko = 3;
                break;
        }
        $post = resikoJatuhDewasa::create([
            'tanggal' => date('Ymd', strtotime($request->tanggal)),
            'jam' => date('His',strtotime($request->jam)),
            'usia_pilihan' => $request->usia_pilihan,
            'defisit_sensoris_pilihan' => $request->defisit_sensoris_pilihan,
            'aktivitas_pilihan' => $request->aktivitas_pilihan,
            'riwayat_jatuh_pilihan' => $request->riwayat_jatuh_pilihan,
            'kognisi_pilihan' => $request->kognisi_pilihan,
            'pengobatan_pilihan' => $request->pengobatan_pilihan,
            'mobilitas_pilihan' => $request->mobilitas_pilihan,
            'pola_bab_bak_pilihan' => $request->pola_bab_bak_pilihan,
            'komorbiditas_pilihan' => $request->komorbiditas_pilihan,
            'keterangan' => $request->keterangan,
            'usia_skor' => $usia_skor,
            'defisit_sensoris_skor' => $defisit_sensoris_skor,
            'aktivitas_skor' => $aktivitas_skor,
            'riwayat_jatuh_skor' => $riwayat_jatuh_skor,
            'kognisi_skor' => $kognisi_skor,
            'pengobatan_skor' => $pengobatan_skor,
            'mobilitas_skor' => $mobilitas_skor,
            'pola_bab_bak_skor' => $pola_bab_bak_skor,
            'komorbiditas_skor' => $komorbiditas_skor,
            'jumlah_skor' => $jumlah_skor,
            'resiko' => $resiko,
        ]);        
        if($post)
        {
            return response()->json([
                'status' => true,
            ], 201);
        }
        else
        {
            return response()->json([
                'status' => false,
            ], 409);
        }
    }
    public function update($srjd,Request $request)
    {
        $validator = Validator::make($request->all(), [
            'usia_pilihan'   => 'required',
            'defisit_sensoris_pilihan' => 'required',
            'aktivitas_pilihan'   => 'required',
            'riwayat_jatuh_pilihan' => 'required',
            'kognisi_pilihan'   => 'required',
            'pengobatan_pilihan' => 'required',
            'mobilitas_pilihan'   => 'required',
            'pola_bab_bak_pilihan' => 'required',
            'komorbiditas_pilihan'   => 'required',
            'keterangan' => 'required',
            'tanggal' => 'required',
            'jam' => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        }
        $skor = 0;
        $usia_skor; $defisit_sensoris_skor; $aktivitas_skor; $riwayat_jatuh_skor;
        $kognisi_skor; $pengobatan_skor; $mobilitas_skor; $pola_bab_bak_skor; $komorbiditas_skor; $resiko;
        switch ($request->usia_pilihan) {
            case 1:
                $usia_skor = 0;
                break;
            case 2:
                $usia_skor = 1;
                $skor = $skor + 1;
                break;
            case 3:
                $usia_skor = 2;
                $skor = $skor + 2;
                break;
        }
        switch ($request->defisit_sensoris_pilihan) {
            case 1:
                $defisit_sensoris_skor = 0;
                break;
            case ($request->defisit_sensoris_pilihan > 1 && $request->defisit_sensoris_pilihan < 4):
                $defisit_sensoris_skor = 1;
                $skor = $skor + 1;
                break;
            case ($request->defisit_sensoris_pilihan > 4):
                $defisit_sensoris_skor = 2;
                $skor = $skor + 2;
                break;
        }
        switch ($request->aktivitas_pilihan) {
            case 1:
                $aktivitas_skor = 0;
                break;
            case 2:
                $aktivitas_skor = 2;
                $skor = $skor + 2;
                break;
            case 3:
                $aktivitas_skor = 3;
                $skor = $skor + 3;
                break;
        }
        switch ($request->riwayat_jatuh_pilihan) {
            case 1:
                $riwayat_jatuh_skor = 0;
                break;
            case 2:
                $riwayat_jatuh_skor = 1;
                $skor = $skor + 1;
                break;
            case 3:
                $riwayat_jatuh_skor = 2;
                $skor = $skor + 2;
                break;
            case 4:
                $riwayat_jatuh_skor = 3;
                $skor = $skor + 3;
                break;
        }
        switch ($request->kognisi_pilihan) {
            case 1:
                $kognisi_skor = 0;
                break;
            case ($request->kognisi_pilihan > 1 && $request->kognisi_pilihan < 4):
                $kognisi_skor = 2;
                $skor = $skor + 2;
                break;
            case ($request->kognisi_pilihan > 4):
                $kognisi_skor = 3;
                $skor = $skor + 2;
                break;
        }
        switch ($request->pengobatan_pilihan) {
            case 1:
                $pengobatan_skor = 1;
                $skor = $skor + 1;
                break;
            case ($request->pengobatan_pilihan > 1):
                $pengobatan_skor = 2;
                $skor = $skor + 2;
                break;
        }
        switch ($request->mobilitas_pilihan) {
            case 1:
                $mobilitas_skor = 0;
                break;
            case 2:
                $mobilitas_skor = 1;
                $skor = $skor + 1;
                break;
            case 3:
                $mobilitas_skor = 2;
                $skor = $skor + 2;
                break;
            case 4:
                $mobilitas_skor = 2;
                $skor = $skor + 3;
                break;
            case ($request->mobilitas_pilihan > 4):
                $mobilitas_skor = 4;
                $skor = $skor + 4;
                break;
        }
        switch ($request->pola_bab_bak_pilihan) {
            case 1:
                $pola_bab_bak_skor = 0;
                break;
            case 2:
                $pola_bab_bak_skor = 1;
                $skor = $skor + 1;
                break;
            case 3:
                $pola_bab_bak_skor = 2;
                $skor = $skor + 2;
                break;
            case 4:
                $pola_bab_bak_skor = 3;
                $skor = $skor + 3;
                break;
        }
        switch ($request->komorbiditas_pilihan) {
            case 1:
                $komorbiditas_skor = 2;
                $skor = $skor + 2;
                break;
            case ($request->komorbiditas_pilihan > 1):
                $komorbiditas_skor = 3;
                $skor = $skor + 3;
                break;
        }
        $jumlah_skor = $skor;
        switch($skor){
            case ($skor < 8):
                $resiko = 1;
                break;
            case ($skor >= 8 && $skor <= 13):
                $resiko = 2;
                break;
            case ($skor >= 14):
                $resiko = 3;
                break;
        }
        $post = resikoJatuhDewasa::findOrFail($srjd);
        $post->update([
            'tanggal' => date('Ymd'),
            'jam' => date('His'),
            'usia_pilihan' => $request->usia_pilihan,
            'defisit_sensoris_pilihan' => $request->defisit_sensoris_pilihan,
            'aktivitas_pilihan' => $request->aktivitas_pilihan,
            'riwayat_jatuh_pilihan' => $request->riwayat_jatuh_pilihan,
            'kognisi_pilihan' => $request->kognisi_pilihan,
            'pengobatan_pilihan' => $request->pengobatan_pilihan,
            'mobilitas_pilihan' => $request->mobilitas_pilihan,
            'pola_bab_bak_pilihan' => $request->pola_bab_bak_pilihan,
            'komorbiditas_pilihan' => $request->komorbiditas_pilihan,
            'keterangan' => $request->keterangan,
            'usia_skor' => $usia_skor,
            'defisit_sensoris_skor' => $defisit_sensoris_skor,
            'aktivitas_skor' => $aktivitas_skor,
            'riwayat_jatuh_skor' => $riwayat_jatuh_skor,
            'kognisi_skor' => $kognisi_skor,
            'pengobatan_skor' => $pengobatan_skor,
            'mobilitas_skor' => $mobilitas_skor,
            'pola_bab_bak_skor' => $pola_bab_bak_skor,
            'komorbiditas_skor' => $komorbiditas_skor,
            'jumlah_skor' => $jumlah_skor,
            'resiko' => $resiko,
            'tanggal' => $request->tanggal,
            'jam' => $request->jam
        ]);        
        if($post)
        {
            return response()->json([
                'status' => true,
            ], 201);
        }
        else
        {
            return response()->json([
                'status' => false,
            ], 409);
        }
    }
    public function delete($srjd)
    {
        $post = resikoJatuhDewasa::find($srjd);
        if($post->delete())
        {
            return response()->json([
                'status' => 'completed!',
            ]);
        }
        else
        {
            return response()->json([
                'status' => 'failed',
            ]);
        }
    }
}

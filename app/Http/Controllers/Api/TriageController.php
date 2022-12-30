<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Auth;
use App\Models\Log;

use App\Models\Triage;

class TriageController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $req
     * @return \Illuminate\Http\Response
     */
    public function store(Request $req)
    {
        return response()->json([
            'status' => false,
            'message' => 'Tidak Diizinkan',
            'data' => null
        ]);

        $input = $req->all();
        Triage::create($input);
        Log::create([
            'id_user' => Auth::user()->id,
            'aksi' => 1,
            'nama_tabel' => 'ugd_triage',
            'keterangan' => 'Tambah triage [no_rm: '.$req->no_rm.']'
        ]);
        return response()->json([
            'status' => true,
            'message' => 'Berhasil menyimpan data',
            'data' => null
        ]);
    }

    
    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function showByLayananId($id)
    {
        $data = Triage::where('layanan_id', $id)->firstOrFail();
        return response()->json([
            'status' => true,
            'message' => 'Berhasil mengambil data',
            'data' => $data
        ]);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $req
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $req, $id)
    {
        return response()->json([
            'status' => false,
            'message' => 'Tidak Diizinkan',
            'data' => null
        ]);
        $input = $req->except(['_method']);
        Triage::findOrFail($id)->update($input);
        Log::create([
            'id_user' => Auth::user()->id,
            'aksi' => 3,
            'nama_tabel' => 'ugd_triage',
            'keterangan' => 'Edit triage [id: '.$id.']'
        ]);
        return response()->json([
            'status' => true,
            'message' => 'Berhasil meyimpan data',
            'data' => null
        ]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}

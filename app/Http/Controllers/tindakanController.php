<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\tindakan;
use Illuminate\Support\Facades\Validator;

class tindakanController extends Controller
{
    public function showData()
    {
        $data = tindakan::orderBy('tri_resiko_jatuh_dewasa_id','asc')
            ->get();
        return response()->json([
            'data' => $data
        ]);
    }
    public function showSpecData($id)
    {
        $data = tindakan::where('id',$id)->get();
        return response()->json([
            'data' => $data
        ]);
    }
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'tanggal' => 'required',
            'jam'=> 'required',
            'tri_resiko_jatuh_dewasa_id' => 'required',
            'keterangan' => 'required'
        ]);
        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        }
        $post = tindakan::create([
            'tanggal' => date('Ymd', strtotime($request->tanggal)),
            'jam' => date('His',strtotime($request->jam)),
            'tri_resiko_jatuh_dewasa_id' => $request->tri_resiko_jatuh_dewasa_id,
            'std_rr1' => $request->std_rr1,
            'std_rr2' => $request->std_rr2,
            'std_rr3' => $request->std_rr3,
            'std_rr4' => $request->std_rr4,
            'std_rr5' => $request->std_rr5,
            'std_rr6' => $request->std_rr6,
            'std_rr7' => $request->std_rr7,
            'std_rr8' => $request->std_rr8,
            'std_rr9' => $request->std_rr9,
            'std_rr10' => $request->std_rr10,
            'std_rt1' => $request->std_rt1,
            'std_rt2' => $request->std_rt2,
            'std_rt3' => $request->std_rt3,
            'std_rt4' => $request->std_rt4,
            'std_rt5' => $request->std_rt5,
            'std_rt6' => $request->std_rt6,
            'std_rt7' => $request->std_rt7,
            'std_rt8' => $request->std_rt8,
            'std_rst1' => $request->std_rst1,
            'std_rst2' => $request->std_rst2,
            'std_rst3' => $request->std_rst3,
            'std_rst4' => $request->std_rst4,
            'std_rst5' => $request->std_rst5,
            'evaluasi' => $request->evaluasi,
            'keterangan' => $request->keterangan
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
    public function update($id,Request $request)
    {
        $validator = Validator::make($request->all(), [
            'tanggal' => 'required',
            'jam'=> 'required',
            'tri_resiko_jatuh_dewasa_id' => 'required',
            'keterangan' => 'required'
        ]);
        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        }
        $post = tindakan::findOrFail($id);
        $post->update([
            'tanggal' => date('Ymd', strtotime($request->tanggal)),
            'jam' => date('His',strtotime($request->jam)),
            'tri_resiko_jatuh_dewasa_id' => $request->tri_resiko_jatuh_dewasa_id,
            'std_rr1' => $request->std_rr1,
            'std_rr2' => $request->std_rr2,
            'std_rr3' => $request->std_rr3,
            'std_rr4' => $request->std_rr4,
            'std_rr5' => $request->std_rr5,
            'std_rr6' => $request->std_rr6,
            'std_rr7' => $request->std_rr7,
            'std_rr8' => $request->std_rr8,
            'std_rr9' => $request->std_rr9,
            'std_rr10' => $request->std_rr10,
            'std_rt1' => $request->std_rt1,
            'std_rt2' => $request->std_rt2,
            'std_rt3' => $request->std_rt3,
            'std_rt4' => $request->std_rt4,
            'std_rt5' => $request->std_rt5,
            'std_rt6' => $request->std_rt6,
            'std_rt7' => $request->std_rt7,
            'std_rt8' => $request->std_rt8,
            'std_rst1' => $request->std_rst1,
            'std_rst2' => $request->std_rst2,
            'std_rst3' => $request->std_rst3,
            'std_rst4' => $request->std_rst4,
            'std_rst5' => $request->std_rst5,
            'evaluasi' => $request->evaluasi,
            'keterangan' => $request->keterangan
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
        $post = tindakan::find($srjd);
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

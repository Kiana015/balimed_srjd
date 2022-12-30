<?php
namespace App\Helpers;
use Illuminate\Support\Str;
use Illuminate\Support\Carbon;

class Formatting{
    /* 
    NIK terdiri dari 16 digit. 
    Kode penyusun NIK terdiri dari 2 digit awal merupakan kode provinsi,
    2 digit setelahnya merupakan kode kota/kabupaten,
    2 digit sesudahnya kode kecamatan,
    6 digit selanjutnya merupakan tanggal lahir dalam format hhbbtt (untuk wanita tanggal ditambah 40), 
    lalu 4 digit terakhir merupakan nomor urut yang dimulai dari 0001. 
    ****
    Sebagai contoh, misalkan seorang perempuan lahir di Kota Bandung tanggal 17 Agustus 1990 maka NIK-nya adalah: 
    10 50 24 570890 0001. 
    Apabila ada orang lain (perempuan) dengan domisili dan tanggal lahir yang sama mendaftar, maka NIK-nya adalah 10 50 24 570890 0002. 
    Apabila ada orang lain (laki-laki) dengan domisili dan tanggal lahir yang sama mendaftar, maka NIK-nya adalah 10 50 24 170890 0001.
    */
    static function splitInfoKTP($value) {
        $response = collect();
        $kode_prov = ""; $kode_kab = ""; $kode_kec = ""; $tgl_lahir=""; $jenis_kelamin = 1;
        if(Str::length($value)<=16){
            $kode_prov = Str::substr($value, 0, 2);
            $kode_kab = Str::substr($value,0,4);
            $kode_kec = Str::padRight(Str::substr($value,0,6),7,'0');
            $tgl_lahir = Str::substr($value,6,6);
            $d = (Str::substr($tgl_lahir, 0, 2));
            $m = Str::substr($tgl_lahir, 2, 2);
            $y = Str::substr($tgl_lahir, 4, 2);

            if($d>40){
                $jenis_kelamin = '2';
                $d = $d-40;
            }
            $tgl_lahir = $d.'-'.$m.'-'.$y;
            $tgl_lahir = Carbon::createFromFormat('d-m-y', $tgl_lahir)->format('Y-m-d');
            $tgl_lahir = explode('-',$tgl_lahir);
            $tgl_lahir[0] = ($tgl_lahir[0] > date('Y') ? $tgl_lahir[0]-100 : $tgl_lahir[0]);
            $tgl_lahir = implode('-',$tgl_lahir);
        }

        $response->put('kode_provinsi',$kode_prov);
        $response->put('kode_kab',$kode_kab);
        $response->put('kode_kec',$kode_kec);
        $response->put('tgl_lahir',$tgl_lahir);
        $response->put('jenis_kelamin',$jenis_kelamin);
        
        return $response;

    }

    static function generateTree($elements,$parentId = 0, $field='parent_id'){
        $branch = array();
        foreach ($elements as $element) {
            if ($element[$field] == $parentId) {
                $children = self::generateTree($elements, $element['id']);
                if ($children) {
                    $element['children'] = $children;
                } else {
                    $element['children'] = [];
                }
                $branch[] = $element;
            }
        }
        return $branch;
    }

    static function generateMenu($elements){
        $html = "";
        foreach($elements as $element){
            $html .=    "<li class='nk-menu-item ".(!empty($element['children']) ? 'has-sub':'')."'>";
            $html .=        "<a href='".(!empty($element['children']) ? '#' :  $element['link'])."' class='nk-menu-link ".(!empty($element['children']) ? 'nk-menu-toggle':'')."'>";
            $html .=             "<span class='nk-menu-text'><i class='{$element['icon']}'></i> {$element['text']}</span>";
            $html .=         "</a>";
            if(!empty($element['children'])){
                $html .= "<ul class='nk-menu-sub'>";
                $html .= self::generateMenu($element['children']);
                $html .= "</ul>";
            }
            $html .=       "</li>";
        }
        return $html;
    }
}
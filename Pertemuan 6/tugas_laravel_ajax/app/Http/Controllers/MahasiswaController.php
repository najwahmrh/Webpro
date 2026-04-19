<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;

class mahasiswaController extends Controller
{
    public function index()
    {
        return view('mahasiswa');
    }

        public function getDataMahasiswa()
    {
        // Tambahkan /data/ sebelum nama file
        $datapath = storage_path('app/data/mahasiswa.json');
        
        if (!File::exists($datapath)){
            return response()->json(['error'=> 'Data tidak ditemukan di: ' . $datapath], 404);
        }

        $jsonData = File::get($datapath);
        $arrayData = json_decode($jsonData, true);

        return response()->json($arrayData);
    }
}
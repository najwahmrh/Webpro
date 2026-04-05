<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class Latihan1Controller extends Controller
{
    // Fungsi untuk /lat1
    public function index()
    {
        $data["nama"] = "Najwa Humairah";
        $data["asal"] = "Bukittinggi";
        return view('latihan1', $data);
    }

    // Fungsi untuk /lat1/m2
    public function method2()
    {
        $data['title'] = "Daftar Mahasiswa";
        $data['daf_mhs'] = array(
            array("nama" => "Najwa", "asal" => "Agam"),
            array("nama" => "Humairah", "asal" => "Bukittinggi"),
            array("nama" => "Alya", "asal" => "Sumatera Barat"),
        );
        return view('latihan2', $data);
    }
}

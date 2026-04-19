<?php

use App\Http\Controllers\mahasiswaController;

// Route untuk tampilkan halaman utama
Route::get('/', [mahasiswaController::class, 'index']);

// Route untuk AJAX (Ini yang penting!)
Route::get('/mahasiswa', [mahasiswaController::class, 'getDataMahasiswa']);
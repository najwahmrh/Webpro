<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Latihan1Controller;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/lat1', [Latihan1Controller::class, 'index']);
Route::get('/lat1/m2', [Latihan1Controller::class, 'method2']);

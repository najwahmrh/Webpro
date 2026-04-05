<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    // 1. Menampilkan halaman login (get, /login) [cite: 3]
    public function login() {
        return view('login');
    }

    // 2. Menerima data login & cek DB (post, /auth) [cite: 4, 5]
    public function auth(Request $request) {
        $credentials = $request->only('email', 'password');

        if (Auth::attempt($credentials)) {
            return redirect('/home');
        }
        return redirect('/login')->with('error', 'Email / password salah');
    }

    // 3. Menampilkan halaman registrasi (get, /registration) [cite: 6]
    public function registration() {
        return view('registration');
    }

    // 4. Insert data user ke DB (post, /register) [cite: 7]
    public function register(Request $request) {
        User::create([
            'email' => $request->email,
            'name' => $request->name,
            'password' => Hash::make($request->password),
        ]);
        return redirect('/registration')->with('success', 'Registrasi berhasil');
    }

    // 5. Menampilkan halaman home & nama user (get, /home) [cite: 8, 9]
    public function home() {
        if (!Auth::check()) {
            return redirect('/login');
        }
        return view('home');
    }

    // 6. Logout (get, /logout) [cite: 10]
    public function logout() {
        Auth::logout();
        return redirect('/login');
    }
}
<div align="center">
    <br />
    <h1>LAPORAN PRAKTIKUM<br>APLIKASI BERBASIS PLATFORM</h1>
    <br />
    <h3>MODUL 10 - 13 (PERTEMUAN 6)<br>LARAVEL & AJAX</h3>
    <br />
    <img src="https://upload.wikimedia.org/wikipedia/commons/0/03/Logo_Telkom_University_potrait.png" alt="Logo" width="300"> 
    <br />
    <h3>Disusun Oleh :</h3>
    <p>
        <strong>Najwa Humairah</strong><br>
        <strong>2311102134</strong><br>
        <strong>PS1IF-11-REG04</strong>
    </p>
    <br />
    <h3>Dosen Pengampu :</h3>
    <p>
        <strong>Cahyo Prihantoro, S.Kom., M.Eng</strong>
    </p>
    <br />
        <h4>Asisten Praktikum :</h4>
        <strong>Gilang Saputra</strong> <br>
        <strong>Rangga Pradarrell Fathi</strong>
    <br />
    <h3>LABORATORIUM HIGH PERFORMANCE
    <br>PROGRAM STUDI TEKNIK INFORMATIKA<br>FAKULTAS INFORMATIKA<br>UNIVERSITAS TELKOM PURWOKERTO<br>2026</h3>
</div>

---

## LINK GIT
<a href="https://github.com/najwahmrh/Webpro/tree/main/Pertemuan%206/tugas_laravel_ajax">
</a>

## 1. Dasar Teori

### Laravel
Laravel merupakan kerangka kerja (framework) aplikasi web sumber terbuka berbasis PHP yang mengadopsi arsitektur Model-View-Controller (MVC). Dikembangkan oleh Taylor Otwell, framework ini hadir untuk menyederhanakan alur pengembangan web yang rumit agar menjadi lebih efisien, aman, dan sistematis. Laravel menyediakan ekosistem fitur bawaan yang lengkap, mulai dari sistem perutean (routing), pengelolaan basis data melalui Eloquent ORM, mesin template Blade, hingga antarmuka baris perintah Artisan. Kehadiran fitur-fitur tersebut secara efektif meningkatkan produktivitas pengembang dengan mengurangi penulisan kode berulang pada konfigurasi standar web.

Dalam pengembangannya, Laravel mengandalkan arsitektur MVC untuk memisahkan logika bisnis dari antarmuka pengguna, sehingga tercipta struktur kode yang modular, mudah dikembangkan, dan terpelihara. Arsitektur ini terbagi menjadi tiga komponen utama:
- Model: Berfungsi sebagai lapisan abstraksi data yang mengatur struktur logis basis data. Bagian ini memegang tanggung jawab penuh atas manipulasi data di sisi belakang (back-end), seperti penyimpanan, pengambilan, validasi, serta seluruh transaksi data (CRUD).
- View: Merupakan lapisan presentasi yang menentukan tampilan antarmuka pengguna (User Interface). View bertugas menerima data terstruktur dari Controller untuk kemudian diolah menjadi format visual yang dapat dilihat pengguna, biasanya dibangun menggunakan kombinasi HTML, CSS, JavaScript, atau template engine bawaan.
- Controller: Bertindak sebagai penghubung atau perantara antara Model dan View. Sebagai pusat logika aplikasi, Controller bertugas menerima permintaan HTTP dari pengguna, memproses instruksi bisnis, berinteraksi dengan Model untuk mengelola data, dan akhirnya menentukan hasil yang akan ditampilkan kembali melalui View.

### Bootstrap
Bootstrap merupakan kerangka kerja (framework) CSS front-end yang sangat populer untuk membangun antarmuka web secara cepat, modern, dan responsif tanpa perlu menyusun kode CSS dasar secara manual. Mengusung konsep mobile-first design, framework ini mengandalkan sistem grid 12-kolom yang fleksibel serta arsitektur flexbox untuk mengatur tata letak. Selain itu, Bootstrap menyediakan pustaka komponen User Interface (UI) yang siap digunakan, seperti menu navigasi, kartu (card), jendela modal, hingga pengaturan tipografi. Melalui sistem otomatisasi ini, setiap elemen visual pada situs web dijamin dapat menyesuaikan diri secara dinamis dan tetap konsisten saat diakses melalui berbagai perangkat, baik itu ponsel pintar maupun monitor komputer.

### AJAX (Asynchronous JavaScript and XML)
AJAX merupakan sekumpulan teknik pengembangan web yang mengintegrasikan berbagai teknologi sisi klien agar aplikasi dapat berinteraksi secara asinkron. Keunggulan utama AJAX terletak pada kemampuannya untuk mengirim, menerima, dan mengolah data dari server di latar belakang secara mandiri, sehingga pengguna tidak perlu memuat ulang (reload) seluruh halaman web. Walaupun menyandang nama "XML", pada praktiknya saat ini format pertukaran data telah beralih secara luas ke JSON (JavaScript Object Notation). JSON menjadi pilihan utama karena strukturnya yang lebih ringan, universal, dan sangat kompatibel dengan sintaks asli JavaScript.

<br>Secara teknis, proses permintaan (request) data dari sisi klien kini standar menggunakan fungsi fetch(), yang telah menggantikan objek XMLHttpRequest yang mulai ditinggalkan. Penggunaan fetch() sangat diandalkan karena sudah mendukung sistem Promises, yang mempermudah pengaturan alur eksekusi HTTP asinkron. Pendekatan ini membuat penulisan kode menjadi lebih bersih, memungkinkan perangkaian perintah yang lebih logis (melalui .then()), serta meningkatkan keterbacaan kode bagi pengembang.
<br>Dengan mengimplementasikan teknik AJAX, elemen Document Object Model (DOM) pada halaman web dapat dimanipulasi secara dinamis—misalnya, memperbarui isi tabel data mahasiswa secara instan tanpa gangguan. Integrasi teknologi ini menciptakan pengalaman pengguna (User Experience) yang jauh lebih responsif dan mulus, memberikan sensasi interaksi cepat yang serupa dengan penggunaan aplikasi desktop atau Single Page Application (SPA).

### JSON (JavaScript Object Notation)
JSON merupakan format pertukaran data berbasis teks dengan standar terbuka (RFC 8259) yang dirancang agar ringan, mudah dipahami oleh manusia, serta efisien untuk diproses oleh mesin. Data dalam JSON direpresentasikan melalui struktur pasangan kunci-nilai (key-value pairs) dan daftar nilai yang terurut (array). Format ini berfungsi sebagai jembatan komunikasi universal yang menghubungkan sisi front-end (seperti skrip AJAX) dengan sisi back-end (seperti respons dari controller Laravel).
Saat ini, JSON telah menjadi standar utama di industri pengembangan perangkat lunak, menggantikan protokol lama seperti XML. Keunggulan utamanya terletak pada strukturnya yang jauh lebih ringkas, sehingga mampu mempercepat proses pengiriman data melalui jaringan API (Application Programming Interface) dan meningkatkan efisiensi performa aplikasi secara keseluruhan.

## 2. Stuktur Folder
```
TugasParktikumLaravelAjax/   
│
├── app/                    
|   ├── Http/               
|   |   └── Controllers/    
|   |       └── mahasiswaController.php  # File Controller yang dipakai
|   |
|   ├── resources/        
|   |   └── views/        
|   |       └── mahasiswa.blade.php      # File blade sebagai view yang ditampilkan
|   |
|   ├── routes/             
|   |   └── web.php                      # File untuk routing URL - Controller
|   |
|   └── storage/              
|       └── app/           
|           └── data/   
|               └── mahasiswa.json      # File JSON sebagai penyimpanan data
|
└── README.md                           # File Laporan Praktikum
```

## 2. Sourcecode 

### mahasiswa.json
```json
[
    {
        "nama": "Najwa Humairah",
        "nim": "2311102134",
        "kelas": "PS1IF-11-REG04",
        "prodi": "Teknik Informatika"
    },
    {
        "nama": "Amelia Azmi",
        "nim": "2311102135",
        "kelas": "PS1IF-11-REG04",
        "prodi": "Teknik Informatika"
    },
    {
        "nama": "Muhammad Deka Maulana",
        "nim": "2311102148",
        "kelas": "PS1IF-11-REG04",
        "prodi": "Teknik Informatika"
    },
    {
        "nama": "Valisha Atthalia Naura Irfan",
        "nim": "2311102160",
        "kelas": "PS1IF-11-REG04",
        "prodi": "Teknik Informatika"
    },
    {
        "nama": "Qonita Rahayu Atmi",
        "nim": "2311102129",
        "kelas": "PS1IF-11-REG01",
        "prodi": "Teknik Informatika"
    }
]
```
Penjelasan Singkat :
<br>File mahasiswa.json merupakan dokumen berbasis teks yang menggunakan format JSON sebagai media penyimpanan data statis. Dalam alur pengembangan, file ini berperan sebagai sumber data simulasi (mock database) yang menyimpan informasi terstruktur mengenai profil mahasiswa. Data di dalamnya disusun dalam format array yang menampung beberapa objek, di mana setiap objek menyimpan atribut entitas secara mendetail mulai dari nama, NIM, kelas, hingga program studi. Karakteristik JSON yang ringan sangat memudahkan controller Laravel untuk memproses pembacaan dan mengonversinya menjadi array PHP. Selanjutnya, data tersebut dapat dikirimkan ke sisi klien untuk ditampilkan secara dinamis pada antarmuka web melalui integrasi skrip AJAX.

### mahasiswaController.php (file controller)
``` php
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

```
Penjelasan singkat :
<br>File mahasiswaController.php berperan sebagai pusat logika aplikasi yang mengatur aliran data mahasiswa. Di dalam berkas ini, terdapat fungsi utama getDataMahasiswa() yang bertugas mengelola pengambilan data dari mahasiswa.json. Proses dimulai dengan mendefinisikan lokasi file melalui variabel $datapath yang mengarah ke direktori storage/app/data/.
<br>Sebelum data diproses, sistem melakukan validasi menggunakan File::exists() untuk memastikan file tersebut tersedia; jika tidak, sistem akan mengirimkan pesan galat (error) "Data tidak ditemukan". Jika file tersedia, isinya akan dibaca menggunakan File::get() dan disimpan ke dalam variabel $jsonData. String mentah tersebut kemudian dikonversi menjadi struktur array asosiatif PHP melalui fungsi json_decode(). Sebagai tahap akhir, data yang telah diolah dalam variabel $arrayData dikirimkan kembali ke sisi klien (front-end) sebagai respons JSON resmi melalui fungsi response()->json(), lengkap dengan header HTTP yang sesuai.

### mahasiswa.blade.php (file view)
```html
<!DOCTYPE html>
<html lang="id">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tugas Laravel + AJAX Pertemuan 6</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">

    <div class="container mt-5">
        <h1 class="mb-4 text-center">Data Mahasiswa</h1>

        <div class="text-center mb-4">
            <button id="btnTampilData" class="btn btn-primary">Tampilkan Data</button>
        </div>

        <div class="row" id="areaHasilData"></div>
    </div>

    <script>
        document.getElementById('btnTampilData').addEventListener('click', function () {
            //mengambil elemen tempat hasil data akan ditaruh
            const areaHasil = document.getElementById('areaHasilData');

            //memberikan indikator loading
            areaHasil.innerHTML = '<div class="col-12 text-center text-muted">Mengambil data...</div>';

            //melakukan request AJAX dengan Fetch API
            fetch('/mahasiswa')
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Terjadi kesalahan jaringan');
                    }
                    return response.json();
                })
                .then(data => {
                    //mengosongkan area hasil sebelum merender data baru
                    areaHasil.innerHTML = '';

                    //looping data JSON dan membuat struktur HTML Card
                    data.forEach(mhs => {
                        const cardHtml = `
                            <div class="col-md-4 mb-3">
                                <div class="card shadow-sm h-100">
                                    <div class="card-body">
                                        <p class="card-text mb-1">
                                            <strong>Nama :</strong> ${mhs.nama}
                                        </p>
                                        <p class="card-text mb-1">
                                            <strong>NIM :</strong> ${mhs.nim}
                                        </p>
                                        <p class="card-text mb-1">
                                            <strong>Kelas :</strong> ${mhs.kelas}
                                        </p>
                                        <p class="card-text">
                                            <strong>Prodi :</strong> ${mhs.prodi}
                                        </p>
                                    </div>
                                </div>
                            </div>
                        `;
                        //menyisipkan card ke dalam area hasil
                        areaHasil.innerHTML += cardHtml;
                    });
                })
                .catch(error => {
                    console.error('Error:', error);
                    areaHasil.innerHTML = '<div class="col-12 text-center text-danger">Gagal memuat data.</div>';
                });
        });
    </script>
</body>

</html>
```
Penjelasan Singkat :
<br>mahasiswa.blade.php berfungsi sebagai lapisan view atau antarmuka pengguna yang menyajikan data mahasiswa secara interaktif. File ini mengintegrasikan struktur HTML dengan framework Bootstrap untuk memastikan tampilan web terlihat modern dan responsif di berbagai perangkat. Fitur utama pada halaman ini dikelola oleh skrip JavaScript menggunakan Fetch API (AJAX), yang memungkinkan pengambilan data dari server secara asinkron tanpa harus memuat ulang (reload) seluruh halaman.
<br>Alur kerjanya dimulai saat pengguna mengeklik tombol "Tampilkan Data". Event listener akan memicu munculnya indikator pemuatan (loading) pada elemen areaHasilData. Selanjutnya, fungsi fetch('/mahasiswa') mengirimkan permintaan HTTP ke controller. Jika respons sukses, data JSON yang diterima akan diproses melalui perulangan forEach. Di dalam perulangan tersebut, setiap entitas mahasiswa dibungkus ke dalam komponen card Bootstrap menggunakan template string, lalu disisipkan ke dalam halaman secara dinamis. Sebelum merender data baru, area tampilan dikosongkan terlebih dahulu untuk mencegah penumpukan data yang sama. Jika terjadi kendala jaringan, blok catch akan menangani error dengan menampilkan pesan peringatan. Implementasi AJAX ini memberikan pengalaman pengguna yang lebih mulus, cepat, dan efisien selayaknya aplikasi web modern.

### web.php (file routing)
```php
<?php

use App\Http\Controllers\mahasiswaController;

// Route untuk tampilkan halaman utama
Route::get('/', [mahasiswaController::class, 'index']);

// Route untuk AJAX (Ini yang penting!)
Route::get('/mahasiswa', [mahasiswaController::class, 'getDataMahasiswa']);
```

Penjelasan Singkat :
<br>web.php berperan sebagai pengatur lalu lintas atau sistem pemetaan URL dalam framework Laravel. File ini menentukan bagaimana aplikasi merespons setiap alamat (jalur) yang diakses oleh pengguna dengan menghubungkannya ke logika tertentu di controller. Dalam berkas ini, terdapat dua rute utama yang didefinisikan:
- Rute Halaman Utama (/): Berfungsi untuk menangani akses ke halaman awal aplikasi. Rute ini mengarahkan pengguna ke metode index() pada mahasiswaController, yang kemudian akan menyajikan tampilan dari file mahasiswa.blade.php.
- Rute AJAX (/mahasiswa): Merupakan rute khusus yang menangani permintaan data secara asinkron. Jalur ini dihubungkan dengan metode getDataMahasiswa() pada controller yang sama untuk mengirimkan data berformat JSON.

## 3. Penjelasan Cara Kerja Aplikasi
Berikut merupakan cara kerja aplikasi :

1. Jalankan aplikasi dengan mengetik command php artisan serve pada terminal.
![Run Program]()

2. Buka http://127.0.0.1:8000 pada browser, kemudian akan ditampilkan halaman awal yang berisi judul dan tombol Tampilkan Data.
![Tampilan Awal]()

3. Tekan tombol Tampilkan Data, kemudian aplikasi akan mengirimkan request AJAX menggunakan Fetch API ke endpoint /mahasiswa. Selama proses berlangsung, akan ditampilkan indikator loading berupa teks “Mengambil data...”.
![Mengambil Data]()

4. Data ditampilkan dalam bentuk card Bootstrap yang disusun secara dinamis di dalam halaman, di mana setiap card berisi informasi mahasiswa seperti nama, NIM, kelas, dan program studi tanpa perlu melakukan reload halaman.
![Data Ditampilkan]()
<div align="center">
    <br />
    <h1>LAPORAN PRAKTIKUM<br>APLIKASI BERBASIS PLATFORM</h1>
    <br />
    <h3>CODING ON THE SPOT<br>MANAJEMEN DATA MAHASISWA</h3>
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

## 1. Dasar Teori

### CRUD (Create, Read, Update, Delete): 
CRUD adalah empat fungsi dasar penyimpanan persisten yang menjadi pilar utama dalam pengelolaan data di aplikasi web. Fungsi ini memungkinkan pengguna untuk membuat data baru, membaca atau menampilkan data, memperbarui data yang sudah ada, dan menghapus data dari basis data secara sistematis.

### Node.js & Express: 
Node.js adalah lingkungan runtime JavaScript yang dibangun di atas mesin V8 Chrome untuk menjalankan kode JavaScript di sisi server. Express adalah framework aplikasi web minimalis untuk Node.js yang mempermudah pengaturan rute (routing) dan pengelolaan middleware dalam membangun aplikasi web yang cepat dan terukur.

### SQLite: 
SQLite adalah sistem manajemen basis data relasional yang bersifat self-contained, serverless, dan tidak memerlukan konfigurasi rumit. Basis data ini menyimpan seluruh datanya dalam satu file tunggal di disk, sehingga sangat efisien untuk aplikasi skala kecil hingga menengah atau untuk keperluan pengembangan.

### Bootstrap: 
Bootstrap adalah framework CSS sumber terbuka yang digunakan untuk merancang situs web responsif secara cepat. Dengan menyediakan berbagai komponen desain siap pakai seperti grid system, form, dan tabel, Bootstrap memastikan tampilan aplikasi tetap konsisten di berbagai ukuran layar perangkat.

### jQuery & DataTables: 
jQuery adalah pustaka JavaScript yang menyederhanakan manipulasi HTML, penanganan event, dan interaksi Ajax. DataTables adalah plugin jQuery yang sangat kuat untuk mengubah tabel HTML biasa menjadi tabel interaktif yang memiliki fitur pencarian, pengurutan, dan paginasi secara otomatis.

### JSON (JavaScript Object Notation): 
JSON adalah format pertukaran data ringan yang mudah dibaca dan ditulis oleh manusia, serta mudah diurai oleh mesin. Dalam pengembangan web, JSON sering digunakan sebagai standar untuk mengirimkan data dari server ke klien (browser) melalui permintaan Ajax.

### EJS (Embedded JavaScript): 
EJS adalah mesin templating sederhana untuk Node.js yang memungkinkan pengembang untuk menyisipkan kode JavaScript murni ke dalam file HTML. Hal ini memudahkan pembuatan halaman web dinamis yang isinya dapat berubah-ubah sesuai dengan data yang dikirimkan dari server.

## 2. Struktur Folder

```text
COTS/
├── node_modules/       
├── views/              
│   ├── index.ejs       
│   ├── form.ejs        
│   └── table.ejs       
├── package.json        
├── package-lock.json   
├── server.js           
├── database.sqlite     
└── README.md           
```

## 3. Source Code

### Server.js
```
const express = require('express');
const bodyParser = require('body-parser');
const sqlite3 = require('sqlite3').verbose();
const path = require('path');

const app = express();
const db = new sqlite3.Database('./database.sqlite');

app.set('view engine', 'ejs');
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

db.run(`CREATE TABLE IF NOT EXISTS mahasiswa (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nama TEXT,
    nim TEXT,
    jurusan TEXT
)`);

app.get('/', (req, res) => {
    res.render('index');
});

app.get('/form', (req, res) => {
    res.render('form', { data: null });
});

app.get('/data', (req, res) => {
    res.render('table');
});

app.get('/api/mahasiswa', (req, res) => {
    db.all("SELECT * FROM mahasiswa", [], (err, rows) => {
        if (err) {
            res.status(500).json({ error: err.message });
            return;
        }
        res.json({ data: rows });
    });
});

app.post('/api/mahasiswa', (req, res) => {
    const { nama, nim, jurusan } = req.body;
    db.run(`INSERT INTO mahasiswa (nama, nim, jurusan) VALUES (?, ?, ?)`, [nama, nim, jurusan], function(err) {
        if (err) {
            return res.status(500).send(err.message);
        }
        res.redirect('/data');
    });
});

app.get('/form/:id', (req, res) => {
    const id = req.params.id;
    db.get(`SELECT * FROM mahasiswa WHERE id = ?`, [id], (err, row) => {
        res.render('form', { data: row });
    });
});

app.post('/api/mahasiswa/:id', (req, res) => {
    const id = req.params.id;
    const { nama, nim, jurusan } = req.body;
    db.run(`UPDATE mahasiswa SET nama = ?, nim = ?, jurusan = ? WHERE id = ?`, [nama, nim, jurusan, id], function(err) {
        res.redirect('/data');
    });
});

app.get('/api/mahasiswa/delete/:id', (req, res) => {
    const id = req.params.id;
    db.run(`DELETE FROM mahasiswa WHERE id = ?`, [id], function(err) {
        res.redirect('/data');
    });
});

app.listen(3000, () => {
    console.log('Server running on port 3000');
});
```

### Views/index.ejs
```
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="/">COTS</a>
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="/">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="/form">Form</a></li>
                    <li class="nav-item"><a class="nav-link" href="/data">Data Tabel</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container mt-5">
        <div class="text-center">
            <h1 class="display-4">Selamat Datang</h1>
            <p class="lead">Aplikasi web sederhana dengan Bootstrap, Node.js, dan jQuery DataTable.</p>
            <a class="btn btn-primary btn-lg" href="/data" role="button">Lihat Data</a>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

### Views/form.ejs

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Form Data</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="/">COTS</a>
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="/">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="/form">Form</a></li>
                    <li class="nav-item"><a class="nav-link" href="/data">Data Tabel</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container mt-5">
        <h2>Form Mahasiswa</h2>
        <form action="<%= data ? '/api/mahasiswa/' + data.id : '/api/mahasiswa' %>" method="POST">
            <div class="mb-3">
                <label class="form-label">Nama</label>
                <input type="text" class="form-control" name="nama" value="<%= data ? data.nama : '' %>" required>
            </div>
            <div class="mb-3">
                <label class="form-label">NIM</label>
                <input type="text" class="form-control" name="nim" value="<%= data ? data.nim : '' %>" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Jurusan</label>
                <input type="text" class="form-control" name="jurusan" value="<%= data ? data.jurusan : '' %>" required>
            </div>
            <button type="submit" class="btn btn-primary">Simpan</button>
            <a href="/data" class="btn btn-secondary">Batal</a>
        </form>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
```

### Views/table.ejs
```
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Data Tabel</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/dataTables.bootstrap5.min.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="/">COTS</a>
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="/">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="/form">Form</a></li>
                    <li class="nav-item"><a class="nav-link" href="/data">Data Tabel</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container mt-5">
        <h2>Data Mahasiswa</h2>
        <a href="/form" class="btn btn-success mb-3">Tambah Data</a>
        <table id="dataTable" class="table table-striped table-bordered" style="width:100%">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nama</th>
                    <th>NIM</th>
                    <th>Jurusan</th>
                    <th>Aksi</th>
                </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.4/js/dataTables.bootstrap5.min.js"></script>

    <script>
        $(document).ready(function() {
            $('#dataTable').DataTable({
                "ajax": "/api/mahasiswa",
                "columns": [
                    { "data": "id" },
                    { "data": "nama" },
                    { "data": "nim" },
                    { "data": "jurusan" },
                    {
                        "data": null,
                        "render": function (data, type, row) {
                            return `
                                <a href="/form/${row.id}" class="btn btn-sm btn-warning">Edit</a>
                                <a href="/api/mahasiswa/delete/${row.id}" class="btn btn-sm btn-danger" onclick="return confirm('Yakin ingin menghapus?')">Delete</a>
                            `;
                        }
                    }
                ]
            });
        });
    </script>
</body>
</html>
```

## Penjelasan Program Aplikasi

### Mekanisme Operasi CRUD pada Aplikasi
### 1. Proses Menampilkan Data (Read)
Fungsi Read berjalan secara otomatis ketika pengguna mengakses tautan /data. Pada tahap ini, halaman web mengandalkan jQuery DataTables untuk melakukan inisialisasi tabel interaktif. Secara di balik layar, DataTables mengirimkan permintaan AJAX menuju endpoint API /api/mahasiswa. Backend yang dibangun dengan Express.js kemudian menyambut permintaan tersebut dan menjalankan instruksi SQL SELECT * FROM mahasiswa pada basis data SQLite. Data yang diperoleh dikonversi ke dalam format JSON agar dapat dikirimkan kembali ke frontend. Terakhir, DataTables menangkap payload JSON tersebut dan menyajikannya secara rapi ke dalam baris-baris tabel, lengkap dengan fitur pencarian dan pembagian halaman (pagination) tanpa perlu memuat ulang seluruh halaman.
![Operasi Read](/Pertemuan_5/COTS/Assets/read.png)

### 2. Proses Penambahan Data (Create)
Siklus Create dimulai saat pengguna berinteraksi dengan tombol "Tambah Data" yang mengarah ke rute /form. Halaman formulir ini dihasilkan secara dinamis menggunakan mesin templating EJS. Setelah pengguna melengkapi kolom Nama, NIM, serta Jurusan dan menekan tombol simpan, peramban mengirimkan instruksi HTTP POST ke server. Express.js akan mengekstraksi informasi dari badan permintaan (request body) tersebut untuk kemudian dieksekusi menggunakan perintah INSERT INTO ke dalam tabel di SQLite. Begitu proses penyimpanan dinyatakan sukses, server akan menginstruksikan peramban untuk melakukan redirect kembali ke halaman utama /data agar pengguna bisa langsung melihat hasil input terbarunya.
![Operasi Create](/Pertemuan_5/COTS/Assets/create.png)
![Operasi Create](/Pertemuan_5/COTS/Assets/create_update.png)

### 3. Proses Pembaruan Data (Update)
Fungsi Update dipicu ketika pengguna memilih tombol "Edit" pada entitas tertentu di dalam tabel. Aksi ini mengirimkan permintaan ke endpoint GET /form/:id. Server akan menangkap identitas (ID) unik tersebut, menarik data lama dari SQLite melalui perintah SELECT, dan menampilkannya kembali ke dalam file form.ejs sehingga kolom input sudah terisi secara otomatis (pre-populated). Setelah revisi data selesai dilakukan dan tombol simpan ditekan, sistem melakukan pengiriman data melalui HTTP POST ke /api/mahasiswa/:id. Backend kemudian memperbarui rekaman di database dengan query UPDATE. Jika sinkronisasi berhasil, pengguna akan segera dikembalikan ke tampilan tabel utama.
![Operasi Update](/Pertemuan_5/COTS/Assets/edit.png)
![Operasi Update](/Pertemuan_5/COTS/Assets/edit_update.png)

### 4. Proses Penghapusan Data (Delete)
Operasi Delete dikelola melalui kolom aksi pada tabel DataTables. Setiap baris data memiliki tombol hapus yang terhubung dengan rute khusus /api/mahasiswa/delete/:id. Sebagai langkah keamanan untuk menghindari kehilangan data yang tidak disengaja, aplikasi akan memunculkan jendela konfirmasi JavaScript confirm() terlebih dahulu. Jika pengguna memberikan persetujuan, permintaan GET akan diteruskan ke server Express.js untuk mengeksekusi perintah SQL DELETE FROM berdasarkan ID yang dipilih. Segera setelah baris data terhapus secara permanen dari file SQLite, sistem akan menyegarkan tampilan dengan mengarahkan kembali pengguna ke halaman /data.
![OPERASI Delete](/Pertemuan_5/COTS/Assets/delete.png)
![Operasi Delete](/Pertemuan_5/COTS/Assets/delete_update.png)

## Kesimpulan 
Hasil pengembangan aplikasi web sederhana ini, dapat disimpulkan bahwa integrasi antara Node.js sebagai runtime dan Express.js sebagai framework mampu menghasilkan aplikasi yang efisien dan responsif. Penggunaan SQLite sebagai basis data terbukti sangat efektif untuk penyimpanan data lokal karena sifatnya yang ringan dan tidak memerlukan konfigurasi server yang rumit.

Dari sisi antarmuka, penerapan Bootstrap memberikan tampilan yang konsisten dan profesional, sementara penggunaan jQuery DataTables dengan format data JSON berhasil memenuhi spesifikasi teknis untuk menyajikan informasi secara interaktif melalui fitur pencarian, pengurutan, dan paginasi otomatis. Seluruh fungsionalitas CRUD (Create, Read, Update, Delete) telah diimplementasikan dengan baik, mulai dari proses input melalui form EJS hingga manajemen penghapusan data yang aman. Secara keseluruhan, aplikasi ini telah memenuhi seluruh kriteria penilaian praktikum, termasuk struktur halaman yang fungsional dan pengelolaan data yang terorganisir.

## Link PPT Presentasi

[Masukkan Link Google Drive PPT Anda Di Sini]

## Link Video Rekaman Presentasi

[Masukkan Link Google Drive Video Anda Di Sini]
# Laporan Tugas Praktik Modul 12 & 13
**Nama:** Najwa Humairah
**NIM:** 2311102134
**Mata Kuliah:** Pemrograman Web (Flutter)

---

## 1. Cara Kerja Provider pada Aplikasi
Pada aplikasi ini, **Provider** digunakan sebagai *State Management* untuk mengelola nilai counter agar pembaruan UI dapat dilakukan secara efisien tanpa harus menggunakan `setState` secara berlebihan. 

Langkah-langkah cara kerja Provider pada aplikasi ini:
1. **Membuat Kelas Provider:** Membuat kelas `CounterProvider` yang meng-extend `ChangeNotifier`. Di dalam kelas ini terdapat variabel `_counter` untuk menyimpan nilai counter saat ini.
2. **Method Increment & Notifikasi Perubahan:** Kelas ini memiliki fungsi `increment()` yang berfungsi untuk menambah nilai `_counter` sebanyak 1. Setelah nilai ditambah, fungsi `notifyListeners()` dipanggil untuk memberitahu seluruh widget yang 'mendengarkan' (*listen*) bahwa terjadi perubahan data, sehingga widget tersebut akan me-render ulang UI.
3. **Mendaftarkan Provider:** Di dalam `main()`, aplikasi dibungkus dengan `MultiProvider` dan `ChangeNotifierProvider(create: (_) => CounterProvider())` untuk mendaftarkan `CounterProvider` ke seluruh *widget tree*.
4. **Menggunakan Nilai Provider:** Pada `CounterScreen`, widget mengambil nilai counter menggunakan `Provider.of<CounterProvider>(context)`. Nilai `counterProvider.counter` ditampilkan pada layar utama. Ketika tombol `+` ditekan, fungsi `counterProvider.increment()` akan dijalankan.

## 2. Cara Kerja Notifikasi yang Digunakan
Aplikasi ini menggunakan **Local Notification** (melalui package `flutter_local_notifications`) untuk memunculkan notifikasi setiap kali nilai counter bertambah.

Langkah-langkah cara kerja Notifikasi:
1. **Inisialisasi Plugin:** Pada `main()`, objek `FlutterLocalNotificationsPlugin` diinisialisasi menggunakan pengaturan Android `AndroidInitializationSettings('@mipmap/ic_launcher')` agar menggunakan icon bawaan aplikasi.
2. **Meminta Izin Notifikasi (Android 13+):** Pada saat `CounterScreen` pertama kali dimuat (`initState`), aplikasi akan memanggil `requestNotificationsPermission()` untuk meminta izin dari pengguna menampilkan notifikasi (khusus Android 13/API 33 ke atas).
3. **Membuat Channel dan Menampilkan Notifikasi:** Saat fungsi `increment()` pada `CounterProvider` dipanggil, fungsi tersebut juga memanggil `_showNotification()`. Di dalam fungsi ini, didefinisikan detail notifikasi Android seperti channel id, nama channel, deskripsi, tingkat prioritas, dan *importance* maksimal agar notifikasi muncul sebagai pop-up (heads-up).
4. **Eksekusi:** Method `show()` dipanggil dengan judul **"Counter Update"** dan pesan **"Nilai counter saat ini: X"** (X merupakan nilai counter terbaru).

# Laporan Praktikum: Navigasi dan Notifikasi pada Flutter

## 1. Dasar Teori

### Notifikasi dan Pop-Up Interaktif
Peningkatan User Experience (UX) pada sebuah aplikasi sangat bergantung pada seberapa komunikatif aplikasi tersebut dalam merespon interaksi penggunanya. Developer diwajibkan untuk memberikan umpan balik atas setiap aksi krusial yang dilakukan oleh pengguna, baik itu berupa peringatan, informasi sukses, maupun pesan kesalahan. Flutter menyediakan beberapa pendekatan interaktif untuk menangani hal ini, di antaranya adalah SnackBar dan AlertDialog. 

SnackBar merupakan pesan teks ringkas yang muncul secara otomatis dari bagian bawah layar dan akan menghilang sendiri secara perlahan setelah beberapa detik. Fitur ini sangat cocok digunakan untuk notifikasi aksi instan dan tidak kritikal, seperti notifikasi penyimpanan data yang sukses. Pemanggilan SnackBar secara modern dilakukan melalui perantara ScaffoldMessenger demi mencegah error ketika transisi perpindahan halaman sedang terjadi. Di sisi lain, berbeda dengan Snackbar yang menghilang otomatis, AlertDialog merupakan dialog pop-up statis yang berfungsi menginterupsi layar pengguna secara menyeluruh dengan meredupkan layar di belakangnya. Interaksi pengguna akan difokuskan sepenuhnya kepada isi pesan pop-up tersebut hingga mereka mengambil tindakan secara sadar, seperti menekan tombol konfirmasi penutup. Jenis pop-up interaktif ini sangat krusial dan cocok digunakan untuk hal-hal yang sifatnya genting, misalnya memperingatkan pengguna ketika data formulir masih kosong atau menampilkan konfirmasi akhir sebelum mengirim data ke database.

Berikut ini adalah penerapan kode logika notifikasi dan pop-up dari seluruh halaman (6 halaman) yang ada pada aplikasi:

**1. Halaman Penghitung Mahasiswa**
Setiap kali pengguna menekan tombol "Tambah Mahasiswa", nilai perhitungan akan bertambah dan notifikasi *SnackBar* hijau akan langsung muncul mengonfirmasi penambahan tersebut dengan desain mengambang (floating).

```dart
// Potongan kode dari file main1.dart
SizedBox(
  width: double.infinity,
  child: ElevatedButton.icon(
    icon: const Icon(Icons.person_add_alt_1_rounded),
    onPressed: (){
      setState(() {
        jumlahHadir++;
      });
      // Memanggil fungsi eksekusi memunculkan SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Satu mahasiswa ditambahkan! Total: $jumlahHadir'),
          duration: const Duration(seconds: 1),
          behavior: SnackBarBehavior.floating, // Desain melayang yang estetik
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: Colors.green.shade600,
        )
      );
    },
    label: const Text('Tambah Mahasiswa', style: TextStyle(fontSize: 16)),
    // ... style tombol
  ),
)
```

**[ INSERT SCREENSHOT HALAMAN PENGHITUNG MAHASISWA BERSAMA SNACKBAR DI SINI ]**


**2. Halaman Button**
Pada halaman ini, saat tombol "LOGIN SEKARANG" ditekan, aplikasi akan memunculkan *AlertDialog* berisi konfirmasi bahwa tombol telah berhasil ditekan.

```dart
// Potongan kode dari file main_button.dart
OutlinedButton.icon(
  icon: const Icon(Icons.login_rounded),
  onPressed: () {
    // Memanggil AlertDialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Row(
            children: [
              const Icon(Icons.notifications_active, color: Colors.amber),
              const SizedBox(width: 8),
              Text("Notifikasi", style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
            ],
          ),
          content: const Text("Button Login berhasil ditekan!", style: TextStyle(fontSize: 16)),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Tutup", style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        );
      },
    );
  }, 
  label: Text("LOGIN SEKARANG", style: GoogleFonts.poppins(fontWeight: FontWeight.bold))
)
```

**[ INSERT SCREENSHOT HALAMAN BUTTON BESERTA ALERT DIALOG DI SINI ]**


**3. Halaman Kolom & Form Login**
Jika pengguna secara gegabah menekan tombol login pada saat username atau password masih dibiarkan kosong, layar akan secara konstan terinterupsi oleh *AlertDialog* peringatan tebal (error). Apabila pengisian valid, sebaliknya akan timbul notifikasi *SnackBar* cerah berisi sambutan.

```dart
// Potongan kode dari file main_colom.dart
ElevatedButton(
  onPressed: () {
    if (_userController.text.isEmpty || _passController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: const Row(
            children: [
              Icon(Icons.error_outline, color: Colors.red),
              SizedBox(width: 8),
              Text("Error"),
            ],
          ),
          content: const Text("Username atau password tidak boleh kosong!"),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text("OK", style: TextStyle(fontWeight: FontWeight.bold)))
          ],
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Icon(Icons.check_circle, color: Colors.white),
              const SizedBox(width: 8),
              Text("Berhasil login sebagai: ${_userController.text}"),
            ],
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.green.shade600,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        )
      );
      _userController.clear();
      _passController.clear();
    }
  }, 
  child: Text("LOGIN", style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold))
)
```

**[ INSERT SCREENSHOT FORM LOGIN KETIKA MENDAPAT ALERT DIALOG ERROR DI SINI ]**

**[ INSERT SCREENSHOT FORM LOGIN KETIKA MUNCUL SNACKBAR SUKSES DI SINI ]**


**4. Halaman Container**
Halaman ini didesain unik dengan memanfaatkan inisialisasi otomatis `addPostFrameCallback`. Saat halaman ini baru saja selesai dimuat dan terbuka, secara otomatis sistem akan langsung memunculkan *SnackBar* biru yang menyambut pengguna tanpa harus menekan tombol apapun.

```dart
// Potongan kode dari file main_container.dart
@override
Widget build(BuildContext context) {
  // Fungsi yang dieksekusi tepat setelah widget selesai di-render
  WidgetsBinding.instance.addPostFrameCallback((_) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Row(
          children: [
            Icon(Icons.info_outline, color: Colors.white),
            SizedBox(width: 8),
            Text("Halaman Container Terbuka!"),
          ],
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: Colors.blue.shade600,
      )
    );
  });
  
  return Scaffold(
    // ... isi body layout container
  );
}
```

**[ INSERT SCREENSHOT HALAMAN CONTAINER BERSAMA SNACKBAR OTOMATIS DI SINI ]**


**5. Halaman Flutter 1 (Basic)**
Halaman ini mengimplementasikan dua jenis interaksi notifikasi sekaligus. Jika logo Flutter yang berada di tengah layar ditekan (di-tap), sebuah *SnackBar* akan muncul menginformasikan interaksi tersebut. Selain itu, terdapat pula tombol khusus di bawah yang apabila ditekan akan memunculkan sebuah *AlertDialog* sapaan.

```dart
// Potongan kode dari file main_flutter1.dart
GestureDetector(
  onTap: () {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Row(
          children: [
            Icon(Icons.flutter_dash, color: Colors.white),
            SizedBox(width: 8),
            Text("Anda menekan logo Flutter!"),
          ],
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.blue.shade600,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      )
    );
  },
  child: Container(
    // ... widget gambar logo flutter
  ),
),

// ... kode tombol pemanggil dialog di bagian bawah:
ElevatedButton.icon(
  onPressed: () {
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Row(
          children: [
            Icon(Icons.notifications_active, color: Colors.deepPurple),
            SizedBox(width: 8),
            Text("Pesan Baru"),
          ],
        ),
        content: const Text("Halo! Ini adalah notifikasi pop-up dari Halaman Flutter 1."),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("OK", style: TextStyle(fontWeight: FontWeight.bold)))
        ],
      )
    );
  }, 
  icon: const Icon(Icons.touch_app), 
  label: const Text("Tampilkan Pop-up"),
)
```

**[ INSERT SCREENSHOT HALAMAN FLUTTER 1 KETIKA MUNCUL SNACKBAR LOGO DI SINI ]**

**[ INSERT SCREENSHOT HALAMAN FLUTTER 1 KETIKA MUNCUL ALERT DIALOG POP-UP DI SINI ]**


**6. Halaman Text Field**
Jika tombol "Kirim / Submit" ditekan tanpa memasukkan teks satu huruf pun (dibiarkan kosong), maka sistem keamanan sederhana akan mencegatnya dan memunculkan *SnackBar* error berwarna merah. Namun jika kolom input divalidasi dan terbukti memiliki teks, aplikasi akan memunculkan *AlertDialog* ringkasan interaktif yang menampilkan kembali data spesifik yang baru saja dimasukkan pengguna lengkap dengan ikon konfirmasi checklist.

```dart
// Potongan kode fungsi fungsionalitas dari _tampilkanNotifikasi di file main_textfield.dart
void _tampilkanNotifikasi(String value) {
  if (value.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("Data tidak boleh kosong!"),
        backgroundColor: Colors.red.shade600,
        behavior: SnackBarBehavior.floating,
      )
    );
    return;
  }

  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Row(
        children: [
          const Icon(Icons.check_circle, color: Colors.green),
          const SizedBox(width: 8),
          Text("Data Disubmit", style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
        ],
      ),
      content: Text("Anda memasukkan:\n\n$value", style: const TextStyle(fontSize: 16)),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("OK", style: TextStyle(fontWeight: FontWeight.bold)),
        )
      ],
    )
  );
}
```

**[ INSERT SCREENSHOT HALAMAN TEXT FIELD BESERTA ALERT DIALOG SUKSES DI SINI ]**

---
*Laporan Selesai*

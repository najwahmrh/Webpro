var jadwal = {
    platform: 34,
    telah_berangkat: false,
    asal: { //objek asal sebagai properti objek jadwal
        "kode-kota": "BKT",
        nama_kota: "Bukittinggi",
        waktu: "2013-12-29 14:00"
    },
    tujuan: { //objek tujuan sebagai properti objek tujuan
        "kode-kota": "BDG",
        "nama-kota": "Bandung",
        waktu: "2013-12-29 17:30"
    }
};

console.log(jadwal.platform); //34
console.log(jadwal.asal.nama_kota); //bukittinggi
console.log(jadwal.asal["kode-kota"]); //BKT
console.log(jadwal.tujuan["nama-kota"]);  //Bandung

console.log(jadwal.asal.nama_kota); //bukittinggi
console.log(jadwal.tujuan["kode-kota"]); //BDG
console.log(jadwal.tujuan["nama-kota"]);  //Bandung
var objek_kosong = {}
var jadwal = {
    platform : 34,
    telah_berangkat : false,
    "kota-tujuan" : "Bandung",
    kota_asal : "Bukittinggi",
    "nomor-polisi" : "BK1234AB",
    "jarak-tempuh" : 123
};

console.log(jadwal.platform) //34
console.log(jadwal.kota_asal) //Bukittinggi
console.log(jadwal["kota-tujuan"]) //Bandung
console.log(jadwal["nomor-polisi"])  //BK1234AB

console.log("Berangkat dari : " + jadwal.kota_asal); //Bukittinggi
console.log("Tujuan : " + jadwal["kota-tujuan"]);  //Bandung
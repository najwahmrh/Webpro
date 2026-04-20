    void main() {
    // --- NOMOR 1: Array 2 Dimensi ---
    print("--- Jawaban Nomor 1 ---");
    
    // Membuat list 2 dimensi kosong
    List<List<int>> listDuaDimensi = [];

    // Baris 1: 4 bilangan kelipatan 6 mulai dari 6
    List<int> baris1 = [];
    for (int i = 1; i <= 4; i++) {
        baris1.add(i * 6);
    }
    listDuaDimensi.add(baris1);

    // Baris 2: 5 bilangan ganjil berurutan mulai dari 3
    List<int> baris2 = [];
    int ganjil = 3;
    for (int i = 0; i < 5; i++) {
        baris2.add(ganjil);
        ganjil += 2;
    }
    listDuaDimensi.add(baris2);

    // Baris 3: 6 bilangan pangkat tiga dari bilangan asli mulai dari 4
    // Bilangan asli mulai dari 4 adalah: 4, 5, 6, 7, 8, 9
    List<int> baris3 = [];
    for (int i = 4; i < 4 + 6; i++) {
        baris3.add(i * i * i); 
    }
    listDuaDimensi.add(baris3);

    // Baris 4: 7 bilangan asli berurutan beda 7 mulai dari 3
    List<int> baris4 = [];
    int angkaBeda7 = 3;
    for (int i = 0; i < 7; i++) {
        baris4.add(angkaBeda7);
        angkaBeda7 += 7;
    }
    listDuaDimensi.add(baris4);

    // Menampilkan Output List
    print("Isi list:");
    for (var baris in listDuaDimensi) {
        print(baris.join(" "));
    }

    print("\n-----------------------\n");

    // --- NOMOR 2: Fungsi FPB ---
    print("--- Jawaban Nomor 2 ---");
    
    void hitungFPB(int a, int b) {
    int bil1 = a;
    int bil2 = b;
    
    // Algoritma Euclidean untuk mencari FPB
    while (b != 0) {
        int temp = b;
        b = a % b;
        a = temp;
    }
    
    print("Bilangan 1: $bil1");
    print("Bilangan 2: $bil2");
    print("FPB $bil1 dan $bil2 = $a");
    }

    // Contoh pemanggilan fungsi
    hitungFPB(12, 8);
}
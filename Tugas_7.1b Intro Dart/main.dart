// Najwa Humairah (2311102134)

void main() {
    // Membuat array 2 dimensi
    List<List<int>> list2D = [];

    // Baris 1: 4 bilangan kelipatan 6 mulai dari 6
    List<int> baris1 = [];
    int nilai = 6;
    for (int i = 0; i < 4; i++) {
        baris1.add(nilai);
        nilai += 6;
    }
    list2D.add(baris1);

    // Baris 2: 5 bilangan ganjil mulai dari 3
    List<int> baris2 = [];
    nilai = 3;
    for (int i = 0; i < 5; i++) {
        baris2.add(nilai);
        nilai += 2;
    }
    list2D.add(baris2);

    // Baris 3: 6 bilangan pangkat tiga mulai dari 4
    List<int> baris3 = [];
    nilai = 4;
    for (int i = 0; i < 6; i++) {
        baris3.add(nilai * nilai * nilai);
        nilai++;
    }
    list2D.add(baris3);

    // Baris 4: 7 bilangan beda 7 mulai dari 3
    List<int> baris4 = [];
    nilai = 3;
    for (int i = 0; i < 7; i++) {
        baris4.add(nilai);
        nilai += 7;
    }
    list2D.add(baris4);

    // Output
    print("Isi List:");
    for (var baris in list2D) {
        print(baris.join(" "));
    }

    // Contoh penggunaan fungsi FPB
    int a = 12;
    int b = 8;

    print("\nBilangan 1: $a");
    print("Bilangan 2: $b");
    print("FPB $a dan $b = ${fpb(a, b)}");
    }

    // Fungsi untuk menghitung FPB (Euclidean Algorithm)
    int fpb(int a, int b) {
    while (b != 0) {
        int sisa = a % b;
        a = b;
        b = sisa;
    }
    return a;
}
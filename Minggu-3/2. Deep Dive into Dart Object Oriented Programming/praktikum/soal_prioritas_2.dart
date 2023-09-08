/* 

Soal :

1. Buat class dengan spesifikasi :
  a. Class Matematika 
    method hasil
  b. Class KelipatanPersekutuanTerkecil (implements ke Class Matematika)
    field x
    field y
  c. Class FaktorPersekutuanTerbesar (implements ke Class Matematika)
    field x
    field y

2. Dari rangkaian diatas,  lengkapi kode berikut sehingga dapat menampilkan hasil pada Layar!
    void main() {
      ..
    }

 */
// Membuat kelas Matematika dengan method hasil
class Matematika {
  // Method hasil yang akan diimplementasikan oleh subclass
  double hasil() {
    return 0.0;
  }
}

// Membuat kelas KelipatanPersekutuanTerkecil yang mengimplementasikan Matematika
class KelipatanPersekutuanTerkecil implements Matematika {
  double x;
  double y;

  // Konstruktor untuk KelipatanPersekutuanTerkecil
  KelipatanPersekutuanTerkecil(this.x, this.y);

  // Implementasi method hasil untuk KelipatanPersekutuanTerkecil
  @override
  double hasil() {
    int max = x > y ? x.toInt() : y.toInt();
    while (true) {
      if (max % x == 0 && max % y == 0) {
        return max.toDouble();
      }
      max++;
    }
  }
}

// Membuat kelas FaktorPersekutuanTerbesar yang mengimplementasikan Matematika
class FaktorPersekutuanTerbesar implements Matematika {
  double x;
  double y;

  // Konstruktor untuk FaktorPersekutuanTerbesar
  FaktorPersekutuanTerbesar(this.x, this.y);

  // Implementasi method hasil untuk FaktorPersekutuanTerbesar
  @override
  double hasil() {
    while (y != 0) {
      final temp = x % y;
      x = y;
      y = temp;
    }
    return x;
  }
}

void main() {
  // Menggunakan kelas KelipatanPersekutuanTerkecil dan FaktorPersekutuanTerbesar

  // Membuat objek KelipatanPersekutuanTerkecil
  final kpt = KelipatanPersekutuanTerkecil(12, 18);
  print('Kelipatan Persekutuan Terkecil: ${kpt.hasil()}');

  // Membuat objek FaktorPersekutuanTerbesar
  final fpt = FaktorPersekutuanTerbesar(24, 36);
  print('Faktor Persekutuan Terbesar: ${fpt.hasil()}');
}

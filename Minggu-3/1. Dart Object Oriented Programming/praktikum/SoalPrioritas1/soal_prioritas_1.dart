/* 

Soal :

1. Buatlah sebuah class dengan ketentuan dibawah ini:
  a. class Hewan
  b. property berat: menyimpan data berat badan hewan

2. Buatlah sebuah class lagi dengan ketentuan:
  a. class Mobil
  b. property kapasitas: total berat maksimum muatan
  c. property muatan: list data hewan yang menjadi muatan
  d. method tambahMuatan: jika kapasitas mencukupi, maka menambah data hewan pada list muatan

 */
// Membuat class Hewan
class Hewan {
  double berat;

  Hewan(this.berat);
}

// Membuat class Mobil
class Mobil {
  double kapasitas;
  List<Hewan> muatan;

  Mobil(this.kapasitas) : muatan = [];

  // Menambahkan hewan ke muatan jika kapasitasnya mencukupi
  void tambahMuatan(Hewan hewan) {
    if (totalBeratMuatan() + hewan.berat <= kapasitas) {
      muatan.add(hewan);
    } else {
      throw ArgumentError('Kapasitas muatan penuh');
    }
  }

  // Menghitung berat total muatan
  double totalBeratMuatan() {
    double totalBerat = 0;
    for (var hewan in muatan) {
      totalBerat += hewan.berat;
    }
    return totalBerat;
  }
}

void main() {
  // Buat mobil dengan kapasitas 1000
  var car = Mobil(1000);

  // Menambahkan beberapa hewan
  var singa = Hewan(200);
  var harimau = Hewan(300);
  var gajah = Hewan(500);

  // Menambahkan hewan ke muatan mobil
  car.tambahMuatan(singa);
  car.tambahMuatan(harimau);
  car.tambahMuatan(gajah);

  // Menghitung berat total muatan
  var totalBerat = car.totalBeratMuatan();
  print('Total berat kargo : $totalBerat');
}

// Membuat class Hewan
class Hewan {
  double berat;

  Hewan(this.berat);
}

// Membuat class Mobil
class Mobil {
  double kapasitas;
  List<Hewan> kargo;

  Mobil(this.kapasitas) : kargo = [];

  // Menambahkan hewan ke kargo jika kapasitasnya mencukupi
  void tambahKargo(Hewan hewan) {
    if (totalBeratKargo() + hewan.berat <= kapasitas) {
      kargo.add(hewan);
    } else {
      throw ArgumentError('Kapasitas kargo penuh');
    }
  }

  // Menghitung berat total kargo
  double totalBeratKargo() {
    double totalBerat = 0;
    for (var hewan in kargo) {
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

  // Menambahkan hewan ke kargo mobil
  car.tambahKargo(singa);
  car.tambahKargo(harimau);
  car.tambahKargo(gajah);

  // Menghitung berat total muatan
  var totalBerat = car.totalBeratKargo();
  print('Total berat kargo : $totalBerat');
}

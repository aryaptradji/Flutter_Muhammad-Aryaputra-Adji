/* 

Soal :

1. Buat class dengan spesifikasi :
a. Class BangunRuang (sebagai superclass)
    field panjang
    field lebar
    field tinggi
method volume
b. Class Kubus (sebagai subclass dari Class BangunRuang)
    field sisi
c. Class Balok (sebagai subclass dari Class BangunRuang)

2. Dari rangkaian Class diatas, buatlah method Overriding untuk membedakan tiap proses dalam method antar Class! sehingga dapat ditampilkan pada layar
    void main() {
      ..
    }

 */
class BangunRuang {
  double panjang;
  double lebar;
  double tinggi;

  // Konstruktor kelas BangunRuang
  BangunRuang(this.panjang, this.lebar, this.tinggi);

  // Method untuk menghitung volume (tidak diimplementasikan di sini)
  double volume() {
    return 0.0;
  }
}

class Kubus extends BangunRuang {
  double sisi;

  // Konstruktor kelas Kubus
  Kubus(this.sisi) : super(sisi, sisi, sisi);

  // Overriding method volume untuk Kubus
  @override
  double volume() {
    return sisi * sisi * sisi;
  }
}

class Balok extends BangunRuang {
  // Konstruktor kelas Balok
  Balok(double panjang, double lebar, double tinggi)
      : super(panjang, lebar, tinggi);

  // Overriding method volume untuk Balok
  @override
  double volume() {
    return panjang * lebar * tinggi;
  }
}

void main() {
  // Membuat objek Kubus
  var kubus = Kubus(5.0);
  // Menghitung dan mencetak volume Kubus
  print('Volume Kubus: ${kubus.volume()}');

  // Membuat objek Balok
  var balok = Balok(4.0, 3.0, 6.0);
  // Menghitung dan mencetak volume Balok
  print('Volume Balok: ${balok.volume()}');
}

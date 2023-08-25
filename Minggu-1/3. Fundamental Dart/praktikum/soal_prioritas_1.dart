import 'dart:math';

void main(List<String> args) {
  //* Soal [1]
  print("// Soal [1]");
  // Menentukan nilai sisi persegi
  int s = 10;

  // Menghitung keliling persegi
  final keliling_persegi = 4 * s;
  // Menghitung luas persegi
  final luas_persegi = s * s;

  // Menampilkan hasil keliling dan luas persegi
  print("Keliling Persegi : $keliling_persegi");
  print("Luas Persegi : $luas_persegi");

  // Menentukan nilai panjang dan lebar persegi panjang
  double panjang = 5.0;
  double lebar = 3.0;

  // Menghitung keliling persegi panjang
  double keliling_persegipanjang = 2 * (panjang + lebar);

  // Menghitung luas persegi panjang
  double luas_persegipanjang = panjang * lebar;

  // Menampilkan hasil keliling dan luas persegi panjang
  print('Keliling Persegi Panjang: $keliling_persegipanjang');
  print('Luas Persegi Panjang: $luas_persegipanjang\n');

  //? Soal 2
  print("// Soal [2]");
  // Menentukan nilai jari-jari lingkaran
  double jariJari_lingkaran = 5.0;

  // Menghitung keliling lingkaran
  double keliling_lingkaran = 2 * pi * jariJari_lingkaran;

  // Menghitung luas lingkaran
  double luas_lingkaran = pi * pow(jariJari_lingkaran, 2);

  // Menampilkan hasil keliling dan luas lingkaran
  print('Keliling Lingkaran: $keliling_lingkaran');
  print('Luas Lingkaran: $luas_lingkaran');
}

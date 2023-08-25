void main() {
  //* Soal [1]
  print("Soal [1]");
  // Membuat 3 variabel string
  String hello = "Hello";
  String greet = "Good Morning";
  String nama = "Adji";

  // Menggabungkan 3 variabel
  String hasil = "$hello, $greet, Perkenalkan nama saya $nama";

  // Menampilkan hasil
  print(hasil);
  print("\n");

  //? Soal [2]
  print("Soal [2]");
  // Menentukan nilai tinggi tabung
  double tinggi = 10.0;
  // Menentukan nilai jari-jari tabung
  double jariJari = 5.0;

  // Menghitung volume tabung
  double volume = 3.14 * jariJari * jariJari * tinggi;

  // Menampilkan hasil volume tabung
  print("Volume tabung adalah: $volume");
}

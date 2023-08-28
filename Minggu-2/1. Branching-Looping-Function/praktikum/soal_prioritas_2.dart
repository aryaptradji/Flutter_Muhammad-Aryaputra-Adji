import 'dart:io';

void main() {
  //* Tugas Looping
  //* Soal [1]
  print("Tugas Looping\n// Soal [1]");
  // Menentukan jumlah baris piramida bintang
  int rows = 8;

  // Membuat looping baris
  for (int i = 1; i <= rows; i++) {
    // Membuat spasi
    for (int j = 1; j <= rows - i; j++) {
      stdout.write("  ");
    }
    // Membuat bintang
    for (int k = 1; k <= 2 * i - 1; k++) {
      stdout.write("* ");
    }
    // Membuat baris baru
    print("\n");
  }

  //* Soal [2]
  print("// Soal [2]");
  void jamPasir(int size) {
    // Menentukan ukuran jam pasir dan jumlah baris
    int numRows = 2 * size - 1;

    // Membuat looping baris
    for (int i = 0; i < numRows; i++) {
      int numSpaces = i < size ? i : numRows - i - 1;
      int numStars = numRows - 2 * numSpaces;

      // Membuat spasi
      for (int j = 0; j < numSpaces; j++) {
        stdout.write(" ");
      }

      // Membuat nol
      for (int j = 0; j < numStars; j++) {
        stdout.write("0");
      }

      stdout.writeln();
    }
  }

  // Menampilkan hasil jam pasir
  int size = 6;
  jamPasir(size);

  //* Soal [3]
  print("\n// Soal [3]");
  // Membuat fungsi untuk menghitung faktorial
  int calculateFaktorial(int n) {
    // Memeriksa apakah nomor inputnya negatif dan memberikan pengecualian jika ya
    if (n < 0) {
      throw ArgumentError("Faktorial tidak boleh bernilai negatif.");
    }
    // Menginisialisasi faktorial variabel ke 1
    int faktorial = 1;
    // Iterasi dari 1 ke angka masukan dan mengalikan faktorial dengan setiap angka dalam iterasi
    for (int i = 1; i <= n; i++) {
      faktorial *= i;
    }
    // Mengembalikan nilai akhir faktorial
    return faktorial;
  }

  // Menampilkan hasil faktorial
  print("Faktorial dari 10: ${calculateFaktorial(10)}");
  print("Faktorial dari 40: ${calculateFaktorial(40)}");
  print("Faktorial dari 50: ${calculateFaktorial(50)}");

//? Tugas Function
  print("\nTugas Function");
  // Deklarasi radius
  double radius;

  // Membuat fungsi luas lingkaran
  double calculateCircleArea(double radius) {
    return 3.14 * radius * radius;
  }

  // Inisiasi fungsi luas lingkaran
  radius = 5;
  double area = calculateCircleArea(radius);

  // Menampilkan hasil fungsi luas lingkaran
  print("Luas lingkaran dengan jari-jari $radius adalah $area");
}



  

  

// double calculateCircleArea(double radius) {
//   return 3.14159 * radius * radius; // Rumus luas lingkaran: π * r^2
// }

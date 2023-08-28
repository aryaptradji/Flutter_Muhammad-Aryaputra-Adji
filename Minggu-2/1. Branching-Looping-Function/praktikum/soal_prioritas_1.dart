void main() {
//* Tugas Percabangan (Branching)
  print("// Tugas Percabangan (Branch)");
  // Menentukan nilai yang akan dicek
  int nilai1 = 85;
  int nilai2 = 50;
  int nilai3 = 25;

  // Membuat function dengan pengkondisian if untuk kategori nilai tertentu
  String checkNilai(int nilai) {
    if (nilai > 70) {
      return "Nilai A";
    } else if (nilai > 40 && nilai <= 70) {
      return "Nilai B";
    } else if (nilai > 0 && nilai <= 40) {
      return "Nilai C";
    } else {
      return "";
    }
  }

  print("$nilai1: ${checkNilai(nilai1)}");
  print("$nilai2: ${checkNilai(nilai2)}");
  print("$nilai3: ${checkNilai(nilai3)}");

  //? Tugas Perulangan (Looping)
  print("\n// Tugas Perulangan (Looping)");
  for (var i = 1; i <= 10; i++) {
    print(i);
  }
}

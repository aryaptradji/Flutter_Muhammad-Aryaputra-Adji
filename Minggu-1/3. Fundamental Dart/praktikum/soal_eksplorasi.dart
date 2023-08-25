void main() {
  //* Soal [1]
  print("Soal [1]");
  // Kata yang akan dicek
  String inputY = "aku suka";
  String inputN = "mobil balap";

  // Menghapus spasi dari kata dan mengubah menjadi huruf kecil semua
  String cleanedInputY = inputY.replaceAll(' ', '').toLowerCase();
  String cleanedInputN = inputN.replaceAll(' ', '').toLowerCase();

  bool isPalindromeY = true;
  bool isPalindromeN = true;

  for (int i = 0; i < cleanedInputY.length ~/ 2; i++) {
    if (cleanedInputY[i] != cleanedInputY[cleanedInputY.length - 1 - i]) {
      isPalindromeY = false;
      break;
    }
  }
  for (int i = 0; i < cleanedInputN.length ~/ 2; i++) {
    if (cleanedInputN[i] != cleanedInputN[cleanedInputN.length - 1 - i]) {
      isPalindromeN = false;
      break;
    }
  }

  // Menampilkan hasil
  if (isPalindromeY) {
    print("$inputY = palindrom");
  } else {
    print("$inputY = bukan palindrom");
  }
  if (isPalindromeN) {
    print("$inputN = palindrom");
  } else {
    print("$inputN = bukan palindrom");
  }
  print("\n");

  //? Soal [2]
  print("Soal [2]");
  // Bilangan yang akan dicari faktornya
  int bilangan = 24;

  // Menampilkan hasil
  print("Faktor dari $bilangan adalah:");

  for (int i = 1; i < bilangan; i++) {
    if (bilangan % i == 0) {
      print(i);
    }
  }
}

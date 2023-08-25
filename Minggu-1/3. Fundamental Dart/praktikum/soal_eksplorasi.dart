void main() {
  // Soal [1]
  print("Soal [1]");
  // Kata yang akan dicek
  String input = "aku suka";

  // Menghapus spasi dari kata dan mengubah menjadi huruf kecil semua
  String cleanedInput = input.replaceAll(' ', '').toLowerCase();

  bool isPalindrome = true;

  for (int i = 0; i < cleanedInput.length ~/ 2; i++) {
    if (cleanedInput[i] != cleanedInput[cleanedInput.length - 1 - i]) {
      isPalindrome = false;
      break;
    }
  }

  if (isPalindrome) {
    print("$input = palindrom");
  } else {
    print("$input = bukan palindrom");
  }
  print("\n");

  // Soal [2]
  print("Soal [2]");
  int bilangan = 24; // Bilangan yang akan dicari faktornya

  print("Faktor dari $bilangan adalah:");

  for (int i = 1; i <= bilangan; i++) {
    if (bilangan % i == 0) {
      print(i);
    }
  }
}

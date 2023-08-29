import 'dart:math';
import 'dart:io';

void main() {
  //^ Soal [1]
  print("// Soal [1]");
  // Membuat fungsi untuk mengecek bilangan prima atau bukan
  bool isPrime(int bilangan) {
    // Mengecek bilangan prima yang tidak boleh kurang dari 2
    if (bilangan < 2) {
      return false;
    }

    // Mengecek apakah bilangan tersebut habis dibagi bilangan apapun dari 2 hingga akar kuadrat(bilangan)
    for (int i = 2; i <= sqrt(bilangan); i++) {
      if (bilangan % i == 0) {
        return false;
      }
    }
    return true;
  }

  // Menginisiasi nilai bilangan yang akan dicek
  int bilangan1 = 23;
  int bilangan2 = 12;
  // Menampilkan hasil pengecekan bilangan prima
  if (isPrime(bilangan1)) {
    print('$bilangan1 = bilangan prima');
  } else {
    print('$bilangan1 = bukan bilangan prima');
  }
  if (isPrime(bilangan2)) {
    print('$bilangan2 = bilangan prima');
  } else {
    print('$bilangan2 = bukan bilangan prima');
  }

  //$ Soal [2]
  print("\n// Soal [2]");
  // Menentukan nilai maksimal dari perkalian
  int input = 9;
  int maxValue = input * input;

  // Menghitung panjang digit terpanjang untuk penataan tabel
  int maxDigitCount = maxValue.toString().length;

  // Membuat tabel perkalian
  for (int i = 1; i <= input; i++) {
    for (int j = 1; j <= input; j++) {
      int product = i * j;
      String formattedProduct = product.toString().padLeft(maxDigitCount);

      stdout.write(formattedProduct + " ");
    }
    print("\n");
  }
}

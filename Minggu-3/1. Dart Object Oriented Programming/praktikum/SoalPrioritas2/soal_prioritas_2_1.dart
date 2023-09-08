/* 

Soal :

Buatlah sebuah class Calculator dengan kriteria sebagai berikut:
  a. Terdapat method untuk melakukan penjumlahan dua bilangan.
  b. Terdapat method untuk melakukan pengurangan dua bilangan.
  c. Terdapat method untuk melakukan perkalian dua bilangan.
  d. Terdapat method untuk melakukan pembagian dua bilangan.

 */
// Membuat class Calculator
class Calculator {
  // Method penjumlahan
  num add(num a, num b) {
    return a + b;
  }

  // Method pengurangan
  num subtract(num a, num b) {
    return a - b;
  }

  // Method perkalian
  num multiply(num a, num b) {
    return a * b;
  }

  // Method pembagian
  num divide(num a, num b) {
    if (b == 0) {
      throw ArgumentError('Cannot divide by zero');
    }
    return a / b;
  }
}

void main() {
  Calculator calculator = Calculator();

  // Contoh penggunaaan
  print(calculator.add(2, 3)); // Output: 5
  print(calculator.subtract(5, 2)); // Output: 3
  print(calculator.multiply(4, 6)); // Output: 24
  print(calculator.divide(10, 2)); // Output: 5
}

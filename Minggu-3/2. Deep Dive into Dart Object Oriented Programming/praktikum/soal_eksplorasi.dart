/* 

Soal :

Kriteria dari program yang dibuat adalah sebagai berikut:

- Buat class beserta interface sesuai dengan class diagram diatas.
- Method `getArea()` digunakan untuk menghitung luas bangun datar.
- Method `getPerimeter()` digunakan untuk menghitung keliling bangun datar.
- Output yang harus ditampilkan adalah luas dan keliling untuk tiga bangun datar berdasarkan di class diagram.

 */
// Membuat interface Shape
abstract class Shape {
  int getArea(); // Method untuk menghitung luas bangun datar
  int getPerimeter(); // Method untuk menghitung keliling bangun datar
}

// Membuat kelas Circle yang mengimplementasikan Shape
class Circle implements Shape {
  int radius;

  // Konstruktor untuk Circle
  Circle(this.radius);

  // Implementasi method getArea untuk Circle
  @override
  int getArea() {
    return (3.14 * radius * radius).toInt();
  }

  // Implementasi method getPerimeter untuk Circle
  @override
  int getPerimeter() {
    return (2 * 3.14 * radius).toInt();
  }
}

// Membuat kelas Square yang mengimplementasikan Shape
class Square implements Shape {
  int side;

  // Konstruktor untuk Square
  Square(this.side);

  // Implementasi method getArea untuk Square
  @override
  int getArea() {
    return (side * side);
  }

  // Implementasi method getPerimeter untuk Square
  @override
  int getPerimeter() {
    return (4 * side);
  }
}

// Membuat kelas Rectangle yang mengimplementasikan Shape
class Rectangle implements Shape {
  int width;
  int height;

  // Konstruktor untuk Rectangle
  Rectangle(this.width, this.height);

  // Implementasi method getArea untuk Rectangle
  @override
  int getArea() {
    return (width * height);
  }

  // Implementasi method getPerimeter untuk Rectangle
  @override
  int getPerimeter() {
    return (2 * (width + height));
  }
}

void main() {
  // Menggunakan kelas Circle, Square, dan Rectangle

  // Membuat objek Circle
  final circle = Circle(5);
  // Menghitung dan mencetak luas dan keliling Circle
  print('Luas Lingkaran: ${circle.getArea()}');
  print('Keliling Lingkaran: ${circle.getPerimeter()}');

  // Membuat objek Square
  final square = Square(4);
  // Menghitung dan mencetak luas dan keliling Square
  print('Luas Persegi: ${square.getArea()}');
  print('Keliling Persegi: ${square.getPerimeter()}');

  // Membuat objek Rectangle
  final rectangle = Rectangle(6, 8);
  // Menghitung dan mencetak luas dan keliling Rectangle
  print('Luas Persegi Panjang: ${rectangle.getArea()}');
  print('Keliling Persegi Panjang: ${rectangle.getPerimeter()}');
}

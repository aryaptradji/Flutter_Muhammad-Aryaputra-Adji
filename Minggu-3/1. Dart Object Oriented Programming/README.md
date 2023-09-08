# Summary

# Dart Object Oriented Programming

Pemrograman Berorientasi Objek (OOP) di dalam bahasa pemrograman Dart adalah paradigma pemrograman yang mengorganisasi kode menjadi objek-objek yang dapat berinteraksi satu sama lain. Dart mendukung OOP secara penuh dan memiliki fitur-fitur yang memungkinkan kita untuk memodelkan dunia nyata dan mengorganisasi kode dengan lebih baik. Berikut adalah beberapa poin utama OOP di Dart :

### **1. &nbsp;Kelas dan Objek**
Dalam Dart, kelas adalah blueprint atau template yang mendefinisikan struktur dan perilaku objek. Objek adalah instance konkret dari sebuah kelas.

**Rumus :**  
```dart
class NamaKelas {
  // Properti (atribut)
  TipeData namaProperti;

  // Konstruktor
  NamaKelas(this.namaProperti);

  // Metode
  TipeData namaMetode() {
    // Implementasi metode
  }
}
```

**Contoh :**
```dart
class Person {
  // Properti
  String name;
  int age;

  // Konstruktor
  Person(this.name, this.age);

  // Metode
  void introduce() {
    print('Nama: $name, Usia: $age tahun');
  }
}

void main() {
  // Membuat objek dari kelas Person
  var person1 = Person('Alice', 25);
  var person2 = Person('Bob', 30);

  // Memanggil metode dari objek
  person1.introduce();
  person2.introduce();
}
```
Dalam contoh ini, saya mendefinisikan kelas `Person` dengan properti `name` dan `age`, serta metode introduce. Kita kemudian membuat objek dari kelas `Person` dan memanggil metode `introduce` pada objek-objek tersebut.

### **2. &nbsp;Pewarisan (*Inheritance*)**
Konsep dalam OOP yang memungkinkan kita membuat class baru dengan mewarisi atribut dan metode dari class yang sudah ada. Dalam Dart, inheritance dilakukan dengan menggunakan kata kunci `extends`.

**Rumus :**
```dart
class SubKelas extends KelasInduk {
  // Properti dan metode khusus subkelas
}
```

**Contoh :**
```dart
class Animal {
  String name;

  Animal(this.name);

  void speak() {
    print('$name berbicara');
  }
}

class Dog extends Animal {
  Dog(String name) : super(name);

  void bark() {
    print('$name menggonggong');
  }
}

void main() {
  var dog = Dog('Fido');
  dog.speak(); // Memanggil metode dari kelas induk
  dog.bark();  // Memanggil metode dari subkelas
}
```

### **3. &nbsp;Polimorfisme**
Polimorfisme memungkinkan objek dari kelas yang berbeda untuk merespons metode dengan cara yang berbeda. Object dari suatu class parent bisa berubah bentuk menjadi object dari class childnya. Ini dapat dicapai melalui overriding dan penggunaan antarmuka (*interfaces*).

Contoh :
```dart
class Shape {
  void draw() {
    print('Menggambar bentuk');
  }
}

class Circle extends Shape {
  @override
  void draw() {
    print('Menggambar lingkaran');
  }
}

class Square extends Shape {
  @override
  void draw() {
    print('Menggambar persegi');
  }
}

void main() {
  var shapes = [Circle(), Square()];

  for (var shape in shapes) {
    shape.draw();
  }
}
```
Dalam contoh ini, saya memiliki kelas dasar `Shape` dengan metode `draw`, dan kemudian saya memiliki dua subkelas, `Circle` dan `Square`, yang melakukan overriding pada metode `draw`. Ketika saya membuat objek dari kedua subkelas tersebut dan memanggil metode `draw` pada keduanya, saya melihat polimorfisme di mana metode yang sesuai dari setiap objek dipanggil.

<br><br>

# Hasil Praktikum

### **SOAL PRIORITAS 1**

**// Source Code**

![soal_prioritas_1_code.png](screenshot/soal_prioritas_1_code.png "source code soal prioritas 1")

**// Output**

![soal_prioritas_1_output.png](screenshot/soal_prioritas_1_output.png "output soal prioritas 1")

<br>

### **SOAL PRIORITAS 2**
**// Source Code**  

*Nomor 1*

![soal_prioritas_2_code.png](screenshot/soal_prioritas_2_1_code.png "source soal prioritas 2 nomor 2")

*Nomor 2*

![soal_prioritas_2_code.png](screenshot/soal_prioritas_2_2_code.png "source soal prioritas 2 nomor 2")

**// Output**

*Nomor 1*

![soal_prioritas_2_output.png](screenshot/soal_prioritas_2_1_output.png "output soal prioritas 2 nomor 1")

*Nomor 2*

![soal_prioritas_2_output.png](screenshot/soal_prioritas_2_2_output.png "output soal prioritas 2 nomor 2")

<br>

### **SOAL EKSPLORASI**

**// Source Code**

![soal_eksplorasi_code.png](screenshot/soal_eksplorasi_code.png "source code soal eksplorasi")

**// Output**

![soal_eksplorasi_output.png](screenshot/soal_eksplorasi_output.png "output soal eksplorasi")

<br>

Untuk melihat hasil praktikum lebih lengkapnya, dapat klik [di sini](https://github.com/aryaptradji/flutter_Muhammad-Aryaputra-Adji/tree/master/Minggu-3/1.%20Dart%20Object%20Oriented%20Programming/praktikum)
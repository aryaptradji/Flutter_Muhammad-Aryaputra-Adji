# Documentation

# Installation Command Line Interface and Package Management in Flutter

### **SOAL PRIORITAS 1**

**// Melakukan inisiasi**  
- Saya melakukan inisiasi dengan membuat projek baru dengan menggunakan command &nbsp;`git create <nama_projek>`
  
  ![](../screenshot/inisialisasi/ss%20membuat%20projek%20baru.png "Membuat projek dengan 'flutter create'")

**// Menambahkan package**
- Saya menambahkan package http (untuk nanti diremove) dengan command &nbsp;`flutter pub add <nama_package>`
  
  ![](../screenshot/inisialisasi/flutter%20pub%20add%20http%20(untuk%20diremove).png "Menambahkan package http dengan flutter pub add")

**// Menginstall package**
- Saya menginstall package dengan command &nbsp;`flutter pub get`
  
  ![](../screenshot/soal_prioritas_1/flutter%20pub%20get.png "Menginstall package dengan flutter pub get")

**// Menghapus package yang terinstall**
- Saya menghapus package http dengan command &nbsp;`flutter pub remove <nama_package>`
  
  ![](../screenshot/soal_prioritas_1/flutter%20pub%20remove%20http.png "Menghapus package http dengan flutter pub remove")

**// Melakukan hot-reload**
- Saya melakukan hot reload dengan menjalankan command &nbsp;`flutter run` kemudian mengetik huruf `r`
  
  ![](../screenshot/soal_prioritas_1/flutter%20run%20(no%20hot-reload).png "Melakukan flutter run tanpa hot-reload")

  ![](../screenshot/soal_prioritas_1/flutter%20run%20(hot-reload).png "Melakukan flutter run dengan hot-reload")

**// Membuat APK**
- Saya membuat apk dengan &nbsp;`flutter build apk`

  ![](../screenshot/soal_prioritas_1/flutter%20build%20apk.png "Membuat APK dengan flutter build apk")

**// Membersihkan cache**
- Saya membersihkan cache dari projek dengan command &nbsp; `flutter clean`

  ![](../screenshot/soal_prioritas_1/flutter%20clean.png "Membersihkan cache dengan flutter clean")

<br>

### **SOAL PRIORITAS 2**

Mmengubah Appbar dengan tulisan “Halo Alterra” dan di halaman bodynya berisi tulisan “Nama saya adalah Muhammad Aryaputra Adji”
```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String nama = "Muhammad Aryaputra Adji";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halo Alterra"),
      ),
      body: Center(
        child: Text("Nama saya adalah $nama"),
      ),
    );
  }
}
```
***Output:**

![](../screenshot/soal_prioritas_2/text_appbar_flutter.png)
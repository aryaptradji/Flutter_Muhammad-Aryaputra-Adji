# Summary

# Installation Command Line Interface and Package Management in Flutter

## Flutter CLI (Command Line Interface)
Flutter CLI (Co`mmand Line Interface) adalah alat yang digunakan untuk mengelola dan mengembangkan proyek Flutter melalui baris perintah. Flutter CLI menyediakan berbagai perintah yang memungkinkan pengembang untuk membuat, menjalankan, dan menguji aplikasi Flutter.

## Package Management 
Package management dalam Flutter adalah proses mengelola dependensi atau paket-paket yang digunakan dalam pengembangan aplikasi Flutter. Paket-paket ini adalah kode yang ditulis oleh komunitas Flutter dan disimpan di repositori pub.dev. Package management memungkinkan pengembang untuk dengan mudah menambahkan, menghapus, dan mengupdate paket-paket ini dalam proyek Flutter mereka.

## Command Penting dalam Flutter CLI
Berikut adalah beberapa perintah penting dalam Flutter CLI:

1. `flutter create`: Perintah ini digunakan untuk membuat proyek Flutter baru. Misalnya, `flutter create nama_proyek` akan membuat struktur dasar proyek Flutter dengan nama 'nama_proyek'.

2. `flutter run`: Perintah ini digunakan untuk menjalankan aplikasi Flutter pada emulator atau perangkat fisik yang terhubung. Misalnya, `flutter run` akan menjalankan aplikasi Flutter pada perangkat default yang terhubung.

3. `flutter doctor`: Perintah ini digunakan untuk memeriksa konfigurasi Flutter pada sistem pengembangan. Ini akan memeriksa apakah ada dependensi yang hilang atau konfigurasi yang tidak tepat.

4. `flutter pub get`: Perintah ini digunakan untuk mengunduh dan menginstal paket-paket yang didefinisikan dalam file pubspec.yaml. Misalnya, `flutter pub get` akan mengunduh dan menginstal semua paket yang didefinisikan dalam proyek.

5. `flutter pub upgrade`: Perintah ini digunakan untuk mengupgrade paket-paket yang ada dalam proyek ke versi terbaru. Misalnya, `flutter pub upgrade` akan memperbarui semua paket yang ada dalam proyek ke versi terbaru yang tersedia.

6. `flutter test`: Perintah ini digunakan untuk menjalankan unit test yang telah ditulis dalam proyek Flutter. Ini akan memeriksa apakah fungsi dan komponen aplikasi berfungsi dengan baik.

7. `flutter build`: Perintah ini digunakan untuk membangun aplikasi Flutter ke dalam file binary yang siap untuk didistribusikan. Misalnya, `flutter build apk` akan membangun aplikasi Flutter menjadi file APK yang dapat diinstal pada perangkat Android.

8. `flutter clean`: Perintah ini digunakan untuk membersihkan cache dan file sementara yang dihasilkan oleh Flutter. Ini dapat membantu memperbaiki masalah yang terkait dengan cache atau file yang rusak.

## Langkah-Langkah Menambahkan Package dalam Projek Flutter

Berikut adalah langkah-langkah untuk menambahkan package dalam proyek Flutter:

1. Buka file `pubspec.yaml` dalam proyek Flutter.

2. Cari bagian `dependencies` dalam file `pubspec.yaml`. Bagian ini digunakan untuk menentukan paket-paket yang akan digunakan dalam proyek.

3. Di bawah `dependencies`, tambahkan baris baru dengan format `nama_paket: versi`. Gantilah `nama_paket` dengan nama paket yang ingin ditambahkan, dan `versi` dengan versi yang ingin digunakan. Jika tidak menentukan versi, Flutter akan menggunakan versi terbaru dari paket tersebut.

   Contoh: `http: ^0.13.3`

4. Simpan file `pubspec.yaml`.

5. Buka terminal atau command prompt dan arahkan ke direktori proyek Flutter.

6. Jalankan perintah `flutter pub get` untuk mengunduh dan menginstal paket-paket yang telah ditambahkan ke file `pubspec.yaml`.

   Contoh: `flutter pub get`

7. Setelah perintah selesai dijalankan, paket-paket akan terunduh dan diinstal dalam proyek Flutter.

8. Untuk menggunakan paket yang telah ditambahkan dalam kode Flutter, impor paket dengan menambahkan pernyataan `import` di file Dart yang sesuai.

   Contoh: `import 'package:http/http.dart' as http;`

9. Gunakan fungsi dan kelas yang disediakan oleh paket dalam kode Flutter.

   Contoh: `http.get(url).then((response) { // kode lain });`

<br>

Untuk melihat hasil praktikum, dapat klik [di sini](https://github.com/aryaptradji/flutter_Muhammad-Aryaputra-Adji/tree/master/Minggu-4/1.%20Installation%20Command%20Line%20Interface%20and%20Package%20Management%20in%20Flutter/praktikum)
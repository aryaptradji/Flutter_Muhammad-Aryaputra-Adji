# Summary 

# Introduction Flutter and Flutter Widget

## Apa itu Flutter?
Flutter adalah sebuah framework open-source yang dikembangkan oleh Google untuk membangun aplikasi mobile, web, dan desktop dari satu basis kode yang sama. Salah satu aspek yang membuat Flutter menonjol adalah penggunaan bahasa pemrograman Dart untuk pengembangan aplikasi. Dart adalah bahasa pemrograman yang dikembangkan oleh Google yang memiliki sintaksis yang mudah dipahami dan kompatibel dengan pengembangan berbasis objek.

Beberapa fitur utama dari Flutter adalah :  
1. **Widget-Based** : Flutter menggunakan konsep widget sebagai komponen dasar untuk membangun antarmuka pengguna. Anda dapat menggabungkan widget-widget ini untuk membuat UI yang kaya dan kompleks.  
2. **Hot Reload** : Fitur ini memungkinkan pengembang untuk melakukan perubahan dalam kode dan melihat hasilnya secara langsung dalam waktu nyata tanpa perlu menghentikan atau me-restart aplikasi. Hal ini mempercepat siklus pengembangan.
3. **Tampilan Konsisten** : Dengan Flutter, Anda dapat menciptakan tampilan yang seragam di berbagai platform, termasuk Android dan iOS, sehingga pengguna akan merasa familiar dengan aplikasi Anda.
4. **Kinerja Cepat** : Flutter diketahui memiliki kinerja yang sangat cepat karena menggunakan rendering langsung ke GPU dan menghindari "bridge" ke native code.

<br>

## Projek Flutter
### **A. &nbsp;Membuat Projek** 
**// Membuat projek di VSCode**  
1. Buka VSCode.

2. Pilih "View" (Tampilan) di menu atas, lalu pilih "Command Palette" (Palet Perintah) atau tekan Ctrl+Shift+P (Windows/Linux) atau Cmd+Shift+P (macOS).

3. Ketik "Flutter: New Project" dan pilih perintah tersebut dari daftar yang muncul. Ini akan membuka jendela dialog untuk membuat proyek.

4. Berikan nama proyek Flutter dan pilih direktori tempat dimana ingin menyimpan proyek tersebut. Selanjutnya, pilih "Create" (Buat).

5. Selanjutnya, pilih "Flutter: New Application" untuk membuat proyek aplikasi Flutter standar. Bisa juga memilih "Flutter: New Package" jika Anda ingin membuat package Flutter.

6. Setelah memilih jenis proyek, Flutter akan mulai membuat proyek dan mengunduh dependensi yang diperlukan. Ini akan memakan waktu yang cukup banyak.

**// Membuat projek di Terminal**  
1. Buka terminal atau command prompt di komputer.

2. Navigasikan ke direktori tempat projek Flutter baru ingin dibuat dengan menggunakan command :
   ```
   cd /path/to/your/directory
   ```

3. Membuat projek baru dengan command :  
   ```
   flutter create <nama_projek>
   ```
   Ganti `<nama_projek>` dengan nama projek yang diinginkan.

4. Flutter akan mulai membuat proyek baru dan mengunduh dependensi yang diperlukan. Ini akan memakan waktu beberapa saat.

### **B. &nbsp;Menjalankan Projek**
**// Menjalankan projek di VSCode**
1. Buka folder projek Flutter di VSCode.
2. Menekan tombol di bawah ini :
   ![](screenshot/ss_runProject.png)
3. Projek akan berjalan tapi membutuhkan waktu yang lumayan.

**// Menjalankan projek di Terminal**
1. Buka terminal atau command prompt di komputer.
2. Navigasikan ke direktori proyek Flutter Anda menggunakan perintah `cd` (change directory).
   ```
   cd /path/to/your/flutter/project
   ```
3. Gunakan command berikut untuk menjalankan projek :
   ```
   flutter run
   ```
4. Projek akan berjalan yang memerlukan waktu beberapa saat.

### **C. &nbsp;Fitur Hot Reload**
Selama pengembangan, terdapat fitur "hot reload" Flutter untuk melihat perubahan kode secara langsung tanpa harus menghentikan dan memulai ulang aplikasi. Cukup tekan tombol r di terminal setelah menjalankan `flutter run`, dan aplikasi akan diperbarui secara otomatis ketika menyimpan perubahan kode.

### **D. &nbsp;Struktur Projek Flutter**
Struktur proyek Flutter memiliki hierarki yang terorganisir dengan baik untuk memfasilitasi pengembangan aplikasi. Berikut adalah komponen-komponen utama dalam struktur proyek Flutter :

1. Folder `android` :  
   Ini adalah folder yang berisi proyek Android yang dihasilkan dari Flutter. Biasanya, Anda tidak perlu banyak berinteraksi dengan folder ini, kecuali jika Anda perlu menyesuaikan beberapa konfigurasi Android tertentu.

2. Folder `assets` :  
Folder ini berisi berkas-berkas statis seperti gambar, font, file konfigurasi, dan sumber daya lainnya yang diperlukan oleh aplikasi Anda. Anda dapat mengakses sumber daya ini di dalam kode Flutter Anda.

3. Folder `build` :  
Ini adalah folder tempat Flutter menyimpan berkas-berkas yang dihasilkan selama proses kompilasi, seperti kode Dart yang telah diterjemahkan menjadi kode mesin, asset yang telah dioptimalkan, dan lain-lain. Biasanya, Anda tidak perlu berinteraksi langsung dengan folder ini.

4. Folder `ios` :  
Seperti folder android, folder ini berisi proyek iOS yang dihasilkan oleh Flutter. Anda jarang perlu berinteraksi langsung dengan folder ini, kecuali jika Anda perlu menyesuaikan konfigurasi iOS khusus.

5. Folder `lib` :  
Inilah tempat utama di mana Anda akan mengembangkan kode Flutter Anda. Anda akan menemukan file main.dart di dalam folder ini, yang merupakan file utama yang dijalankan saat aplikasi Flutter Anda dijalankan. Anda dapat membuat folder dan file tambahan di dalamnya sesuai dengan struktur proyek Anda.

6. Folder `test` :  
Ini adalah folder yang digunakan untuk menulis tes unit dan tes integrasi untuk aplikasi Anda. Tes digunakan untuk memastikan bahwa aplikasi berfungsi dengan baik dan dapat digunakan dalam pengembangan berkelanjutan.

7. File `pubspec.yaml` :  
Ini adalah berkas konfigurasi proyek Flutter Anda. Di dalamnya, Anda mendefinisikan dependensi paket Flutter dan sumber daya lainnya yang dibutuhkan oleh aplikasi Anda. Anda juga dapat menambahkan metadata seperti nama, deskripsi, versi, dan banyak lagi.

8. Folder `build` :  
Ini adalah folder tempat Flutter menyimpan berkas-berkas yang dihasilkan selama proses kompilasi, seperti kode Dart yang telah diterjemahkan menjadi kode mesin, asset yang telah dioptimalkan, dan lain-lain. Biasanya, Anda tidak perlu berinteraksi langsung dengan folder ini.

<br>

## Stateless Widget
Stateless Widget adalah jenis widget dalam Flutter yang tidak memiliki keadaan internal yang dapat berubah. Ini berarti bahwa setelah widget dibuat, properti dan tampilan widget tersebut tidak akan berubah. Stateless Widget umumnya digunakan untuk menampilkan informasi statis atau komponen UI yang tidak memerlukan interaksi yang kompleks.

Berikut adalah beberapa contoh Stateless Widget yang umum digunakan dalam Flutter :  
1. **Text Widget**  
   `Text` digunakan untuk menampilkan teks pada layar. Ini adalah salah satu widget paling sederhana.
    ```dart
    Text('Halo, Dunia!')
    ```

2. **Icon Widget**  
   `Icon` digunakan untuk menampilkan ikon atau simbol tertentu.
   ```dart
   Icon(Icons.star)
   ```

3. **Image Widget**  
   `Image` digunakan untuk menampilkan gambar.
   ```dart
   Image.asset('assets/gambar.jpg')
   ```

4. **RaisedButton Widget**  
   `RaisedButton` digunakan untuk membuat tombol yang dapat ditekan.
   ```dart
   RaisedButton(
     onPressed: () {
       // Aksi yang dijalankan saat tombol ditekan
     },
     child: Text('Klik Saya'),
   )
   ```

5. **Container Widget**  
   `Container` digunakan untuk mengelompokkan dan mengatur widget lain dalam bentuk kotak.
   ```dart
   Container(
     color: Colors.blue,
     child: Text('Ini teks di dalam kotak biru.'),
   )
   ```

6. **ListTile Widget**  
   `ListTile` digunakan untuk membuat item dalam daftar atau tampilan daftar yang lebih rumit.
   ```dart
   ListTile(
     title: Text('Judul Item'),
     subtitle: Text('Deskripsi item'),
     leading: Icon(Icons.star),
   )
   ```

7. **Card Widget**  
   `Card` digunakan untuk menampilkan informasi dalam bentuk kartu.
   ```dart
   Card(
     child: ListTile(
       title: Text('Judul Kartu'),
       subtitle: Text('Deskripsi kartu'),
     ),
   )
   ```

8. **AppBar Widget**  
   `AppBar` digunakan untuk menampilkan app bar di bagian atas aplikasi.
   ```dart
   AppBar(
     title: Text('Judul Aplikasi'),
   )
   ```

9. **Chip Widget**  
    `Chip` digunakan untuk menampilkan komponen seperti label, tag, atau item kecil lainnya.
    ```dart
    Chip(
      label: Text('Tag Flutter'),
      avatar: Icon(Icons.label),
    )
    ```

10. **SizedBox Widget**  
    `SizedBox` digunakan untuk memberikan dimensi yang tepat pada widget.
    ```dart
    SizedBox( 
      width: 100,
      height: 100, 
      child: Text('SizedBox'),
    )
    ```
Stateless Widget sangat berguna untuk menampilkan konten statis dalam aplikasi Flutter. Mereka biasanya digunakan untuk menggabungkan dan menyusun widget yang lebih kompleks dan interaktif dalam aplikasi Anda.

<br>

## Stateful Widget
Stateful Widget adalah jenis widget dalam Flutter yang memiliki keadaan internal yang dapat berubah selama siklus hidup aplikasi. Ini berarti widget dapat memperbarui tampilan mereka berdasarkan perubahan data atau interaksi pengguna. Stateful Widget memiliki dua kelas terpisah: kelas widget itu sendiri dan kelas "state" yang berisi data yang dapat berubah.

Berikut adalah beberapa contoh Stateful Widget yang umum digunakan dalam Flutter :  
1. **Stateful Widget**  
   `StatefulWidget` adalah kelas dasar untuk semua widget stateful di Flutter. Ini berisi metode `createState()` yang mengembalikan objek dari kelas `State` yang sesuai.
   ```dart
   class CounterWidget extends StatefulWidget {
     @override
     _CounterWidgetState createState() => _CounterWidgetState();
   }
   ```

2. **State**  
   `State` adalah kelas yang mengelola keadaan (state) dari widget stateful. Ini berisi data yang dapat berubah selama siklus hidup widget. Update keadaan menggunakan metode `setState()`.
   ```dart
   class _CounterWidgetState extends State<CounterWidget> {
     int counter = 0;

     void incrementCounter() {
       setState(() {
         counter++;
       });
     }

     @override
     Widget build(BuildContext context) {
       return Column(
         children: [
           Text('Counter: $counter'),
           ElevatedButton(
             onPressed: incrementCounter,
             child: Text('Tambah'),
           ),
         ],
       );
     }
   }
   ```

<br>

## Built-in Widget
Built-in Widget dalam Flutter adalah sekelompok widget bawaan yang telah disediakan oleh Flutter untuk membangun berbagai jenis komponen antarmuka pengguna. Ini termasuk widget untuk tata letak, input, tampilan, animasi, dan banyak lagi. Berikut adalah beberapa contoh Built-in Widget yang sering digunakan dalam Flutter :
1. **MaterialApp**  
   `MaterialApp` adalah widget yang digunakan sebagai "kerangka" aplikasi Flutter. Ini mengatur berbagai konfigurasi dan tata letak default yang digunakan dalam aplikasi.
   ```dart
   MaterialApp(
     title: 'Aplikasi Flutter',
     home: MyHomePage(),
   )
   ```

2. **Scaffold**  
   `Scaffold` adalah widget yang digunakan untuk membuat tampilan dasar aplikasi. Ini termasuk app bar, floating action button, dan body.
   ```dart
   Scaffold(
     appBar: AppBar(
       title: Text('Contoh App Flutter'),
     ),
     body: Center(
       child: Text('Selamat datang di Flutter!'),
     ),
   )
   ```

3. **AppBar**  
   `AppBar` adalah widget yang digunakan untuk menampilkan app bar di bagian atas aplikasi. Ini biasanya berisi judul aplikasi dan tombol-tombol navigasi.
   ```dart
   AppBar(
     title: Text('Judul Aplikasi'),
     actions: [
       IconButton(
         icon: Icon(Icons.search),
         onPressed: () {
           // Aksi yang dijalankan saat tombol pencarian ditekan
         },
       ),
     ],
   )
   ```

4. **Text**  
   Text adalah widget yang digunakan untuk menampilkan teks pada layar.
   ```dart
   Text('Halo, Dunia!')
   ```
# Summary

# Flutter Form 

Flutter Form adalah widget yang digunakan dalam kerangka kerja Flutter untuk mengelola input pengguna, validasi, dan tindakan yang terkait dengan formulir. Flutter Form akan membantu dalam hal membuat dan mengelola formulir dengan mudah dalam aplikasi Flutter Kita.

Ada beberapa komponen penting dalam Flutter Form:
1. `Form Widget`&nbsp;: Form adalah widget utama yang membungkus elemen-elemen formulir di dalamnya. Kita dapat memiliki banyak elemen formulir dalam satu Form. Form bertanggung jawab atas validasi dan pengiriman data yang dimasukkan oleh pengguna.

2. `TextFormField`&nbsp;: TextFormField adalah widget yang digunakan untuk memungkinkan pengguna memasukkan teks atau data lainnya ke dalam formulir. Kita dapat menambahkan berbagai properti, seperti controller (untuk mengontrol isian teks), validator (untuk validasi), dan banyak lagi.

3. `GlobalKey<FormState>`&nbsp;: Kita memerlukan `GlobalKey<FormState>` untuk mengakses status dan metode validasi dari Form. Kita harus menghubungkannya ke Form menggunakan properti key.

4. `FormState`&nbsp;: FormState adalah objek yang berisi informasi tentang keadaan Form seperti status validasi, apakah formulir telah di-submit, dan lainnya.

5. **Submit Button**: Kita biasanya menyertakan tombol "Submit" yang akan mengirimkan data formulir ke server atau mengambil tindakan lainnya sesuai dengan kebutuhan aplikasi Kita.

6. **Validation**: Kita dapat menambahkan logika validasi ke dalam formulir Kita menggunakan properti `validator` dalam `TextFormField` atau dengan menggunakan `FormState`. Properti ini hanya tersedia pada `TextFormField` tetapi tidak pada `TextField`. Dengan validasi, Kita dapat memastikan bahwa data yang dimasukkan oleh pengguna sesuai dengan aturan tertentu sebelum mengizinkannya untuk di-submit. 

7. `onChanged`&nbsp;: Kita juga dapat menggunakan properti onChanged dalam `TextField` untuk menentukan apa yang harus dilakukan dengan data yang dimasukkan setelah data tersebut dinyatakan valid. Ketika menggunakan properti `onChanged` ini kita harus membuat controller terlebih dahulu untuk mengambil data text yang ada di TextField dari class `TextEditingController`.

8. **Form Submission**: Ketika pengguna menekan tombol "Submit" atau tindakan serupa, Kita dapat mengakses data formulir yang divalidasi melalui `FormState` dan mengambil tindakan sesuai dengan data tersebut, misalnya mengirimkannya ke server.

<br><br>

# Hasil Praktikum

### **SOAL PRIORITAS 1**

**// Soal 1: Membuat halaman Form Contact App**

![halaman_form_contact_app.png](screenshot/soal_prioritas_1/soal1.png "Halaman Form Contact App")

**// Soal 2: Menampilkan isi data List pada console ketika tombol Submit ditekan**

![hasil_console.png](screenshot/soal_prioritas_1/soal2.png "Hasil Console")

<br>

### **SOAL PRIORITAS 2**

**// Soal 1: Membuat tampilan ListView yang berisi data-data dalam List**

![tampilan_ui_listview.png](screenshot/soal_prioritas_2/tampilan_ui.png "Tampilan UI ListView")

**// Soal 2: Membuat fitur untuk menambah data kontak**

![tambah_data.png](screenshot/soal_prioritas_2/tambah_data_1.png "Mengisi data dan menekan tombol submit")

![tambah_data.png](screenshot/soal_prioritas_2/tambah_data_2.png "Data berhasil ditambahkan dan masuk dalam ListView paling atas")

**// Soal 3: Membuat fitur untuk menghapus data pada ListView**

![hapus_data.png](screenshot/soal_prioritas_2/hapus_data_1.png "Menghapus data kontak")

**// Soal 4: Membuat fitur untuk melakukan update pada kontak**

![edit_data.png](screenshot/soal_prioritas_2/edit_data_1.png "Menekan tombol edit")

![edit_data.png](screenshot/soal_prioritas_2/edit_data_2.png "Mengambil data pada ListTile yang ditekan tombol editnya")

<br>

### **SOAL EKSPLORASI**

**// Soal 1: Membuat fitur validasi nama**  
- Nama harus diisi oleh user

  ![nama_wajib_diisi.png](screenshot/soal_eksplorasi/validasi_nama_wajib_diisi.png "Validasi nama wajib diisi")

- Nama harus terdiri dari 2 kata minimal

  ![nama_minimal_2_kata.png](screenshot/soal_eksplorasi/validasi_nama_minimal_2_kata.png "Validasi nama minimal 2 kata")

- Setiap kata harus dimulai dengan Huruf Kapital

  ![nama_huruf_kapital.png](screenshot/soal_eksplorasi/validasi_nama_huruf_kapital.png "Validasi nama Huruf Kapital")

- Nama tidak boleh mengandung angka atau karakter khusus

  ![nama_tidak_boleh_angka_atau_karakter.png](screenshot/soal_eksplorasi/validasi_nama_tidakboleh_angka_karakter.png "Validasi nama tidak boleh angka atau karakter")

**// Soal 2: Membuat fitur validasi nomor handphone**

- Nomor handphone harus diisi oleh user

  ![nomor_wajib_diisi.png](screenshot/soal_eksplorasi/validasi_nomor_wajib_diisi.png "Validasi nomor handphone wajib diisi")

- Nomor handphone hanya boleh terdiri dari angka

  ![nomor_hanya_boleh_angka.png](screenshot/soal_eksplorasi/validasi_hanya_boleh_angka.png "Validasi nomor handphone hanya boleh angka saja")

- Panjang nomor handphone harus minimal 8 digit dan maksimal 15 digit

  ![nomor_terdiri_8-15_digit.png](screenshot/soal_eksplorasi/validasi_nomor_terdiri_8-15_digit.png "Validasi nomor handphone harus terdiri 8-15 digit")

- Nomor handphone harus dimulai dengan 0

  ![nomor_dimulai_dengan_0.png](screenshot/soal_eksplorasi/validasi_nomor_dimulai_dari_0.png "Validasi nomor handphone harus dimulai dengan angka 0")

<br>

Untuk melihat hasil praktikum, dapat klik [di sini]()
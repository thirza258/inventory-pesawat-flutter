# **Pemrograman Berbasis Platform**



## **Daftar Isi**:

- [**Pemrograman Berbasis Platform**](#pemrograman-berbasis-platform)
  - [**Daftar Isi**:](#daftar-isi)
  - [**Tugas 7**](#tugas-7)
  - [**Elemen Dasar Flutter**](#elemen-dasar-flutter)
  

---
## **Tugas 7**
## **Elemen Dasar Flutter**
**Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?**
- Stateless widget adalah widget yang tidak memiliki suatu state internal yang berarti bahwa widget ini tidak dapat berubah selama aplikasi berjalan walaupun terjadi interaksi yang dibuat pengguna atau data yang berubah.
- Stateful widget adalah widget yang memiliki state internal yang berarti bahwa widget ini dapat berubah selama aplikasi berjalan ketika terjadi perubahan data atau interaksi yang dibuat pengguna.
- Stateless juga dapat didefinisikan sebagai immutable, jadi tidak dapat diubah setelah dibuat. Stateful juga dapat didefinisikan sebagai mutable, jadi dapat diubah setelah dibuat.
- Stateless widge juga dapat digunakan kembali karena tidak perlu mengelola state. Stateful widget membutuhkan pengelolaan state yang kompleks.
  
**Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.**

1. **MaterialApp**: Widget ini adalah root dari aplikasi Flutter. Ia menyediakan beberapa fungsi penting seperti navigasi, theming, dan title.

2. **Scaffold**: Ini menyediakan struktur tampilan dasar untuk aplikasi Material Design, termasuk AppBar, body, dan floating action buttons.

3. **AppBar**: Ini adalah bar di bagian atas layar yang biasanya menampilkan judul dan actions.

4. **Text**: Widget untuk menampilkan teks pada aplikasi.

5. **SingleChildScrollView**: Memberikan kemampuan scroll pada widget yang ada di dalamnya, yang berguna jika konten melebihi layar.

6. **Padding**: Memberikan padding pada widget lain, yaitu memberikan ruang kosong di sekitarnya.

7. **Column**: Menyusun daftar anak-anaknya secara vertikal.

8. **GridView.count**: Menampilkan widget dalam layout grid dengan jumlah kolom tetap yang telah ditentukan.

9. **Material**: Membungkus InkWell untuk memberikan efek visual pada tap.

10. **InkWell**: Mendeteksi berbagai jenis gesture seperti tap dan double tap. Dalam konteks ini, digunakan untuk memberikan interaksi saat InventoryCard ditekan.

11. **Container**: Widget yang digunakan untuk mengelompokkan serangkaian widget lainnya, sering digunakan untuk styling dan positioning.

12. **Icon**: Menampilkan sebuah ikon dari set ikon material.

13. **SnackBar**: Memberikan feedback sementara kepada pengguna, muncul dari bagian bawah layar.

14. **Center**: Memusatkan anak-anaknya secara horizontal dan vertikal.

15. **ThemeData**: Digunakan untuk menentukan data tema untuk MaterialApp, memungkinkan penggunaan tema secara keseluruhan pada aplikasi.

**Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)**

Membuat sebuah program Flutter baru dengan tema inventory seperti tugas-tugas sebelumnya.
- Membuat projek Flutter baru yang sama dengan tugas PBP sebelumnya yaitu Inventory Pesawat.

Membuat tiga tombol sederhana dengan ikon dan teks untuk:
 - Melihat daftar item (Lihat Item)
    - Menambahkan class InventoryCard yang mengextend StatelessWidget. Class Ini membuat suatu Card yang mengembalikan Material yang berisi Inkwell yang berisi Container. Di dalam Container terdapat Center untuk menengahkan icon dan teks. Dan mempunyai Column untuk dibagi menjadi kolom. Setiap kolom diisi dengan Icon dan Text. 
    - Menambahkan class InventoryItem yang berisi String name, Icon, dan Color. 
    - Di main page atau MyHomePage menambahkan list InventoryItem yang berisi nama dan icon dari item yang akan ditampilkan.
    - Untuk card **Daftar Item** menambahkan class InventoryItem yang diisi dengan namanya **Lihat Item**, iconnya berupa `Icons.checklist`, dan warnanya berupa `Colors.blue`.
    - Untuk Setiap Card dibagi menjadi GridView dan sesuai dengan jumlahnya. Lalu Mengambil Class sebagai child dari GridViewnya.
  - Menambah item (Tambah Item)
    - Untuk card **Tambah Item** menambahkan class InventoryItem yang diisi dengan namanya **Tambah Item**, iconnya berupa `Icons.checklist`, dan warnanya berupa `Colors.red`.
  - Logout (Logout)
    - Untuk card **Logout** menambahkan class InventoryItem yang diisi dengan namanya **Logout**, iconnya berupa `Icons.logout`, dan warnanya berupa `Colors.green`.

 Memunculkan Snackbar dengan tulisan:

 - "Kamu telah menekan tombol Lihat Item" ketika tombol Lihat Item ditekan.
   - Membuat suatu hal setelah tombol ditekan melalui InkWell. Lalu ketika InkWell Ditekan akan mengambil parameter dari context setelah itu di show dan isi contentnya adalah `Kamu telah menekan tombol ${item.name}`
   - Untuk Lihat item ketika ditekan akan menampilkan snackbar dengan tulisan `Kamu telah menekan tombol Lihat Item` melalui ketika melakukan passing parameter berupa item dan item itu diambil oleh Inkwell sebagai message dari SnackBar, Setelah itu di pass lagi ke {item.name} yang mengambil item name dari InventoryItem.

 - "Kamu telah menekan tombol Tambah Item" ketika tombol Tambah Item ditekan.
   - Untuk Lihat item ketika ditekan akan menampilkan snackbar dengan tulisan `Kamu telah menekan tombol Tambah Item` melalui ketika melakukan passing parameter berupa item dan item itu diambil oleh Inkwell sebagai message dari SnackBar, Setelah itu di pass lagi ke {item.name} yang mengambil item name dari InventoryItem. Item yang diambil namenya berisi **Tambah Item**
 - "Kamu telah menekan tombol Logout" ketika tombol Logout ditekan.
   - Untuk Lihat item ketika ditekan akan menampilkan snackbar dengan tulisan `Kamu telah menekan tombol Logout` melalui ketika melakukan passing parameter berupa item dan item itu diambil oleh Inkwell sebagai message dari SnackBar, Setelah itu di pass lagi ke {item.name} yang mengambil item name dari InventoryItem. Item yang diambil namenya berisi **Logout**
 - Melakukan add-commit-push ke GitHub.
   - Melakukan `git add . ` lalu `git commit -m "Tugas 7 pengerjaan 2" ` dan `git push origin main` untuk mengupload ke github.
 - Kamu akan mendapatkan nilai bonus pada penilaian tugas ini apabila kamu mengimplementasikan warna-warna yang berbeda untuk setiap tombol (Lihat Item, Tambah Item, dan Logout).
   - Menambahkan Color di class Inventory Item `final Color color` lalu setiap dan memintacolor pada constructor dan ketika membuat list InventoryItem di main page menambahkan warna yang berbeda-beda untuk setiap itemnya.
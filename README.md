# **Pemrograman Berbasis Platform**

**Nama** : Thirza Ahmad Tsaqif

**NPM** : 2206082556

**Kelas** : PBP E


## **Daftar Isi**:

- [**Pemrograman Berbasis Platform**](#pemrograman-berbasis-platform)
  - [**Daftar Isi**:](#daftar-isi)
  - [**Tugas 7**](#tugas-7)
    - [**Elemen Dasar Flutter**](#elemen-dasar-flutter)
  - [**Tugas 8**](#tugas-8)
    - [Flutter Navigation, Layouts, Forms, and Input Elements](#flutter-navigation-layouts-forms-and-input-elements)
  - [**Tugas 9**](#tugas-9)
    - [**Integrasi Layanan Web Django dengan Aplikasi Flutter**](#integrasi-layanan-web-django-dengan-aplikasi-flutter)

---
## **Tugas 7**
### **Elemen Dasar Flutter**
**Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?**
- Stateless widget adalah widget yang tidak memiliki suatu state internal yang berarti bahwa widget ini tidak dapat berubah selama aplikasi berjalan walaupun terjadi interaksi yang dibuat pengguna atau data yang berubah.
- Stateful widget adalah widget yang memiliki state internal yang berarti bahwa widget ini dapat berubah selama aplikasi berjalan ketika terjadi perubahan data atau interaksi yang dibuat pengguna.
- Stateless juga dapat didefinisikan sebagai immutable, jadi tidak dapat diubah setelah dibuat. Stateful juga dapat didefinisikan sebagai mutable, jadi dapat diubah setelah dibuat.
- Stateless widge juga dapat digunakan kembali karena tidak perlu mengelola state. Stateful widget membutuhkan pengelolaan state yang kompleks.
  
**Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.**

1. **MaterialApp**: Widget ini adalah root dari aplikasi Flutter. Ia menyediakan beberapa fungsi penting seperti navigasi, theming, dan title.

2. **Scaffold**: Ini menyediakan struktur tampilan dasar untuk aplikasi Material Design, termasuk AppBar, body, dan floating action buttons.

3. **AppBar**: Ini adalah bar bagian atas layar yang biasanya menampilkan judul dan actions.

4. **Text**: Widget untuk menampilkan teks seperti tag `<p>` namun dapat diubah/distyling dapat menjadi `<h1>` lagi menjad pada aplikasi.

5. **SingleChildScrollView**: Memberikan kemampuan scroll pada widget yang ada di dalamnya, yang berguna jika konten melebihi layar.

6. **Padding**: Memberikan padding pada widget lain, yaitu memberikan ruang kosong di sekitarnya.

7. **Column**: Menyusun daftar anak-anaknya secara vertikal atau dimasukkan ke suatu kolom dari tabel.

8. **GridView.count**: Menampilkan widget dalam layout grid dengan jumlah kolom tetap yang telah ditentukan.

9. **Material**: Membungkus InkWell untuk memberikan efek visual pada tap.

10. **InkWell**: Mendeteksi berbagai jenis gesture seperti tap dan double tap. Dalam konteks ini, digunakan untuk memberikan interaksi saat InventoryCard ditekan.

11. **Container**: Widget yang digunakan untuk mengelompokkan serangkaian widget lainnya, sering digunakan untuk styling dan positioning.

12. **Icon**: Menampilkan sebuah ikon dari set ikon material. 

13. **SnackBar**: Memberikan feedback sementara kepada pengguna, muncul dari bagian bawah layar.

14. **Center**: Menjadikan childnya berada di tengah secara horizontal dan vertikal.

15. **ThemeData**: Digunakan untuk menentukan data tema untuk MaterialApp, memungkinkan penggunaan tema secara keseluruhan pada aplikasi.
16. **MyHomePage**: WIdget yang didefinisikan sebagai widget buatan melalui class MyHomePage. Class ini berisi widget widget yang didefinisikan di file.

**Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)**

Membuat sebuah program Flutter baru dengan tema inventory seperti tugas-tugas sebelumnya.
- Membuat projek Flutter baru yang sama dengan tugas PBP sebelumnya yaitu Inventory Pesawat dengan Android Studio yaitu New FLutter Project abis itu pilih versi FLutter setelah itu namakan project bernama **inventory_pesawat** lalu create.

Membuat tiga tombol sederhana dengan ikon dan teks untuk:
 - Melihat daftar item (Lihat Item)
    - Menambahkan class InventoryCard yang mengextend StatelessWidget. Class Ini membuat suatu Card yang mengembalikan Material yang berisi Inkwell yang berisi Container. Di dalam Container terdapat Center untuk menengahkan icon dan teks. Dan mempunyai Column untuk dibagi menjadi kolom. Setiap kolom diisi dengan Icon dan Text. 
    ```
    class InventoryCard extends StatelessWidget {
      final InventoryItem item;

      const InventoryCard(this.item, {super.key}); // Constructor

      @override
      Widget build(BuildContext context) {
        return Material(
          color: item.color,
          child: InkWell(
            // Area responsive terhadap sentuhan
            onTap: () {
              // Memunculkan SnackBar ketika diklik
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(
                    content: Text("Kamu telah menekan tombol ${item.name}!")));
            },
            child: Container(
              // Container untuk menyimpan Icon dan Text
              padding: const EdgeInsets.all(8),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      item.icon,
                      color: Colors.white,
                      size: 30.0,
                    ),
                    const Padding(padding: EdgeInsets.all(3)),
                    Text(
                      item.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    }

    ```
    - Menambahkan class InventoryItem yang berisi String name, Icon, dan Color. 
    ```
    class InventoryItem {
      final String name;
      final IconData icon;
      final Color color;

      InventoryItem(this.name, this.icon, this.color);
    }
    ```
    - Di main page atau MyHomePage menambahkan list InventoryItem yang berisi nama dan icon dari item yang akan ditampilkan.
    ```
    final List<InventoryItem> items = [];
    ```
    - Untuk card **Daftar Item** menambahkan class InventoryItem yang diisi dengan namanya **Lihat Item**, iconnya berupa `Icons.checklist`, dan warnanya berupa `Colors.blue`.
    ```
    InventoryItem("Lihat Item", Icons.checklist, Colors.blue),
    ```
    - Untuk Setiap Card dibagi menjadi GridView dan sesuai dengan jumlahnya. Lalu Mengambil Class sebagai child dari GridViewnya.
    ```
    GridView.count(
      // Container pada card kita.
      primary: true,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 3,
      shrinkWrap: true,
      children: items.map((InventoryItem item) {
        // Iterasi untuk setiap item
        return InventoryCard(item);
      }).toList(),
    ),
    ```
  - Menambah item (Tambah Item)
    - Untuk card **Tambah Item** menambahkan class InventoryItem yang diisi dengan namanya **Tambah Item**, iconnya berupa `Icons.checklist`, dan warnanya berupa `Colors.red`.
    ```
    InventoryItem("Tambah Item", Icons.shopping_cart, Colors.red),
    ```
  - Logout (Logout)
    - Untuk card **Logout** menambahkan class InventoryItem yang diisi dengan namanya **Logout**, iconnya berupa `Icons.logout`, dan warnanya berupa `Colors.green`.
    ```
    InventoryItem("Logout", Icons.logout, Colors.green),
    ```

 Memunculkan Snackbar dengan tulisan:

 - "Kamu telah menekan tombol Lihat Item" ketika tombol Lihat Item ditekan.
   - Membuat suatu hal setelah tombol ditekan melalui InkWell. Lalu ketika InkWell Ditekan akan mengambil parameter dari context setelah itu di show dan isi contentnya adalah `Kamu telah menekan tombol ${item.name}`. Setelah itu di pass lagi ke {item.name} yang mengambil item name dari InventoryItem.

   - Untuk Lihat item ketika ditekan akan menampilkan snackbar dengan tulisan `Kamu telah menekan tombol Lihat Item` melalui ketika melakukan passing parameter berupa item dan item itu diambil oleh Inkwell sebagai message dari SnackBar, Setelah itu di pass lagi ke {item.name} yang mengambil item name dari InventoryItem.

 - "Kamu telah menekan tombol Tambah Item" ketika tombol Tambah Item ditekan.
   - Untuk Lihat item ketika ditekan akan menampilkan snackbar dengan tulisan `Kamu telah menekan tombol Tambah Item` melalui ketika melakukan passing parameter berupa item dan item itu diambil oleh Inkwell sebagai message dari SnackBar, Setelah itu di pass lagi ke {item.name} yang mengambil item name dari InventoryItem. Item yang diambil namenya berisi **Tambah Item**
 - "Kamu telah menekan tombol Logout" ketika tombol Logout ditekan.
   - Untuk Lihat item ketika ditekan akan menampilkan snackbar dengan tulisan `Kamu telah menekan tombol Logout` melalui ketika melakukan passing parameter berupa item dan item itu diambil oleh Inkwell sebagai message dari SnackBar, Setelah itu di pass lagi ke {item.name} yang mengambil item name dari InventoryItem. Item yang diambil namenya berisi **Logout**
 - Melakukan add-commit-push ke GitHub.
   - Melakukan `git add . ` lalu `git commit -m "Tugas 7 pengerjaan 2" ` dan `git push origin main` untuk mengupload ke github.
 - Kamu akan mendapatkan nilai bonus pada penilaian tugas ini apabila kamu mengimplementasikan warna-warna yang berbeda untuk setiap tombol (Lihat Item, Tambah Item, dan Logout).
   - Menambahkan Color di class Inventory Item `final Color color` lalu setiap dan memintacolor pada constructor dan ketika membuat list InventoryItem di main page menambahkan warna yang berbeda-beda untuk setiap itemnya.

---
## **Tugas 8**
### Flutter Navigation, Layouts, Forms, and Input Elements

**Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!**
- `Navigator.push()` adalah menambahkan suatu halaman atau rute ke suatu stack navigator. Jadi ketika menambahkan `push()` maka akan menambahkan halaman baru ke dalam stack navigator. Jadi dapat kembali ke halaman sebelumnya dengan tombol back.
- `Navigator.push()` dapat digunakan untuk misalnya halaman halaman daftar item lalu kita dapat menambahkan halaman detail item dengan `Navigator.push()` dan dapat kembali ke halaman daftar item dengan tombol back.
- `Navigator.pushReplacement()` Mengganti halaman dengan halaman baru. Jadi Halaman tidak ditumpuk dengan stack melainkan menjadi halaman yang baru. Jadi tidak dapat kembali ke halaman sebelumnya dengan tombol back.
- `Navigator.pushReplacement()` dapat digunakan untuk halaman login dan registrasi yang langsung masuk ke halaman utama. Ketika di Halaman utama hampir tidak mungkin untuk kembali ke halaman login dengan tombol back.

**Bagaimana penerapan clean architecture pada aplikasi Flutter?**
- Membagi aplikasi flutter menjadi Presentation Layer, Data Layer, dan Domain Layer.
- Pada Presentation Layer terdapat UI dan Business Logic. Membuat folder screens untuk yang beirsi file yang mendefinisikan halaman dan layar dari aplikasi. Lalu juga menggunakan folder widgets yang berisi widget widget yang digunakan di aplikasi. Lalu juga menggunakan folder bloc yang berisi file file yang berisi business logic dari aplikasi. Menggunakan Flutter widget tree untuk mendefinisikan komponen UI.
- Pada Domain Layer terdapat folder domain yang bersi file file yang mendefinisikan model atau class spesifik. Lalu juga mendefinisikan entity yang berisi class class objek dari aplikasi. Menggunakan use cases untuk mendefinisikan fungsi fungsi yang dapat digunakan di aplikasi.
- Pada Data layer terdapat folder data untuk yang berisi class yang mendefinisikan data yang digunakan aplikasi. Mendefinisikan folder repositories untuk interface repository. Mengimplementasi asal data yang berinteraksi dengan layanan external atau database.
  
**Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!**
  1. Align dapat digunakan untuk mengatur posisi dari widget yang ada di dalamnya. Seperti menengahkan widget atau mengatur posisi widget di dalamnya.
  2. Padding dapat digunakan untuk memberikan ruang kosong disekitar widget kita. Seperti memberikan jarak kosong di sekitar widget.
  3. ListView: Sebuah widget scrollable yang digunakan untuk menampilkan daftar item secara vertikal. Misalnya dibuat daftar item yang dapat di scroll.
  4. Column dapat digunakan untuk menyusun daftar dalam tabel secara vertikal. Misalnya membuat tabel yang berisi daftar item.
  5. GridView dapat digunakan untuk menyusun daftar dalam tabel secara horizontal. Misalnya membuat tabel yang berisi daftar item secara menyamping.
  6. Container dapat digunakan untuk mengelompokkan serangkaian widget lainnya, sering digunakan untuk styling dan positioning. Misalnya membuat kotak yang berisi daftar item.

**Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!**
1. TextFormField: Digunakan untuk membuat form field yang berisi teks. Digunakan untuk membuat form field yang berisi teks.
2. Checkbox: Digunakan untuk membuat form field yang berisi checkbox yang mendefinisikan nilai boolean.

**Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)**

[1] Membuat minimal satu halaman baru pada aplikasi, yaitu halaman formulir tambah item baru dengan ketentuan sebagai berikut.
- Membuat halaman baru di file tambah_item.dart. lalu membuat class TambahItemForm untuk formulir tambah_item.

 [2] Memakai minimal tiga elemen input, yaitu name, amount, description. Tambahkan elemen input sesuai dengan model pada aplikasi tugas Django yang telah kamu buat.
- Membuat variabel name, amount, description, engine, winglet, image yang sesuai dengan project tugas Django. Lalu membuat TextFormField untuk variabel name, description, amount, engine, dan image. Lalu CheckBox untuk winglet.
 [3] Memiliki sebuah tombol Save.
- Membuat tombol save yang ketika ditekan akan menampilkan pop up yang berisi data yang diisi di form.

 [4] Setiap elemen input di formulir juga harus divalidasi dengan ketentuan sebagai berikut:

 - [5] Setiap elemen input tidak boleh kosong.
  - Membuat validator untuk setiap TextFormField yang memeriksa apakah TextFormField tersebut kosong atau tidak.
  ```
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Tidak boleh kosong!';
    }
    return null;
  },
  ```
 - [6] Setiap elemen input harus berisi data dengan tipe data atribut modelnya.
  - Membuat validator untuk setiap TextFormField yang memeriksa apakah TextFormField tersebut sesuai dengan tipe data yang diminta.
  ```
    if (int.tryParse(value) == null) {
      return "Amount harus berupa angka!";
    }
  ```
 [7] Mengarahkan pengguna ke halaman form tambah item baru ketika menekan tombol Tambah Item pada halaman utama.
  - Membuat tombol Tambah Item yang ada pada Tugas 7. Ada pada class InventoryCard. Lalu menambahkan `Navigator.push()` yang mengarahkan ke halaman tambah item baru.
  ```
  if (item.name == "Tambah Item") {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ItemFormPage()));
          }
  ```

 [8] Memunculkan data sesuai isi dari formulir yang diisi dalam sebuah pop-up setelah menekan tombol Save pada halaman formulir tambah item baru.
- Membuat tombol save yang ketika ditekan akan menampilkan pop up yang berisi data yang diisi di form. Dengan menggunakan `showDialog()` yang berisi `AlertDialog()` yang berisi `Text()` yang berisi data yang diisi di form.
  ```
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Data yang diisi"),
        content: Text(
            "Name: ${nameController.text}\nAmount: ${amountController.text}\nDescription: ${descriptionController.text}\nEngine: ${engineController.text}\nWinglet: ${wingletController.text}\nImage: ${imageController.text}"),
        actions: [
          TextButton(
            child: Text("OK"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
  ```

 [9] Membuat sebuah drawer pada aplikasi dengan ketentuan sebagai berikut:
 - [10] Drawer minimal memiliki dua buah opsi, yaitu Halaman Utama dan Tambah Item.
   - Membuat file left_drawer.dart. 
   - Membuat ListTile yang berisi `Icon()` dan `Text()` yang berisi opsi Halaman Utama dan Tambah Item. Salah satu List dinamakan Tambah Item dan yang kedua adalah Halaman Utama.
 - [11] Ketika memiih opsi Halaman Utama, maka aplikasi akan mengarahkan pengguna ke halaman utama.
   - Menambahkan `Navigator.pushReplacement()` yang mengarahkan ke halaman utama.
   ```
    if (item.name == "Halaman Utama") {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyHomePage(title: "Inventory Pesawat")));
            }
    ```
 - [12] Ketika memiih opsi (Tambah Item), maka aplikasi akan mengarahkan pengguna ke halaman form tambah item baru.
   - Menambahkan `Navigator.pushReplacement()` yang mengarahkan ke halaman tambah item baru.
   ```
    if (item.name == "Tambah Item") {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ItemFormPage()));
            }
    ``` 
[13] Melakukan add-commit-push ke GitHub. 
  - Melakukan `git add .` lalu `git commit -m "mengerjakan tugas 8"` dan `git push origin main` untuk mengupload ke github.

[14] Membuat sebuah halaman baru, yaitu halaman daftar item yang sudah dibuat dengan isi halamannya adalah setiap data produk yang sudah pernah dibuat.
  - Membuat file daftar_item.dart lalu menambahkan Class Daftar Item yang berisi ListTile dari item yang sudah dibuat. ListTile mengambil item dari List yang ada pada class Item. Lalu Itemnya diterjemahkan menjadi Item Item yang ada di produk.

[15] Mengarahkan pengguna ke halaman tersebut jika menekan tombol Lihat Produk pada halaman utama atau drawer.
  - Menambahkan `Material.push` di menu.dart pada bagian `if (item.name == "Lihat Item")` yang mengarahkan ke halaman daftar item.
  - 
---
## **Tugas 9**
### **Integrasi Layanan Web Django dengan Aplikasi Flutter**

**Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?**
- Bisa, tetapi tidak disarankan, kita dapat membuat pengambilan data dengan JSON dengan dibuat struktur data map atau dictionary. Pembuatan model sebelum melakukan pengambilan data JSON selalu lebih baik daripada tanpa membuat model hal ini dikarenakan kita dapat melakukan validasi data, dapat auto complete atau melihat kesalahan saat compile time, mudah untuk melakukan debugging, dan aman pada tipe data *type safety*.

**Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.**
- CookieRequest adalah class yang digunakan untuk melakukan request ke server. CookieRequest perlu dibagikan ke semua komponen di aplikasi Flutter karena CookieRequest digunakan untuk melakukan request ke server dan mendapatkan data dari server. Jadi CookieRequest perlu dibagikan ke semua komponen di aplikasi Flutter agar dapat melakukan request ke server dan mendapatkan data dari server.

**Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter.**
- Pertama menambahkan package http di flutter untuk membuat permintaan http. Di enpoint itu ada data JSON. Jadi diminta ke url itu. Setelah diberi JSON flutter mengurai data json tersebut dengan `jsonDecode` dari `dart:convert`.
- Mendefinisikan model yang sesuai dengan daya json. Lalu dijadikan map dengan fromJson. Lalu disesuaikan dengan data JSONnya.
- Setelah itu data dapat ditambilkan dengan `FutureBuilder` yang mengambil data dari model yang telah dibuat. Lalu menampilkan data tersebut misal dengan `ListView`.

**Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.**
- Membuat file dart untuk login. Lalu membuat class yang menangani login di login.dart. Mendefinisiakn textfiled yang mengarah ke textediting controller. Mengecek username dan password yang diisi. Jika benar maka masuk. Di django membuat fungsi login dengan authenticate yang memastikan username dan password benar sehingga dapat masuk ke halaman.

**Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.**
- TextField digunakan untuk membuat form field yang berisi teks.
- TextEditingController digunakan untuk mengontrol TextField.
- ElevatedButton digunakan untuk membuat tombol yang berisi teks.
- SizedBox digunakan untuk membuat kotak yang berisi widget lainnya.
- Text digunakan untuk membuat teks.
- FutureBuilder digunakan untuk membuat widget yang membangun dirinya sendiri berdasarkan nilai dari future.
- ListView digunakan untuk membuat daftar item yang dapat di scroll.
- ListTile digunakan untuk membuat daftar item yang dapat di scroll.
- Icon digunakan untuk membuat icon.

**Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step!**
[1] Memastikan deployment proyek tugas Django kamu telah berjalan dengan baik.
- Melakukan deployment di proyek django dan memastikan deployment berjalan dengan baik. terutama pada endpoint yang mengembalikan JSON.

[2]  Membuat halaman login pada proyek tugas Flutter.
- Membuat halaman login di Login.dart dan membuat class Login pada login dart di situ meminta username dan password lalu mengirimkan ke server django apakah benar atau tidak.

[3]  Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter.
- melakukan await request login di url yang sesuai dengan authentisikasi django dan memasukkan username dan password yang diisi ke request.

[4] Membuat model kustom sesuai dengan proyek aplikasi Django.
- Membuat model kustom di items.dart yang berisi model yang sesuai dengan proyek django. 

[5]  Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah kamu deploy
- Halaman di list_item.dart adalah file untuk menambilkan daftar item yang sudah dibuat di django. Lalu menampilkan daftar item tersebut dengan ListView dan ListTile.

[6] Tampilkan name, amount, dan description dari masing-masing item pada halaman ini.
- Menampilkan name, amount, dan description dari masing-masing item pada halaman ini dengan ListTile yang berisi Text yang berisi name, amount, dan description. name dan amount ini didapat dari JSON yang dikembalikan oleh endpoint.

[7]  Membuat halaman detail untuk setiap item yang terdapat pada halaman daftar Item.
- Membuat halaman detail yaitu pada ItemDetailPage class lalu di class itu mengextend Stateless widget.
- Halaman ini akan meminta detail item dan menampilkan atribut lain dari item yang ditampilkan

[8]  Halaman ini dapat diakses dengan menekan salah satu item pada halaman daftar Item.
- Menambahkan Gesture Detector yang diasosisasikan dengan setiap item sesuai indexnya lalu memastukkan item ke ItemDetailPage untuk ditampilkan.

[9] Tampilkan seluruh atribut pada model item kamu pada halaman ini
- Menampilkan seluruh detail item seperti name, amount, description, engine, winglet, dan image. Dengan ListTile yang berisi Text yang berisi name, amount, description, engine, winglet, dan image. name, amount, dan description ini didapat dari JSON yang dikembalikan oleh endpoint.

[10] Tambahkan tombol untuk kembali ke halaman daftar item.
- Menambahkan leading di AppBar yang berisi icon arrow back yang ketika ditekan akan melakukan `pop(context)` yang akan kembali ke halaman sebelumnya.

[11] 

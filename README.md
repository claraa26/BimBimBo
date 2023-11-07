# Tugas7 - PBP
Nama  : Clara Sista Widhiastuti <br/>
NPM   : 2206825782 <br/>
Kelas : PBP-E <br/>

## Perbedaan stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter
|***Stateless***|***Stateful***|
|--|--|
|Widget statis|Widget dinamis|
|Dibuat dengan konfigurasi yang sudah diinisiasi sejak awal| Dapat memperbarui tampilan maupun mengubah nilai variabel dan lainnya berdasarkan action dari pengguna maupun dari data yang ada di database|
|Tidak dapat diubah, sifatnya mutlak| Dapat berubah-ubah|
|Cocok untuk menampilkan data yang sifatnya statis atau nilainya tidak perlu berubah| Dapat menampilkan data yang bersifat dinamis atau berubah-ubah|

#### Diagram perbedaan
![Diagram Perbedaan](image/flutter_widget.png)

## Widget yang digunakan pada tugas ini dan fungsinya masing-masing.
```MaterialApp``` -> Dipanggil dari wigdet ```MyApp```.  Merupakan root widget dari aplikasi Flutter yang menggunakan Material Design serta menyediakan fitur-fitur penting seperti navigasi dan tema untuk aplikasi.

```Column``` -> tata letak child-widget secara vertikal

```Container``` -> Digunakan untuk mengatur posisi, ukuran, dan dekorasi dari widget yang ada di dalamnya.

```AppBar``` -> Menampilkan konten dan tindakan yang ada pada bagian paling atas layar

```Icon``` -> Ikon Material Design 

```Scaffold``` -> Menerapkan struktur tata letak visual Desain Material dasar.

```Text``` -> Menampilkan teks sesuai format

```SingleChildScrolledView``` -> membuat widget yang dapat di scroll

```Grid View``` -> Digunakan untuk membuat grid layout 

```Padding``` ->  Digunakan untuk memberikan padding pada widget yang berada di dalamnya.

```InkWell``` ->  Digunakan sebagai area responsif terhadap sentuhan pengguna.

```SnackBar``` -> Menampilkan suatu notifikasi ketika tombol ditekan

```ShopCard``` -> Custom widget yang Anda buat untuk menampilkan informasi item

## Implementasi Tugas
#### ***Getting Started with Flutter***

1. Pastikan Flutter sudah ter-instal di perangkat kamu
2. Buat direktori baru yaitu ```BimBimBo_PBP```
3. Generate proyek flutter baru
```
flutter create bimbimbo
cd bimbimbo
```

#### Merapikan Struktur Proyek
1. Pada direktori ```bimbimbo/lib``` buat file baru dengan nama ```menu.dart``` lalu tambahkan kode berikut
```
import 'package:flutter/material.dart';
```

2. Pindahkan kode ```classMyHomePage ... {}...``` pada file ```menu.dart``` dan hapus kode tersebut yang ada di file ```main.dart```

3. Tambahkan kode berikut
```
import 'package:bimbimbo/menu.dart';
```

#### Membuat widget sederhana
1. Menambahkan teks dan card yang diinginkan
```
class KdramaItem {
  final String name;
  final IconData icon;
  final Color color;

  KdramaItem(this.name, this.icon, this.color);
}
```
2. Pada baris setelah kode ```MyHomePage({Key? key}) : super(key: key);``` tambahkan tombol-tombol
```
 final List<KdramaItem> items = [
    KdramaItem("Lihat Item", Icons.checklist, const Color.fromARGB(255, 240, 149, 180)),
    KdramaItem("Tambah Item", Icons.add_shopping_cart, const Color.fromARGB(255, 229, 170, 239)),
    KdramaItem("Logout", Icons.logout, const Color.fromARGB(255, 171, 217, 255)),
];
```
3. Menambahkan kode dibawah ini dalam **Widget** build
```
return Scaffold(
    appBar: AppBar(
        title: const Text(
          'BimBimBo',
        ),
        foregroundColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 138, 233, 219),
    ),
    body: SingleChildScrollView(
        // Widget wrapper yang dapat discroll
        child: Padding(
            padding: const EdgeInsets.all(10.0), // Set padding dari halaman
            child: Column(
                // Widget untuk menampilkan children secara vertikal
                children: <Widget>[
                    const Padding(
                        padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                        // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                        child: Text(
                            'K-Drama Collection', // Text yang menandakan toko
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                            ),    
                        ),
                    ),
                    // Grid layout
                    GridView.count(
                        // Container pada card kita.
                        primary: true,
                        padding: const EdgeInsets.all(20),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 3,
                        shrinkWrap: true,
                        children: items.map((KdramaItem item) {
                            // Iterasi untuk setiap item
                            return KdramaCard(item);
                        }).toList(),
                    ),
                ],
            ),
        ),
      ),
    );
```
4. Mengcustom *widget stateles* baru untuk menampilkan *card*
```
class KdramaCard extends StatelessWidget {
    final KdramaItem item;

    const KdramaCard(this.item, {super.key}); // Constructor

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
#### Menjalankan proyek
Buka terminal atau comand prompt yang mengarah pada direktori proyek kamu disimpan kemudian jalankan kode berikut
```
flutter run -d chrome
```

# Archieve
<details>
<summary>A new Flutter project.</summary>
## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
</details>




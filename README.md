# Tugas8 - PBP
Nama  : Clara Sista Widhiastuti <br/>
NPM   : 2206825782 <br/>
Kelas : PBP-E <br/>

## Perbedaan ```Navigator.push()``` dan ```Navigator.pushReplacement()```
|```Navigator.push()```|```Navigator.pushReplacement()```|
|--|--|
|Menambahkan suatu *route* pada tumpukan navigasi|Menghapus *route* yang lama dengan *route* baru|
|Memungkinkan kembali ke *route* sebelumnya dengan tombol kembali|Tidak dapat kembali ke layar sebelumnya|
contoh ```Navigator.push()```
```
Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => KdramaListPage(),
        ),
    );
```
contoh ```Navigator.pushReplacement()```
```
Navigator.pushReplacement(
    context,
    MaterialPageRoute(
        builder: (context) => MyHomePage(),
        ),
    );
```
## *Layout* widget pada flutter
1. ```Align``` -> mengatur child di dalamnya. Digunakan mengatur tombol save pada form
2. ```Container``` -> Menyimpan ikon dan teks di dalamnya. Memberikan padding dan memiliki latar belakang sesuai warna dari objek KdramaItem.
3. ```Padding``` -> menambahkan padding di sekitar child 
4. ```Column``` -> tata letak child-widget secara vertikal
4. ```GridView``` -> Digunakan untuk membuat grid layout 
6. ```ListView``` -> digunakan untuk membuat daftar item dengan jumlah yang dinamis tanpa memerlukan item yang ada sebelumnya.


## Elemen input pada form
1. Judul Kdrama
    Berisi tentang judul kdrama yang akan diinput pada collection.
2. Jumlah Episode
    Banyaknya episode, karena menurut saya jumlah episode penting dalam suatu Kdrama
3. Sinopsis
    Memberikan gambaran kdrama yang dipilih secara singkat.

## Penerapan *clean architecture* pada aplikasi Flutter
*Clean architecture* bertujuan untuk memisahkan kode menjadi beberapa lapisan yang saling terikat namun tetap independen. Pada aplikasi Flutter, Clean Architecture dapat diterapkan dengan memisahkan kode program antara business logic, presenter/UI, state management, eksternal datasources, dan repository. Hal tersebut juga membuat kode program menjadi lebih testable dan maintainable.


## Input dan form sederhana
#### Menambahkan Form dan Elemen Input
1. Buat berkas baru pada direktori ```lib``` dengan nama ```kdrama_form.dart``` kemudian tambahkan kode berikut,
```
class KdramaFormPage extends StatefulWidget {
    const KdramaFormPage({super.key});

    @override
    State<KdramaFormPage> createState() => _KdramaFormPageState();
}

class _KdramaFormPageState extends State<KdramaFormPage> {

    final _formKey = GlobalKey<FormState>();
    String _judul = "";
    int _episode = 0;
    String _sinopsis = "";
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Center(
                child: Text(
                    'Add Your Favorite Kdrama!!',
                ),
                ),
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
            ),
            
            drawer: const LeftDrawer(),
            body: Form(
                key: _formKey,
                child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                        const Text(
                                            'Judul Kdrama',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                            ),
                                        ),
                                        TextFormField(
                                            decoration: InputDecoration(
                                                hintText: "Masukan judul kdrama",
                                                labelText: "",
                                                border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(5.0),
                                                ),
                                            ),
                                            onChanged: (String? value) {
                                                setState(() {
                                                    _judul = value!;
                                                });
                                            },
                                            validator: (String? value) {
                                                if (value == null || value.isEmpty) {
                                                    return "Nama tidak boleh kosong!";
                                                }
                                                return null;
                                            },
                                        ),
                                    ],
                                ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                        const Text(
                                            'Jumlah Episode',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                            ),
                                        ),
                                        TextFormField(
                                            decoration: InputDecoration(
                                                hintText: "Masukan jumlah episode",
                                                labelText: "",
                                                border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(5.0),
                                                ),
                                            ),
                                            onChanged: (String? value) {
                                                setState(() {
                                                    _episode = int.parse(value!);
                                                });
                                            },
                                            validator: (String? value) {
                                                if (value == null || value.isEmpty) {
                                                    return "Jumlah episode tidak boleh kosong!";
                                                }
                                                if (int.tryParse(value) == null) {
                                                    return "Jumlah episode harus berupa angka!";
                                                }
                                                return null;
                                            },
                                        ),
                                    ],
                                )
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                        const Text(
                                            'Sinopsis',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                            ),
                                        ),
                                        TextFormField(
                                            decoration: InputDecoration(
                                                hintText: "Masukan sinopsis",
                                                labelText: "",
                                                border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(5.0),
                                                ),
                                            ),
                                            maxLines: 5,
                                            onChanged: (String? value) {
                                                setState(() {
                                                    _sinopsis = value!;
                                                });
                                            },
                                            validator: (String? value) {
                                                if (value == null || value.isEmpty) {
                                                    return "Sinopsis tidak boleh kosong!";
                                                }
                                                return null;
                                            },
                                        ),
                                    ],
                                )
                            ),
                        ] 
                    ),
                ),
            ),
        );
    }
}
```
kode tersebut digunakan untuk menambahkan 3 elemen input dan validasi input sesuai ketentuan
2. Untuk menambahkan tombol save, tambahkan kode berikut
```
...
Align(
  alignment: Alignment.bottomCenter,
  child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: ElevatedButton(
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(Colors.indigo),
      ),
      onPressed: () {
        if (_formKey.currentState!.validate()) {}
      },
      child: const Text(
        "Save",
        style: TextStyle(color: Colors.white),
      ),
    ),
  ),
),
```
#### Navigasi pada tombol ```tambah item```
1. Pada berkas file ```kdrama_card.dart``` tambahkan kode berikut agar saat tombol tambah item di tekan akan memunculkan form yang telah dibuat sebelumnnya,
```
onTap: () {
    // Memunculkan SnackBar ketika diklik
    ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(
            content: Text("Kamu telah menekan tombol ${item.name}!")));
    if (item.name == "Tambah Item") {
        Navigator.pushReplacement(
        context,
            MaterialPageRoute(
                builder: (context) => const KdramaFormPage(),
            ),
        );
    }
}
```
#### Memunculkan data form dalam bentuk ```pop-up```
1. tambahkan fungsi ```showDialog()``` pada bagian ```onPressed()``` dan memunculkan widget ```AlertDialog```
```
child: ElevatedButton(
    style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(Colors.indigo),
    ),
    onPressed: () {
        if (_formKey.currentState!.validate()) {
        KdramaItemList newKdrama = KdramaItemList(judul: _judul, episode: _episode, sinopsis: _sinopsis);
        kdramaList.add(newKdrama);
        showDialog(
            context: context,
            builder: (context) {
            return AlertDialog(
                title: const Text('Kdrama berhasil ditambahkan'),
                content: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                    Text('Judul: $_judul'),
                    Text('Episode: $_episode'),
                    Text('Sinopsis: $_sinopsis'),
                    ],
                ),
                ),
                actions: [
                TextButton(
                    child: const Text('OK'),
                    onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                        builder: (context) => MyHomePage(),
                        ),
                    );
                    },
                ),
                ],
            );
            },
        );
        _formKey.currentState!.reset();
        }
    },
    child: const Text(
        "Save",
        style: TextStyle(color: Colors.white),
    ),
    ),
```
#### Menambahkan drawer
1. Buat direktori baru pada direktori ```lib``` dengan nama ```widgets```. Kemudian buat file baru dengan nama ```left_drawrer.dart``` lalu tambahkan kode berikut
```
import 'package:bimbimbo/widgets/kdrama_list_page.dart';
import 'package:flutter/material.dart';
import 'package:bimbimbo/screens/menu.dart';
import 'package:bimbimbo/screens/kdrama_form.dart';


class LeftDrawer extends StatelessWidget {
    const LeftDrawer({super.key});

    @override
    Widget build(BuildContext context) {
        return Drawer(
            child: ListView(
                children: [
                    const DrawerHeader(
                        decoration: BoxDecoration(
                            color: Colors.indigo,
                        ),
                        child: Column(
                            children: [
                                Text(
                                    'Bimbimbo',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                    ),
                                ),
                                Padding(padding: EdgeInsets.all(10)),
                                Text("Catat seluruh kdrama favoritmu di sini!",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal
                                    ),
                                ),
                            ],
                        ),
                    ),
                ],
            ),
        );
    }
}
```
2. Navigasi pada tombol ```tambah item```. Saat di tekan akan membuka form
```
ListTile(
    leading: const Icon(Icons.home_outlined),
    title: const Text('Halaman Utama'),
    onTap: () {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => MyHomePage(),
        ));
    },
),
ListTile(
    leading: const Icon(Icons.add_shopping_cart),
    title: const Text('Tambah Item'),
    onTap: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
            builder: (context) => const KdramaFormPage(),
        ));
    },
),

```
#### Refactoring file
1. Buat file baru pada direktori ```widgets``` dengan nama ```kdrama_card.dart``` 
2. Pindahkan isi ```KdramaItem``` dari berkas ```menu.dart``` ke ```kdrama_card.dart```
3. Buat direktori baru ```sreens``` pada direktori ```lib```
4. Pindahkan berkas ```menu.dart``` dan ```kdrama_form.dart``` ke direktori ```screens```

#### Menampilkan daftar item yang telah dibuat dari form 
1. Buat berkas baru dalam direktori ```widgets``` dengan nama ```kdrama_list_page``` lalu tambahkan kode berikut
```
class KdramaListPage extends StatelessWidget {
    final List<KdramaItemList> kdramaList;

    KdramaListPage({required this.kdramaList});

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text(
                    'List of Kdrama Items',
                    textAlign: TextAlign.center,
                ),
                centerTitle: true,
            ),
            body: ListView.builder(
                itemCount: kdramaList.length,
                itemBuilder: (context, index) {
                    return Card(
                        elevation: 4.0,
                        margin: EdgeInsets.all(8.0),
                        child: ListTile(
                            title: Text('Judul Kdrama: ' + kdramaList[index].judul),
                            subtitle: Text('Episode: ${kdramaList[index].episode}\n Sinopsis: ${kdramaList[index].sinopsis}'),
                            
                            tileColor: Color.fromARGB(255, 235, 194, 148),
                        ),
                    );
                },
            ),
            floatingActionButton: ElevatedButton(
                onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                        builder: (context) => MyHomePage(),
                        ),
                    );
                },
                child: Text('Back'),
            ),
        );
    }
}
```
#### Menambahkan opsi tambah item pada drawer
1. Pada berkas ```left_drawer.dart``` tambahkan kode berikut
```
...
ListTile(
    leading: const Icon(Icons.checklist),
    title: const Text('Lihat Item'),
    onTap: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
            builder: (context) => KdramaListPage(kdramaList: kdramaList),
        ));
    },
),
```
#### Navigasi pada tombol ```lihat item```
1. Pada berkas file ```kdrama_card.dart``` tambahkan kode berikut agar saat tombol tambah item di tekan akan memunculkan form yang telah dibuat sebelumnnya,
```
onTap: () {
    // Memunculkan SnackBar ketika diklik
    ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(
            content: Text("Kamu telah menekan tombol ${item.name}!")));
    if (item.name == "Tambah Item") {
        Navigator.pushReplacement(
        context,
            MaterialPageRoute(
                builder: (context) => const KdramaFormPage(),
            ),
        );
    }
    else if (item.name == "Lihat Item"){
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => KdramaListPage(kdramaList: kdramaList),
            ),
        );
    }
}
```







# Archieve
<details>
<summary>Tugas 7</summary>
## Perbedaan stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter
|***Stateless***|***Stateful***|
|--|--|
|Widget statis|Widget dinamis|
|Dibuat dengan konfigurasi yang sudah diinisiasi sejak awal| Dapat memperbarui tampilan maupun mengubah nilai variabel dan lainnya berdasarkan action dari pengguna maupun dari data yang ada di database|
|Tidak dapat diubah, sifatnya mutlak| Dapat berubah-ubah|
|Cocok untuk menampilkan data yang sifatnya statis atau nilainya tidak perlu berubah| Dapat menampilkan data yang bersifat dinamis atau berubah-ubah|

#### Diagram perbedaan
<img src="https://cdn.discordapp.com/attachments/1030834426126544907/1171528585559953489/flutter_widget.png?ex=655d0204&is=654a8d04&hm=3196c44083335687492434dbde8260e79b3941825bca167af0c772c7e5e10f54&">

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
</details>
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




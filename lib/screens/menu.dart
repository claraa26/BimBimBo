import 'package:flutter/material.dart';
import 'package:bimbimbo/widgets/left_drawer.dart';
import 'package:bimbimbo/widgets/kdrama_card.dart';


class MyHomePage extends StatelessWidget {
    MyHomePage({Key? key}) : super(key: key);
    final List<KdramaItem> items = [
    KdramaItem("Lihat Item", Icons.checklist, const Color.fromARGB(255, 240, 149, 180)),
    KdramaItem("Tambah Item", Icons.add_shopping_cart, const Color.fromARGB(255, 229, 170, 239)),
    KdramaItem("Logout", Icons.logout, const Color.fromARGB(255, 171, 217, 255)),
];

    @override
    Widget build(BuildContext context) {
        return Scaffold(
        appBar: AppBar(
        title: const Text(
          'BimBimBo',
        ),
        foregroundColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 138, 233, 219),
      ),
      drawer: const LeftDrawer(),
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
    }
}
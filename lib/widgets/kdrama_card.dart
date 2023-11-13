import 'package:bimbimbo/screens/kdrama_form.dart';
import 'package:bimbimbo/widgets/kdrama_list_page.dart';
import 'package:flutter/material.dart';

class KdramaItem {
  final String name;
  final IconData icon;
  final Color color;

  KdramaItem(this.name, this.icon, this.color);
}

class KdramaItemList {
  final String judul;
  final int episode;
  final String sinopsis;

  KdramaItemList({
    required this.judul,
    required this.episode,
    required this.sinopsis,
  });
}
List<KdramaItemList> kdramaList = [];

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
          if (item.name == "Tambah Item") {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const KdramaFormPage(),
              ),
            );
          }else if (item.name == "Lihat Item"){
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => KdramaListPage(kdramaList: kdramaList),
              ),
            );
          }
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

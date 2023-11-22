import 'package:bimbimbo/screens/kdrama_form.dart';
import 'package:bimbimbo/screens/login.dart';
import 'package:bimbimbo/widgets/kdrama_list_page.dart';
import 'package:flutter/material.dart';
import 'package:bimbimbo/screens/list_kdrama.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

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
    final request = context.watch<CookieRequest>();
    return Material(
      color: item.color,
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () async {
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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const KdramaPage(),
              ),
            );
          }
          else if (item.name == "Logout") {
            final response = await request.logout(
                // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                "http://localhost:8000/auth/logout/");
            String message = response["message"];
            if (response['status']) {
              String uname = response["username"];
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("$message Sampai jumpa, $uname."),
              ));
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("$message"),
              ));
            }
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

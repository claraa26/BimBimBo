import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:bimbimbo/models/product.dart';
import 'package:bimbimbo/widgets/left_drawer.dart';
import 'package:bimbimbo/screens/detail_kdrama.dart';

class KdramaPage extends StatefulWidget {
    const KdramaPage({Key? key}) : super(key: key);

    @override
    _KdramaPageState createState() => _KdramaPageState();
}

class _KdramaPageState extends State<KdramaPage> {
Future<List<Kdrama>> fetchKdrama() async {
    // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
    var url = Uri.parse(
        'http://localhost:8000/json/');
    var response = await http.get(
        url,
        headers: {"Content-Type": "application/json"},
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object Kdrama
    List<Kdrama> list_Kdrama = [];
    for (var d in data) {
        if (d != null) {
            list_Kdrama.add(Kdrama.fromJson(d));
        }
    }
    return list_Kdrama;
}

@override
Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('List of Kdrama Items'),
        ),
        drawer: const LeftDrawer(),
        body: FutureBuilder(
            future: fetchKdrama(),
            builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
                } else {
                    if (!snapshot.hasData) {
                    return const Column(
                        children: [
                        Text(
                            "Tidak ada data produk.",
                            style:
                                TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                        ),
                        SizedBox(height: 8),
                        ],
                    );
                } else {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index) => InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => KdramaDetailPage(kdrama: snapshot.data![index]),
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                "${snapshot.data![index].fields.name}",
                                style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                ),
                                ),
                                const SizedBox(height: 10),
                                Text("${snapshot.data![index].fields.amount}"),
                                const SizedBox(height: 10),
                                Text(
                                    "${snapshot.data![index].fields.description}")
                              ],
                            ),
                          )
                                
                                
                        )
                      );
                    }
                }
            }
          )
        );
    }
}
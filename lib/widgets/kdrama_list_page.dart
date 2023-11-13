import 'package:flutter/material.dart';
import 'package:bimbimbo/widgets/kdrama_card.dart';
import 'package:bimbimbo/screens/menu.dart';
import 'package:bimbimbo/widgets/left_drawer.dart';

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
        backgroundColor: Color.fromARGB(255, 138, 233, 219),
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      backgroundColor: Color.fromARGB(255, 244, 197, 212),
      body: ListView.builder(
        itemCount: kdramaList.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4.0,
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              title: Text('Judul Kdrama: ' + kdramaList[index].judul),
              subtitle: Text('Episode: ${kdramaList[index].episode}\nSinopsis: ${kdramaList[index].sinopsis}'),
              
              tileColor: Color.fromARGB(255, 240, 149, 180),
            ),
          );
        },
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          // Navigator.pop(context);
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

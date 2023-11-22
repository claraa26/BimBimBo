import 'package:flutter/material.dart';
import 'package:bimbimbo/models/product.dart';

class KdramaDetailPage extends StatelessWidget {
  final Kdrama kdrama;

  const KdramaDetailPage({Key? key, required this.kdrama}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kdrama.fields.name),
        backgroundColor: Color.fromARGB(255, 166, 145, 239),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Judul: ${kdrama.fields.name}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Amount: ${kdrama.fields.amount}'),
            SizedBox(height: 10),
            Text('sinopsis: ${kdrama.fields.description}'),
          ],
        ),
      ),
    );
  }
}
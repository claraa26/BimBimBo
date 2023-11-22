import 'dart:convert';

import 'package:bimbimbo/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:bimbimbo/widgets/left_drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';


class KdramaFormPage extends StatefulWidget {
    const KdramaFormPage({super.key});

    @override
    State<KdramaFormPage> createState() => _KdramaFormPageState();
}

class _KdramaFormPageState extends State<KdramaFormPage> {

  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _amount = 0;
  String _description = "";
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Add Your Favorite Kdrama!!',
          ),
        ),
        backgroundColor: Color.fromARGB(255, 138, 233, 219),
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Container(
        color: Color.fromARGB(255, 231, 195, 238),
      child: Form(
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
                        color: Color.fromARGB(255, 29, 24, 63),
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Masukan judul kdrama",
                        labelText: "",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        fillColor: Color.fromARGB(255, 229, 170, 239),
                        filled: true,
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          _name = value!;
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Judul tidak boleh kosong!";
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
                      'Amount',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color.fromARGB(255, 29, 24, 63),
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "amount",
                        labelText: "",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        fillColor: Color.fromARGB(255, 229, 170, 239),
                        filled: true,
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          _amount = int.parse(value!);
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Amount tidak boleh kosong!";
                        }
                        if (int.tryParse(value) == null) {
                          return "Amount harus berupa angka!";
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
                        color: Color.fromARGB(255, 29, 24, 63),
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Masukan sinopsis",
                        labelText: "",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        fillColor: Color.fromARGB(255, 229, 170, 239),
                        filled: true,
                      ),
                      maxLines: 5,
                      onChanged: (String? value) {
                        setState(() {
                          _description = value!;
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
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.indigo),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                          // Kirim ke Django dan tunggu respons
                          // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                          final response = await request.postJson(
                          "http://localhost:8000/create-flutter/",
                          jsonEncode(<String, String>{
                              'name': _name,
                              'amount': _amount.toString(),
                              'description': _description,
                          }));
                          if (response['status'] == 'success') {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                              content: Text("Produk baru berhasil disimpan!"),
                              ));
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => MyHomePage()),
                              );
                          } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                  content:
                                      Text("Terdapat kesalahan, silakan coba lagi."),
                              ));
                          }
                      }
                  },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ]
          ),
        ),
      ),
      )
    );
  }
}
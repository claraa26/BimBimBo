import 'package:bimbimbo/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:bimbimbo/widgets/left_drawer.dart';
import 'package:bimbimbo/widgets/kdrama_card.dart';


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
                        color: Color.fromARGB(255, 29, 24, 63),
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Masukan jumlah episode",
                        labelText: "",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        fillColor: Color.fromARGB(255, 229, 170, 239),
                        filled: true,
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
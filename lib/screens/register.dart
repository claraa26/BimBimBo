// import paket flutter
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

// buat widget stateful untuk form registrasi
class RegisterForm extends StatefulWidget {
  // buat konstruktor untuk widget RegisterForm
  const RegisterForm({Key? key}) : super(key: key);
  static const ROUTE_NAME = '/register';
  // buat state untuk widget RegisterForm
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

// buat kelas untuk state dari widget RegisterForm
class _RegisterFormState extends State<RegisterForm> {
  // buat variabel untuk menyimpan email, password, dan persetujuan
  String username = '';
  String password = '';
  String confirmPass = '';
  // bool agree = false;

  // buat variabel untuk menyimpan global key dari form
  final _formKey = GlobalKey<FormState>();

  // buat fungsi untuk memvalidasi email
  String? validateEmail(String value) {
    // cek apakah email tidak kosong
    if (value.isEmpty) {
      // jika kosong, kembalikan pesan 'Email cannot be empty'
      return 'Email cannot be empty';
    }
    // cek apakah email memiliki format yang benar
    if (!value.contains('@')) {
      // jika tidak, kembalikan pesan 'Email is not valid'
      return 'Email is not valid';
    }
    // jika tidak ada masalah, kembalikan null
    return null;
  }

  // buat fungsi untuk memvalidasi password
  String? validatePassword(String value) {
    // cek apakah password tidak kosong
    if (value.isEmpty) {
      // jika kosong, kembalikan pesan 'Password cannot be empty'
      return 'Password cannot be empty';
    }
    // cek apakah password memiliki panjang minimal 6 karakter
    if (value.length < 6) {
      // jika tidak, kembalikan pesan 'Password must be at least 6 characters'
      return 'Password must be at least 6 characters';
    }
    // jika tidak ada masalah, kembalikan null
    return null;
  }

  // buat fungsi untuk melakukan aksi ketika tombol daftar ditekan
  void register() {
    // cek apakah form valid
    if (_formKey.currentState!.validate()) {
      // jika valid, tampilkan widget SnackBar dengan pesan 'Register successful'
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Register successful'),
        ),
      );
      // lakukan aksi lain, seperti mengirimkan data ke server, atau berpindah ke halaman lain
    }
  }

  // buat fungsi untuk membangun widget
  @override
  Widget build(BuildContext context) {
     final request = context.watch<CookieRequest>();
    // kembalikan widget Form untuk menampilkan form registrasi
    return Form(
      // tentukan key untuk form
      key: _formKey,
      // tambahkan widget Column untuk menampilkan widget-widget dalam form
      child: Column(
        // atur alignment menjadi center
        mainAxisAlignment: MainAxisAlignment.center,
        // atur cross alignment menjadi start
        crossAxisAlignment: CrossAxisAlignment.start,
        // tambahkan widget-widget untuk form registrasi
        children: [
          // tambahkan widget TextFormField untuk input email
          TextFormField(
            // atur decoration menjadi email
            decoration: InputDecoration(labelText: 'Email'),
            // atur keyboard type menjadi email
            keyboardType: TextInputType.emailAddress,
            // atur validator untuk memvalidasi email
            validator: validateEmail,
            // atur on saved untuk menyimpan email
            onSaved: (value) {
              setState(() {
                email = value!;
              });
            },
          ),
          // tambahkan widget TextFormField untuk input password
          TextFormField(
            // atur decoration menjadi password
            decoration: InputDecoration(labelText: 'Password'),
            // atur obscure text menjadi true untuk menyembunyikan password
            obscureText: true,
            // atur validator untuk memvalidasi password
            validator: validatePassword,
            // atur on saved untuk menyimpan password
            onSaved: (value) {
              setState(() {
                password = value!;
              });
            },
          ),
          // tambahkan widget CheckboxListTile untuk input persetujuan
         
          // tambahkan widget ElevatedButton untuk tombol daftar
          ElevatedButton(
            // atur child menjadi widget Text dengan teks 'Register'
            child: Text('Register'),
            // atur on pressed untuk melakukan aksi registrasi
            onPressed: register,
          ),
        ],
      ),
    );
  }
}

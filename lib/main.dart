import 'package:flutter/material.dart';
import 'login.dart';
// import 'tampilan_produk.dart'; // Import file login_form.dart

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) :super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Login(),
    );   
  }
}


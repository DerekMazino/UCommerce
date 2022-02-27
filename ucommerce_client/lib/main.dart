
import 'package:flutter/material.dart';
import 'package:ucommerce_client/screens/home_screen.dart';
import 'package:ucommerce_client/screens/explorar.dart';
import 'package:ucommerce_client/screens/objeto.dart';
import 'package:ucommerce_client/screens/carro.dart';
import 'package:ucommerce_client/screens/perfil.dart';
import 'package:ucommerce_client/screens/admin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner:  false,
      home: Admin()

    );
  }
}
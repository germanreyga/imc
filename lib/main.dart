import 'package:flutter/material.dart';
import 'PantallaIMC.dart' as Home;

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IMC Calculadora',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: Home.PantallaIMCStateful(),
      debugShowCheckedModeBanner: false,
    );
  }
}
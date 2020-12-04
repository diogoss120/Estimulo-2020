import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'login.dart';

void main() {
  runApp(
    TelaInicial(),
  );
}

class TelaInicial extends StatefulWidget {
  @override
  TelaInicialState createState() => TelaInicialState();
}

class TelaInicialState extends State<TelaInicial> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(
        seconds: 6,
        backgroundColor: Colors.indigo[900],
        loaderColor: Colors.white70,
        // photoSize: 30,
        useLoader: true,
        loadingText: Text(
          'Carregando',
          style: TextStyle(color: Colors.white),
        ),
        navigateAfterSeconds: Login(),
      ),
    );
  }
}

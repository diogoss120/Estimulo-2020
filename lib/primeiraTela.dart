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
      home: SplashScreen(
        seconds: 6,
        backgroundColor: Colors.indigo[900],
        photoSize: 90,
        image: Image.asset('images/estimulo-bg.png'),
        loaderColor: Colors.white70,
        loadingText: Text('Carregando aplicação'),
        navigateAfterSeconds: Login(),
      ),
    );
  }
}

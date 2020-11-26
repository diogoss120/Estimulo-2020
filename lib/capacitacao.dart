import 'package:flutter/material.dart';
import 'curso.dart';

class Capacitacao extends StatefulWidget {
  @override
  CapacitacaoState createState() => CapacitacaoState();
}

class CapacitacaoState extends State<Capacitacao> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Escolha seu curso!"),
          backgroundColor: Colors.lightBlue[800],
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(5),
          child: Column(
            children: [
              Card(
                margin: EdgeInsets.all(10),
                elevation: 15,
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Curso JavaScript",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      FlatButton(
                        onPressed: () {
                          String canal = "PLx4x_zx8csUj3IbPQ4_X5jis_SkCol3eC";
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Curso("CFB Cursos", canal),
                            ),
                          );
                        },
                        child: Icon(
                          Icons.play_circle_outline,
                          size: 35,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.all(10),
                elevation: 15,
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Curso MySql Server",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      FlatButton(
                        onPressed: () {
                          String canal = "PLiLrXujC4CW1HSOb8i7j8qXIJmSqX44KH";
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  Curso("Infocotidiano", canal),
                            ),
                          );
                        },
                        child: Icon(
                          Icons.play_circle_outline,
                          size: 35,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.all(10),
                elevation: 15,
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Curso TypeScript",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      FlatButton(
                        onPressed: () {
                          String canal = "PLbIBj8vQhvm0Q_TMvL22kkpdUW8sP8Yql";
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  Curso("Otávio Miranda", canal),
                            ),
                          );
                        },
                        child: Icon(
                          Icons.play_circle_outline,
                          size: 35,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

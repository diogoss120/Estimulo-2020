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
      debugShowCheckedModeBanner: false,
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
              GestureDetector(
                onTap: () {
                  String canal = "PLx4x_zx8csUj3IbPQ4_X5jis_SkCol3eC";
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Curso("CFB Cursos", canal),
                    ),
                  );
                },
                child: Card(
                  margin: EdgeInsets.all(10),
                  elevation: 15,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(
                          fit: FlexFit.tight,
                          flex: 1,
                          child: Icon(
                            Icons.play_circle_outline,
                            size: 60,
                          ),
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          flex: 1,
                          child: Text(
                            "JavaScript",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  String canal = "PLiLrXujC4CW1HSOb8i7j8qXIJmSqX44KH";
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Curso("Infocotidiano", canal),
                    ),
                  );
                },
                child: Card(
                  margin: EdgeInsets.all(10),
                  elevation: 15,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                          fit: FlexFit.tight,
                          flex: 1,
                          child: Icon(
                            Icons.play_circle_outline,
                            size: 60,
                          ),
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          flex: 1,
                          child: Text(
                            "MySql Server",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  String canal = "PLbIBj8vQhvm0Q_TMvL22kkpdUW8sP8Yql";
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Curso("Otávio Miranda", canal),
                    ),
                  );
                },
                child: Card(
                  margin: EdgeInsets.all(10),
                  elevation: 15,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(
                          fit: FlexFit.tight,
                          flex: 1,
                          child: Icon(
                            Icons.play_circle_outline,
                            size: 60,
                          ),
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          flex: 1,
                          child: Text(
                            "TypeScript",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  String canal = "PL8vXuI6zmpdgsO3Ec64aGFYrcp2WOPhUu";
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Curso("Kultivi", canal),
                    ),
                  );
                },
                child: Card(
                  margin: EdgeInsets.all(10),
                  elevation: 15,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(
                          fit: FlexFit.tight,
                          flex: 1,
                          child: Icon(
                            Icons.play_circle_outline,
                            size: 60,
                          ),
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          flex: 1,
                          child: Text(
                            "Inglês completo",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
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

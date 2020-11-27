import 'package:estimulo2020/capacitacao.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Trilhas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Trilhas',
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Selecione a trilha de sejada"),
          backgroundColor: Colors.lightBlue[800],
        ),
        body: Paginas(),
      ),
    );
  }
}

class Paginas extends StatefulWidget {
  PaginasState createState() => PaginasState();
}

class PaginasState extends State<Paginas> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 5),
            child: Card(
              elevation: 2,
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                children: [
                  Image.asset(
                    'images/mentor.jpg',
                    fit: BoxFit.fill,
                    width: double.infinity,
                    height: 200,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Mentoria Especifica",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.italic),
                      ),
                      FlatButton(
                        child: const Text('Firebase'),
                        onPressed: () {
                          Firestore.instance
                              .collection("usuarios")
                              .document("pontuacao")
                              .setData({"vitor": "estudante", "idade": "17"});
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5, bottom: 5),
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                children: [
                  Image.asset(
                    'images/capacitacao2.jpg',
                    fit: BoxFit.fill,
                    width: double.infinity,
                    height: 200,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Trilha de capacitação",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.italic),
                      ),
                      FlatButton(
                        child: const Text('COMEÇAR'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Capacitacao(),
                            ),
                          );
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5, bottom: 5),
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                children: [
                  Image.asset(
                    'images/acompanhamento5.png', //dialogo3.jpg',
                    fit: BoxFit.fill,
                    width: double.infinity,
                    height: 200,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Acompanhamento",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.italic),
                      ),
                      FlatButton(
                        child: const Text('COMEÇAR'),
                        onPressed: () {/* ... */},
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

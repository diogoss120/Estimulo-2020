import 'package:estimulo2020/capacitacao.dart';
import 'package:flutter/material.dart';
import 'acompanhamento.dart';
import 'mentoria.dart';

class Trilhas extends StatelessWidget {
  final usuarioEmail;
  Trilhas(this.usuarioEmail);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Trilhas',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Selecione a trilha de sejada"),
          backgroundColor: Colors.lightBlue[800],
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
                size: 35,
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    // retorna um objeto do tipo Dialog
                    return AlertDialog(
                      title: new Text("Configurações"),
                      content: new Text("Selecione a opção desejada!"),
                      actions: <Widget>[
                        new FlatButton(
                          child: Center(
                            child: Text("Suporte"),
                          ),
                          onPressed: () {},
                        ),
                        new FlatButton(
                          child: Center(
                            child: Text("Sobre"),
                          ),
                          onPressed: () {},
                        ),
                        new FlatButton(
                          child: new Text("Sair"),
                          onPressed: () {},
                        ),
                      ],
                    );
                  },
                );
              },
            )
          ],
        ),
        body: Paginas(usuarioEmail),
      ),
    );
  }
}

class Paginas extends StatefulWidget {
  final usuarioEmail;
  Paginas(this.usuarioEmail);
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
                        child: const Text('COMEÇAR'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Mentoria(),
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
                        onPressed: () {
                          var _email = widget.usuarioEmail;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Acompanhamento(_email),
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
        ],
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'trilhas.dart';

class Perguntas extends StatefulWidget {
  final emailUsuario;
  final form;
  Perguntas(this.emailUsuario, this.form);
  @override
  PerguntasState createState() => PerguntasState(emailUsuario, form);
}

class PerguntasState extends State<Perguntas> {
  final emailUsuario;
  final form;
  List<TextEditingController> controlers = List();
  //int qtdPerguntas;
  var idUsuario = '';

  PerguntasState(this.emailUsuario, this.form);

  getEmail() {
    return widget.emailUsuario;
  }

  Future<dynamic> verificaForm() async {
    var tamanholista = form.length;
    print(tamanholista);
    preencheControlers(tamanholista);
    return form;
  }

  preencheControlers(int tamanho) {
    for (int controler = 0; controler < tamanho; controler++) {
      TextEditingController controler = TextEditingController();
      controlers.add(controler);
    }
  }

  Future<dynamic> perguntas;

  @override
  void initState() {
    perguntas = verificaForm();
    super.initState();
  }

  salvaUsuario() async {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Acompanhamento do negocio',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Questionário de acompanhamento"),
          backgroundColor: Colors.lightBlue[800],
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              //verificaForm();
              Navigator.pop(context);
            },
          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 25.0),
              child: IconButton(
                icon: Icon(Icons.done_all),
                iconSize: 40,
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      // retorna um objeto do tipo Dialog
                      return AlertDialog(
                        title: new Text("Confirmação"),
                        content: new Text(
                            "Tem certeza que deseja enviar as respostas?"),
                        actions: <Widget>[
                          new FlatButton(
                            child: new Text("Sim"),
                            onPressed: () async {
                              for (int i = 0; i < controlers.length; i++) {
                                Firestore banco = Firestore();

                                await banco
                                    .collection('questionarios')
                                    .document('form1')
                                    .setData({
                                  i.toString(): {
                                    'pergunta': form[i].toString(),
                                    'resposta': controlers[i].text,
                                  }
                                }, merge: true);
                              }

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Trilhas(getEmail())),
                              );
                            },
                          ),
                          new FlatButton(
                            child: new Text("Não"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                  for (var i = 0; i < controlers.length; i++) {
                    print('respostas: ' + controlers[i].text.toString());
                  }
                  print('tamanho: ' + controlers.length.toString());
                },
              ),
            ),
          ],
        ),
        body: FutureBuilder(
          future: perguntas,
          initialData: "Aguardando os dados...",
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data;
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.only(bottom: 5, top: 5),
                        child: Column(
                          children: [
                            Text(
                              data[index].toString(),
                              style: TextStyle(fontSize: 20.0),
                            ),
                            TextField(
                              controller: controlers[index],
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                },
              );
            } else {
              return Center(
                child: Text('Nenhum formulario pendente'),
              );
            }
          },
        ),
      ),
    );
  }
}

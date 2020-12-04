import 'package:flutter/material.dart';
import 'cadastro.dart';
import 'login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Identificador extends StatelessWidget {
  final TextEditingController id = TextEditingController();

  Future<bool> verificaIdentificador() async {
    Firestore db = Firestore.instance;

    DocumentSnapshot snapshot =
        await db.collection("usuarios").document(id.text.toString()).get();

    var usuario = snapshot.data;
    if (usuario is Map) {
      if (usuario['habilitado']) {
        //se true, significa que já está cadastrado
        return false;
      } else {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: 'Termos',
      home: Scaffold(
        appBar: AppBar(
          //title: Text("Termos"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'IDENTIFICADOR',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
            ),
            Container(
              padding: EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextFormField(
                    controller: id,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                        'Esse código foi informado PREVIAMENTE pela Estimulo 2020',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontWeight: FontWeight.w300)),
                  ),
                ],
              ),
            ),
            RaisedButton(
              onPressed: () async {
                bool identificadorValido = await verificaIdentificador();
                //a função retornava um FUTURE, sendo assim, o metodo que iria
                //receber o retorno da função TAMBÉM deve ser assincrono
                if (identificadorValido) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Cadastro()),
                  );
                } else {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: new Text("Acesso negado"),
                          content: new Text(
                              "Chave já cadastrada ou sem permissão para acessar esse aplicativo"),
                          actions: <Widget>[
                            new FlatButton(
                              child: new Text("OK"),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login()),
                                );
                              },
                            ),
                          ],
                        );
                      });
                }
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              color: Colors.blue[700],
              child: Container(
                width: 100,
                height: 50,
                child: Center(
                  child: Text(
                    'Continuar',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

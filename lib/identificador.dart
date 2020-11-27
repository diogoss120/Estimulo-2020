import 'package:flutter/material.dart';
import 'cadastro.dart';

class Identificador extends StatelessWidget {
  TextEditingController id = TextEditingController();
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
        body: Center(
          child: Container(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'IDENTIFICADOR',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
              ),
              TextField(
                controller: id,
              ),
              Text(
                  '*Esse código foi informado PREVIAMENTE pela Estimulo2020\nInsira para dar proseguimento'),
              RaisedButton(
                onPressed: () {
                  var cpf = id.text;
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Cadastro(cpf)),
                  );
                },
                child: Text('Continuar'),
              )
            ],
          )),
        ),
      ),
    );
  }
}

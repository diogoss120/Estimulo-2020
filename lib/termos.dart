import 'package:flutter/material.dart';
import 'cadastro.dart';

class Termos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Termos',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Termos"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: CorpoDosTermos(),
      ),
    );
  }
}

class CorpoDosTermos extends StatefulWidget {
  CorpoDosTermosState createState() => CorpoDosTermosState();
}

class CorpoDosTermosState extends State<CorpoDosTermos> {
  bool termosUso = false;
  bool termosPrivacidade = false;
  bool buttonHabilitado = false;

  void habilitaButton() {
    setState(
      () {
        if (termosUso == true && termosPrivacidade == true) {
          buttonHabilitado = true;
        } else {
          buttonHabilitado = false;
        }
      },
    );
  }

  @override
  Widget build(BuildContext contex) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(30),
            child: Text(
              'Leia atentamente os termos',
              style: TextStyle(
                fontSize: 22,
                color: Colors.grey[700],
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(30),
            child: Text(
              "ACEITO DOS TERMOS DE USO DO FINANCIAMENTO QUE JÁ ADQUIRI PREVIAMENTE COM O ESTIMULO 2020, ENTENDO A OBRIGATORIEDADE DE PREENCHER OS FORMULARIOS DISPOSTOS NO APLICATIVO PARA ACOMPANHAMENTO DOS INVESTIMENTOS FEITOS POR MIM; CONCORDO COM A POLÍTICA DE PRIVACIDADE DO CONTRATO DE FINANCIAMENTO E DO USO DO APLICATIVO, ESTOU SUJEITO AOS MEIOS DE CONBRANÇA ADICIONAIS DISPOSTOS NO CONTRATO EM CASO DE INADIMPLEMENTO DAS MENSALIDADES OU DE NÃO PREENCHIMENTO DO FORMULARIO DE ACOMPANHAMENTO OBRIGADÓRIO SEMPRE QUE O MESMO ESTIVER DISPONIVEL NO APLICATIVO..",
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(18),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: termosUso
                          ? Icon(Icons.check_box)
                          : Icon(Icons.check_box_outline_blank),
                      onPressed: () {
                        setState(
                          () {
                            termosUso = !termosUso;
                          },
                        );
                        habilitaButton();
                      },
                    ),
                    Text('Aceito os termos de uso!')
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: termosPrivacidade
                          ? Icon(Icons.check_box)
                          : Icon(Icons.check_box_outline_blank),
                      onPressed: () {
                        setState(
                          () {
                            termosPrivacidade = !termosPrivacidade;
                          },
                        );
                        habilitaButton();
                      },
                    ),
                    Text('Aceito os termos de privacidade!')
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  onPressed: buttonHabilitado
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Cadastro()),
                          );
                        }
                      : null,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  color: Colors.green[700],
                  child: Container(
                    width: 140,
                    height: 50,
                    child: Center(
                      child: Text('Continuar',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
                RaisedButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  color: Colors.red[900],
                  child: Container(
                    width: 140,
                    height: 50,
                    child: Center(
                      child: Text('Cancelar',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:estimulo2020/perguntas.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class Acompanhamento extends StatelessWidget {
  final email;
  Acompanhamento(this.email);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Acompamnhamento"),
          backgroundColor: Colors.lightBlue[800],
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: new BoxDecoration(color: Colors.lightBlue[800]),
          child: AcompanhamentoStateFul(email),
        ),
      ),
    );
  }
}

class AcompanhamentoStateFul extends StatefulWidget {
  final email;
  AcompanhamentoStateFul(this.email);
  @override
  _AcompannhamentoState createState() => _AcompannhamentoState(email);
}

class _AcompannhamentoState extends State<AcompanhamentoStateFul> {
  final email;
  _AcompannhamentoState(this.email);
  List<String> data = [
    'ENVIADO',
    'PENDENTE',
    'INDISPONIVEL',
    'INDISPONIVEL',
    'INDISPONIVEL'
  ];

  List form = ['Está aprendendo com os cursos?', 'Quanto já investiu?'];
  //List form2 = ['Está aprendendo com os cursos?', 'Quanto já investil?'];

  cardForm(String text, int index) {
    var color = Colors.red;
    if (text == 'ENVIADO') color = Colors.green;
    if (text == 'PENDENTE') color = Colors.orange;

    var icon = Icon(Icons.folder_special, size: 70);
    if (text == 'ENVIADO')
      icon = Icon(
        Icons.folder_open,
        size: 70,
      );
    if (text == 'PENDENTE')
      icon = Icon(
        Icons.create_new_folder,
        size: 70,
      );

    return GestureDetector(
      onTap: () {
        if (text == 'PENDENTE') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Perguntas(email, form),
            ),
          );
        }
      },
      child: Container(
        margin: EdgeInsets.only(top: 3, bottom: 3),
        width: double.infinity,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 5,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 15),
                child: ListTile(
                  leading: icon,
                  title: Text('Questionario ' + (index + 1).toString() + '',
                      style: TextStyle(color: Colors.black, fontSize: 18)),
                  subtitle: Text(
                    text.toString(),
                    style: TextStyle(color: color),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (context, index) {
              return cardForm((data[index].toString()), index);
            },
          ),
        )
      ],
    );
  }
}

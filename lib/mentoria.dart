import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Mentoria extends StatefulWidget {
  @override
  _MentoriaState createState() => _MentoriaState();
}

class _MentoriaState extends State<Mentoria> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bem vindo',
      home: Scaffold(
        appBar: AppBar(
          //title: Text("Olá, seja Bem vindo!"),
          backgroundColor: Colors.lightBlue[800],
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Para iniciarmos sua mentoria, clique em continuar e preencha o formulário.',
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              RaisedButton(
                onPressed: () async {
                  {
                    const url =
                        'https://docs.google.com/forms/d/e/1FAIpQLSdQT7Cn7bnW0QhtZSXeueelAhk0s2a-NsfrykaMLIasY3bZrw/formResponse';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  }
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                color: Colors.green[700],
                child: Container(
                  width: 250,
                  height: 50,
                  child: Center(
                    child: Text(
                      'Continuar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 16),
                    child: Text(
                      'Se você já participou de uma mentoria\navalie o seu mentor',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        size: 30,
                      ),
                      Icon(
                        Icons.star,
                        size: 30,
                      ),
                      Icon(
                        Icons.star,
                        size: 30,
                      ),
                      Icon(
                        Icons.star_border,
                        size: 30,
                      ),
                      Icon(
                        Icons.star_border,
                        size: 30,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

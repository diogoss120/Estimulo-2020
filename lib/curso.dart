import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_youtube/flutter_youtube.dart';
//import 'api.dart';

const chave_youtube = 'AIzaSyBDpq-IOTil2YD03woYFOQEAU_8pvdaS4A';
const url_requissicao = 'https://www.googleapis.com/youtube/v3/';

class Curso extends StatefulWidget {
  String tituloDoCurso;
  String canal;
  Curso(this.tituloDoCurso, this.canal);
  @override
  CursoState createState() => CursoState();
}

class CursoState extends State<Curso> {
  List listaDeAulas = List();

  @override
  void initState() {
    buscarVideos(widget.canal);
    super.initState();
  }

  Future buscarVideos(String canal) async {
    String idPlaylist = canal;
    var resposta = await http.get(url_requissicao +
        "playlistItems" +
        "?part=snippet" +
        "&maxResults=10" +
        "&playlistId=$idPlaylist" +
        "&key=$chave_youtube");

    if (resposta.statusCode == 200) {
      var retornoJson = json.decode(resposta.body);
      for (int i = 0; i < retornoJson["items"].length; i++) {
        var id = retornoJson["items"][i]["snippet"]["resourceId"]["videoId"];
        var titulo = retornoJson["items"][i]["snippet"]["title"].toString();
        var imagem =
            retornoJson["items"][i]["snippet"]["thumbnails"]["high"]["url"];
        Aulas aula = Aulas(id, titulo, imagem);
        setState(() {
          listaDeAulas.add(aula);
        });
        print(aula.titulo);
      }
      print("tamanho da lista " + listaDeAulas.length.toString());
    } else {
      print("Erro na requisição");
    }
    //adicionei 24/11 seguinte linha
    //return listaDeAulas;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.tituloDoCurso),
          backgroundColor: Colors.lightBlue[800],
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: ListView.builder(
          itemCount: listaDeAulas.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                FlutterYoutube.playYoutubeVideoById(
                    apiKey: chave_youtube,
                    videoId: listaDeAulas[index].id,
                    autoPlay: true,
                    fullScreen: true);
              },
              child: Column(
                children: [
                  Card(
                    elevation: 2,
                    child: Column(
                      children: [
                        Container(
                          height: 220,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(listaDeAulas[index].imagem),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(5),
                          child: ListTile(
                            title: Text(
                              listaDeAulas[index].titulo,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                            leading: Icon(Icons.play_circle_outline),
                            //subtitle: Icon(Icons.check),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class Aulas {
  String id;
  String imagem;
  String titulo;
  Aulas(this.id, this.titulo, this.imagem);
}

/*
ListView.builder(
          itemCount: listaDeAulas.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                FlutterYoutube.playYoutubeVideoById(
                    apiKey: chave_youtube,
                    videoId: listaDeAulas[index].id,
                    autoPlay: true,
                    fullScreen: true);
              },
              child: Column(
                children: [
                  Card(
                    elevation: 2,
                    child: Column(
                      children: [
                        Container(
                          height: 220,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(listaDeAulas[index].imagem),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(5),
                          child: ListTile(
                            title: Text(
                              listaDeAulas[index].titulo,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                            leading: Icon(Icons.play_circle_outline),
                            //subtitle: Icon(Icons.check),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
*/

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'curso.dart';

class Api {
  final chave_youtube = 'AIzaSyBDpq-IOTil2YD03woYFOQEAU_8pvdaS4A';
  final url_requissicao = 'https://www.googleapis.com/youtube/v3/';

  Future<List<Aulas>> trazerVideos(String canal) async {
    List<Aulas> listaDeAulas = List();
    String idPlaylist = canal;
    var resposta = await http.get(url_requissicao +
        "playlistItems" +
        "?part=snippet" +
        "&maxResults=100" +
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
        listaDeAulas.add(aula);
        print(aula.titulo);
      }
      print("tamanho da lista " + listaDeAulas.length.toString());
    } else {
      print("Erro na requisição");
    }
    //adicionei 24/11 seguinte linha
    return listaDeAulas;
  }
}

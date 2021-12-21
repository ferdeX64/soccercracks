import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:soccer_cracks/models/noticia_model.dart';

class NoticeService {
  NoticeService();
  final String _rootUrl = "https://tranquil-reef-80972.herokuapp.com";
      

  Future<List<Notice>> getNotice() async {
    List<Notice> result = [];
    try {
      var url = Uri.parse(_rootUrl);
      final response = await http.get(url);
      if (response.body.isEmpty) return result;

      Map<String,dynamic> content = json.decode(response.body);
      Map<String,dynamic> noticias = content["noticias"];
      List<dynamic> internacional=noticias["internacional"];
      for (var item in internacional) {
        final noticia = Notice.fromJson(item);        
        result.add(noticia);
      }
      return result;
    } catch (ex) {
      print(ex);
      return result;
    }
  }
}

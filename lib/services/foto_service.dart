import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:http/http.dart' as http;
import 'package:soccer_cracks/models/foto_model.dart';
import 'dart:convert';

class FotosService {
  FotosService();

  final String _rootUrl = "https://soccercracks-backend.web.app/api/foto";

  Future<int> postFoto(Foto foto) async {
    try {
      final Map<String, String> _headers = {"content-type": "application/json"};
      String _fotoBody = fotoToJson(foto);
      var url = Uri.parse(_rootUrl);
      final response = await http.post(url, headers: _headers, body: _fotoBody);
      if (response.body.isEmpty) return 400;
      Map<String, dynamic> content = json.decode(response.body);
      return content["estado"];
    } catch (ex) {
      // ignore: avoid_print
      print(ex);
      return 500;
    }
  }

  Future<String> uploadImage(File image) async {
    final cloudinary = CloudinaryPublic('dyvxsq2cr', 'ml_default', cache: false);
    try {
      CloudinaryResponse response = await cloudinary.uploadFile(
        CloudinaryFile.fromFile(image.path,
            resourceType: CloudinaryResourceType.Image),
      );
      return response.secureUrl;
    } on CloudinaryException catch (e) {
      // ignore: avoid_print
      print(e.message);
      // ignore: avoid_print
      print(e.request);
      return "";
    }
  }
}
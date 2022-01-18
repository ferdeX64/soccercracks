import 'dart:convert';

Foto fotoFromJson(String str) => Foto.fromJson(json.decode(str));

String fotoToJson(Foto data) => json.encode(data.toJson());

class Foto {
  Foto({this.url});

  String? url;
  String? idperfil;

  factory Foto.created(String value) => Foto();

  factory Foto.fromJson(Map<String, dynamic> json) => Foto(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}
/*import 'dart:convert';

import 'package:soccer_cracks/models/imagen_model.dart';

Noticias noticiasFromJson(String str) => Noticias.fromJson(json.decode(str));

String noticiasToJson(Noticias data) => json.encode(data.toJson());

class Noticias {
  Noticias({
    this.noticias,
  });

  NoticiasClass? noticias;

  factory Noticias.fromJson(Map<String, dynamic> json) => Noticias(
        noticias: NoticiasClass.fromJson(json["noticias"]),
      );

  Map<String, dynamic> toJson() => {
        "noticias": noticias!.toJson(),
      };
}

class NoticiasClass {
  NoticiasClass({
    this.internacional,
    this.nacional,
  });

  List<Nacional>? internacional;
  List<Nacional>? nacional;

  factory NoticiasClass.fromJson(Map<String, dynamic> json) => NoticiasClass(
        internacional: List<Nacional>.from(
            json["internacional"].map((x) => Nacional.fromJson(x))),
        nacional: List<Nacional>.from(
            json["nacional"].map((x) => Nacional.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "internacional":
            List<dynamic>.from(internacional!.map((x) => x.toJson())),
        "nacional": List<dynamic>.from(nacional!.map((x) => x.toJson())),
      };
}

class Nacional {
  Nacional({
    this.autor,
    this.descripcion,
    this.introduccion,
    this.fecha,
    this.imagen,
    this.seccion,
    this.titulo,
  });

  String? autor;
  String? descripcion;
  String? introduccion;
  String? fecha;
  Imagen? imagen;
  String? seccion;
  String? titulo;

  factory Nacional.fromJson(Map<String, dynamic> json) => Nacional(
        autor: json["autor"],
        descripcion: json["descripcion"],
        introduccion: json["introduccion"],
        fecha: json["fecha"],
        imagen: Imagen.fromJson(json["imagen"]),
        seccion: json["seccion"],
        titulo: json["titulo"],
      );

  Map<String, dynamic> toJson() => {
        "autor": autor,
        "descripcion": descripcion,
        "introduccion": introduccion,
        "fecha": fecha,
        "imagen": imagen!.toJson(),
        "seccion": seccion,
        "titulo": titulo,
      };
}
*/

// To parse this JSON data, do
//
//     final notice = noticeFromJson(jsonString);

import 'dart:convert';

Notice noticeFromJson(String str) => Notice.fromJson(json.decode(str));

class Notice {
  Notice({
    this.autor,
    this.descripcion,
    this.fecha,
    this.imagen,
    this.seccion,
    this.titulo,
  });

  String? autor;
  String? descripcion;
  String? fecha;
  List<String>? imagen;
  String? seccion;
  String? titulo;

  factory Notice.fromJson(Map<String, dynamic> json) => Notice(
        autor: json["autor"],
        descripcion: json["descripcion"],
        fecha: json["fecha"],
        imagen: List<String>.from(json["imagen"].map((x) => x)),
        seccion: json["seccion"],
        titulo: json["titulo"],
      );
}

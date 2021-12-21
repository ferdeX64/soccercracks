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

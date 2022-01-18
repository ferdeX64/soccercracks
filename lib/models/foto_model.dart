import 'dart:convert';

Foto fotoFromJson(String str) => Foto.fromJson(json.decode(str));

String fotoToJson(Foto data) => json.encode(data.toJson());

class Foto {
  Foto({this.url, this.fecha, this.observacion, this.idmantenimiento});

  String? url;
  DateTime? fecha;
  String? observacion;
  String? idmantenimiento;

  factory Foto.created(String value) =>
      Foto(idmantenimiento: value, fecha: DateTime.now());

  factory Foto.fromJson(Map<String, dynamic> json) => Foto(
        url: json["url"],
        fecha: DateTime.parse(json["fecha"]),
        observacion: json["observacion"],
        idmantenimiento: json["idmantenimiento"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "fecha": fecha!.toIso8601String(),
        "observacion": observacion,
        "idmantenimiento": idmantenimiento,
      };
}

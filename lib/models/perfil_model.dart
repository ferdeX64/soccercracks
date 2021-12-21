import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  Login({
    this.nombre,
    this.usuario,
    this.equipo,
  });

  String? nombre;
  String? usuario;
  String? equipo;

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        nombre: json["nombre"],
        usuario: json["usuario"],
        equipo: json["equipo"],
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "usuario": usuario,
        "equipo": equipo,
      };
}

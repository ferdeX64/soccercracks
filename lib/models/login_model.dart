import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  Login({
    this.nombre,
    this.correoElectronico,
    this.fechaNacimiento,
    this.usuario,
    this.contrasenia,
  });

  String? nombre;
  String? correoElectronico;
  String? fechaNacimiento;
  String? usuario;
  String? contrasenia;

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        nombre: json["nombre"],
        correoElectronico: json["correoElectronico"],
        fechaNacimiento: json["fechaNacimiento"],
        usuario: json["usuario"],
        contrasenia: json["contraseña"],
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "correoElectronico": correoElectronico,
        "fechaNacimiento": fechaNacimiento,
        "usuario": usuario,
        "contraseña": contrasenia,
      };
}

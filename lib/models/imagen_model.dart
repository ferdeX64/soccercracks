class Imagen {
  Imagen({
    this.url,
    this.fecha,
  });

  String? url;
  String? fecha;

  factory Imagen.fromJson(Map<String, dynamic> json) => Imagen(
        url: json["url"],
        fecha: json["fecha"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "fecha": fecha,
      };
}

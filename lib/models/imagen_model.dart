class Imagen {
  Imagen({
    this.url,
  });

  String? url;

  factory Imagen.fromJson(Map<String, dynamic> json) => Imagen(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}

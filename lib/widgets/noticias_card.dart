import 'package:soccer_cracks/models/noticia_model.dart';
import 'package:flutter/material.dart';
class NoticeCard extends StatelessWidget {
  const NoticeCard({Key? key, required this.model}) : super(key: key);
  final Notice model;

  @override
  Widget build(BuildContext context) {
    final url=model.imagen!.first;
    return Card(
        child:ListTile(
          leading:  Image.network(url,width: 64),
          title: Text(model.titulo??""),
          subtitle: Text(model.seccion?? ""),
          ), 
    );
  }
}
import 'package:flutter/material.dart';
import 'package:soccer_cracks/models/noticia_model.dart';
class NoticasDetailContentWidget extends StatelessWidget {
  const NoticasDetailContentWidget({Key? key, required this.noticias}) : super(key: key);
  final Notice noticias;
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7.0, vertical: 4.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ListTile(
                title: Text(noticias.titulo??"", textAlign: TextAlign.center),
                    ),
            ListTile(
                subtitle: Text(noticias.descripcion??"", textAlign: TextAlign.justify,)
                ),      
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:soccer_cracks/models/noticia_model.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:soccer_cracks/widgets/noticias_detail_widget.dart';
class NoticiasPage extends StatelessWidget {
  const NoticiasPage({Key? key, required this.noticias}) :  super(key: key);
  final Notice noticias;

  @override
  Widget build(BuildContext context) {
    final url=noticias.imagen!.first;
    
    return SafeArea(
      child: Scaffold(
          body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            expandedHeight:415,
            flexibleSpace: FlexibleSpaceBar(
             
              background:  Image.network(url,fit: BoxFit.cover),
              title: GradientText(
                  noticias.seccion ?? "",
                  style:const TextStyle(
                      fontSize: 20.0,
                      
                      
                  ),
                  colors: const [
                      Colors.blue,
                      Colors.red,
                      Colors.teal,
                  ],
              ),
      ),
             ),

            
          
          SliverFillRemaining(
            child: NoticiaDetailWidget(noticias: noticias),
            
            
          )
        ],
      )),
    );
  }
}
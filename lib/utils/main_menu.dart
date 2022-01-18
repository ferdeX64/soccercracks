import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soccer_cracks/widgets/inicio_widget.dart';
import 'package:soccer_cracks/widgets/noticias_widget.dart';
import 'package:soccer_cracks/widgets/partidos_widget.dart';
import 'package:soccer_cracks/widgets/perfil_widget.dart';

class MenuItem {
  String label;
  IconData icon;
  MenuItem(this.label, this.icon);
}

List<MenuItem> menuOptions = [
  MenuItem("Inicio", Icons.home),
  MenuItem("Partidos", Icons.sports_soccer),
  MenuItem("Noticias", Icons.article_outlined),
  MenuItem("Perfil", Icons.person),
];

List<Widget> contentWidgets = [
  const InicioWidget(),
  const PartidosWidget(),
  const NoticiasWidget(),
  const PerfilWidget(
    id: '',
  )
];

import 'package:flutter/material.dart';
import 'package:soccer_cracks/utils/main_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<String> _options = ["Inicio", "Partidos", "Noticias", "Perfil"];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text('SoccerCracks - ' + _options[_selectedIndex])),
      body: contentWidgets[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {
            _selectedIndex = index;
            setState(() {});
          },
          type: BottomNavigationBarType.fixed,
          items: menuOptions
              .map((e) =>
                  BottomNavigationBarItem(label: e.label, icon: Icon(e.icon)))
              .toList(),
          currentIndex: _selectedIndex),
    );
  }
}

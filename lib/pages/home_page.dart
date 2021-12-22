import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:soccer_cracks/providers/main_provider.dart';
import 'package:soccer_cracks/utils/main_menu.dart';

final List<String> _options = ["Inicio", "Partidos", "Noticias", "Perfil"];

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
          leading: SizedBox.square(
              dimension: 60.0,
              child: Switch(
                  value: mainProvider.mode,
                  onChanged: (bool value) async {
                    mainProvider.mode = value;
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.setBool("mode", value);
                  })),
          title: Text('SoccerCracks - ' + _options[mainProvider.index])),
      body: contentWidgets[mainProvider.index],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {
            mainProvider.index = index;
          },
          type: BottomNavigationBarType.fixed,
          items: menuOptions
              .map((e) =>
                  BottomNavigationBarItem(label: e.label, icon: Icon(e.icon)))
              .toList(),
          currentIndex: mainProvider.index),
    );
  }
}

/*import 'package:flutter/material.dart';
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
}*/

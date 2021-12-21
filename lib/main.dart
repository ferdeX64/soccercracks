import 'package:flutter/material.dart';
import 'package:soccer_cracks/pages/inicio_page.dart';

//import 'package:soccer_cracks/pages/home_page.dart';
//import 'package:soccer_cracks/pages/iniciar_sesion_page.dart';
//import 'package:soccer_cracks/pages/registrarse_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login SoccerCracks',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const InicioPage(),
      /*initialRoute: 'login',
      routes: {
        'login': (_) => const IniciarSesionPage(),
        'registrarse': (_) => const RegistrarsePage()
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),*/
    );
  }
}

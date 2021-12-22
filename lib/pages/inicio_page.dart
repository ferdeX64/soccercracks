import 'dart:async';
import 'package:flutter/material.dart';
import 'package:soccer_cracks/utils/color.dart';
import 'login_page.dart';

class InicioPage extends StatefulWidget {
  const InicioPage({Key? key}) : super(key: key);

  @override
  _InicioPageState createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 5000), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [orangeColors, orangeLightColors],
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter),
        ),
        child: const Center(
          child: CircleAvatar(
            backgroundImage: AssetImage("assets/images/imagen01.png"),
            radius: 70,
          ),
        ),
      ),
    );
  }
}

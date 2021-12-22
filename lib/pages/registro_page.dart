// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:soccer_cracks/pages/home_page.dart';
import 'package:soccer_cracks/pages/login_page.dart';
import 'package:soccer_cracks/widgets/button_widget.dart';
import 'package:soccer_cracks/widgets/header_widget.dart';

class RegistroPage extends StatefulWidget {
  const RegistroPage({Key? key}) : super(key: key);

  @override
  _RegistroPageState createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 30),
        child: Column(
          children: <Widget>[
            HeadPage("¡REGÍSTRATE!"),
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    _textInput(hint: "Nombre", icon: Icons.person),
                    _textInput(hint: "Correo Electrónico", icon: Icons.email),
                    _textInput(hint: "Usuario", icon: Icons.call),
                    _textInput(hint: "Contraseña", icon: Icons.person),
                    Expanded(
                      child: Center(
                        child: ButtonWidget(
                          btnText: "REGISTRARSE",
                          onClick: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()));
                          },
                        ),
                      ),
                    ),
                    RichText(
                      text: const TextSpan(children: [
                        TextSpan(
                            text: "¿Tienes una cuenta?",
                            style: TextStyle(color: Colors.black)),
                      ]),
                    ),
                    RaisedButton(
                      child: const Text('Iniciar sesión'),
                      color: Colors.blueAccent,
                      padding: const EdgeInsets.all(20),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                        );
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _textInput({controller, hint, icon}) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
      ),
      padding: const EdgeInsets.only(left: 10),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          prefixIcon: Icon(icon),
        ),
      ),
    );
  }
}

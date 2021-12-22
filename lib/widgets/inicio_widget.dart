import 'package:flutter/material.dart';

class InicioWidget extends StatelessWidget {
  const InicioWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Image.asset("assets/images/imagen03.png"),
    ]));
  }
}

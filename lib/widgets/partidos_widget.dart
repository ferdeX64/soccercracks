import 'package:flutter/material.dart';

class PartidosWidget extends StatelessWidget {
  const PartidosWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.sports_soccer, size: 50.0),
        Text("Estamos trabajando!",
            style: Theme.of(context).textTheme.headline4)
      ],
    ));
  }
}

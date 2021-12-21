// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:soccer_cracks/utils/color.dart';

class HeadPage extends StatelessWidget {
  var text = "Login";

  HeadPage(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [orangeColors, orangeLightColors],
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter),
          borderRadius:
              const BorderRadius.only(bottomLeft: Radius.circular(100))),
      child: Stack(
        children: <Widget>[
          Positioned(
              bottom: 20,
              right: 20,
              child: Text(
                text,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              )),
          Center(
            child: Row(
              children: const [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/imagen01.png'),
                    radius: 70,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

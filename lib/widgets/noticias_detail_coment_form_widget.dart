import 'dart:io';

import 'package:flutter/material.dart';

import 'package:soccer_cracks/models/foto_model.dart';
import 'package:image_picker/image_picker.dart';

class NoticiaDetailsFormWidget extends StatefulWidget {
  const NoticiaDetailsFormWidget({Key? key, required this.id})
      : super(key: key);
  final String id;

  @override
  State<NoticiaDetailsFormWidget> createState() =>
      _NoticiaDetailsFormWidgetState();
}

class _NoticiaDetailsFormWidgetState
    extends State<NoticiaDetailsFormWidget> {
  final _formKey = GlobalKey<FormState>();
  late Foto _foto;
  File? _imagen;
  final ImagePicker _picker = ImagePicker();
  bool _onSaving = false;

  @override
  void initState() {
    _foto = Foto.created(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Column(
      children: [
        Container(
          
        )
      ],
    ));
  }
}
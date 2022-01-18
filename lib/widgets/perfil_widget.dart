import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:soccer_cracks/models/foto_model.dart';
import 'package:soccer_cracks/services/foto_service.dart';

class PerfilWidget extends StatefulWidget {
  const PerfilWidget({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  State<PerfilWidget> createState() => _PerfilWidgetState();
}

class _PerfilWidgetState extends State<PerfilWidget> {
  final _formKey = GlobalKey<FormState>();
  late Foto _foto;
  File? _imagen;
  final ImagePicker _picker = ImagePicker();
  bool _onSaving = false;
  final FotoService _fotoService = FotoService();

  @override
  void initState() {
    _foto = Foto();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
        child: Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 14.0),
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          width: size.width * .80,
          decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage("assets/images/fondo_futbol.jpg"),
                  fit: BoxFit.cover),
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                  width: 2.0, color: Theme.of(context).primaryColorDark)),
          child: Form(
              key: _formKey,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 14.0, horizontal: 7.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 7.0),
                      child: Text("Nueva foto de perfil",
                          style: Theme.of(context).textTheme.subtitle1),
                    ),
                    SizedBox(
                      height: 100.h,
                      width: 150.h,
                      child: Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: _imagen == null
                            ? Image.asset('assets/images/generica.jpg')
                            : Image.file(_imagen!),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton.icon(
                            onPressed: () => _selectImage(ImageSource.camera),
                            icon: const Icon(Icons.camera),
                            label: const Text("Cámara")),
                        ElevatedButton.icon(
                            onPressed: () => _selectImage(ImageSource.gallery),
                            icon: const Icon(Icons.image),
                            label: const Text("Galería")),
                      ],
                    ),
                    _onSaving
                        ? const Padding(
                            padding: EdgeInsets.symmetric(vertical: 20.0),
                            child: CircularProgressIndicator())
                        : Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: Tooltip(
                              message: "Guardar nueva foto de perfil",
                              child: ElevatedButton.icon(
                                  onPressed: () {
                                    _sendForm();
                                  },
                                  label: const Text("Guardar"),
                                  icon: const Icon(Icons.save)),
                            ),
                          ),
                    const Padding(
                        padding: EdgeInsets.only(top: 7.0),
                        child: Text("Erick Fernández",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold))),
                  ],
                ),
              )),
        )
      ],
    ));
  }

  Future _selectImage(ImageSource source) async {
    XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      _imagen = File(pickedFile.path);
    } else {
      _imagen = null;
      //print('No image selected.');
    }
    setState(() {});
  }

  _sendForm() async {
    if (!_formKey.currentState!.validate()) return;
    _onSaving = true;
    setState(() {});

    //Vincula el valor de las controles del formulario a los atributos del modelo
    _formKey.currentState!.save();

    if (_imagen != null) {
      _foto.url = await _fotoService.uploadImage(_imagen!);
    }

    //Invoca al servicio POST para enviar la Foto
    int estado = await _fotoService.postFoto(_foto);
    if (estado == 201) {
      _formKey.currentState!.reset();
      _onSaving = false;
      _formKey.currentState!.setState(() {});
      setState(() {});
    }
  }
}

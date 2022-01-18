import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soccer_cracks/models/foto_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:soccer_cracks/services/foto_service.dart';

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
  final FotosService _fotosService = FotosService();

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
          margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 14.0),
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          width: size.width * .80,
          decoration: BoxDecoration(
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
                    TextFormField(
                        keyboardType: TextInputType.text,
                        initialValue: _foto.observacion,
                        onSaved: (value) {
                          //Este evento se ejecuta cuando se cumple la validación y cambia el estado del Form
                          _foto.observacion = value.toString();
                        },
                        validator: (value) {
                          _validateObservacion(value!);
                        },
                        decoration: const InputDecoration(
                            labelText: "Observación inicial"),
                        maxLength: 255,
                        maxLines: 3),
                    Padding(
                      padding: const EdgeInsets.only(top: 7.0),
                      child: Text("Ingresar la fecha",
                          style: Theme.of(context).textTheme.subtitle1),
                    ),
                    DatePickerWidget(
                        lastDate: DateTime.now(),
                        looping: false, // default is not looping
                        dateFormat: "dd-MMMM-yyyy",
                        locale: DatePicker.localeFromString('es'),
                        onChange: (DateTime newDate, _) {
                          _foto.fecha = newDate;
                        }),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 7.0),
                      child: Text("Ingresar imagen inicial",
                          style: Theme.of(context).textTheme.subtitle1),
                    ),
                    SizedBox(
                      height: 100.h,
                      width: 150.h,
                      child: Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: _imagen == null
                            ? Image.asset('assets/images/imagen02.jpg')
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
                              message: "Registrar inicio de mantenimiento",
                              child: ElevatedButton.icon(
                                  onPressed: () {
                                    _sendForm();
                                  },
                                  label: const Text("Guardar"),
                                  icon: const Icon(Icons.save)),
                            ),
                          )
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
      _foto.url = await _fotosService.uploadImage(_imagen!);
    }

    //Invoca al servicio POST para enviar la Foto
    int estado = await _fotosService.postFoto(_foto);
    if (estado == 201) {
      _formKey.currentState!.reset();
      _onSaving = false;
      _formKey.currentState!.setState(() {});
      setState(() {});
    }
  }

  String? _validateObservacion(String value) {
    return (value.length < 25)
        ? "Debe ingresar un mensaje con al menos 25 caracteres"
        : null; //Validación se cumple al retorna null
  }
}

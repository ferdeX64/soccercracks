import 'package:flutter/material.dart';
import 'package:soccer_cracks/models/noticia_model.dart';
import 'package:soccer_cracks/services/notices_services.dart';
import 'noticias_card.dart';

class NoticiasWidget extends StatefulWidget {
  const NoticiasWidget({Key? key}) : super(key: key);

  @override
  _NoticiasWidgetState createState() => _NoticiasWidgetState();
}

class _NoticiasWidgetState extends State<NoticiasWidget> {
  final NoticeService _noticeService = NoticeService();
  List<Notice>? _listaNotice;

  @override
  void initState() {
    super.initState();
    _downloadMantenimientos();
  }

  @override
  Widget build(BuildContext context) {
    if (_listaNotice == null) {
      return const Center(
        child: SizedBox(
            height: 50.0, width: 50.0, child: CircularProgressIndicator()),
      );
    }

    if (_listaNotice!.isEmpty) {
      return const Center(
        child: SizedBox(child: Text('No hay datos de noticias')),
      );
    }

    return Container(
      
     
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 7.0),
      child: ListView(
        
        children: _listaNotice!.map((e) => NewNoticeCard(model: e)).toList(),
      ),
    );
  }

  _downloadMantenimientos() async {
    _listaNotice = await _noticeService.getNotice();
    if (mounted) {
      setState(() {});
    }
  }
}

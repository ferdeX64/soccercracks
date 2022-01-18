import 'package:flutter/material.dart';
import 'package:soccer_cracks/models/noticia_model.dart';
import 'package:soccer_cracks/widgets/noticas_detail_content_widget.dart';
import 'package:soccer_cracks/widgets/noticias_detail_coment_form_widget.dart';

class NoticiaDetailWidget extends StatefulWidget {
  const NoticiaDetailWidget({Key? key, required this.noticias}) : super(key: key);
  final Notice noticias;

  @override
  _NoticiaDetailWidgetState createState() => _NoticiaDetailWidgetState();
}

class _NoticiaDetailWidgetState extends State<NoticiaDetailWidget> with SingleTickerProviderStateMixin  {
  final List<Tab> _myTabs = <Tab>[
    const Tab(text: 'Detalles'),
    const Tab(text: 'Comentarios'),
  ];
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(vsync: this, length: _myTabs.length);
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TabBar(tabs: _myTabs, controller: _tabController),
      body: TabBarView(controller: _tabController, children: [
        NoticasDetailContentWidget(noticias: widget.noticias),
        NoticiaDetailsFormWidget(id: widget.noticias.idnoticia ?? "")
       
      ]),
    );
  }
}
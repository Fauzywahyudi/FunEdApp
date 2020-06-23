import 'package:flutter/material.dart';
import 'package:pkn_app/assets/assets.dart';

class MateriPelajaran extends StatefulWidget {
  static const routeName = '/MateriPelajaran';
  @override
  _MateriPelajaranState createState() => _MateriPelajaranState();
}

class _MateriPelajaranState extends State<MateriPelajaran> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      // floatingActionButton: _buildFAB(),
      body: _buildBody(),
    );
  }

  Widget _buildFAB() {
    return FloatingActionButton(
      child: Icon(Icons.check),
      onPressed: () {},
      // => save(tecNamaSubBab.text, tecIsiSubBab.text, widget.data['id_bab']
      //     ),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      leading: backIos(Colors.white, context),
      title: Text("Materi Pelajaran"),
    );
  }

  Widget _buildBody(){
    return Container();
  }
}
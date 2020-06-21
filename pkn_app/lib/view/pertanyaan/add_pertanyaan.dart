import 'package:flutter/material.dart';
import 'package:pkn_app/assets/assets.dart';

class AddPertanyaan extends StatefulWidget {
  @override
  _AddPertanyaanState createState() => _AddPertanyaanState();
}

class _AddPertanyaanState extends State<AddPertanyaan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      floatingActionButton: _buildFAB(),
      body: _buildBody(),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      leading: backIos(Colors.white, context),
      title: Text("Tambah Pertanyaan"),
    );
  }

  Widget _buildFAB() {
    return FloatingActionButton(
      child: Icon(
        Icons.check,
      ),
      tooltip: "Simpan",
      onPressed: () {}
    );
  }

  Widget _buildBody(){
    return Container();
  }
}
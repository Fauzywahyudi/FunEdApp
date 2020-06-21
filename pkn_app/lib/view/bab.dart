import 'package:flutter/material.dart';
import 'package:pkn_app/assets/assets.dart';

class BabDescrib extends StatefulWidget {
  final data;

  const BabDescrib({Key key, this.data}) : super(key: key);
  @override
  _BabDescribState createState() => _BabDescribState();
}

class _BabDescribState extends State<BabDescrib> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      floatingActionButton: _buildFAB(),
      body: _buildBody(),
    );
  }

  Widget _buildFAB(){
    return FloatingActionButton(
      child: Icon(Icons.edit),
      onPressed: (){},
    );
  }

  Widget _buildAppBar(){
    return AppBar(
        leading: backIos(Colors.white, context),
        title: Text(widget.data['nama_bab']),
      );
  }

  Widget _buildBody(){
    return Container();
  }
}
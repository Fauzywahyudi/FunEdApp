import 'package:flutter/material.dart';
import 'package:pkn_app/assets/assets.dart';

class Quiz extends StatefulWidget {
  static const routeName = '/Quiz';
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
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
      title: Text("Quiz"),
    );
  }

  Widget _buildBody(){
    return Container();
  }
}
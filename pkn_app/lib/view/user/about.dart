import 'package:flutter/material.dart';
import 'package:pkn_app/assets/assets.dart';

class About extends StatefulWidget {
  static const routeName = '/About';
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      leading: backIos(Colors.white, context),
      title: Text("About"),
    );
  }

  Widget _buildBody() {
    return Container(
      child: ListView(
        children: [
          
        ],
      ),
    );
  }
}
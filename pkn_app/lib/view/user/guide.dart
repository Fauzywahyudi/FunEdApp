import 'package:flutter/material.dart';
import 'package:pkn_app/assets/assets.dart';

class Guide extends StatefulWidget {
  static const routeName = '/Guide';
  @override
  _GuideState createState() => _GuideState();
}

class _GuideState extends State<Guide> {
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
      title: Text("Guide"),
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
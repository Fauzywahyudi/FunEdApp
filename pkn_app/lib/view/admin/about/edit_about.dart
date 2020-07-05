import 'package:flutter/material.dart';
import 'package:pkn_app/assets/assets.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pkn_app/server/url.dart' as url;


class EditAbout extends StatefulWidget {
  static const routeName = '/EditAbout';
  @override
  _EditAboutState createState() => _EditAboutState();
}

class _EditAboutState extends State<EditAbout> {
  TextEditingController tecText = TextEditingController();
  bool isEditing = false;
  String text="";

  Future getData()async{
    final result = await http.post(url.Url.home+"getAbout.php");
    List data = json.decode(result.body);
    setState(() {
      text = data[0]['text'];
    });
  }

  Future update(String id, String text)async{
    await http.post(url.Url.home+"updateAbout.php",body: {
      "id" : id,
      "text" : text,
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
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
      
    );
  }
}
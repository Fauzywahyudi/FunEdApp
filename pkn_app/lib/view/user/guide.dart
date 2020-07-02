import 'package:flutter/material.dart';
import 'package:pkn_app/assets/assets.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pkn_app/server/url.dart' as url;

class Guide extends StatefulWidget {
  static const routeName = '/Guide';
  @override
  _GuideState createState() => _GuideState();
}

class _GuideState extends State<Guide> {

  Future<List> getData()async{
    final result = await http.post(url.Url.home+"getPetunjuk.php");
    return json.decode(result.body);
  }
  
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
      padding: EdgeInsets.all(10),
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            // padding: EdgeInsets.all(10),
            child: Image.asset(url.Url.assetImage+"pancasilaOpacity.jpeg", fit: BoxFit.fill,)
          ),
          FutureBuilder<List>(future: getData(),
          builder: (context, snapshot) {
            if(snapshot.hasError)print(snapshot.error);
            return snapshot.hasData ?
            ListView.builder(itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return Text(snapshot.data[index]['text'],textAlign: TextAlign.justify, style: TextStyle(
                fontSize: 17,
              ),);
            },) : Center(child: CircularProgressIndicator(),);
          },),
        ],
      )
    );
  }
}
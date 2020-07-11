import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pkn_app/server/url.dart' as url;

class OptionDialog extends StatefulWidget {
  @override
  _OptionDialogState createState() => _OptionDialogState();
}

class _OptionDialogState extends State<OptionDialog> {

  List data;
  List<Widget> widgets = List<Widget>();


  @override
  void initState() { 
    super.initState();
    getData();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Text("Pilih Bab",style: TextStyle(color: Colors.deepOrange,fontSize: 20, fontWeight: FontWeight.bold),),),
            ),
            Column(children: widgets==null? [SizedBox(height: 50)] : widgets)
          ],
        ),
      ),
    );
  }

  Future getData() async {
    final result = await http.post(url.Url.home + "getBab.php");
    setState(() {
      data = json.decode(result.body);
      for (var i = 0; i < data.length; i++) {
        Widget widg = Container(
          decoration: BoxDecoration(
          color: Colors.deepOrange,
            borderRadius: BorderRadius.circular(20)
          ),
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.symmetric(vertical: 2,horizontal: 5),
          child: ListTile(
            subtitle: Text(data[i]['nama_bab'],
            style: TextStyle(color: Colors.white),),
            leading: Text("Bab "+data[i]['bab'],
            style: TextStyle(color: Colors.white),),
            ),
        );
        widgets.add(widg);
      }
    });
  }
}
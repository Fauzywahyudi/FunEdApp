import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pkn_app/assets/assets.dart';
import 'package:pkn_app/models/bab.dart';

class EditBab extends StatefulWidget {
  static const routeName = '/EditBab';
  @override
  _EditBabState createState() => _EditBabState();
}

class _EditBabState extends State<EditBab> {
  Bab _bab;
  TextEditingController tecNamaBab = TextEditingController();
  TextEditingController tecNoBab = TextEditingController();
  
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), () {
      setData();
    });
  }

  setData(){
    setState(() {
      tecNoBab.text=_bab.getBab().toString();
      tecNamaBab.text=_bab.getNamaBab();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Bab args = ModalRoute.of(context).settings.arguments;
    setState(() {
      this._bab = args;
    });
    return Scaffold(
      appBar: _buildAppBar(),
      floatingActionButton: _buildFAB(),
      body: _buildBody(),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      leading: backIos(Colors.white, context),
      title: Text("Edit Bab"),
    );
  }

  Widget _buildFAB(){
    return FloatingActionButton(
      child: Icon(Icons.check),
      tooltip: "Simpan",
      onPressed: ()async {
        if(tecNamaBab.text.isEmpty|| tecNoBab.text.isEmpty){
          Fluttertoast.showToast(msg: "Data tidak boleh kosong");
        }else{
          String result = await BabService().update(_bab.getIdBab(), tecNoBab.text, tecNamaBab.text);
          print(result);
          Navigator.pop(context);
        }
      },
    );
  }

  Widget _buildBody() {
    return Container(
          alignment: Alignment.center,
          child: Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 20.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Material(
                    color: Colors.deepPurple.withOpacity(0.5),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: TextField(
                      controller: tecNoBab,
                      onChanged: (String value) {},
                      cursorColor: Colors.deepPurple,
                      keyboardType: TextInputType.number,
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        
                          labelText: "Nomor Bab",
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 13)),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Material(
                    color: Colors.deepPurple.withOpacity(0.5),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: TextField(
                      controller: tecNamaBab,
                      maxLines: 3,
                      minLines: 1,
                      onChanged: (String value) {},
                      cursorColor: Colors.deepPurple,
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                          labelText: "Nama Bab",
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 13)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
  }

  // Future update(int id, String bab, String nama) async {
  //   await http.post(url.Url.home + "addBab.php",
  //       body: {"bab": bab, "nama_bab": nama});
  //   Navigator.pop(context);
  //   tecNamaBab.text = "";
  //   tecNoBab.text = "";
  //   setState(() {});
  // }
}
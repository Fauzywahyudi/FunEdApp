import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pkn_app/assets/assets.dart';
import 'package:http/http.dart' as http;
import 'package:pkn_app/models/bab.dart';
import 'package:pkn_app/server/url.dart' as url;

class AddPertanyaan extends StatefulWidget {
  static const routeName = '/AddPertanyaan';

  @override
  _AddPertanyaanState createState() => _AddPertanyaanState();
}

class _AddPertanyaanState extends State<AddPertanyaan> {
  TextEditingController tecPertanyaan = TextEditingController();
  TextEditingController tecJawaban = TextEditingController();
  TextEditingController tecOpsi = TextEditingController();
  TextStyle titleStyle = TextStyle(
      fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold);

  List<String> opsi;
  Bab _bab;

  Future save() async {
    final result = await http.post(url.Url.home + "addPertanyaan.php", body: {
      "id_bab": _bab.getIdBab().toString(),
      "pertanyaan": tecPertanyaan.text,
      "jawaban": tecJawaban.text,
      "opsi": json.encode(opsi),
    });
  }

  @override
  void initState() {
    opsi = List<String>();
    super.initState();
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
      title: Text("Tambah Pertanyaan"),
    );
  }

  Widget _buildFAB() {
    return FloatingActionButton(
      child: Icon(
        Icons.check,
      ),
      tooltip: "Simpan",
      disabledElevation: 2,
      onPressed: () {
        save();
        Navigator.pop(context);
      },
    );
  }

  Widget _buildBody() {
    return Material(
      type: MaterialType.transparency,
      child: Container(
        child: Container(
          margin: const EdgeInsets.all(8.0),
          // padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.white,
          ),
          child: Stack(
            children: [
              Container(
              width: MediaQuery.of(context).size.width,
              // padding: EdgeInsets.all(10),
              child: Image.asset(
                url.Url.assetImage + "pancasilaOpacity.jpeg",
                fit: BoxFit.fill,
              )),
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(height: 20.0),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Material(
                        color: Colors.deepPurple.withOpacity(0.5),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: TextField(
                            maxLines: 10,
                            minLines: 1,
                            style: TextStyle(color: Colors.white),
                            controller: tecPertanyaan,
                            onChanged: (String value) {},
                            cursorColor: Colors.deepPurple,
                            textCapitalization: TextCapitalization.words,
                            decoration: InputDecoration(
                                hintText: "Pertanyaan",
                                hintStyle: TextStyle(color: Colors.white54),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 13))),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Material(
                        color: Colors.deepPurple.withOpacity(0.5),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: TextField(
                          maxLines: 3,
                          minLines: 1,
                          style: TextStyle(color: Colors.white),
                          controller: tecJawaban,
                          onChanged: (String value) {},
                          cursorColor: Colors.deepPurple,
                          decoration: InputDecoration(
                              hintText: "Jawaban",
                              hintStyle: TextStyle(color: Colors.white54),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 13)),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Text(
                            "Opsi/Pilihan",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Expanded(child: Container()),
                          FlatButton.icon(
                              color: Colors.deepPurple.withOpacity(0.5),
                              onPressed: () {
                                _customAlertDialog(context);
                              },
                              icon: Icon(
                                Icons.add,
                                color: Colors.white70,
                              ),
                              label: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Tambah Opsi",
                                  style: TextStyle(color: Colors.white70),
                                ),
                              ))
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: ListView.builder(
                          itemCount: opsi.length,
                          itemBuilder: (context, index) {
                            return opsi == null
                                ? Container(
                                    child: Text("Belum ada data"),
                                  )
                                : Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      color: Colors.deepPurple.withOpacity(0.2),
                                    ),
                                    margin: EdgeInsets.symmetric(vertical: 5),
                                    child: ListTile(
                                      title: Text(opsi[index]),
                                      trailing: IconButton(
                                        icon: Icon(Icons.close),
                                        onPressed: () {
                                          setState(() {
                                            opsi.removeAt(index);
                                          });
                                        },
                                      ),
                                    ),
                                  );
                          }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _customAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return _buildDialog("Tambah Opsi");
      },
    );
  }

  Widget _buildDialog(String title) {
    return Material(
        type: MaterialType.transparency,
        child: Container(
          alignment: Alignment.center,
          child: Container(
            margin: const EdgeInsets.all(8.0),
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      FontAwesomeIcons.bookOpen,
                      color: Colors.deepPurple,
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: Text(
                        title,
                        style: titleStyle,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
                Divider(),
                SizedBox(height: 20.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Material(
                    color: Colors.deepPurple.withOpacity(0.5),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: TextField(
                      controller: tecOpsi,
                      maxLines: 3,
                      minLines: 1,
                      onChanged: (String value) {},
                      cursorColor: Colors.deepPurple,
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                          hintText: "Opsi",
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 13)),
                    ),
                  ),
                ),
                SizedBox(height: 40.0),
                Row(
                  children: [
                    Expanded(
                      child: FlatButton(
                        padding: const EdgeInsets.all(5.0),
                        child: Text("Cancel"),
                        onPressed: () => Navigator.pop(context, true),
                      ),
                    ),
                    Expanded(
                      child: FlatButton(
                        padding: const EdgeInsets.all(5.0),
                        child: Text("Oke"),
                        onPressed: () {
                          setState(() {
                            opsi.add(tecOpsi.text);
                            tecOpsi.text = "";
                            Navigator.pop(context);
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

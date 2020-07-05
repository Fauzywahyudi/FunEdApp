import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pkn_app/assets/assets.dart';
import 'package:http/http.dart' as http;
import 'package:pkn_app/server/url.dart' as url;

class AddSubBab extends StatefulWidget {
  final data;

  const AddSubBab({Key key, this.data}) : super(key: key);

  @override
  _AddSubBabState createState() => _AddSubBabState();
}

class _AddSubBabState extends State<AddSubBab> {
  TextEditingController tecNamaSubBab = TextEditingController();
  TextEditingController tecIsiSubBab = TextEditingController();
  TextEditingController tecUrl = TextEditingController();
  bool addGambar = false;
  bool isLihatGambar = false;
  TextStyle titleStyle = TextStyle(
      fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold);
  List<String> urlImages = List<String>();

  Future save(String nama, String isi, String idbab) async {
    await http.post(url.Url.home + "addSubBab.php",
        body: {
          "nama_subbab": nama, 
          "isi_subbab": isi, 
          "id_bab": idbab,
          "gambar": json.encode(urlImages),
          });
    Navigator.pop(context);
    tecNamaSubBab.text = "";
    tecIsiSubBab.text = "";
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      floatingActionButton: isLihatGambar ? null :_buildFAB(),
      body: isLihatGambar ? _buildBodyLihatGambar(): _buildBody(),
    );
  }

  Widget _buildFAB() {
    return FloatingActionButton(
      child: Icon(Icons.check),
      onPressed: () =>
          save(tecNamaSubBab.text, tecIsiSubBab.text, widget.data['id_bab']),
      // _customAlertDialog(context),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      leading: isLihatGambar
          ? IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                setState(() {
                  isLihatGambar = !isLihatGambar;
                });
              })
          : backIos(Colors.white, context),
      title: Text("${isLihatGambar ? "Gambar": "Tambah Sub-Bab"}"),
    );
  }

  Widget _buildBodyLihatGambar(){
    return Container(
      child: ListView.builder(
        itemCount: urlImages.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        (index + 1).toString(),
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Image.network(urlImages[index]),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Center(
                        child: IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              setState(() {
                                urlImages.removeAt(index);
                              });
                            }),
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
              ),
            ],
          );
        },
      ),
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
          child: SingleChildScrollView(
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
                        maxLines: 3,
                        minLines: 1,
                        controller: tecNamaSubBab,
                        onChanged: (String value) {},
                        cursorColor: Colors.deepPurple,
                        textCapitalization: TextCapitalization.words,
                        decoration: InputDecoration(
                            hintText: "Nama Sub-Bab",
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
                      controller: tecIsiSubBab,
                      minLines: 15,
                      maxLines: 15,
                      onChanged: (String value) {},
                      cursorColor: Colors.deepPurple,
                      decoration: InputDecoration(
                          hintText: "Isi Sub-Bab",
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 13)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      RaisedButton(
                        onPressed: () {
                          if (addGambar) {
                            if (!tecUrl.text.isEmpty) {
                              urlImages.add(tecUrl.text);
                            }
                            setState(() {
                              tecUrl.text = "";
                            });
                          }
                          setState(() {
                            addGambar = !addGambar;
                          });
                        },
                        child: Container(
                            child: Text(
                          "${addGambar ? "Simpan Gambar" : "Tambah Gambar"}",
                          style: TextStyle(color: Colors.white),
                        )),
                        color: Colors.deepPurple,
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      RaisedButton(
                        onPressed: () {
                          setState(() {
                            isLihatGambar = !isLihatGambar;
                          });
                          print(urlImages.toString());
                        },
                        child: Container(
                            child: Text(
                          "Lihat Gambar",
                          style: TextStyle(color: Colors.white),
                        )),
                        color: Colors.deepPurple,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(child: Text("Tambahkan \"@img\" pada Text Input setelah menambahkan gambar tepat dimana anda ingin menyisipkan gambar",style: TextStyle(color: Colors.red),)),
                SizedBox(
                  height: 10,
                ),
                addGambar
                    ? Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Material(
                          color: Colors.deepPurple.withOpacity(0.5),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: TextField(
                              maxLines: 3,
                              minLines: 1,
                              controller: tecUrl,
                              onChanged: (String value) {},
                              cursorColor: Colors.deepPurple,
                              textCapitalization: TextCapitalization.words,
                              decoration: InputDecoration(
                                  hintText: "Url Gambar",
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 13))),
                        ),
                      )
                    : SizedBox(
                        height: 10,
                      ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

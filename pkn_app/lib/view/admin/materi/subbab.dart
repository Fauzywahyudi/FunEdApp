import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pkn_app/assets/assets.dart';
import 'package:http/http.dart' as http;
import 'package:pkn_app/server/url.dart' as url;

class SubBabDescr extends StatefulWidget {
  final data;

  const SubBabDescr({Key key, this.data}) : super(key: key);
  @override
  _SubBabDescrState createState() => _SubBabDescrState();
}

class _SubBabDescrState extends State<SubBabDescr> {
  TextEditingController tecIsiSubBab = TextEditingController();
  TextEditingController tecUrl = TextEditingController();
  bool isEditing = false;

  bool addGambar = false;
  bool isLihatGambar = false;
  var dataMateri;
  List<String> urlImages = List<String>();
  List<Widget> widgets = List<Widget>();
  List<String> texts;
  int jumlah = 0;
  String isi = "";

  @override
  void initState() {
    dataMateri = widget.data;
    isi = widget.data['isi'];
    print(urlImages.length);
    setState(() {
      if (widget.data['gambar'].toString().isNotEmpty) {
        List data = json.decode(widget.data['gambar']);
        for (var i = 0; i < data.length; i++) {
          urlImages.add(data[i]);
        }
      }
      jumlah = urlImages.length;
      print("image jumlah : " + jumlah.toString());
    });

    if (jumlah > 0) {
      int indexImages = 0;
      texts = isi.toString().split("@img");
      for (var i = 0; i < texts.length; i++) {
        widgets.add(Text(texts[i]));
        if (jumlah != 0) {
          widgets.add(Container(
              child: Center(
            child: Image.network(
              urlImages[indexImages],
              fit: BoxFit.fill,
            ),
          )));
          jumlah--;
          indexImages++;
        }
      }
    }
    super.initState();
  }

  refresh() {
    setState(() {
      jumlah = urlImages.length;

      if (jumlah > 0) {
        widgets = null;
        int indexImages = 0;
        texts = isi.toString().split("@img");
        widgets = List<Widget>();
        for (var i = 0; i < texts.length; i++) {
          widgets.add(Text(texts[i]));
          if (jumlah != 0) {
            widgets.add(Container(
                child: Center(
              child: Image.network(
                urlImages[indexImages],
                fit: BoxFit.fill,
              ),
            )));
            jumlah--;
            indexImages++;
          }
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isEditing ? _buildAppBarEditing() : _buildAppBar(),
      floatingActionButton: isEditing ? _buildFABEditing() : _buildFAB(),
      body: isEditing && !isLihatGambar
          ? _buildBodyEditing()
          : isEditing && isLihatGambar ? _buildBodyLihatGambar() : _buildBody(),
    );
  }

  String validasiNama() {
    if (dataMateri == null) {
      return widget.data['nama_sub_bab'];
    } else {
      return dataMateri['nama_sub_bab'];
    }
  }

  String validasiIsi() {
    if (dataMateri == null) {
      return widget.data['isi'];
    } else {
      return dataMateri['isi'];
    }
  }

  Future save() async {
    final result = await http.post(url.Url.home + "editSubBab.php", body: {
      "id_sub": widget.data['id_sub_bab'],
      "isi": tecIsiSubBab.text,
      "gambar": json.encode(urlImages),
    });
    List list = json.decode(result.body);
    setState(() {
      dataMateri = list[0];
    });
  }

  FloatingActionButton _buildFABEditing() {
    return FloatingActionButton(
        child: Icon(
          Icons.check,
        ),
        tooltip: "Simpan",
        onPressed: () {
          setState(() {
            save();
            isEditing = false;
            isi = tecIsiSubBab.text;
            refresh();
          });
        });
  }

  FloatingActionButton _buildFAB() {
    return FloatingActionButton(
        child: Icon(
          Icons.edit,
        ),
        tooltip: "Edit Isi Materi",
        onPressed: () {
          setState(() {
            isEditing = true;
            tecIsiSubBab.text = validasiIsi();
          });
        });
  }

  Widget _buildAppBar() {
    return AppBar(
      leading: backIos(Colors.white, context),
      title: Text(validasiNama()),
    );
  }

  Widget _buildAppBarEditing() {
    return AppBar(
      leading: IconButton(
          icon: Icon(Icons.close),
          tooltip: "Cencel",
          onPressed: () {
            setState(() {
              if (isEditing && isLihatGambar) {
                isLihatGambar = !isLihatGambar;
              } else {
                isEditing = false;
              }
            });
          }),
      title: Text("Edit " + validasiNama()),
    );
  }

  Widget _buildBody() {
    return urlImages.length < 1
        ? Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
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
                    children: [
                      SizedBox(height: 10),
                      Text(validasiIsi(), textAlign: TextAlign.justify),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
          )
        : Container(
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: widgets == null ? [] : widgets,
                  ),
                ),
              ],
            ),
          );
  }

  Widget _buildBodyEditing() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0),
              child: Material(
                color: Colors.deepPurple.withOpacity(0.5),
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: TextField(
                  controller: tecIsiSubBab,
                  maxLines: 15,
                  minLines: 15,
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 15),
                  onChanged: (String value) {},
                  cursorColor: Colors.deepPurple,
                  decoration: InputDecoration(
                      hintText: "Isi Sub-Bab",
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 13)),
                ),
              ),
            ),
            SizedBox(height: 10),
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
              height: 20,
            ),
            Center(
                child: Text(
              "Tambahkan \"@img\" pada Text Input setelah menambahkan gambar tepat dimana anda ingin menyisipkan gambar",
              style: TextStyle(color: Colors.red),
            )),
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
    );
  }

  Widget _buildBodyLihatGambar() {
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
              Divider(),
            ],
          );
        },
      ),
    );
  }
}

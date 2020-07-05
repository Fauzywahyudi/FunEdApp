import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pkn_app/assets/assets.dart';
import 'package:http/http.dart' as http;
import 'package:pkn_app/server/url.dart' as url;

class DemoPertanyaan extends StatefulWidget {
  final data;

  const DemoPertanyaan({Key key, this.data}) : super(key: key);

  @override
  _DemoPertanyaanState createState() => _DemoPertanyaanState();
}

class _DemoPertanyaanState extends State<DemoPertanyaan> {
  List opsi;
  List<bool> _selected = List.generate(20, (i) => false);
  bool kebenaran = false;
  bool cek = false;
  bool isEditing = false;
  String pertanyaan="";
  String jawaban = "";

  TextEditingController tecPertanyaan = TextEditingController();
  TextEditingController tecJawaban = TextEditingController();
  TextEditingController tecOpsi = TextEditingController();
  TextStyle titleStyle = TextStyle(
      fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold);

  List opsiEditing;

  Future save() async {
    final result = await http.post(url.Url.home + "editPertanyaan.php", body: {
      "id_pertanyaan": widget.data['id_pertanyaan'],
      "pertanyaan": tecPertanyaan.text,
      "jawaban": tecJawaban.text,
      "opsi": json.encode(opsiEditing),
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      pertanyaan = widget.data['pertanyaan'];
      jawaban = widget.data['jawaban'];
      opsi = json.decode(widget.data['opsi']);
      opsiEditing = opsi;
      tecPertanyaan.text = widget.data['pertanyaan'];
      tecJawaban.text = widget.data['jawaban'];
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  konfirmJawaban(String jawaban, String pilihan) {
    if (jawaban == pilihan) {
      setState(() {
        kebenaran = true;
      });
    } else {
      setState(() {
        kebenaran = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isEditing? _buildAppBarEditing() :_buildAppBar(),
      floatingActionButton: isEditing?_buildFABEditing(): _buildFAB(),
      body: isEditing ? _buildBodyEditing() : _buildBody(),
    );
  }

  Widget _buildAppBarEditing(){
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.close),
        onPressed: (){
          setState(() {
              isEditing = !isEditing;
            });
        },
      ),
      title: Text("Edit Soal"),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      leading: backIos(Colors.white, context),
      title: Text("Demo Soal"),
      actions: [
        IconButton(tooltip: "Edit Soal",
          icon: Icon(Icons.edit), onPressed: (){
            setState(() {
              isEditing = !isEditing;
            });
        }),
      ],
    );
  }

  Widget _buildFABEditing() {
    return FloatingActionButton(
        child: Icon(
          Icons.check,
        ),
        tooltip: "Simpan",
        onPressed: () {
          setState(() {
            save();
            isEditing = !isEditing;
            opsi = opsiEditing;
            pertanyaan = tecPertanyaan.text;
            jawaban = tecJawaban.text;
          });
        }
        // ()=>Navigator.pushNamed(context, '/AddPertanyaan')
        );
  }

  Widget _buildFAB() {
    return FloatingActionButton(
        child: Icon(
          Icons.check,
        ),
        tooltip: "Konfirmasi",
        onPressed: () {
          setState(() {
            cek = true;
            if (kebenaran) {
              print("benar");
            } else {
              print("salah");
            }
          });
        }
        // ()=>Navigator.pushNamed(context, '/AddPertanyaan')
        );
  }

  Widget _buildBodyEditing() {
    return  Material(
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
                          itemCount: opsiEditing.length,
                          itemBuilder: (context, index) {
                            return opsiEditing == null
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
                                      title: Text(opsiEditing[index]),
                                      trailing: IconButton(
                                        icon: Icon(Icons.close),
                                        onPressed: () {
                                          setState(() {
                                            opsiEditing.removeAt(index);
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
  
  Widget _buildBody() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.deepPurple.withOpacity(0.2),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: ListTile(
                    title: Text(
                      pertanyaan,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Text(
                        "Pilih satu jawaban di bawah ini!",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      Text(
                        !cek ? "" : kebenaran ? "Benar" : "Salah",
                        style: TextStyle(
                            color: kebenaran ? Colors.green : Colors.red,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  height: MediaQuery.of(context).size.height /2 ,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: ListView.builder(
                    itemCount: opsi.length,
                    itemBuilder: (context, index) {
                      return opsi == null
                          ? Container()
                          : Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                color: _selected[index]
                                    ? Colors.deepPurple.withOpacity(0.5)
                                    : Colors.deepPurple.withOpacity(0.2),
                              ),
                              margin: EdgeInsets.symmetric(vertical: 5),
                              child: ListTile(
                                title: Text(opsi[index],textAlign: TextAlign.justify,),
                                onTap: () {
                                  setState(() {
                                    cek = false;
                                    _selected = List.generate(20, (i) => false);
                                    _selected[index] = !_selected[index];
                                    konfirmJawaban(
                                        jawaban, opsi[index]);
                                  });
                                },
                              ),
                            );
                    },
                  ),
                ),
                Container(
                  height: 50,
                )
              ],
            ),
          ),
        ],
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

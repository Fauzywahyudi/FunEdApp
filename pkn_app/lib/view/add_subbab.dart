import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
  TextStyle titleStyle = TextStyle(
      fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold);

  Future save(String nama, String isi, String idbab) async {
    await http.post(url.Url.home + "addSubBab.php",
        body: {"nama_subbab": nama, "isi_subbab": isi, "id_bab": idbab});
    Navigator.pop(context);
    tecNamaSubBab.text = "";
    tecIsiSubBab.text = "";
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      floatingActionButton: _buildFAB(),
      body: _buildBody(),
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
      leading: backIos(Colors.white, context),
      title: Text("Tambah Sub-Bab"),
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
                    maxLines: 20,
                    minLines: 10,
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
            ],
          ),
        ),
      ),
    );
  }
}

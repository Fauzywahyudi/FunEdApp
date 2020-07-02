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

  @override
  void initState() {
    super.initState();
    setState(() {
      opsi = json.decode(widget.data['opsi']);
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
      appBar: _buildAppBar(),
      floatingActionButton: _buildFAB(),
      body: _buildBody(),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      leading: backIos(Colors.white, context),
      title: Text("Demo Soal"),
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
                      widget.data['pertanyaan'],
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
                                        widget.data['jawaban'], opsi[index]);
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
}

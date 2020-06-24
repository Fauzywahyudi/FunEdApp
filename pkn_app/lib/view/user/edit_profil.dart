import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:pkn_app/assets/assets.dart';
import 'package:pkn_app/models/siswa.dart';
import 'package:pkn_app/view/user/profil_user.dart';

class EditProfil extends StatefulWidget {
  static const routeName = '/EditProfil';
  @override
  _EditProfilState createState() => _EditProfilState();
}

class _EditProfilState extends State<EditProfil> {
  Siswa _siswa;
  TextEditingController tecNisn = TextEditingController();
  TextEditingController tecNama = TextEditingController();
  TextEditingController tecKelas = TextEditingController();
  TextEditingController tecJurusan = TextEditingController();
  FocusNode focNisn = FocusNode();
  FocusNode focNama = FocusNode();
  FocusNode focKelas = FocusNode();
  FocusNode focJurusan = FocusNode();
  bool isLoading = true;
  String grupJk;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), () {
      setData();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  setData() {
    setState(() {
      tecNama.text = _siswa.getNama();
      tecNisn.text = _siswa.getNis();
      tecKelas.text = _siswa.getKelas();
      tecJurusan.text = _siswa.getJurusan();
      if (_siswa.getJk() == null || _siswa.getJk() == "") {
        grupJk = "";
      } else {
        grupJk = _siswa.getJk();
      }
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Siswa args = ModalRoute.of(context).settings.arguments;
    setState(() {
      this._siswa = args;
    });
    return Scaffold(
      appBar: _buildAppBar(),
      floatingActionButton: _buildFAB(),
      body: _buildBody(args),
    );
  }

  Widget _buildFAB() {
    return FloatingActionButton(
        child: Icon(Icons.check),
        tooltip: "Simpan",
        onPressed: () {
          if (tecNisn.text.isNotEmpty &&
              tecNama.text.isNotEmpty &&
              tecKelas.text.isNotEmpty &&
              tecJurusan.text.isNotEmpty &&
              grupJk.isNotEmpty) {
            _customAlertDialog(context);
          } else {
            Fluttertoast.showToast(
                msg: "Isi semua data!",
                backgroundColor: Colors.red,
                textColor: Colors.white);
          }
        });
  }

  Widget _buildAppBar() {
    return AppBar(
      leading: backIos(Colors.white, context),
      title: Text("Edit Profil"),
    );
  }

  Widget _buildBody(Siswa siswa) {
    return Container(
      child: isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Material(
                      elevation: 2.0,
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                      child: TextField(
                        controller: tecNisn,
                        focusNode: focNisn,
                        enabled: false,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        onSubmitted: (v) {
                          FocusScope.of(context).requestFocus(focNama);
                        },
                        onChanged: (String value) {},
                        cursorColor: Colors.deepOrange,
                        decoration: InputDecoration(
                          hintText: "NIS Siswa",
                          prefixIcon: Material(
                            elevation: 0,
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            child: Icon(
                              FontAwesomeIcons.idCard,
                              color: Colors.deepPurple,
                            ),
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 13),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Material(
                      elevation: 2.0,
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                      child: TextField(
                        controller: tecNama,
                        focusNode: focNama,
                        textCapitalization: TextCapitalization.words,
                        textInputAction: TextInputAction.next,
                        onSubmitted: (v) {
                          FocusScope.of(context).requestFocus(focKelas);
                        },
                        onChanged: (String value) {},
                        cursorColor: Colors.deepOrange,
                        decoration: InputDecoration(
                          hintText: "Nama Siswa",
                          prefixIcon: Material(
                            elevation: 0,
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                            child: Icon(
                              Icons.person,
                              color: Colors.deepPurple,
                            ),
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 13),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Material(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.wc,
                                  color: Colors.deepPurple,
                                ),
                              ),
                              Text("Jenis Kelamin",
                                  style: TextStyle(fontSize: 17)),
                              Expanded(child: Container()),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Radio(
                                  value: "Laki-laki",
                                  groupValue: grupJk,
                                  onChanged: (value) => rdListener(value)),
                              Text("Laki-laki"),
                              Radio(
                                  value: "Perempuan",
                                  groupValue: grupJk,
                                  onChanged: (value) => rdListener(value)),
                              Text("Perempuan"),
                              SizedBox(
                                width: 20,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Material(
                      elevation: 2.0,
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                      child: TextField(
                        controller: tecKelas,
                        focusNode: focKelas,
                        textCapitalization: TextCapitalization.words,
                        textInputAction: TextInputAction.next,
                        onSubmitted: (v) {
                          FocusScope.of(context).requestFocus(focJurusan);
                        },
                        onChanged: (String value) {},
                        cursorColor: Colors.deepOrange,
                        decoration: InputDecoration(
                          hintText: "Kelas",
                          prefixIcon: Material(
                            elevation: 0,
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                            child: Icon(
                              FontAwesomeIcons.solidCopyright,
                              color: Colors.deepPurple,
                            ),
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 13),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Material(
                      elevation: 2.0,
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                      child: TextField(
                        controller: tecJurusan,
                        focusNode: focJurusan,
                        textCapitalization: TextCapitalization.words,
                        textInputAction: TextInputAction.done,
                        onSubmitted: (v) {
                          focJurusan.unfocus();
                        },
                        onChanged: (String value) {},
                        cursorColor: Colors.deepOrange,
                        decoration: InputDecoration(
                          hintText: "Jurusan",
                          prefixIcon: Material(
                            elevation: 0,
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                            child: Icon(
                              Icons.school,
                              color: Colors.deepPurple,
                            ),
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 13),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
    );
  }

  _customAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return _buildDialog(context, _siswa.getNama());
      },
    );
  }

  Widget _buildDialog(BuildContext context, String nama) {
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
                      Icons.warning,
                      size: 30,
                      color: Colors.deepPurple,
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: Text(
                        "Konfirmasi",
                        style: titleStyle,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
                Divider(),
                SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Apakah anda yakin perbaharui data diri?"),
                ),
                SizedBox(height: 20.0),
                Row(
                  children: [
                    Expanded(
                      child: FlatButton(
                        padding: const EdgeInsets.all(5.0),
                        child: Text("Tidak"),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                    Expanded(
                      child: FlatButton(
                        padding: const EdgeInsets.all(5.0),
                        child: Text("Iya"),
                        onPressed: () {
                          update();
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

  update() async {
    Siswa newSiswa = Siswa(_siswa.getId(), tecNisn.text, _siswa.getPassword(),
        tecNama.text, grupJk, tecKelas.text, tecJurusan.text);

    await SiswaService().updateData(newSiswa).then((value) => setState(() {
          _siswa = newSiswa;
        }));
    Navigator.pop(context);
    Navigator.pop(context);
    Navigator.pop(context);
    Navigator.pushReplacementNamed(context, "/HomeUser", arguments: newSiswa);
  }

  void rdListener(String value) {
    setState(() {
      grupJk = value;
    });
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pkn_app/assets/assets.dart';
import 'package:http/http.dart' as http;
import 'package:pkn_app/server/url.dart' as url;

class SubBabDescrUser extends StatefulWidget {
  final data;

  const SubBabDescrUser({Key key, this.data}) : super(key: key);
  @override
  _SubBabDescrUserState createState() => _SubBabDescrUserState();
}

class _SubBabDescrUserState extends State<SubBabDescrUser> {
  TextEditingController tecIsiSubBab = TextEditingController();
  bool isEditing = false;
  var dataMateri;

  @override
  void initState() {
    dataMateri = widget.data;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isEditing ? _buildAppBarEditing() : _buildAppBar(),
      // floatingActionButton: isEditing ? _buildFABEditing() : _buildFAB(),
      body: isEditing ? _buildBodyEditing() : _buildBody(),
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
    });
    List list = json.decode(result.body);
    setState(() {
      dataMateri = list[0];
    });
  }

  // FloatingActionButton _buildFABEditing() {
  //   return FloatingActionButton(
  //       child: Icon(
  //         Icons.check,
  //       ),
  //       tooltip: "Simpan",
  //       onPressed: () {
  //         setState(() {
  //           save();
  //           isEditing = false;
  //         });
  //       });
  // }

  // FloatingActionButton _buildFAB() {
  //   return FloatingActionButton(
  //       child: Icon(
  //         Icons.edit,
  //       ),
  //       tooltip: "Edit Isi Materi",
  //       onPressed: () {
  //         setState(() {
  //           isEditing = true;
  //           tecIsiSubBab.text = validasiIsi();
  //         });
  //       });
  // }

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
              isEditing = false;
            });
          }),
      title: Text("Edit " + validasiNama()),
    );
  }

  Widget _buildBody() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            Text(validasiIsi(), textAlign: TextAlign.justify),
            SizedBox(height: 10),
          ],
        ),
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
                  maxLines: 30,
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
          ],
        ),
      ),
    );
  }
}

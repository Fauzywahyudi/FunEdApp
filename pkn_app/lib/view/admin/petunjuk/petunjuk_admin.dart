import 'package:flutter/material.dart';
import 'package:pkn_app/assets/assets.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pkn_app/server/url.dart' as url;


class PetunjukAdmin extends StatefulWidget {
  static const routeName = '/PerbaharuiPetunjuk';
  @override
  _PetunjukAdminState createState() => _PetunjukAdminState();
}

class _PetunjukAdminState extends State<PetunjukAdmin> {

  TextEditingController tecIsiSubBab = TextEditingController();
  bool isEditing = false;
  String text = "";
  String id = "";

  Future getData()async{
    final result = await http.post(url.Url.home+"getPetunjuk.php");
    List data = json.decode(result.body);
    setState(() {
      text = data[0]['text'];
      id = data[0]['id_petunjuk'];
    });
  }

  Future save() async {
    final result = await http.post(url.Url.home + "updatePetunjuk.php", body: {
      "id": id,
      "text": tecIsiSubBab.text,
    });
    print(result.body);
  }

  @override
  void initState() {
    super.initState();
    getData();
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
      body: isEditing ? _buildBodyEditing() : _buildBody(),
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
      title: Text("Edit Petunjuk"),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      leading: backIos(Colors.white, context),
      title: Text("Petunjuk"),
    );
  }

  Widget _buildFAB(){
    return FloatingActionButton(
        child: Icon(
          Icons.edit,
        ),
        tooltip: "Edit Petunjuk",
        onPressed: () {
          setState(() {
            isEditing = true;
            tecIsiSubBab.text = text;
          });
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
            text = tecIsiSubBab.text;
          });
        });
  }

  Widget _buildBody() {
    return Container(
        padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
              child: Column(
          children: [
            Text(text,textAlign: TextAlign.justify, style: TextStyle(
                  fontSize: 17,
                ),),
                SizedBox(height: 70,)
          ],
        ),
      )
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
                  maxLines: 25,
                  minLines: 15,
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 17),
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
            SizedBox(height: 70),
          ],
        ),
      ),
    );
  }
}
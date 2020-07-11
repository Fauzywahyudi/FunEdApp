import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pkn_app/assets/assets.dart';
import 'package:pkn_app/models/bab.dart';
import 'package:pkn_app/view/admin/materi/bab.dart';
import 'package:http/http.dart' as http;
import 'package:pkn_app/server/url.dart' as url;

class MateriView extends StatefulWidget {
  static const routeName = '/UpdateTheory';
  @override
  _MateriViewState createState() => _MateriViewState();
}

class _MateriViewState extends State<MateriView> {
  TextEditingController tecNamaBab = TextEditingController();
  TextEditingController tecNoBab = TextEditingController();
  TextStyle titleStyle = TextStyle(
      fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold);

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  aksiDismis(var data) {
    _requestConfirm(context, data);
    

    // if (tipe == "hapus") {
    // } else if (tipe == "edit") {
    //   Bab bab = Bab(data['id_bab'], data['bab'], data['nama_bab']);
    //   Navigator.pushNamed(context, "/EditBab",arguments: bab);
    // }
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
      title: Text("Theory"),
    );
  }

  Widget _buildFAB() {
    return FloatingActionButton(
      child: Icon(
        Icons.edit,
      ),
      tooltip: "Tambah Bab",
      onPressed: () => _customAlertDialog(context),
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
          FutureBuilder<List>(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              return snapshot.hasData
                  ? ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            _buildBab(snapshot.data[index]),
                            SizedBox(
                              height: 5,
                            )
                          ],
                        );
                      },
                    )
                  : Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBab(var data) {
    return Dismissible(
      background: Container(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.delete, color: Colors.white, size: 25),
            ),
            Expanded(
              child: Container(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.delete, color: Colors.white, size: 25),
            ),
            
          ],
        ),
      ),
      confirmDismiss: (direction) {
        aksiDismis(data);
      },
      key: ValueKey(data['id_bab']),
      child: InkWell(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BabDescrib(
                data: data,
              ),
            )),
        onLongPress: () {
          Bab bab = Bab(int.parse(data['id_bab']), int.parse(data['bab']), data['nama_bab']);
          Navigator.pushNamed(context, '/EditBab',arguments: bab);
        },
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.deepOrange,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey,
                  blurRadius: 1,
                  spreadRadius: 1,
                  offset: Offset(1, 1))
            ],
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Row(
            children: <Widget>[
              Container(
                // color: Colors.pink,
                width: 75,
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.bookOpen,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 16.0),
                    Text(
                      "Bab ${data['bab']}",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  child: Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(26.0),
                        alignment: Alignment.centerRight,
                        child: Opacity(
                          opacity: 0.3,
                          child: Icon(
                            FontAwesomeIcons.bookOpen,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 26, horizontal: 15),
                        child: Text(
                          data['nama_bab'],
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<List> getData() async {
    final result = await http.post(url.Url.home + "getBab.php");
    setState(() {});
    return json.decode(result.body);
  }

  _customAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return _buildDialog();
      },
    );
  }

  Widget _buildDialog() {
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
                        "Tambah Bab",
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
                      controller: tecNoBab,
                      onChanged: (String value) {},
                      cursorColor: Colors.deepPurple,
                      keyboardType: TextInputType.number,
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                          hintText: "Nomor Bab",
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
                          hintText: "Nama Bab",
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
                        onPressed: () async {
                          await save(tecNoBab.text, tecNamaBab.text);
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

  Future save(String bab, String nama) async {
    await http.post(url.Url.home + "addBab.php",
        body: {"bab": bab, "nama_bab": nama});
    Navigator.pop(context);
    tecNamaBab.text = "";
    tecNoBab.text = "";
    setState(() {});
  }

  _requestConfirm(BuildContext context, var data) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return buildDialogRequest(context, data);
      },
    );
  }

  Widget buildDialogRequest(BuildContext context, var data) {
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
            child: isLoading
                ? Container(
                    height: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                            child: Text(
                          "Loading...",
                          style: TextStyle(fontSize: 25),
                        )),
                        SizedBox(
                          height: 20,
                        ),
                        Center(child: CircularProgressIndicator()),
                      ],
                    ),
                  )
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.delete,
                            size: 30,
                            color: Colors.deepPurple,
                          ),
                          const SizedBox(width: 10.0),
                          Expanded(
                            child: Text(
                              "Hapus",
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
                        child:
                            Text("Apakah anda yakin untuk menghapus Bab ini?"),
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        children: [
                          Expanded(
                            child: FlatButton(
                                padding: const EdgeInsets.all(5.0),
                                child: Text("Batal"),
                                onPressed: () {
                                  Navigator.pop(context);
                                }),
                          ),
                          Expanded(
                            child: FlatButton(
                              padding: const EdgeInsets.all(5.0),
                              child: Text("Iya"),
                              onPressed: () async {
                                setState(() {
                                  isLoading = true;
                                });
                                final hapus = await http
                                    .post(url.Url.home + "deleteBab.php", body: {
                                  "id_bab": data['id_bab'],
                                });
                                if (hapus.body == "sukses") {
                                  Fluttertoast.showToast(msg: "Sukses menghapus");
                                  setState(() {
                                    isLoading = false;
                                  });
                                } else {
                                  Fluttertoast.showToast(msg: "Gagal menghapus");
                                  setState(() {
                                    isLoading = false;
                                  });
                                }
                                Navigator.pop(context);
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

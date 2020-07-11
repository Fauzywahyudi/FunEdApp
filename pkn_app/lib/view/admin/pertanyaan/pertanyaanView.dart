import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pkn_app/assets/assets.dart';
import 'package:http/http.dart' as http;
import 'package:pkn_app/models/bab.dart';
import 'package:pkn_app/server/url.dart' as url;
import 'package:pkn_app/view/admin/pertanyaan/add_pertanyaan.dart';
import 'package:pkn_app/view/admin/pertanyaan/view_demo.dart';

class PertanyaanView extends StatefulWidget {
  static const routeName = '/PertanyaanBab';
  @override
  _PertanyaanViewState createState() => _PertanyaanViewState();
}

class _PertanyaanViewState extends State<PertanyaanView> {
  bool isLoading = false;
  Bab _bab;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() { 
    super.initState();
  }

  aksiDismis(var data) {
    _requestConfirm(context, data);
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
      title: Text("Question"),
    );
  }

  Widget _buildFAB() {
    return FloatingActionButton(
      child: Icon(
        Icons.edit,
      ),
      tooltip: "Tambah Pertanyaan",
      onPressed: ()=>Navigator.pushNamed(context, '/AddPertanyaan',arguments: _bab)
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
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            _buildBab(snapshot.data[index],index),
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

  Widget _buildBab(var data, int index) {
    return Dismissible(
      key: ValueKey(data['id_pertanyaan']),
      confirmDismiss: (direction) {
        aksiDismis(data);
      },
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
          child: InkWell(
        onTap: ()
        => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DemoPertanyaan(
                data: data,
              ),
            )),
        onLongPress: () {},
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
                      "Soal ${index+1}",
                      textAlign: TextAlign.center,
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
                        child: Text("",
                          // data['nama_bab'],
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
    final result = await http.post(url.Url.home + "getPertanyaan.php", body: {
      'id_bab': _bab.getIdBab().toString(),
    });
    setState(() {
        
    });
    return json.decode(result.body);
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
                            Text("Apakah anda yakin untuk menghapus Pertanyaan ini?"),
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
                                // setState(() {
                                //   isLoading = true;
                                // });
                                final hapus = await http
                                    .post(url.Url.home + "deletePertanyaan.php", body: {
                                  "id_pertanyaan": data['id_pertanyaan'],
                                });
                                print(hapus.body);
                                Navigator.pop(context);
                                setState(() {
                                  
                                });
                                // if (hapus.body == "sukses") {
                                //   Fluttertoast.showToast(msg: "Sukses menghapus");
                                //   setState(() {
                                //     isLoading = false;
                                //   });
                                // } else {
                                //   Fluttertoast.showToast(msg: "Gagal menghapus");
                                //   setState(() {
                                //     isLoading = false;
                                //   });
                                // }
                                // setState(() {
                                //   isLoading = !isLoading;
                                // });
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
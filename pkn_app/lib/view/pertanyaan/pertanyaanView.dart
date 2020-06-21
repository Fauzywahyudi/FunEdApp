import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pkn_app/assets/assets.dart';
import 'package:http/http.dart' as http;
import 'package:pkn_app/server/url.dart' as url;
import 'package:pkn_app/view/pertanyaan/add_pertanyaan.dart';

class PertanyaanView extends StatefulWidget {
  @override
  _PertanyaanViewState createState() => _PertanyaanViewState();
}

class _PertanyaanViewState extends State<PertanyaanView> {
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
      title: Text("Pertanyaan"),
    );
  }

  Widget _buildFAB() {
    return FloatingActionButton(
      child: Icon(
        Icons.edit,
      ),
      tooltip: "Tambah Pertanyaan",
      onPressed: ()=>Navigator.pushNamed(context, '/AddPertanyaan')
    );
  }

  Widget _buildBody() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ListView.builder(
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
    );
  }

  Widget _buildBab(var data) {
    return InkWell(
      onTap: () {},
      // => Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => BabDescrib(
      //         data: data,
      //       ),
      //     )),
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
    );
  }

  Future<List> getData() async {
    final result = await http.post(url.Url.home + "getPertanyaan.php");
    if(mounted){
      setState(() {
        
      });
    }
    return json.decode(result.body);
  }
}
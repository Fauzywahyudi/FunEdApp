import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pkn_app/assets/assets.dart';
import 'package:http/http.dart' as http;
import 'package:pkn_app/models/bab.dart';
import 'package:pkn_app/server/url.dart' as url;
import 'package:pkn_app/view/admin/pertanyaan/pertanyaanView.dart';

class PertanyaanBab extends StatefulWidget {
  static const routeName = '/Pertanyaan';
  @override
  _PertanyaanBabState createState() => _PertanyaanBabState();
}

class _PertanyaanBabState extends State<PertanyaanBab> {
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      leading: backIos(Colors.white, context),
      title: Text("Pertanyaan"),
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
    Bab dataBab = Bab(int.parse(data['id_bab']), int.parse(data['bab']), data['nama_bab']);
    return InkWell(
      onTap: () => Navigator.pushNamed(context, PertanyaanView.routeName,arguments: dataBab),
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
    final result = await http.post(url.Url.home + "getBab.php");
    setState(() {});
    return json.decode(result.body);
  }

}
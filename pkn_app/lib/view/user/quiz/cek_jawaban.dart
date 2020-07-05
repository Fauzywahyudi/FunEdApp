import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:pkn_app/assets/assets.dart';
import 'package:pkn_app/models/hasil.dart';
import 'package:pkn_app/models/pertanyaan.dart';

class CekJawaban extends StatefulWidget {
  static const routeName = '/CekJawaban';

  @override
  _CekJawabanState createState() => _CekJawabanState();
}

class _CekJawabanState extends State<CekJawaban> {
  Hasil _hasil;
  bool isLoading = true;
  List _pilihanUser = List();

  @override
  void initState() {
    Timer(Duration(seconds: 1), () {
      setState(() {
        isLoading = false;
        _pilihanUser = json.decode(_hasil.getPilihan());
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Hasil args = ModalRoute.of(context).settings.arguments;
    setState(() {
      this._hasil = args;
    });
    return Scaffold(
      appBar: _buildAppBar(),
      // floatingActionButton: _buildFAB(),
      body: isLoading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : _buildBody(),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      elevation: 0,
      leading: backIos(Colors.white, context),
      title: Text("Hasil Quiz"),
    );
  }

  Widget _buildBody() {
    return Container(
      color: Colors.black12,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          ClipPath(
            clipper: WaveClipperTwo(),
            child: Container(
              decoration: BoxDecoration(color: Colors.deepPurple),
              height: 250,
            ),
          ),
          Container(
            child: FutureBuilder<List>(
              future: PertanyaanService().getJsonData(),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);
                return snapshot.hasData
                    ? ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return _itemCek(
                              snapshot.data[index], _pilihanUser[index]);
                        },
                      )
                    : Center(child: CircularProgressIndicator());
              },
            ),
          ),
          // Positioned(
          //     bottom: 10,
          //     right: 10,
          //     child: InkWell(
          //       onTap: (){
          //         Navigator.pushNamed(context, '/CekJawaban',arguments: _hasil);
          //       },
          //       borderRadius: BorderRadius.circular(20),
          //       child: Container(
          //         padding: EdgeInsets.all(10),
          //         decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(20),
          //             color: Colors.deepPurple),
          //         child: Row(
          //           children: [
          //             Icon(
          //               Icons.check,
          //               color: Colors.white,
          //             ),
          //             SizedBox(width: 15,),
          //             Text(
          //               "Cek Jawaban",
          //               style: TextStyle(color: Colors.white),
          //             )
          //           ],
          //         ),
          //       ),
          //     )),
        ],
      ),
    );
  }

  Widget _itemCek(var dataPertanyaan, String pilihanUser) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            dataPertanyaan['pertanyaan'],
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 17,
            ),
          ),
          SizedBox(height: 10),
          Text(
            pilihanUser,
            style: TextStyle(
                color: pilihanUser != dataPertanyaan['jawaban']
                    ? Colors.red
                    : Colors.green,
                fontSize: 17,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          pilihanUser != dataPertanyaan['jawaban']
              ? RichText(
                  text: TextSpan(
                    text: 'Jawaban : ',
                    style: TextStyle(fontSize: 17,color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                          text: dataPertanyaan['jawaban'],
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      
                    ],
                  ),
                )
              // Text("Jawaban : ${dataPertanyaan['jawaban']}", style: TextStyle(
              //   fontSize: 17,
              // ),)
              : Text("")
        ],
      ),
    );
  }
}

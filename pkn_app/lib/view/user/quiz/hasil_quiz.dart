import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:pkn_app/assets/assets.dart';
import 'package:pkn_app/models/hasil.dart';
import 'package:pkn_app/models/siswa.dart';

class HasilQuiz extends StatefulWidget {
  static const routeName = '/HasilQuiz';

  @override
  _HasilQuizState createState() => _HasilQuizState();
}

class _HasilQuizState extends State<HasilQuiz> {
  Siswa _siswa;
  Hasil _hasil;
  bool isLoading = true;

  Future getHasil()async{
    Hasil hasil = await HasilService().getNewHasil(_siswa.getId());
    setState(() {
      _hasil = hasil;
      isLoading = false;
    });
  }

  @override
  void initState() {
    Timer(Duration(seconds: 1), (){
      getHasil();
    });
    super.initState();
  }
  
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Siswa args = ModalRoute.of(context).settings.arguments;
    setState(() {
      this._siswa = args;
    });
    return Scaffold(
      appBar: _buildAppBar(),
      // floatingActionButton: _buildFAB(),
      body: isLoading?Container(child: Center(child: CircularProgressIndicator(),),): _buildBody(),
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
          SingleChildScrollView(
            child: Column(
              children: [
                _itemResult("Total Pertanyaan", _hasil.getJumPertanyaan().toString()),
                _itemResult("Nilai", "${_hasil.getJumBenar() / _hasil.getJumPertanyaan() * 100}%"),
                _itemResult("Jawaban Benar", _hasil.getJumBenar().toString()),
                _itemResult("Jawaban Salah", "${_hasil.getJumPertanyaan()-_hasil.getJumBenar()}"),
              ],
            ),
          ),
          Positioned(
              bottom: 10,
              left: 10,
              child: InkWell(
                onTap: ()=>Navigator.pop(context),
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.deepPurple),
                  child: Row(
                    children: [
                      Icon(
                        Icons.home,
                        color: Colors.white,
                      ),
                      SizedBox(width: 15,),
                      Text(
                        "Home",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              )),
          Positioned(
              bottom: 10,
              right: 10,
              child: InkWell(
                onTap: (){},
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.deepPurple),
                  child: Row(
                    children: [
                      Icon(
                        Icons.check,
                        color: Colors.white,
                      ),
                      SizedBox(width: 15,),
                      Text(
                        "Cek Jawaban",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }

  Widget _itemResult(String title, String value) {
    return Container(
      decoration: BoxDecoration(

        color: Colors.white,
        borderRadius: BorderRadius.circular(20)
      ),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(title,style: TextStyle(fontSize: 17),), Text(value,style: TextStyle(fontSize: 17, color: Colors.deepOrange))],
        ));
  }
}

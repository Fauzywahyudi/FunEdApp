import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:pkn_app/assets/assets.dart';
import 'package:pkn_app/models/hasil.dart';
import 'package:pkn_app/models/pertanyaan.dart';
import 'package:pkn_app/models/siswa.dart';
import 'package:pkn_app/view/user/quiz/hasil_quiz.dart';

class Quiz extends StatefulWidget {
  static const routeName = '/Quiz';
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Siswa _siswa;
  List<bool> _selected = List.generate(20, (i) => false);
  bool isPrepare = true;
  int _jumlahSoal = 0;
  int _currentSoal = 0;
  int _jumlahBenar = 0;
  List<Pertanyaan> pertanyaanList;
  Pertanyaan _currentPertanyaan;
  List _currentOpsi;
  bool isLoading = false;
  String _currentPilihan = "";
  String _currentIdPertanyaan = "";
  String _currentKunci = "";
  List<String> _pilihUser = List<String>();
  List<String> _idPertanyaan = List<String>();

  

  getPertanyaan() async {
    pertanyaanList = await PertanyaanService().getAll();
    setState(() {
      _jumlahSoal = pertanyaanList.length;
    });
  }

  setOpsi() {
    setState(() {
      _currentPertanyaan = pertanyaanList[_currentSoal];
      _currentOpsi = json.decode(_currentPertanyaan.getOpsi());
      _currentOpsi.shuffle();
    });
  }

  Future insert()async{
    await HasilService().insertHasil(_siswa.getId(), json.encode(_idPertanyaan), json.encode(_pilihUser),_jumlahSoal, _jumlahBenar);
  }



  @override
  void initState() {
    getPertanyaan();
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
      appBar: isPrepare ? _buildAppBar() : _buildAppBarQuiz(),
      floatingActionButton: isPrepare ? _buildFABPrepare() : null,
      body: isPrepare ? _buildBodyPrepare() : _buildBodyQuiz(),
    );
  }

  Widget _buildFABQuiz() {
    return FloatingActionButton.extended(
      backgroundColor: Colors.deepOrange,
      elevation: 10,
      onPressed: () {
        setState(()  {
          if (_currentPilihan!="") {
            _pilihUser.add(_currentPilihan);
            _idPertanyaan.add(_currentIdPertanyaan);
            if(_currentPilihan==_currentKunci){
              _jumlahBenar++;
            }
            if (_currentSoal < _jumlahSoal - 1) {
              _currentSoal++;
              setOpsi();
              _selected = List.generate(20, (i) => false);
              _currentPilihan="";
              _currentIdPertanyaan="";
              _currentKunci="";
            } else {
              insert();
              Navigator.pushReplacementNamed(context, HasilQuiz.routeName,arguments: _siswa);
            }
          }else{
            Fluttertoast.showToast(msg: "Silahkan pilih jawaban!");
          }
        });
      },
      label: Text("${_currentSoal + 1 == _jumlahSoal ? "Finish" : "Next"}"),
      icon: _currentSoal + 1 == _jumlahSoal
          ? Icon(Icons.done)
          : Icon(Icons.arrow_forward_ios),
    );
  }

  Widget _buildFABPrepare() {
    return FloatingActionButton.extended(
      backgroundColor: Colors.deepOrange,
      onPressed: () {
        setState(() {
          isPrepare = false;
          isLoading = true;
          setOpsi();
          isLoading = false;
        });
      },
      label: Text("Mulai Quiz"),
      icon: Icon(FontAwesomeIcons.play),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      elevation: 0,
      leading: backIos(Colors.white, context),
      title: Text("Quiz"),
    );
  }

  Widget _buildAppBarQuiz() {
    return AppBar(
      elevation: 0,
      leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
          onPressed: () {
            _requestData(context);
          }),
      title: Text("Mulai : ${_currentSoal + 1} dari $_jumlahSoal Soal"),
    );
  }

  Widget _buildBodyPrepare() {
    return Container(
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
                Container(
                    // child: ListTile(
                    //   title: ,
                    // ),
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBodyQuiz() {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.black12,
      child: isLoading
          ? Container()
          : Stack(
              children: [
                ClipPath(
                  clipper: WaveClipperTwo(),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.deepPurple),
                    height: 250,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: ListTile(
                      title: Text(
                    _currentPertanyaan.getPertanyaan(),
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  )),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  margin: EdgeInsets.only(top: 250),
                  child: ListView.builder(
                    itemCount: _currentOpsi.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: _selected[index]
                              ? Colors.deepPurple.withOpacity(0.5)
                              : Colors.deepPurple.withOpacity(0.2),
                        ),
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child: ListTile(
                          title: Text(
                            _currentOpsi[index],
                            textAlign: TextAlign.justify,
                          ),
                          onTap: () {
                            setState(() {
                              _selected = List.generate(20, (i) => false);
                              _selected[index] = !_selected[index];
                              _currentPilihan = _currentOpsi[index];
                              _currentIdPertanyaan = _currentPertanyaan.getId()
                              .toString();
                              _currentKunci = _currentPertanyaan.getJawaban();
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
                Positioned(right: 10, top: 180, child: _buildFABQuiz()),
              ],
            ),
    );
  }

  _requestData(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return buildDialogRequest(context, _siswa.getNama());
      },
    );
  }

  Widget buildDialogRequest(BuildContext context, String nama) {
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
                      Icons.exit_to_app,
                      size: 30,
                      color: Colors.deepPurple,
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: Text(
                        "Keluar",
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
                  child: Text("$nama, Apakah anda yakin untuk keluar?"),
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
                        child: Text("Keluar"),
                        onPressed: () {
                          Navigator.pop(context);
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

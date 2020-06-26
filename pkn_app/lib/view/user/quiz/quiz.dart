import 'dart:async';
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
import 'package:http/http.dart' as http;
import 'package:pkn_app/server/url.dart' as url;

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

  Future<List> getHistory() async {
    final result = await http.post(url.Url.home + "getHistorySiswa.php", body: {
      "id_siswa": _siswa.getId().toString(),
    });
    return json.decode(result.body);
  }

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

  String hitung(String benar, String soal)=>(int.parse(benar) / int.parse(soal)*100).toString();

  Future insert() async {
    await HasilService().insertHasil(_siswa.getId(), json.encode(_idPertanyaan),
        json.encode(_pilihUser), _jumlahSoal, _jumlahBenar);
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

  String formatDate(String strDate){
    DateTime date = DateTime.parse(strDate);
    int year = date.year;
    int month = date.month;
    int day = date.day;
    String jam = date.hour.toString()+":"+date.minute.toString()+":"+date.second.toString();

    String result = day.toString()+"-"+month.toString()+"-"+year.toString()+" "+jam;

    return result;
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
        setState(() {
          if (_currentPilihan != "") {
            _pilihUser.add(_currentPilihan);
            _idPertanyaan.add(_currentIdPertanyaan);
            if (_currentPilihan == _currentKunci) {
              _jumlahBenar++;
            }
            if (_currentSoal < _jumlahSoal - 1) {
              _currentSoal++;
              setOpsi();
              _selected = List.generate(20, (i) => false);
              _currentPilihan = "";
              _currentIdPertanyaan = "";
              _currentKunci = "";
            } else {
              insert();
              Navigator.pushReplacementNamed(context, HasilQuiz.routeName,
                  arguments: _siswa);
            }
          } else {
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
      color: Colors.black12,
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
                SizedBox(height: 10,),
                Row(
                  children: [
                    Expanded(child: Center(child: Text("History Quiz",style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold)))),
                    Center(child: Text("3 Terakhir",style: TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.bold))),
                    SizedBox(width: 10,)
                  ],
                ),
                SizedBox(height: 10,),
                Container(
                  height: MediaQuery.of(context).size.height,
                    child: FutureBuilder<List>(
                  future: getHistory(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) print(snapshot.error);
                    return snapshot.hasData
                        ? ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              return Container(
                                decoration: BoxDecoration(

                                color: Colors.white.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(20),
                                ),
                                padding: EdgeInsets.symmetric(vertical: 5),
                                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                                child: ListTile(
                                  leading: Container(
                                    height: 65,
                                    width: 65,
                                    decoration: BoxDecoration(
                                      color: Colors.deepOrange,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(child: Text("${index+1}",style: TextStyle(color: Colors.white,fontSize: 18),))
                                  ),
                                  subtitle: Text(formatDate(snapshot.data[index]['tgl_selesai']),style: TextStyle(
                                    color: Colors.deepOrange
                                  ),),
                                  title: Text("Nilai : ${hitung(snapshot.data[index]['pilihan_benar'],snapshot.data[index]['jumlah_pertanyaan'])}",style: TextStyle(
                                    color: Colors.deepPurple, fontWeight: FontWeight.bold)
                                  ),
                                  trailing: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text("Benar",style: TextStyle(
                                    color: Colors.deepPurple, fontWeight: FontWeight.bold,fontSize: 17)),
                                      Text("${snapshot.data[index]['pilihan_benar'] +" dari " +snapshot.data[index]['jumlah_pertanyaan']}",style: TextStyle(
                                    color: Colors.deepPurple, fontWeight: FontWeight.bold,fontSize: 17))
                                    ],
                                  ),
                                ),
                              );
                            },
                          )
                        : Center(child: CircularProgressIndicator());
                  },
                )),
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
                              _currentIdPertanyaan =
                                  _currentPertanyaan.getId().toString();
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

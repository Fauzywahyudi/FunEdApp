import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pkn_app/server/url.dart' as url;

class Pertanyaan{

  int _idPertanyaan;
  String _pertanyaan;
  String _jawaban;
  String _opsi;
  String _pilihanUser;

  Pertanyaan(int id, String pertanyaan, String jawaban, String opsi){
    this._idPertanyaan = id;
    this._pertanyaan = pertanyaan;
    this._jawaban = jawaban;
    this._opsi = opsi;
  }

  void setPilihan(String pilih)=>this._pilihanUser = pilih;
  int getId()=>this._idPertanyaan;
  String getPertanyaan()=>this._pertanyaan;
  String getJawaban()=>this._jawaban;
  String getOpsi()=>this._opsi;
  String getPilihanUser()=>this._pilihanUser;

}

class PertanyaanService{

  Future<List<Pertanyaan>> getAll() async {
    final result = await http.post(url.Url.home + "getAllPertanyaan.php");
    List data = json.decode(result.body);
    List<Pertanyaan> pertanyaanList = List<Pertanyaan>();
    Pertanyaan pertanyaan;
    for (var i = 0; i < data.length; i++) {
      pertanyaan = Pertanyaan(
        int.parse(data[i]['id_pertanyaan']),
        data[i]['pertanyaan'], 
        data[i]['jawaban'], 
        data[i]['opsi']);
        pertanyaanList.add(pertanyaan);
    }
    return pertanyaanList;
  }

  

}
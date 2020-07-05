import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pkn_app/models/bab.dart';
import 'package:pkn_app/server/url.dart' as url;

class Pertanyaan extends Bab{

  int _idPertanyaan;
  String _pertanyaan;
  String _jawaban;
  String _opsi;
  String _pilihanUser;

  Pertanyaan(this._idPertanyaan, this._pertanyaan, this._jawaban, this._opsi, int idBab, int bab, String namaBab) 
  : super(idBab, bab, namaBab);

  void setPilihan(String pilih)=>this._pilihanUser = pilih;
  int getId()=>this._idPertanyaan;
  String getPertanyaan()=>this._pertanyaan;
  String getJawaban()=>this._jawaban;
  String getOpsi()=>this._opsi;
  String getPilihanUser()=>this._pilihanUser;

}

class PertanyaanService{

  Future<List<Pertanyaan>> getAll(String id) async {
    final result = await http.post(url.Url.home + "getAllPertanyaan.php" ,body: {
      'id_bab': id,
    });
    List data = json.decode(result.body);
    List<Pertanyaan> pertanyaanList = List<Pertanyaan>();
    Pertanyaan pertanyaan;
    for (var i = 0; i < data.length; i++) {
      pertanyaan = Pertanyaan(
        int.parse(data[i]['id_pertanyaan']),
        data[i]['pertanyaan'], 
        data[i]['jawaban'], 
        data[i]['opsi'],
        int.parse(data[i]['id_bab']),
        int.parse(data[i]['bab']),
        data[i]['nama_bab'],
        );
        pertanyaanList.add(pertanyaan);
    }
    return pertanyaanList;
  }

  Future<List> getJsonData(String id)async{
    final result = await http.post(url.Url.home + "getAllPertanyaan.php",body: {
      'id_bab': id,
    });
    return json.decode(result.body);
  }



  

}
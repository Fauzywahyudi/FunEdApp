import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pkn_app/server/url.dart' as url;

class Hasil{

  int _idHasil;
  int _idSiswa;
  String _pertanyaan;
  String _pilihan;
  int _jumPertanyaan;
  int _jumBenar;
  String _tanggal;

  Hasil(this._idHasil, this._idSiswa, this._pertanyaan, this._pilihan, this._jumPertanyaan, this._jumBenar, this._tanggal);

  int getIdHasil()=>this._idHasil;
  int getIdSiswa()=>this._idSiswa;
  String getPertanyaan()=>this._pertanyaan;
  String getPilihan()=>this._pilihan;
  int getJumPertanyaan()=>this._jumPertanyaan;
  int getJumBenar()=>this._jumBenar;
  String getTanggal()=>this._tanggal;

}

class HasilService{

  Future insertHasil(int idSiswa, String listIdPertanyaan, String listPilihan, int jumPertanyaan, int jumBenar)async{
    await http.post(url.Url.home+"insertHasil.php",body: {
      "id_siswa" : idSiswa.toString(),
      "pertanyaan" : listIdPertanyaan,
      "pilihan" : listPilihan,
      "jumlah_pertanyaan" : jumPertanyaan.toString(),
      "jumlah_benar" : jumBenar.toString(),
    });
  }

  Future<Hasil> getNewHasil(int idSiswa)async{
    final result = await http.post(url.Url.home+"getNewHasilById.php",body: {
      "id_siswa" : idSiswa.toString(),
    });
    List data = json.decode(result.body);
    Hasil hasil = Hasil(int.parse(data[0]['id_hasil']),
    int.parse(data[0]['id_siswa']),
    data[0]['pertanyaan'], 
    data[0]['pilihan'], 
    int.parse(data[0]['jumlah_pertanyaan'],),
    int.parse(data[0]['pilihan_benar']),
    data[0]['tgl_selesai']);
    return hasil;
  }

}
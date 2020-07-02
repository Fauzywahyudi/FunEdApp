import 'package:http/http.dart' as http;
import 'package:pkn_app/server/url.dart' as url;

class Bab {
  int idBab;
  int bab;
  String namaBab;

  Bab(int idBab, int bab, String namaBab) {
    this.idBab = idBab;
    this.bab = bab;
    this.namaBab = namaBab;
  }

  int getIdBab() => this.idBab;
  int getBab() => this.bab;
  String getNamaBab() => this.namaBab;

  setIdBab(int id) => this.idBab = id;
  setBab(int bab) => this.bab = bab;
  setNamaBab(String nama) => this.namaBab = nama;
}

class BabService {
  Future update(int id, String bab, String nama) async {
    final result = await http.post(url.Url.home + "editBab.php", body: {
      "id_bab": id.toString(),
      "bab" : bab,
      "nama_bab" : nama,
    });
    return result.body;
  }
}

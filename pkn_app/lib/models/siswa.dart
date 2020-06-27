import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pkn_app/server/url.dart' as url;

class Siswa {
  int _id;
  String _nis;
  String _password;
  String _nama;
  String _jk;
  String _kelas;
  String _jurusan;

  Siswa(int id, String nis, String password, String nama, String jk,
      String kelas, String jurusan) {
    this._id = id;
    this._nis = nis;
    this._password = password;
    this._nama = nama;
    this._jk = jk;
    this._kelas = kelas;
    this._jurusan = jurusan;
  }

  int getId() => this._id;
  String getNis() => this._nis;
  String getPassword() => this._password;
  String getNama() => this._nama;
  String getJk() => this._jk;
  String getKelas() => this._kelas;
  String getJurusan() => this._jurusan;
}

class SiswaService {
  Future<Siswa> getById(String id) async {
    final result = await http.post(url.Url.home + "getUserById.php", body: {
      "id": id,
    });
    List data = json.decode(result.body);
    Siswa siswa = Siswa(
        int.parse(data[0]['id_siswa']),
        data[0]['nis'],
        data[0]['password'],
        data[0]['nama'],
        data[0]['jk'],
        data[0]['kelas'],
        data[0]['jurusan']);
    return siswa;
  }

  Future<Siswa> getByNis(String nis, String pass) async {
    final result = await http.post(url.Url.home + "loginUser.php", body: {
      "nisn": nis,
      "password": pass,
    });
    print(result.statusCode);
    List data = json.decode(result.body);
    Siswa siswa = Siswa(
        int.parse(data[0]['id_siswa']),
        data[0]['nis'],
        data[0]['password'],
        data[0]['nama'],
        data[0]['jk'],
        data[0]['kelas'],
        data[0]['jurusan']);
    return siswa;
  }

  Future updateData(Siswa siswa) async {
    try {
      final result = await http.post(url.Url.home + "updateProfil.php", body: {
      'id': siswa.getId().toString(),
      'nisn': siswa.getNis(),
      'nama': siswa.getNama(),
      'jk': siswa.getJk(),
      'kelas': siswa.getKelas(),
      'jurusan': siswa.getJurusan(),
    });
    print(result.body);
    } catch (e) {
      print("gagal update");
    }
  }
}

import 'package:flutter/material.dart';
import 'package:pkn_app/assets/assets.dart';
import 'package:pkn_app/models/siswa.dart';
import 'package:pkn_app/server/url.dart' as url;

class ProfilUser extends StatefulWidget {
  static const routeName = '/ProfilUser';

  @override
  _ProfilUserState createState() => _ProfilUserState();
}

class _ProfilUserState extends State<ProfilUser> {
  Siswa _siswa;
  var style = TextStyle(fontWeight: FontWeight.bold);

  @override
  void initState() {
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
      floatingActionButton: _buildFAB(),
      body: _buildBody(),
    );
  }

  Widget _buildFAB() {
    return FloatingActionButton(
        child: Icon(Icons.edit),
        tooltip: "Edit Profil",
        onPressed: () {
          Navigator.pushNamed(context, "/EditProfil",arguments: this._siswa);
        });
  }

  Widget _buildAppBar() {
    return AppBar(
      leading: backIos(Colors.white, context),
      title: Text("Profil"),
    );
  }

  Widget _buildBody() {
    return Container(
      child: Stack(
        children: [
          Container(
              width: MediaQuery.of(context).size.width,
              // padding: EdgeInsets.all(10),
              child: Image.asset(
                url.Url.assetImage + "pancasilaOpacity.jpeg",
                fit: BoxFit.fill,
              )),
          ListView(
            children: [
              _itemData(this._siswa.getNis(), "NISN"),
              _itemData(this._siswa.getNama(), "Nama Lengkap"),
              _itemData(this._siswa.getJk(), "Jenis Kelamin"),
              _itemData(this._siswa.getKelas(), "Kelas"),
              _itemData(this._siswa.getJurusan(), "Jurusan"),
            ],
          ),
        ],
      ),
    );
  }

  _itemData(String title, String subtitle) {
    if (title == null) title = "-";
    return ListTile(
      title: Text(title,style: style),
      subtitle: Text(subtitle),
    );
  }
}

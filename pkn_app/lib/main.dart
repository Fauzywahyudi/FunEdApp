import 'package:flutter/material.dart';
import 'package:pkn_app/models/siswa.dart';
import 'package:pkn_app/view/html/home.dart';
import 'package:pkn_app/view/admin/login_admin.dart';
import 'package:pkn_app/view/admin/materi_view.dart';
import 'package:pkn_app/view/admin/home_admin.dart';
import 'package:pkn_app/view/admin/pertanyaan/add_pertanyaan.dart';
import 'package:pkn_app/view/quiz.dart';
import 'package:pkn_app/view/admin/pertanyaan/pertanyaanView.dart';
import 'package:pkn_app/view/user/edit_profil.dart';
import 'package:pkn_app/view/user/home_user.dart';
import 'package:pkn_app/view/user/login_user.dart';
import 'package:pkn_app/view/user/materi_pelajaran.dart';
import 'package:pkn_app/view/user/profil_user.dart';
import 'package:pkn_app/view/user/quiz.dart';
import 'package:pkn_app/view/user/register.dart';
import 'package:pkn_app/view/utils/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PKN Review',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        // User
        LoginUser.routeName: (context) => LoginUser(),
        HomeUser.routeName: (context) => HomeUser(),
        MateriPelajaran.routeName: (context) => MateriPelajaran(),
        Quiz.routeName: (context) => Quiz(),
        Register.routeName: (context) => Register(),
        ProfilUser.routeName: (context) =>ProfilUser(),
        EditProfil.routeName: (context) =>EditProfil(),

        // Admin
        LoginAdmin.routeName: (context) => LoginAdmin(),
        HomeAdmin.routeName: (context) => HomeAdmin(),
        MateriView.routeName: (context) => MateriView(),
        PertanyaanView.routeName: (context) => PertanyaanView(),
        AddPertanyaan.routeName: (context) => AddPertanyaan(),
      },
      home: SplashScreen(),
    );
  }
}

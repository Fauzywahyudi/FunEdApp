import 'package:flutter/material.dart';
import 'package:pkn_app/view/admin/about/about_admin.dart';
import 'package:pkn_app/view/admin/about/edit_about.dart';
import 'package:pkn_app/view/admin/login_admin.dart';
import 'package:pkn_app/view/admin/materi/edit_bab.dart';
import 'package:pkn_app/view/admin/materi/materi_view.dart';
import 'package:pkn_app/view/admin/home_admin.dart';
import 'package:pkn_app/view/admin/pertanyaan/add_pertanyaan.dart';
import 'package:pkn_app/view/admin/pertanyaan/pertanyaanView.dart';
import 'package:pkn_app/view/admin/petunjuk/petunjuk_admin.dart';
import 'package:pkn_app/view/html/tesText.dart';
import 'package:pkn_app/view/user/about.dart';
import 'package:pkn_app/view/user/guide.dart';
import 'package:pkn_app/view/user/materi_view.dart';
import 'package:pkn_app/view/user/profil/edit_profil.dart';
import 'package:pkn_app/view/user/home_user.dart';
import 'package:pkn_app/view/user/login_user.dart';
// import 'package:pkn_app/view/user/materi_pelajaran.dart';
import 'package:pkn_app/view/user/profil/profil_user.dart';
import 'package:pkn_app/view/user/quiz/cek_jawaban.dart';
import 'package:pkn_app/view/user/quiz/hasil_quiz.dart';
import 'package:pkn_app/view/user/quiz/quiz.dart';
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
        Register.routeName: (context) => Register(),
        HomeUser.routeName: (context) => HomeUser(),
        MateriPelajaran.routeName: (context) => MateriPelajaran(),
        Quiz.routeName: (context) => Quiz(),
        HasilQuiz.routeName: (context) => HasilQuiz(),
        CekJawaban.routeName: (context) =>CekJawaban(),
        ProfilUser.routeName: (context) =>ProfilUser(),
        EditProfil.routeName: (context) =>EditProfil(),
        About.routeName: (context) => About(),
        Guide.routeName: (context) => Guide(),

        // Admin
        LoginAdmin.routeName: (context) => LoginAdmin(),
        HomeAdmin.routeName: (context) => HomeAdmin(),
        MateriView.routeName: (context) => MateriView(),
        EditBab.routeName: (context) => EditBab(),
        PertanyaanView.routeName: (context) => PertanyaanView(),
        AddPertanyaan.routeName: (context) => AddPertanyaan(),
        AboutAdmin.routeName: (context) =>AboutAdmin(),
        EditAbout.routeName: (context) =>EditAbout(),
        PetunjukAdmin.routeName: (context) => PetunjukAdmin(),
      },
      home: SplashScreen(),
    );
  }
}

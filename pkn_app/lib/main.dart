import 'package:flutter/material.dart';
import 'package:pkn_app/view/html/home.dart';
import 'package:pkn_app/view/login.dart';
import 'package:pkn_app/view/materi.dart';
import 'package:pkn_app/view/newHome.dart';
import 'package:pkn_app/view/pertanyaan/add_pertanyaan.dart';
import 'package:pkn_app/view/quiz.dart';
import 'package:pkn_app/view/pertanyaan/pertanyaanView.dart';

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
      routes: <String, WidgetBuilder>{
        '/Login' : (BuildContext context) => new LoginPage(),
        '/Home' : (BuildContext context) => new QuizHomePage(),
        '/Materi' : (BuildContext context) => new MateriView(),
        '/Quiz' : (BuildContext context) => new QuizView(),
        '/Pertanyaan' : (BuildContext context) => new PertanyaanView(),
        '/AddPertanyaan' : (BuildContext context) => new AddPertanyaan(),
        // '/Tambah_Materi' : (BuildContext context) => new TambahMateri(),
      },
      home: LoginPage(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pkn_app/view/login.dart';
import 'package:pkn_app/view/materi.dart';
import 'package:pkn_app/view/newHome.dart';
import 'package:pkn_app/view/quiz.dart';

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
        '/home' : (BuildContext context) => new QuizHomePage(),
        '/Materi' : (BuildContext context) => new MateriView(),
        '/Quiz' : (BuildContext context) => new QuizView(),
        // '/Tambah_Materi' : (BuildContext context) => new TambahMateri(),
      },
      home: LoginPage(),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer(Duration(seconds: 3), ()=>Navigator.pushReplacementNamed(context, "/LoginUser") );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [
            Colors.white,
            Colors.deepPurple[100],
            Colors.white,
            Colors.deepPurple[100]
          ]
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Hero(
                tag: "logo",
                child: Image.asset("assets/images/logo.png",fit: BoxFit.fill,)),
            )

          ],
        ),
      ),
    );
  }
}
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pkn_app/view/user/login_user.dart';
import 'package:pkn_app/server/url.dart' as url;

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer(Duration(seconds: 3), ()=>Navigator.pushReplacementNamed(context, LoginUser.routeName) );
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
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
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
                child: Image.asset(url.Url.assetImage+"logo.png",fit: BoxFit.fill,)),
            )

          ],
        ),
      ),
    );
  }
}
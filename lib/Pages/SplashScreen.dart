import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:spyveb_flutter_demo1/Controllers/SplashController.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends StateMVC<SplashScreen> {
  SplashController _con;

  _SplashState() : super(SplashController()) {
    _con = controller;
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: () => Future.value(false),
        child: Scaffold(
          key: _con.scaffoldKey,
          body: Container(
            child: Center(
              child: Image.asset("assets/images/logo.png"),
            ),
          ),
        ));
  }
}

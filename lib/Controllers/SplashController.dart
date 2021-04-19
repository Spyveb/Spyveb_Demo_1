import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spyveb_flutter_demo1/Helper/GlobalVariable.dart';

class SplashController extends ControllerMVC {
  GlobalKey<ScaffoldState> scaffoldKey;

  SplashController() {
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
    Future.delayed(const Duration(milliseconds: 300), () async {
      _getLoginStatus();
    });
  }

  _getLoginStatus() async {
    Future.delayed(const Duration(seconds: 4), () async {
      SharedPreferences pref = await SharedPreferences.getInstance();
      if (pref.containsKey(GlobalVariable.ISLOGIN)) {
        if (pref.getBool(GlobalVariable.ISLOGIN)) {
          Navigator.pushNamedAndRemoveUntil(this.scaffoldKey.currentContext,
              '/PhotoFeedsScreen', (route) => false);
        }
      } else {
        Navigator.pushNamedAndRemoveUntil(this.scaffoldKey.currentContext,
            '/SocialLoginScreen', (route) => false);
      }
    });
  }
}

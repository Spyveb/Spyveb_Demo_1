import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:spyveb_flutter_demo1/Controllers/LoginController.dart';
import 'package:spyveb_flutter_demo1/Helper/Helper.dart';

class SocialLoginScreen extends StatefulWidget {
  @override
  _SocialLoginState createState() => _SocialLoginState();
}

class _SocialLoginState extends StateMVC<SocialLoginScreen> {
  LoginController _con;

  _SocialLoginState() : super(LoginController()) {
    _con = controller;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _con.scaffoldKey,
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height / 2.9,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(top: 25, left: 25, right: 25),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[400],
                    spreadRadius: 4,
                    blurRadius: 10 //edited
                    ),
              ],
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    _con.signInWithFacebook().then((value) => {
                          if (value != null)
                            {
                              _con.sendData.appId = value.user.uid,
                              _con.sendData.deviceToken =
                                  "hjhsdfdfjdhsfhkjdshfk",
                              _con.sendData.image = value.user.photoURL,
                              _con.sendData.emailId = value.user.email,
                              _con.sendData.userType = "photographer",
                              _con.sendData.registerType = "facebook",
                              _con.LoginCall(),
                            }
                        });
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                        left: 25, right: 25, top: 25, bottom: 25),
                    child: Image.asset(
                      "assets/images/facebook_login.png",
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    "OR",
                    style: TextStyle(
                      color: Helper.hexToColor("#444444"),
                      fontWeight: FontWeight.w700,
                      fontSize: 26,
                    ).apply(fontWeightDelta: 2),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _con.signInWithGoogle().then((value) => {
                          if (value != null)
                            {
                              _con.sendData.appId = value.user.uid,
                              _con.sendData.deviceToken = "jhsdfjsdkjhkjsfd",
                              _con.sendData.image = value.user.photoURL,
                              _con.sendData.emailId = value.user.email,
                              _con.sendData.userType = "photographer",
                              _con.sendData.registerType = "google",
                              _con.LoginCall(),
                            }
                        });
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                        left: 25, right: 25, top: 25, bottom: 25),
                    child: Image.asset(
                      "assets/images/google_login.png",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

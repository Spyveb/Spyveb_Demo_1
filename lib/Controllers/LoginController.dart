import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:spyveb_flutter_demo1/Helper/Helper.dart';
import 'package:spyveb_flutter_demo1/Models/Login.dart';
import 'package:spyveb_flutter_demo1/Repository/LoginRepository.dart'
    as repository;

class LoginController extends ControllerMVC {
  GlobalKey<ScaffoldState> scaffoldKey;
  OverlayEntry loader;
  Login sendData = new Login();

  LoginController() {
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
    loader = Helper.overlayLoader(this.scaffoldKey.currentContext);
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult result = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final FacebookAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(result.accessToken.token);

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential);
  }

  void LoginCall() {
    FocusScope.of(this.scaffoldKey.currentContext).unfocus();
    Overlay.of(this.scaffoldKey.currentContext).insert(loader);
    Helper.isConnect().then((value) => {
          if (value != null && value)
            {
              repository.LoginUser(this.sendData)
                  .then((value) => {
                        if (value != null)
                          {
                            Navigator.pushNamedAndRemoveUntil(
                                this.scaffoldKey.currentContext,
                                '/PhotoFeedsScreen',
                                (route) => false),
                          },
                        loader.remove(),
                      })
                  .catchError((e) {
                print(e);
                Helper.showToast("Something went wrong");
              }).whenComplete(() {
                Helper.hideLoader(loader);
              })
            }
          else
            {
              loader.remove(),
              Helper.showToast("No Internet Connection"),
            }
        });
  }
}

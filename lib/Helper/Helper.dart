import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'CircularLoadingWidget.dart';

class Helper {
  BuildContext context;

  Helper.of(BuildContext context) {
    this.context = context;
  }

  /// function is use for String-hex to Color code
  static Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  static OverlayEntry overlayLoader(context) {
    OverlayEntry loader = OverlayEntry(builder: (context) {
      final size = MediaQuery.of(context).size;
      return Positioned(
        height: size.height,
        width: size.width,
        top: 0,
        left: 0,
        child: Material(
          color: Theme.of(context).backgroundColor.withOpacity(0.40),
          child: CircularLoadingWidget(height: 200),
        ),
      );
    });
    return loader;
  }

  static hideLoader(OverlayEntry loader) {
    Timer(Duration(milliseconds: 500), () {
      try {
        loader?.remove();
      } catch (e) {}
    });
  }

  static Future<bool> isConnect() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }

  static void showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        timeInSecForIosWeb: 5,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM);
  }
}
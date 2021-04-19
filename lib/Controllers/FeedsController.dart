import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spyveb_flutter_demo1/Helper/GlobalVariable.dart';
import 'package:spyveb_flutter_demo1/Helper/Helper.dart';
import 'package:spyveb_flutter_demo1/Models/Feeds.dart';
import 'package:spyveb_flutter_demo1/Repository/FeedsRepository.dart'
    as repository;

class FeedsController extends ControllerMVC {
  GlobalKey<ScaffoldState> scaffoldKey;
  OverlayEntry loader;
  Feeds sendData = new Feeds();
  List<Feeds> feed_list = new List();

  FeedsController() {
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
    loader = Helper.overlayLoader(this.scaffoldKey.currentContext);
    Future.delayed(const Duration(milliseconds: 300), () async {
      getFeeds("");
    });
  }

  void getFeeds([String id]) async {
    FocusScope.of(this.scaffoldKey.currentContext).unfocus();
    Overlay.of(this.scaffoldKey.currentContext).insert(loader);
    SharedPreferences pref = await SharedPreferences.getInstance();
    sendData.user_id = pref.getString(GlobalVariable.USERID);
    sendData.category_id = id;
    Helper.isConnect().then((value) => {
          if (value != null && value)
            {
              repository
                  .getFeedsList(sendData)
                  .then((value) => {
                        if (value != null)
                          {
                            feed_list = new List(),
                            feed_list.addAll(value),
                            setState(() {}),
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

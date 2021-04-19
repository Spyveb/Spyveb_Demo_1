import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:spyveb_flutter_demo1/Controllers/FeedsController.dart';
import 'package:spyveb_flutter_demo1/Models/Feeds.dart';
import 'package:spyveb_flutter_demo1/Widgets/FeedsView.dart';

class PhotoFeedsScreen extends StatefulWidget {
  @override
  _PhotoFeedsState createState() => _PhotoFeedsState();
}

class _PhotoFeedsState extends StateMVC<PhotoFeedsScreen> {
  FeedsController _con;

  _PhotoFeedsState() : super(FeedsController()) {
    _con = controller;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _con.scaffoldKey,
      backgroundColor: Theme.of(context).backgroundColor,
      body: _con.feed_list.length > 0
          ? SafeArea(
              child: Container(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.only(bottom: 90),
                  shrinkWrap: true,
                  itemBuilder: (_, int index) =>
                      FeedsViews(_con.feed_list[index], _con),
                  itemCount: _con.feed_list.length,
                ),
              ),
            )
          : Container(),
    );
  }
}

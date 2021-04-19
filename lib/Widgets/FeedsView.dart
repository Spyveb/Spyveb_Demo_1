import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:spyveb_flutter_demo1/Controllers/FeedsController.dart';
import 'package:spyveb_flutter_demo1/Models/Feeds.dart';

class FeedsViews extends StatefulWidget {
  Feeds data;
  FeedsController _con;

  FeedsViews(Feeds feed_list, FeedsController con) {
    data = feed_list;
    this._con = con;
  }

  @override
  _FeedState createState() => _FeedState(data);
}

class _FeedState extends StateMVC<FeedsViews> {
  Feeds data;

  _FeedState(Feeds data) {
    this.data = data;
  }

  var platform;

  @override
  Widget build(BuildContext context) {
    platform = Theme.of(context).platform;
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(top: 20, left: 10, right: 10),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: CachedNetworkImage(
                        imageUrl: data.user_image == ""
                            ? 'https://www.minervastrategies.com/wp-content/uploads/2016/03/default-avatar.jpg'
                            : data.user_image,
                        fit: BoxFit.cover,
                        placeholder: (context, url) {
                          return Image.asset("assets/images/loading.gif");
                        },
                        errorWidget: (context, url, error) =>
                        new Icon(Icons.error),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            child: Text(
                              data.user_name,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )),
                        Container(
                            margin: EdgeInsets.only(top: 3),
                            child: Text(
                              "Followers ${data.my_follower_count == "0" ? "0" : data.my_follower_count}",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            )),
                      ],
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    alignment: Alignment.center, // This is needed
                    child: Image.asset(
                      data.isSave
                          ? "assets/images/unsave_button.png"
                          : "assets/images/save_btn.png",
                      fit: BoxFit.contain,
                      width: 70,
                      height: 30,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center, // This is needed
                    child: Image.asset(
                      "assets/images/otherbuttons.png",
                      fit: BoxFit.contain,
                      width: 50,
                      height: 25,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            height: 10,
          ),
          CachedNetworkImage(
            imageUrl: data.image,
            imageBuilder: (context, imageProvider) => Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(10),
                  ),
                  image: DecorationImage(
                      image: imageProvider, fit: BoxFit.cover),
                  shape: BoxShape.rectangle),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                        padding: EdgeInsets.only(
                            left: 15, right: 15, bottom: 15, top: 10),
                        margin: EdgeInsets.only(top: 10, right: 10),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.contain,
                                image: AssetImage(
                                    "assets/images/price_tag_back.png"))),
                        child: Text(
                          "\$ " + data.price,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(left: 5, right: 5, bottom: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(247, 240, 238, 238),
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(10),
                                ),
                                shape: BoxShape.rectangle),
                            margin: EdgeInsets.only(top: 15, right: 10),
                            child: Row(
                              children: [
                                Container(
                                  width: 20,
                                  height: 20,
                                  child: Image.asset(data.isLike
                                      ? "assets/images/like_button.png"
                                      : "assets/images/unilke_button.png"),
                                ),
                                Container(
                                    margin: EdgeInsets.only(left: 5),
                                    child: Text(
                                      "LIKES ${data.likes_count == "0" ? "0" : data.likes_count}",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(247, 240, 238, 238),
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(10),
                                ),
                                shape: BoxShape.rectangle),
                            margin: EdgeInsets.only(top: 15, right: 10),
                            child: Row(
                              children: [
                                Container(
                                  width: 20,
                                  height: 20,
                                  child: Icon(Icons.cloud_download),
                                ),
                                Container(
                                    margin: EdgeInsets.only(left: 5),
                                    child: Text(
                                      "HD DOWNLOAD",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(247, 240, 238, 238),
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(10),
                                ),
                                shape: BoxShape.rectangle),
                            margin: EdgeInsets.only(top: 15, right: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 22,
                                  height: 22,
                                  child: Icon(Icons.remove_red_eye),
                                ),
                                Container(
                                    margin: EdgeInsets.only(left: 5),
                                    child: Text(
                                      "VIEWS ${data.viewer == "0" ? "0" : data.viewer}",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            placeholder: (context, url) {
              return Image.asset("assets/images/loading.gif");
            },
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 5, left: 10, right: 10),
            child: Text(
              data.description,
              textAlign: TextAlign.start,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700)
                  .apply(fontWeightDelta: 1),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 5, left: 10, right: 10),
            child: Text(
              "${data.comments_count} comments",
              textAlign: TextAlign.start,
              maxLines: 1,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600),
            ),
          ),
          data.comments_count != "0"
              ? Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 5, left: 10, right: 10),
              child: Row(
                children: [
                  Text(
                    data.comments_username,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    width: 7,
                  ),
                  Text(
                    data.comments_description,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ))
              : Container(),
        ],
      ),
    );
  }
}

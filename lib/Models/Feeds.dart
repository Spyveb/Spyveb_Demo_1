class Feeds {
  String id = "";
  String description = "";
  String price = "";
  String equipment = "";
  String image = "";
  String viewer = "";
  String user_id = "";
  String category_id = "";
  String comments_count = "0";
  String likes_count = "0";
  bool isLike = false;
  bool isSave = false;
  String user_name = "";
  String Feedsuser_id = "";
  String user_image = "";
  String my_follower_count = "0";

  String comments_username = "";
  String comments_description = "";

  String photo_id = "";
  String isLikeCount = "0";
  String isSaveCount = "0";

  String created_at = "";

  bool isFollow = false;

  Feeds();

  Feeds.fromJSON(Map<String, dynamic> jsonMap) {
    try {
      id = jsonMap['id'].toString();
      description = jsonMap['description'].toString();
      price = jsonMap['price'].toString();
      equipment = jsonMap['equipment'].toString();
      image = jsonMap['image'].toString();
      viewer = jsonMap['viewer'].toString();
      user_id = jsonMap['user_id'].toString();
      category_id = jsonMap['category_id'].toString();
      comments_count = jsonMap['comments_count'].toString();
      likes_count = jsonMap['likes_count'].toString();
      isLike = jsonMap['isLike'] == "0" ? false : true;
      isSave = jsonMap['isSave'] == "0" ? false : true;
      var users = jsonMap['user'];
      user_name = users['user_name'].toString();
      Feedsuser_id = users['id'].toString();
      user_image = users['image'].toString();
      my_follower_count = users['my_follower_count'].toString();
      isFollow = users['isFollow'] == "0" ? false : true;

      var comments = jsonMap['comments'] as List;
      if (comments.length > 0) {
        var commentDetails = comments[0];
        comments_description = commentDetails['description'].toString();
        comments_username = commentDetails['user']['user_name'].toString();
      }
    } catch (e) {
      print(e);
    }
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map['user_id'] = user_id;
    map['category_id'] = category_id;
    return map;
  }
}

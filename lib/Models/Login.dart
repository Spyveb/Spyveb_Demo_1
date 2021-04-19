class Login{
  String userType = "";
  String registerType = "";
  String appId = "";
  String emailId = "";
  String image = "";
  String deviceToken = "";

  Login();

  Map toMapRegister() {
    var map = new Map<String, dynamic>();
    map['userType'] = userType;
    map['registerType'] = registerType;
    map['appId'] = appId;
    map['emailId'] = emailId;
    map['image'] = image;
    map['deviceToken'] = deviceToken;
    return map;
  }
}
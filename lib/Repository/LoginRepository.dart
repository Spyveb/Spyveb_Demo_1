import 'package:global_configuration/global_configuration.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spyveb_flutter_demo1/Helper/GlobalVariable.dart';
import 'package:spyveb_flutter_demo1/Models/Login.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

Future<Login> LoginUser(Login data) async {
  final String url =
      "${GlobalConfiguration().getString("api_base_url")}register";
  print("$url");
  Uri myUri = Uri.parse(url);
  SharedPreferences pref = await SharedPreferences.getInstance();
  final client = new http.Client();
  final response = await client.post(myUri,
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      body: json.encode(data.toMapRegister()));

  Login returnData = new Login();
  if (response.statusCode == 200) {
    print(response.body.toString());
    var res = json.decode(response.body);
    if (res['success']) {
      Map<String, dynamic> userData = res['payload'];
      await pref.setString(GlobalVariable.USERID, userData['id'].toString());
      await pref.setBool(GlobalVariable.ISLOGIN, true);
    }
  } else {
    print(response.body.toString());
  }
  return returnData;
}

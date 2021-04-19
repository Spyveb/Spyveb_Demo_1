import 'dart:convert';
import 'dart:io';

import 'package:global_configuration/global_configuration.dart';
import 'package:spyveb_flutter_demo1/Models/Feeds.dart';
import 'package:http/http.dart' as http;

Future<List<Feeds>> getFeedsList(Feeds data) async {
  final String url =
      "${GlobalConfiguration().getString("api_base_url")}photoList";
  print("$url");
  Uri myUri = Uri.parse(url);
  final client = new http.Client();
  final response = await client.post(myUri,
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      body: json.encode(data.toMap()));
  List<Feeds> list_return = new List();
  print(data.toMap());
  if (response.statusCode == 200) {
    print(response.body.toString());
    var res = json.decode(response.body);
    if (res['success']) {
      list_return =
          (res['payload'] as List).map((e) => Feeds.fromJSON(e)).toList();
    }
  } else {
    print(response.body.toString());
  }
  return list_return;
}

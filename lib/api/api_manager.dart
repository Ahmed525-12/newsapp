import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapp/model/sources.dart';

class ApiManager {
  static const String baseUrl = "newsapi.org";
 static Future<Sources> getSources() async {
    var url = Uri.https(baseUrl, "/v2/top-headlines/sources",
        {"apiKey": "2893a2c362c54317a8e305b5a2a83530"});

    var response = await http.get(url);
    try {
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var sourceResponse = Sources.fromJson(json);
      return sourceResponse;
    } catch (e) {
      throw e;
      
    }
  }
}

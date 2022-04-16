import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapp/model/news_respose.dart';
import 'package:newsapp/model/sources.dart';

class ApiManager {
  static const String baseUrl = "newsapi.org";
  static Future<Sources> getSources(String categoryId) async {
    var url = Uri.https(baseUrl, "/v2/top-headlines/sources",
        {"apiKey": "2893a2c362c54317a8e305b5a2a83530","category":categoryId});

    var response = await http.get(url);
    try {
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var sourceResponse = Sources.fromJson(json);
      return sourceResponse;
    } catch (e) {
      rethrow;
    }
  }

  static Future<NewsRespose> getNews(String sourceId,String search)async {
    var url = Uri.https(baseUrl, "/v2/everything",{"apiKey":"2893a2c362c54317a8e305b5a2a83530","sources":sourceId,"q":search});
    var response = await http.get(url);
      try {
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var newsResponse = NewsRespose.fromJson(json);
       return newsResponse;
    } catch (e) {
      rethrow;
    }
  }
}

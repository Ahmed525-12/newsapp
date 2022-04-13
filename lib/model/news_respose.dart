
import 'package:newsapp/model/Sources.dart';

class NewsRespose {
  String ?status;
  int ?totalResults;
  List<News>? articles;
    String? message;
  String? code;

  NewsRespose({this.status, this.totalResults, this.articles,this.message,this.code});

  NewsRespose.fromJson(Map<String, dynamic> json) {
    if (json["code"] is String) {
      code = json["code"];
    }
     if (json["message"] is String) {
      message = json["message"];
    }
    if(json["status"] is String) {
      status = json["status"];
    }
    if(json["totalResults"] is int) {
      totalResults = json["totalResults"];
    }
    if(json["articles"] is List) {
      articles = json["articles"]==null ? null : (json["articles"] as List).map((e)=>News.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["status"] = status;
    data["totalResults"] = totalResults;
    if(articles != null) {
      data["articles"] = articles?.map((e)=>e.toJson()).toList();
    }
    return data;
  }
}

class News {
  Sources1 ?source;
  String ?author;
  String ?title;
  String ?description;
  String ?url;
  String ?urlToImage;
  String ?publishedAt;
  String ?content;

  News({this.source, this.author, this.title, this.description, this.url, this.urlToImage, this.publishedAt, this.content});

  News.fromJson(Map<String, dynamic> json) {
    if(json["source"] is Map) {
      source = json["source"] == null ? null : Sources1.fromJson(json["source"]);
    }
    if(json["author"] is String) {
      author = json["author"];
    }
    if(json["title"] is String) {
      title = json["title"];
    }
    if(json["description"] is String) {
      description = json["description"];
    }
    if(json["url"] is String) {
      url = json["url"];
    }
    if(json["urlToImage"] is String) {
      urlToImage = json["urlToImage"];
    }
    if(json["publishedAt"] is String) {
      publishedAt = json["publishedAt"];
    }
    if(json["content"] is String) {
      content = json["content"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if(source != null) {
      data["source"] = source?.toJson();
    }
    data["author"] = author;
    data["title"] = title;
    data["description"] = description;
    data["url"] = url;
    data["urlToImage"] = urlToImage;
    data["publishedAt"] = publishedAt;
    data["content"] = content;
    return data;
  }
}

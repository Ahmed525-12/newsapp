import 'package:flutter/material.dart';
import 'package:newsapp/model/news_respose.dart';

class NewsWidget extends StatelessWidget {
  News news;
  NewsWidget(this.news, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 220,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: news.urlToImage == null && news.urlToImage!="null" ? const Icon(Icons.broken_image)
                : Image.network(
                    news.urlToImage ?? " ",
                    height: 220,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(news.author ?? "",style: const TextStyle(
              fontSize: 12,color: Colors.grey
            ),),
          ),
          Text(news.title ?? "",
              style: const TextStyle(
                  fontSize: 18,color: Colors.black
              )),
          Text(news.publishedAt ?? "",
              style: const TextStyle(
                  fontSize: 12,color: Colors.grey
              ),textAlign: TextAlign.end,),
              
        ],
      ),
    );
  }
}
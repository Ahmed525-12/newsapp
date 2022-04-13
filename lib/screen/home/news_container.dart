import 'package:flutter/material.dart';
import 'package:newsapp/api/api_manager.dart';
import 'package:newsapp/model/news_respose.dart';
import 'package:newsapp/model/sources.dart';
import 'package:newsapp/screen/home/news_item.dart';


class News_Container extends StatelessWidget {
  Sources1 selectedSource;
  News_Container(this.selectedSource);

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder<NewsRespose>(
      future: ApiManager.getNews(selectedSource.id??"",),
      builder: (_,snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
        }
        else if(snapshot.hasError){
          return Column(children: [
            Text('Something went wrong'),
            ElevatedButton(onPressed: (){}, child: Text('Try Again'))
          ],);
        }
        if("ok" != snapshot.data?.status){
          // server response has code and message
          return Column(children: [
            Text(snapshot.data?.message ??""),
            ElevatedButton(onPressed: (){}, child: Text('Try Again'))
          ],);
        }

        var newsList = snapshot.data?.articles ?? [];
        return ListView.builder(itemBuilder: (_,index){
          return NewsWidget(newsList[index]);
        },itemCount: newsList.length,) ;
      },
    );
  }
}

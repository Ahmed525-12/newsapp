import 'package:flutter/material.dart';
import 'package:newsapp/api/api_manager.dart';
import 'package:newsapp/model/news_respose.dart';
import 'package:newsapp/model/sources.dart';
import 'package:newsapp/screen/home/news_item.dart';


// ignore: must_be_immutable
class NewsContainer extends StatefulWidget {
  Sources1 selectedSource;

  NewsContainer(this.selectedSource, {Key? key}) : super(key: key);

  @override
  State<NewsContainer> createState() => _NewsContainerState();
}

class _NewsContainerState extends State<NewsContainer> {
    String searchvalue = "";

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
         Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Search',
            hintText: 'Enter Your Search',
          ),
          onChanged: (e) {
            searchvalue = e;
            setState(() {});
          },
        ),
      ),
        Expanded(
          child: FutureBuilder<NewsRespose>(
            future: ApiManager.getNews(widget.selectedSource.id??"",searchvalue),
            builder: (_,snapshot){
              if(snapshot.connectionState == ConnectionState.waiting){
                return const Center(child: CircularProgressIndicator());
              }
              else if(snapshot.hasError){
                return Column(children: [
                  const Text('Something went wrong'),
                  ElevatedButton(onPressed: (){}, child: const Text('Try Again'))
                ],);
              }
              if("ok" != snapshot.data?.status){
                // server response has code and message
                return Column(children: [
                  Text(snapshot.data?.message ??""),
                  ElevatedButton(onPressed: (){}, child: const Text('Try Again'))
                ],);
              }
        
              var newsList = snapshot.data?.articles ?? [];
              return ListView.builder(itemBuilder: (_,index){
                return NewsWidget(newsList[index]);
              },itemCount: newsList.length,) ;
            },
          ),
        ),
      ],
    );
  }
}

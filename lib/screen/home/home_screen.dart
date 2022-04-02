import 'package:flutter/material.dart';
import 'package:newsapp/model/sources.dart';
import 'package:newsapp/screen/home/tab_container.dart';

import '../../api/api_manager.dart';

class Home_Screen extends StatelessWidget {
  static const String routename = "home screen";
  Home_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News App"),
        centerTitle: true,
      ),
      body: Column(children: [
        Expanded(
          child: FutureBuilder<Sources>(
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: const CircularProgressIndicator.adaptive());
              } else if (snapshot.hasError) {
                return Center(
                  child: Column(
                    children: [
                      Text("something get wrong"),
                      ElevatedButton(onPressed: () {}, child: Text("try agian"))
                    ],
                  ),
                );
              }
              if ("ok" != snapshot.data?.status) {
                return Center(
                  child: Column(
                    children: [
                      Text(snapshot.data?.message ?? ""),
                      ElevatedButton(onPressed: () {}, child: Text("try agian"))
                    ],
                  ),
                );
              }
              var sourcesList = snapshot.data?.sources ?? [];
              return  Tab_Container(sourcesList);
            },
            future: ApiManager.getSources(),
          ),
        )
      ]),
    );
  }
}

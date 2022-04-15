import 'package:flutter/material.dart';
import 'package:newsapp/model/category.dart';
import 'package:newsapp/model/sources.dart';
import 'package:newsapp/screen/home/tab_container.dart';

import '../../api/api_manager.dart';

class Home_Screen extends StatefulWidget {
  static const String routename = "home screen";
  Category category;
  Home_Screen(this.category, {Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {

  @override
  Widget build(BuildContext context) {
    return Column(children: [
     
      Expanded(
        child: FutureBuilder<Sources>(
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else if (snapshot.hasError) {
              return Center(
                child: Column(
                  children: [
                    const Text("something get wrong"),
                    ElevatedButton(
                        onPressed: () {}, child: const Text("try agian"))
                  ],
                ),
              );
            }
            if ("ok" != snapshot.data?.status) {
              return Center(
                child: Column(
                  children: [
                    Text(snapshot.data?.message ?? ""),
                    ElevatedButton(
                        onPressed: () {}, child: const Text("try agian"))
                  ],
                ),
              );
            }
            var sourcesList = snapshot.data?.sources ?? [];
            return Tab_Container(sourcesList);
          },
          future: ApiManager.getSources(widget.category.id),
        ),
      )
    ]);
  }
}

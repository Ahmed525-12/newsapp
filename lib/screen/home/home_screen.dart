import 'package:flutter/material.dart';
import 'package:newsapp/model/category.dart';
import 'package:newsapp/model/sources.dart';
import 'package:newsapp/screen/home/tab_container.dart';

import '../../api/api_manager.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  static const String routename = "home screen";
  Category category;
  HomeScreen(this.category, {Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

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
            return TabContainer(sourcesList);
          },
          future: ApiManager.getSources(widget.category.id),
        ),
      )
    ]);
  }
}

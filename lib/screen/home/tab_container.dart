import 'package:flutter/material.dart';
import 'package:newsapp/model/sources.dart';
import 'package:newsapp/screen/home/news_container.dart';
import 'package:newsapp/screen/home/tab_item.dart';

// ignore: must_be_immutable
class TabContainer extends StatefulWidget {
  List<Sources1> soucers;

  TabContainer(this.soucers, {Key? key}) : super(key: key);

  @override
  State<TabContainer> createState() => _TabContainerState();
}

class _TabContainerState extends State<TabContainer> {

  int indexSelect=0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: TabBar(
                isScrollable: true,
                indicatorColor: Colors.transparent,
                onTap: (index) {

                  indexSelect = index;
                  setState(() {
                    
                  });
                },
                tabs: widget.soucers.map((e) => TabItem(e,indexSelect==widget.soucers.indexOf(e)?true:false)).toList()),
          ),
        Expanded(child: NewsContainer(widget.soucers[indexSelect]))
        ],
      ),
      length: widget.soucers.length,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:newsapp/model/sources.dart';
import 'package:newsapp/screen/home/news_container.dart';
import 'package:newsapp/screen/home/tab_item.dart';

class Tab_Container extends StatefulWidget {
  List<Sources1> soucers;

  Tab_Container(this.soucers, {Key? key}) : super(key: key);

  @override
  State<Tab_Container> createState() => _Tab_ContainerState();
}

class _Tab_ContainerState extends State<Tab_Container> {

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
                tabs: widget.soucers.map((e) => Tab_Item(e,indexSelect==widget.soucers.indexOf(e)?true:false)).toList()),
          ),
        Expanded(child: News_Container(widget.soucers[indexSelect]))
        ],
      ),
      length: widget.soucers.length,
    );
  }
}

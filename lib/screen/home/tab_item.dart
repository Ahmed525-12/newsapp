import 'package:flutter/material.dart';
import 'package:newsapp/model/sources.dart';

// ignore: must_be_immutable
class TabItem extends StatelessWidget {
  Sources1 sources;
  bool isSelected;
  TabItem(this.sources, this.isSelected, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color:
              isSelected ? Theme.of(context).primaryColor : Colors.transparent,
           border: Border.all(color:Theme.of(context).primaryColor, )   
              
              
              ),
      child: Text(sources.name ?? "",style: TextStyle(color:  isSelected ? Colors.white : Theme.of(context).primaryColor,),),
    );
  }
}

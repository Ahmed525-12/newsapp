import 'package:flutter/material.dart';
import 'package:newsapp/model/category.dart';

class CategoryWidget extends StatelessWidget {
  Category category;
  int index;
  CategoryWidget(this.category, this.index,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        color: Color(category.color),
        borderRadius:  BorderRadius.only(
          topRight:  const Radius.circular(12),
          topLeft: const Radius.circular(12),
          bottomRight: Radius.circular((index%2==0) ? 0:  12),
          bottomLeft : Radius.circular((index%2==0) ? 12:  0),
        )
      ),
      child:
          Column(children: [Image.asset(category.image,height: 120,fit: BoxFit.fill,), Padding(
            padding: const EdgeInsets.all(8.0),
            child:  Center(child: Text(category.title,style: const TextStyle(color: Colors.white),)),
          )]),
    );
  }
}

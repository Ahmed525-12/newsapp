import 'package:flutter/material.dart';
import 'package:newsapp/model/category.dart';

import 'category_widget.dart';

// ignore: must_be_immutable
class CAtegoriesIntro extends StatelessWidget {
  Function onCategoryClick;
  CAtegoriesIntro(this.onCategoryClick, {Key? key}) : super(key: key);
  var categories = Category.getCategory();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("pick your interest category "),
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
            ),
            itemBuilder: (_, index) {
              return InkWell(
                  onTap: () {
                    onCategoryClick(categories[index]);
                  },
                  child: CategoryWidget(categories[index], index));
            },
            itemCount: categories.length,
          ),
        )
      ]),
    );
  }
}

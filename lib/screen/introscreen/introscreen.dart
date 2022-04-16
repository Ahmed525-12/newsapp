import 'package:flutter/material.dart';
import 'package:newsapp/screen/home/home_screen.dart';
import 'package:newsapp/screen/introscreen/categories.dart';
import 'package:newsapp/screen/introscreen/drawer.dart';

import '../../model/category.dart';

class IntroScreen extends StatefulWidget {
  static const String routename = "introscreen";
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("news")),
      drawer: Drawer(child: DrawerWdget(onSidemenuItemClick)),
      body: selectedcategory == null
          ? CAtegoriesIntro(onCategoryClick)
          : HomeScreen(selectedcategory!),
    );
  }

  Category? selectedcategory;

  void onCategoryClick(Category category) {
    selectedcategory = category;
    setState(() {});
  }

  void onSidemenuItemClick(int clickItem) {
    Navigator.pop(context);
    if (clickItem == DrawerWdget.category) {
      selectedcategory = null;
      setState(() {});
    } else if (clickItem == DrawerWdget.setteings) {}
  }
}

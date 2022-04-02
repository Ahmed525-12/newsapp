import 'package:flutter/material.dart';

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
      body: Column(children: []),
    );
  }
}

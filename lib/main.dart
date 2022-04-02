import 'package:flutter/material.dart';
import 'package:newsapp/screen/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News app',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
      routes: {
        Home_Screen.routename:(context) => Home_Screen()
      },
     initialRoute: Home_Screen.routename,
    );
  }
}

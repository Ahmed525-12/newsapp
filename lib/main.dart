import 'package:flutter/material.dart';

import 'package:newsapp/screen/introscreen/introscreen.dart';

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
        primaryColor: const Color.fromARGB(255, 33, 243, 138),
        appBarTheme: const AppBarTheme(
          color: Color.fromARGB(255, 33, 243, 138),
        )
      ),
      routes: {
        IntroScreen.routename:(context) => const IntroScreen(),
      },
     initialRoute: IntroScreen.routename,
    );
  }
}

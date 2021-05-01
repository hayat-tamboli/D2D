import 'package:flutter/material.dart';
import 'package:random/utils/theme_config.dart';
import 'package:random/view/SplashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: buildThemeData(context),
      home: Splash(),
    );
  }
}

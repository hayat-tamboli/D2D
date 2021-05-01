import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:random/Utils/Constants.dart';
import 'package:random/view/auth/auth.dart';
import 'package:random/utils/theme_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Constants.prefs = await SharedPreferences.getInstance();
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
      home: Auth(),
    );
  }
}

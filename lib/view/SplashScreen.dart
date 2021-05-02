import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:random/Utils/Constants.dart';
import 'package:random/mainApp.dart';
import 'package:random/view/auth/auth.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  // Timer to change the screen in 2.2 seconds

  String _userId = Constants.prefs.get('userId');
  // String _firsttime = Constants.prefs.getString('firsttime');

  // String _firsttime = "no";
  startTimeout() {
    return Timer(Duration(milliseconds: 2200), handleTimeout);
  }

  void handleTimeout() {
    changeScreen();
  }

  changeScreen() async {
    // _firsttime == null
    //     ? CRouter.pushPageWithFadeAnimation(context, OnBoardingPage())
    //     : _userId == null
    //         ? CRouter.pushPageWithFadeAnimation(context, GauthPage())
    //         : Navigator.pushReplacement(context,
    //             MaterialPageRoute(builder: (context) => AnimatedBottomBar()));
    _userId == null
        ? Navigator.push(
            context, MaterialPageRoute(builder: (context) => Auth()))
        : Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MainApp()));
  }

  @override
  void initState() {
    startTimeout();
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("firbase initialized in splash screen");
      setState(() {});
      startTimeout();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Center(
            //   child: ClipRRect(
            //     borderRadius: BorderRadius.all(Radius.circular(32)),
            //     child: Image(
            //       image: AssetImage('assets/icon.png'),
            //       width: 150,
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 170,
            ),
            Text(
              "D2D",
              style: TextStyle(
                color: Theme.of(context).backgroundColor.withOpacity(0.9),
                fontSize: 38,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

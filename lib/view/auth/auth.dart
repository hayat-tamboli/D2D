import 'dart:ui';

import 'package:flutter/gestures.dart';

import 'package:flutter/material.dart';
import 'package:random/Services/auth.dart';
import 'package:random/view/auth/afterLogin.dart';
import 'package:random/widgets/button.dart';

class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Welcome to D2D",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 48,
                  letterSpacing: -3,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Image(
                image: AssetImage('assets/Auth illustration.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Find your other half",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      letterSpacing: -2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Image(
                    image: AssetImage('assets/Emojihandshake.png'),
                    width: 58,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Meet with other designers and developers and complete beutiful projects with them.",
                style: TextStyle(
                  fontSize: 21,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: PrimaryButton(
                alt: false,
                onTap: () {
                  signInWithGoogle().then((value) => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AfterLogin())));
                },
                text: "Continue with Google",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'By continuing you agree to our ',
                  style: Theme.of(context).textTheme.bodyText2,
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Privacy Policy',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                    TextSpan(text: ' and '),
                    TextSpan(
                      text: 'Terms & Conditions',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

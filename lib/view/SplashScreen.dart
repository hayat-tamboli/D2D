import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Results!',
              style: TextStyle(color: Color(0xff29BCBC)),
            ),
          ],
        ),
        Row(
          children: [
            Image.asset(''),
          ],
        ),
        Row(
          children: [
            Container(
              color: Color(0xff24BFBF),
              child: Text('A Yellow Paperboat.'),
            )
          ],
        ),
        Row(
          children: [
            Text('Liked this magic tool?',
                style: TextStyle(
                    color: Color(0xff29BCBC),
                    fontSize: 7.0,
                    fontFamily: 'Poppins')),
            Text('Rate us on Playstore!',
                style: TextStyle(
                    color: Colors.black, fontSize: 7.0, fontFamily: 'Poppins')),
          ],
        ),
      ],
    );
  }
}

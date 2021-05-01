import 'package:flutter/material.dart';
import 'package:random/mainApp.dart';
import 'package:random/widgets/button.dart';

class AfterLogin extends StatefulWidget {
  @override
  _AfterLoginState createState() => _AfterLoginState();
}

class _AfterLoginState extends State<AfterLogin> {
  bool _designer = true;
  bool _developer = false;
  bool _manager = false;
  String _selected='Designer';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:20.0),
                  child: Text(
                    "You are a",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 48,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                    child: PrimaryButton(
                      alt: !_designer,
                      onTap: () {
                        setState(() {
                          _designer = true;
                          _developer = false;
                          _manager = false;
                          _selected = 'Designer';
                        });
                      },
                      text: "Designer",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                    child: PrimaryButton(
                      alt: !_developer,
                      onTap: () {
                        setState(() {
                          _designer = false;
                          _developer = true;
                          _manager = false;
                          _selected = 'Developer';
                        });
                      },
                      text: "Developer",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                    child: PrimaryButton(
                      alt: !_manager,
                      onTap: () {
                        setState(() {
                          _designer = false;
                          _developer = false;
                          _manager = true;
                          _selected = 'Manager';
                        });
                      },
                      text: "Hiring manager",
                    ),
                  ),
                ],
              )
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: PrimaryButton(
                alt: false,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MainApp()));
                },
                text: "Continue",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AddProject extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Project", style: TextStyle(color: Colors.black)),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [FlutterLogo(),FlutterLogo(),],
        ),
      ),
    );
  }
}

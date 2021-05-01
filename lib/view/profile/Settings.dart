import 'package:flutter/material.dart';
import '../../widgets/button.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _workAvailable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffffffff),
          title: Text(
            'Profile',
            style: TextStyle(
              fontSize: 28.0,
              color: Colors.black,
            ),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              SwitchListTile(
                title: Text('Available for work'),
                value: _workAvailable,
                activeColor: Colors.blue,
                onChanged: (bool value) {
                  setState(() {
                    _workAvailable = value;
                  });
                },
              ),
              Text(
                'Update your skills',
                style: TextStyle(fontSize: 15.0, color: Colors.grey),
              ),
              TextField(
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: 'UI/UX'),
              ),
              PrimaryButton(
                alt: false,
                onTap: () {},
                text: "Continue",
              ),
              SizedBox(width: 20.0, height: 20.0),
            ],
          ),
        ));
  }
}

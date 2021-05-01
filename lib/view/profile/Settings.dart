import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:random/Utils/Constants.dart';
import 'package:random/widgets/inputBox.dart';
import '../../widgets/button.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _workAvailable = true;
  TextEditingController talentTextEditingController =
      new TextEditingController();
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
              InputBox(
                controller: talentTextEditingController,
                textInputType: TextInputType.name,
                hintText: 'UI/UX',
                maxLength: 36,
              ),
              PrimaryButton(
                alt: false,
                onTap: () async {
                  await FirebaseFirestore.instance
                      .collection('users')
                      .doc(Constants.prefs.get('userId'))
                      .update(
                          {'bio': talentTextEditingController.text.toString()});
                },
                text: "Continue",
              ),
              SizedBox(width: 20.0, height: 20.0),
            ],
          ),
        ));
  }
}

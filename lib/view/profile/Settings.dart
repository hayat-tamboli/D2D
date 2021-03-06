import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:random/Services/auth.dart';
import 'package:random/Utils/Constants.dart';
import 'package:random/view/auth/auth.dart';
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
            'Settings',
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
                activeColor: Theme.of(context).primaryColor,
                onChanged: (bool value) {
                  setState(() {
                    _workAvailable = value;
                  });
                },
              ),
              InputBox(
                controller: talentTextEditingController,
                textInputType: TextInputType.name,
                hintText: 'UI/UX',
                labelText: 'Update your skills',
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
              PrimaryButton(
                alt: false,
                color: Theme.of(context).errorColor,
                onTap: () {
                  signOutGoogle();
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Auth()));
                },
                text: "Log Out",
              ),
            ],
          ),
        ));
  }
}

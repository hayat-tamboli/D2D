import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:random/Utils/Constants.dart';
import 'package:random/widgets/Loader.dart';
import 'package:random/widgets/projectCard.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool _workAvailable = true;
  StreamSubscription sub;
  Map data;
  bool loading = false;
  final db = FirebaseFirestore.instance;
  @override
  void initState() {
    super.initState();
    sub = db
        .collection('users')
        .doc(Constants.prefs.getString('userId'))
        .snapshots()
        .listen((snap) {
      setState(() {
        data = snap.data();
        loading = true;
      });
    });
  }

  @override
  void dispose() {
    sub.cancel();
    super.dispose();
  }

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
        body: loading
            ? SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.fromLTRB(120.0, 10.0, 120.0, 10.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.network(
                          data['profileImage'],
                        ),
                      ),
                    ),
                    Text(
                      data['name'],
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                    Text(
                      data['bio'],
                      style: TextStyle(fontSize: 15.0, color: Colors.grey),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RatingBar.builder(
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.tealAccent,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                    ),
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
                    SizedBox(width: 20.0, height: 20.0),
                    Container(
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                print("Open profile");
                              });
                            },
                            child: ProjectCard(
                              name: 'Hayat-Tamboli',
                              project: 'D2D',
                              contributions: 4,
                              issues: 11,
                              stars: 20,
                              forks: 3,
                              imageLink:
                                  'https://avatars.githubusercontent.com/u/55529269?v=4',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : Loader());
  }
}

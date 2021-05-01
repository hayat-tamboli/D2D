import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:random/Utils/Constants.dart';
import 'package:random/view/profile/addproject.dart';
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
        automaticallyImplyLeading: false,
        title: Text(
          'Profile',
          style: TextStyle(
            fontSize: 28.0,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(16.0, 0, 16, 0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(120.0, 10.0, 120.0, 10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.network(
                    data['profileImage'],
                  ),
                ),
              ),
              Text(
                data['name'],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
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
                    color: Color(0xff66D9AB),
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
              // Container(
              //   child: GridView.builder(gridDelegate: gridDelegate, itemBuilder: itemBuilder)
              //     children: [
              //       GestureDetector(
              //         onTap: () {
              //           setState(() {
              //             print("Open profile");
              //           });
              //         },
              //         child: ProjectCard(
              //           name: 'Hayat-Tamboli',
              //           project: 'D2D',
              //           contributions: 4,
              //           issues: 11,
              //           stars: 20,
              //           forks: 3,
              //           imageLink:
              //               'https://avatars.githubusercontent.com/u/55529269?v=4',
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // GridView.count(
              //     crossAxisCount: 3,
              //     crossAxisSpacing: 4.0,
              //     mainAxisSpacing: 8.0,
              //     children: List.generate(6, (index) {
              //       return Center(
              //         child: Image(
              //           image: NetworkImage(
              //               "https://cdn.dribbble.com/users/5732576/screenshots/14430923/dribble_-_daily_6_2x_4x.png"),
              //           width: 40,
              //         ),
              //       );
              //     }))
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => AddProject()));
                },
                child: Container(
                  width: 179,
                  height: 99,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Color(0xff0887fc),
                            width: 1,
                          ),
                        ),
                        padding: const EdgeInsets.only(
                          top: 16,
                          bottom: 10,
                          left: 24,
                          right: 24,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 38,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Feather.plus_circle,
                                    size: 32,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "New Project",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xff0887fc),
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

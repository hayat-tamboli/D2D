import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:random/Model/Project.dart';
import 'package:random/Services/projectServices.dart';
import 'package:random/Utils/Constants.dart';
import 'package:random/view/profile/Settings.dart';
import 'package:random/view/profile/addproject.dart';
import 'package:random/widgets/Loader.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool _workAvailable = true;
  int _projectCount = 5;
  StreamSubscription sub;
  Map data;
  bool loading = false;
  Stream currentFeed;
  bool anotherload = false;
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

    getUserInfo();
  }

  getUserInfo() async {
    getCurrentFeed().then((snapshots) {
      setState(() {
        currentFeed = snapshots;
        anotherload = true;
        print("we got the data for Projects");
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
        actions: [
          IconButton(
              icon: Icon(Feather.settings),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingsPage()));
              })
        ],
      ),
      body: loading
          ? SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(16.0, 0, 16, 0),
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(120.0, 10.0, 120.0, 0),
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
                          ignoreGestures: true,
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
                      SizedBox(width: 20.0, height: 20.0),
                      Container(
                        height: 350,
                        child: StreamBuilder(
                            stream: currentFeed,
                            builder: (context, snapshot) {
                              return snapshot.hasData
                                  ? snapshot.data.documents.length > 0
                                      ? GridView.builder(
                                          itemCount:
                                              snapshot.data.documents.length,
                                          gridDelegate:
                                              SliverGridDelegateWithMaxCrossAxisExtent(
                                            maxCrossAxisExtent: 200,
                                            childAspectRatio: 4 / 2,
                                            crossAxisSpacing: 20,
                                            mainAxisSpacing: 20,
                                          ),
                                          itemBuilder:
                                              (BuildContext ctx, index) {
                                            Project data = new Project.fromJson(
                                                snapshot.data.documents[index]);
                                            return Container(
                                              clipBehavior: Clip.hardEdge,
                                              alignment: Alignment.center,
                                              child: Image(
                                                // height: 40,
                                                // width: 80,
                                                fit: BoxFit.cover,
                                                image: NetworkImage(data.img),
                                              ),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16)),
                                            );
                                          })
                                      : Container(
                                          child: Center(
                                              child: Text('Nothing available')))
                                  : Loader();
                            }),
                      ),
                      if (_projectCount != 6)
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddProject()));
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 38,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Feather.plus_circle,
                                              size: 32,
                                              color: Theme.of(context)
                                                  .primaryColor,
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
            )
          : Loader(),
    );
  }
}

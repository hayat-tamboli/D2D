import 'package:flutter/material.dart';
import 'package:random/widgets/projectCard.dart';

class Profile extends StatelessWidget {
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
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: ProjectCard(
            name: 'Hayat-Tamboli',
            project: 'D2D',
            contributions: 4,
            issues: 11,
            stars: 20,
            forks: 3,
            imageLink: 'https://avatars.githubusercontent.com/u/55529269?v=4',
          ),
        ),
      ),
    );
  }
}

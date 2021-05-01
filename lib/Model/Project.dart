import 'package:cloud_firestore/cloud_firestore.dart';

class Project {
  String name;
  String link;
  String img;
  Project({this.name, this.link, this.img});

  Project.newProject(String name, String link, String img) {
    this.name = name;
    this.link = link;
    this.img = img;
  }

  Map<String, dynamic> toJson() =>
      {'name': this.name, 'link': this.link, 'img': this.img};

  factory Project.fromJson(QueryDocumentSnapshot snapshot) {
    var data = snapshot.data();
    return Project(name: data['name'], link: data['link'], img: data['img']);
  }
}

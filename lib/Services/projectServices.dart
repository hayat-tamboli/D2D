import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:random/Model/Project.dart';
import 'package:random/Utils/Constants.dart';

addProject(Project p) async {
  var doc = FirebaseFirestore.instance
      .collection('users')
      .doc(Constants.prefs.get('userId'))
      .collection('project')
      .doc();
  doc.set(p.toJson());
}

updateProject(Project p) async {
  var doc = FirebaseFirestore.instance
      .collection('users')
      .doc(Constants.prefs.get('userId'))
      .collection('project')
      .doc();
  doc.update(p.toJson());
}

getCurrentFeed() async {
  return FirebaseFirestore.instance
      .collection("user")
      .doc(Constants.prefs.getString('userId'))
      .collection('project')
      .snapshots();
}

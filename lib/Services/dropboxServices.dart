import 'package:cloud_firestore/cloud_firestore.dart';

getSpecificFeed(String flag) async {
  return FirebaseFirestore.instance
      .collection("users")
      .where('type', isEqualTo: flag)
      .snapshots();
}

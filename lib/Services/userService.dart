import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:random/Utils/Constants.dart';

addUserType(String selected) async {
  await FirebaseFirestore.instance
      .collection('users')
      .doc(Constants.prefs.get('userId'))
      .update({'type': selected});
}

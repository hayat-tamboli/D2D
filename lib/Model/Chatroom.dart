import 'package:cloud_firestore/cloud_firestore.dart';

class Chatrooms {
  List<String> usersId;

  DateTime dateTime;
  String sentby;
  String message;
  String type;

  Chatrooms(
      {this.usersId, this.dateTime, this.sentby, this.message, this.type});

  Map<String, dynamic> toJson() => {
        'usersId': usersId,
        'dateTime': dateTime,
        'sentby': sentby,
        'message': message,
        'type': type
      };
  Chatrooms.fromSnapshot(DocumentSnapshot snapshot)
      : usersId = snapshot.data()['usersId'],
        dateTime = snapshot.data()['dateTime'],
        sentby = snapshot.data()['sentby'],
        message = snapshot.data()['message'],
        type = snapshot.data()['type'];
}
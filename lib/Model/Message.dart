import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  //Date and time of the message being sent
  DateTime dateTime;
  //Id of the user who sent the message
  String sentby;
  //What the message consists of
  String message;
  //Name of the user who sent the message
  String sentByName;
  //type of message, used to differentiate custom messages

  Message({this.dateTime, this.sentby, this.message, this.sentByName});

  Message.newMessage(
    DateTime dateTime,
    String sentby,
    String message,
    String sentByName,
  ) {
    this.dateTime = dateTime;
    this.sentby = sentby;
    this.message = message;
    this.sentByName = sentByName;
  }

  Map<String, dynamic> toJson() => {
        'dateTime': dateTime,
        'sentby': sentby,
        'message': message,
        'sentByName': sentByName,
      };

  factory Message.fromJson(QueryDocumentSnapshot data) {
    var parsedJson = data.data();
    return Message(
        dateTime: parsedJson['dateTime'].toDate(),
        sentby: parsedJson['sentby'],
        message: parsedJson['message'],
        sentByName: parsedJson['sentByName']);
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfile {
  String userId;
  String name;
  String profileImage;
  String bio;
  String emailId;
  String type; // to decide if its a company or developer or a designer
  List projects;
  int rating;
  bool work;

  UserProfile(
      {this.userId,
      this.name,
      this.profileImage,
      this.emailId,
      this.bio,
      this.type,
      this.projects,
      this.rating,
      this.work});

  UserProfile.loadUser(this.userId, this.name, this.profileImage, this.emailId,
      this.bio, this.type, this.projects, this.work);

  UserProfile.newuser(userId, name, profileImage, emailId) {
    this.userId = userId;
    this.name = name;
    this.profileImage = profileImage;
    this.emailId = emailId;
    this.bio = 'Hey I am new to D2D';
    this.type = "";
    this.work = true;
  }

  UserProfile.miniView(String userId, String name, String profileImage) {
    this.userId = userId;
    this.name = name;
    this.profileImage = profileImage;
  }

  Map<String, dynamic> miniJson() =>
      {'userId': userId, 'name': name, 'profileImage': profileImage};

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'name': name,
        'profileImage': profileImage,
        'emailId': emailId,
        'bio': bio,
        'type': type,
        'userSearchParam': setSearchParam(name),
        'rating': 1,
        'work': work
      };

  factory UserProfile.fromMap(Map data) {
    return UserProfile(
        userId: data['userId'] ?? "",
        name: data['name'] ?? "",
        profileImage: data['profileImage'] ?? "",
        emailId: data['emailId'] ?? "");
  }

  factory UserProfile.fromJson(QueryDocumentSnapshot snapshot) {
    var data = snapshot.data();
    return UserProfile(
        userId: data['userId'],
        name: data['name'],
        profileImage: data['profileImage'],
        emailId: data['emailId'],
        bio: data['bio'],
        type: data['type'],
        projects: data['projects'],
        rating: data['rating']);
  }
}

setSearchParam(String username) {
  List<String> userSearchList = [];
  String temp = "";
  for (int i = 0; i < username.length; i++) {
    temp = temp + username[i];
    userSearchList.add(temp);
  }
  return userSearchList;
}

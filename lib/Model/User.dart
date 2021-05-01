import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfile {
  String userId;
  String name;
  String profileImage;
  String bio;
  String emailId;

  UserProfile(
      {this.userId, this.name, this.profileImage, this.emailId, this.bio});

  UserProfile.loadUser(
      this.userId, this.name, this.profileImage, this.emailId, this.bio);

  UserProfile.newuser(userId, name, profileImage, emailId) {
    this.userId = userId;
    this.name = name;
    this.profileImage = profileImage;
    this.emailId = emailId;
    this.bio = 'Hey I am new to D2D';
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
        bio: data['bio']);
  }
}

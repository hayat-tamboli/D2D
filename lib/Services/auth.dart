import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:random/Model/User.dart';
import 'package:random/Utils/Constants.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

Future signInWithGoogle() async {
  await Firebase.initializeApp();
  //Initializing the Firebase auth Serivices
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;
  //Getting the device token of the device for FCM purposes
  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final UserCredential authResult =
      await _auth.signInWithCredential(credential);
  final User user = authResult.user;

  if (user != null) {
    print('User is not null');
    //The user has authenticated already
    var result = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();

    if (!result.exists) {
      //Creating a documnet
      Constants.prefs.setString("userId", user.uid);
      Constants.prefs.setString("profileImage", user.photoURL);
      Constants.prefs.setString("name", user.displayName);
      print('User Signed Up');
      //Writing to the backend and making a document for the user
      FirebaseFirestore.instance.collection('users').doc(user.uid).set(
          UserProfile.newuser(
                  user.uid, user.displayName, user.photoURL, user.email)
              .toJson());
    } else {
      //Document already exists
      print('I am Here');
      if (Constants.prefs.get('userId') != user.uid) {
        Constants.prefs.setString('userId', user.uid);
        Constants.prefs.setString("name", user.displayName);
        Constants.prefs.setString("profileImage", user.photoURL);
      }
    }
  }
}

Future<void> signOutGoogle() async {
  await FirebaseAuth.instance.signOut();
  await googleSignIn.disconnect();
}

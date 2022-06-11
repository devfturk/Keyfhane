import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyUser {
  final String? id;
  final String? userName;
  final String? photoUrl;
  final String? email;

  MyUser({this.id, this.userName, this.photoUrl, this.email});

  factory MyUser.createFromFirebase(User myUser) {
    return MyUser(
    id: myUser.uid,
    userName : myUser.displayName,
    photoUrl: myUser.photoURL,
    email: myUser.email
    );
  }

  factory MyUser.dokumandanUret(DocumentSnapshot doc) {
    return MyUser(
      id: doc.id,
      userName: doc['userName'],
      email: doc['email'],
      photoUrl: doc['fotourl'],
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:keyfhane/models/User.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String? currentUSer;
  MyUser? _createUser(User? firebaseUser) {
    return firebaseUser == null
        ? null
        : MyUser.createFromFirebase(firebaseUser);
  }

  Stream<MyUser?> get signFollow {
    return _firebaseAuth.authStateChanges().map(_createUser);
  }

  Future<MyUser?> createUserWithEmailAndPassword(
      String email, String password) async {
    UserCredential signCard = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    return _createUser(signCard.user);
  }

  Future<MyUser?> signInWithEmailAndPassword(
      String email, String password) async {
    UserCredential signCard = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return _createUser(signCard.user);
  }

  Future<void> signOut() {
    return _firebaseAuth.signOut();
  }

  Future<MyUser?> signInWithGoogle() async {
    final GoogleSignInAccount? googlekullanicisi =
        await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleyetki =
        await googlekullanicisi?.authentication;
    final kimliksizgiriskarti = GoogleAuthProvider.credential(
      accessToken: googleyetki?.accessToken,
      idToken: googleyetki?.idToken,
    );
    UserCredential kimlik =
        await _firebaseAuth.signInWithCredential(kimliksizgiriskarti);
    return _createUser(kimlik.user);
  }

  Future<MyUser?> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);
    UserCredential kimlik =
        await _firebaseAuth.signInWithCredential(facebookAuthCredential);
    return _createUser(kimlik.user);
  }
}

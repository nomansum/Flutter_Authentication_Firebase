import 'package:firebase_auth/firebase_auth.dart';
import '../models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserDetails? _userFromFirebaseUser(User? user) {
    return user != null ? UserDetails(uid: user.uid) : null;
  }

  Stream<UserDetails?> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  Future signInAnon() async {
    try {
      var result = await _auth.signInAnonymously();

      var user = result.user;

      // print(user);
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());

      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

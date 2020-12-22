import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<User> signInAnonymous() async {
    try {
      UserCredential res = await _auth.signInAnonymously();
      User user = res.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  static Future<void> signOut() async {
    _auth.signOut();
  }
  static Stream<User> get firebaseAuthStream => _auth.authStateChanges();
}
 
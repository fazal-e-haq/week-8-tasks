import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  void signIn(String email, String password) {
    _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  void signUp(String email, String password) {
    _auth.createUserWithEmailAndPassword(email: email, password: password);
  }
}

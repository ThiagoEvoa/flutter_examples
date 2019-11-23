import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthService {
  FirebaseAuth _firebaseAuth;

  FirebaseAuthService() : _firebaseAuth = FirebaseAuth.instance;

  Future<AuthResult> sign(
      {@required String email, @required String password}) async {
    return await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<AuthResult> signUp(
      {@required String email, @required String password}) async {
    return await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }

  Future<bool> isSigned() async {
    return await _firebaseAuth.currentUser() != null;
  }

  Future<FirebaseUser> getUser() async {
    return await _firebaseAuth.currentUser();
  }

  Future<void> resetPassword({@required String email}) async {
    return await _firebaseAuth.sendPasswordResetEmail(email: email);
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grad_project/features/auth/models/user_model.dart';

class FirebaseDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<void> signUp(String email, String password, String name) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      await _firestore
          .collection('users')
          .doc(userCredential.user?.uid)
          .set(
            UserModel(
              fullName: name,
              email: email,
              password: password,
            ).toJson(),
          );
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          throw Exception('This email is already registered');
        case 'weak-password':
          throw Exception('Password is too weak');
        case 'invalid-email':
          throw Exception('Invalid email format');
        default:
          throw Exception('Sign up failed, please try again');
      }
    }
  }

  Future<void> login({required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
        case 'wrong-password':
        case 'invalid-credential':
          throw Exception('Email or password is incorrect');
        case 'invalid-email':
          throw Exception('Invalid email format');
        case 'too-many-requests':
          throw Exception('Too many attempts, try again later');
        default:
          throw Exception('Login failed, please try again');
      }
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      throw Exception('Sign out failed: ${e.message ?? e.code}');
    }
  }
}

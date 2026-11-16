import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:grad_project/features/auth/models/user_model.dart';
import 'package:grad_project/features/queue_details/models/appointment_model.dart';

class FirebaseDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<void> signUp(String email, String password, String name) async {
    UserCredential cred;

    try {
      cred = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
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

    try {
      await _firestore.collection('users').doc(cred.user!.uid).set({
        'fullName': name,
        'email': email,
        'createdAt': FieldValue.serverTimestamp(),
      });
    } on FirebaseException catch (e) {
      debugPrint('Firestore error: ${e.code} - ${e.message}');
      await cred.user?.delete();
      throw Exception('Could not save your profile, please try again');
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

  Future<UserModel?> getUserData({String? userId}) async {
    try {
      String uid = userId ?? _auth.currentUser!.uid;
      DocumentSnapshot doc = await _firestore
          .collection('users')
          .doc(uid)
          .get();

      if (doc.exists && doc.data() != null) {
        return UserModel.fromJson(doc.data() as Map<String, dynamic>);
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<void> updateUserData({
    required String name,
    required String email,
    // String? profileImageUrl,
  }) async {
    try {
      String uid = _auth.currentUser!.uid;
      await _firestore.collection('users').doc(uid).update({
        'fullName': name,
        'email': email,
      });
    } catch (e) {
      throw Exception('Failed to update user data: $e');
    }
  }

  Future<AppointmentModel> getAppointmentDetails(String bookingNumber) async {
    try {
      final querySnapshot = await _firestore
          .collection('appointments')
          .where("bookingNumber", isEqualTo: bookingNumber)
          .get();

      final docSnapshot = querySnapshot.docs.first;

      AppointmentModel appointment = AppointmentModel.fromJson(
        docSnapshot.data(),
        docSnapshot.id,
      );
      return appointment;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<AppointmentModel?> getActiveAppointment() async {
    try {
      final uid = _auth.currentUser?.uid;
      print('Current uid: $uid');
      if (uid == null) return null;

      final snapshot = await _firestore
          .collection('appointments')
          .where('userId', isEqualTo: uid)
          .where('status', isEqualTo: 'upcoming')
          .limit(1)
          .get();

      if (snapshot.docs.isEmpty) return null;
      final doc = snapshot.docs.first;
      AppointmentModel appointmentModel = AppointmentModel.fromJson(
        doc.data(),
        doc.id,
      );
      return appointmentModel;
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  Future<void> rescheduleAppointment(
    String appointmentId,
    DateTime newDate,
    String newTime,
  ) async {
    await _firestore.collection('appointments').doc(appointmentId).update({
      'date': Timestamp.fromDate(newDate),
      'time': newTime,
    });
  }

  Future<void> cancelAppointment(String appointmentId) async {
    await _firestore.collection('appointments').doc(appointmentId).update({
      'status': 'cancelled',
    });
  }
}

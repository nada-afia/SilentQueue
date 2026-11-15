import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grad_project/features/booking/models/appointment_model.dart';

class BookingFirebaseDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String get userId {
    return _auth.currentUser!.uid;
  }

  String newAppointmentId() {
    return _firestore.collection('appointments').doc().id;
  }

  Future<void> saveAppointment(AppointmentModel appointment) async {
    try {
      await _firestore
          .collection('appointments')
          .doc(appointment.id)
          .set(appointment.toJson());
    } catch (e) {
      throw Exception('Failed to save appointment: $e');
    }
  }

  Future<void> updateReminder(String appointmentId, bool value) async {
    try {
      await _firestore.collection('appointments').doc(appointmentId).update({
        'reminderEnabled': value,
      });
    } catch (e) {
      throw Exception('Failed to update reminder: $e');
    }
  }
}
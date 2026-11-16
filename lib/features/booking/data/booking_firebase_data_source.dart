import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grad_project/features/booking/models/appointment_model.dart';
import 'package:grad_project/features/home/models/doctor_model.dart';

class BookingFirebaseDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String get userId => _auth.currentUser!.uid;

  String newAppointmentId() {
    return _firestore.collection('appointments').doc().id;
  }

  Future<void> saveAppointment(AppointmentModel appointment) async {
    try {
      await _firestore.collection('appointments').doc(appointment.id).set({
        ...appointment.toJson(),
        'userId': userId,
        'createdAt': FieldValue.serverTimestamp(),
      });
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

  Future<List<AppointmentModel>> getPreviousAppointments() async {
    try {
      final snap = await _firestore
          .collection('appointments')
          .where('userId', isEqualTo: userId)
          .where('status', whereIn: ['completed', 'cancelled'])
          .orderBy('date', descending: true)
          .get();

      return snap.docs
          .map((d) => AppointmentModel.fromJson(d.data(), d.id))
          .toList();
    } catch (e) {
      throw Exception('Failed to load previous appointments: $e');
    }
  }

  Future<DoctorModel?> getDoctorById(String doctorId) async {
    final doc = await _firestore.collection('doctors').doc(doctorId).get();
    if (!doc.exists) return null;
    return DoctorModel.fromJson(doc.data()!, doc.id);
  }
}

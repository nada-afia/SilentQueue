import 'package:cloud_firestore/cloud_firestore.dart';

class AppointmentModel {
  final String id;
  final String bookingNumber;
  final String userId;
  final String doctorId;
  final String doctorName;
  final String doctorInitials;
  final String doctorImageUrl;
  final String specialty;
  final String clinic;
  final String address;
  final DateTime date;
  final String time;
  final double consultationFee;
  final double bookingFee;
  final double discount;
  final double total;
  final String status;
  final bool reminderEnabled;

  AppointmentModel({
    required this.id,
    required this.bookingNumber,
    required this.userId,
    required this.doctorId,
    required this.doctorName,
    required this.doctorInitials,
    required this.doctorImageUrl,
    required this.specialty,
    required this.clinic,
    required this.address,
    required this.date,
    required this.time,
    required this.consultationFee,
    required this.bookingFee,
    required this.discount,
    required this.total,
    required this.status,
    required this.reminderEnabled,
  });

  Map<String, dynamic> toJson() {
    return {
      'bookingNumber': bookingNumber,
      'userId': userId,
      'doctorId': doctorId,
      'doctorName': doctorName,
      'doctorInitials': doctorInitials,
      'doctorImageUrl': doctorImageUrl,
      'specialty': specialty,
      'clinic': clinic,
      'address': address,
      'date': Timestamp.fromDate(date),
      'time': time,
      'consultationFee': consultationFee,
      'bookingFee': bookingFee,
      'discount': discount,
      'total': total,
      'status': status,
      'reminderEnabled': reminderEnabled,
      'createdAt': FieldValue.serverTimestamp(),
    };
  }

  factory AppointmentModel.fromJson(Map<String, dynamic> json, String id) {
    return AppointmentModel(
      id: id,
      bookingNumber: json['bookingNumber'],
      userId: json['userId'],
      doctorId: json['doctorId'],
      doctorName: json['doctorName'],
      doctorInitials: json['doctorInitials'],
      doctorImageUrl: json['doctorImageUrl'] ?? '',
      specialty: json['specialty'],
      clinic: json['clinic'],
      address: json['address'],
      date: (json['date'] as Timestamp).toDate(),
      time: json['time'],
      consultationFee: (json['consultationFee'] as num).toDouble(),
      bookingFee: (json['bookingFee'] as num).toDouble(),
      discount: (json['discount'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
      status: json['status'],
      reminderEnabled: json['reminderEnabled'],
    );
  }
}
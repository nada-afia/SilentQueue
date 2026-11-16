import 'package:cloud_firestore/cloud_firestore.dart';

class AppointmentModel {
  final String? address;
  final String? id;
  final num? bookingFee;
  final String? bookingNumber;
  final String? clinic;
  final num? consultationFee;
  final Timestamp? createdAt;
  final Timestamp? date;
  final num? discount;
  final String? doctorId;
  final String? doctorImageUrl;
  final String? doctorInitials;
  final String? doctorName;
  final bool? reminderEnabled;
  final String? specialty;
  final String? status;
  final String? time;
  final num? total;
  final String? userId;

  AppointmentModel({
    this.address,
    this.id,
    this.bookingFee,
    this.bookingNumber,
    this.clinic,
    this.consultationFee,
    this.createdAt,
    this.date,
    this.discount,
    this.doctorId,
    this.doctorImageUrl,
    this.doctorInitials,
    this.doctorName,
    this.reminderEnabled,
    this.specialty,
    this.status,
    this.time,
    this.total,
    this.userId,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json, String docId) {
    return AppointmentModel(
      address: json['address'],
      id: docId,
      bookingFee: json['bookingFee'],
      bookingNumber: json['bookingNumber'],
      clinic: json['clinic'],
      consultationFee: json['consultationFee'],
      createdAt: json['createdAt'],
      date: json['date'],
      discount: json['discount'],
      doctorId: json['doctorId'],
      doctorImageUrl: json['doctorImageUrl'],
      doctorInitials: json['doctorInitials'],
      doctorName: json['doctorName'],
      reminderEnabled: json['reminderEnabled'],
      specialty: json['specialty'],
      status: json['status'],
      time: json['time'],
      total: json['total'],
      userId: json['userId'],
    );
  }
}

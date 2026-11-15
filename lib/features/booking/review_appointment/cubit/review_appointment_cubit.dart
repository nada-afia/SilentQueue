import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/features/booking/data/booking_firebase_data_source.dart';
import 'package:grad_project/features/booking/models/appointment_model.dart';
import 'package:grad_project/features/home/models/doctor_model.dart';
import 'review_appointment_state.dart';

class ReviewAppointmentCubit extends Cubit<ReviewAppointmentStates> {
  ReviewAppointmentCubit({
    required this.doctor,
    required this.selectedDate,
    required this.selectedTime,
  }) : super(ReviewAppointmentInitialState());

  final BookingFirebaseDataSource _dataSource = BookingFirebaseDataSource();

  final DoctorModel doctor;

  DateTime selectedDate;

  String selectedTime;

  double bookingFee = 5;
  double discountPercent = 10;

  double get consultationFee {
    return doctor.consultationFee;
  }

  double get discount {
    return (consultationFee + bookingFee) * discountPercent / 100;
  }

  double get total {
    return consultationFee + bookingFee - discount;
  }

  String get formattedDate {
    final days = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];

    final months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];

    final dayName = days[selectedDate.weekday - 1];
    final monthName = months[selectedDate.month - 1];

    return '$dayName, $monthName ${selectedDate.day}, ${selectedDate.year}';
  }

  Future<void> confirmAppointment() async {
    emit(ReviewAppointmentLoadingState());

    try {
      final id = _dataSource.newAppointmentId();

      final appointment = AppointmentModel(
        id: id,
        bookingNumber: 'APT${id.substring(0, 6).toUpperCase()}',
        userId: _dataSource.userId,
        doctorId: doctor.id,
        doctorName: doctor.name,
        doctorInitials: doctor.initials,
        doctorImageUrl: doctor.imageUrl,
        specialty: doctor.specialty,
        clinic: doctor.clinic,
        address: doctor.address,
        date: DateTime(
          selectedDate.year,
          selectedDate.month,
          selectedDate.day,
        ),
        time: selectedTime,
        consultationFee: consultationFee,
        bookingFee: bookingFee,
        discount: discount,
        total: total,
        status: 'upcoming',
        reminderEnabled: true,
      );

      await _dataSource.saveAppointment(appointment);

      emit(ReviewAppointmentSuccessState(appointment));
    } catch (e) {
      emit(ReviewAppointmentErrorState(e.toString()));
    }
  }
}
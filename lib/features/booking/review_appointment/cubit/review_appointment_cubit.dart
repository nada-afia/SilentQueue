import 'package:flutter_bloc/flutter_bloc.dart';
import 'review_appointment_state.dart';

class ReviewAppointmentCubit extends Cubit<ReviewAppointmentStates> {
  ReviewAppointmentCubit({
    required this.selectedDate,
    required this.selectedTime,
  }) : super(ReviewAppointmentInitialState());

  DateTime selectedDate;

  String selectedTime;

  String doctorInitials = 'SM';
  String doctorName = 'Dr. Sarah Mitchell';
  String specialty = 'Cardiologist';
  String hospital = 'City Heart Center';
  String address = '123 Medical Drive, Suite 400';

  double consultationFee = 150;
  double bookingFee = 5;
  double discountPercent = 10;

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
      await Future.delayed(const Duration(seconds: 2));

      emit(ReviewAppointmentSuccessState());
    } catch (e) {
      emit(ReviewAppointmentErrorState(e.toString()));
    }
  }
}
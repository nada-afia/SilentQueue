import 'package:flutter_bloc/flutter_bloc.dart';
import 'booking_confirmed_state.dart';

class BookingConfirmedCubit extends Cubit<BookingConfirmedStates> {
  BookingConfirmedCubit({
    required this.selectedDate,
    required this.selectedTime,
  }) : super(BookingConfirmedInitialState());

  DateTime selectedDate;

  String selectedTime;

  String bookingId = 'APT12983';

  String doctorInitials = 'SM';
  String doctorName = 'Dr. Sarah Mitchell';
  String specialty = 'Cardiologist';
  String hospital = 'City Heart Center';

  bool reminderEnabled = true;

  String get shortDate {
    final months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];

    final monthName = months[selectedDate.month - 1];

    return '$monthName ${selectedDate.day}, ${selectedDate.year}';
  }

  void changeReminder(bool value) {
    reminderEnabled = value;
    emit(BookingConfirmedSuccessState());
  }
}
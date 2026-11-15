import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/features/booking/data/booking_firebase_data_source.dart';
import 'package:grad_project/features/booking/models/appointment_model.dart';
import 'booking_confirmed_state.dart';

class BookingConfirmedCubit extends Cubit<BookingConfirmedStates> {
  BookingConfirmedCubit({required this.appointment})
    : super(BookingConfirmedInitialState()) {
    reminderEnabled = appointment.reminderEnabled;
  }

  final BookingFirebaseDataSource _dataSource = BookingFirebaseDataSource();

  final AppointmentModel appointment;

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

    final monthName = months[appointment.date.month - 1];

    return '$monthName ${appointment.date.day}, ${appointment.date.year}';
  }

  Future<void> changeReminder(bool value) async {
    reminderEnabled = value;
    emit(BookingConfirmedSuccessState());

    try {
      await _dataSource.updateReminder(appointment.id, value);
    } catch (e) {
      reminderEnabled = !value;
      emit(BookingConfirmedErrorState(e.toString()));
    }
  }
}
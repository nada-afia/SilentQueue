import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/features/home/models/doctor_model.dart';
import 'book_appointment_state.dart';

class BookAppointmentCubit extends Cubit<BookAppointmentStates> {
  BookAppointmentCubit({
    required this.doctor,
    DateTime? initialDate,
    String? initialTime,
    this.replaceId,
  }) : super(BookAppointmentInitialState()) {
    if (doctor.availableTimes.isNotEmpty) {
      selectedTime = doctor.availableTimes.first;
    }
    if (initialTime != null && doctor.availableTimes.contains(initialTime)) {
      selectedTime = initialTime;
    }
    if (initialDate != null) {
      final today = DateTime.now();
      final todayOnly = DateTime(today.year, today.month, today.day);
      selectedDate = initialDate.isBefore(todayOnly) ? todayOnly : initialDate;
    }
  }

  final DoctorModel doctor;

  final String? replaceId;

  DateTime selectedDate = DateTime.now();

  String selectedTime = '';

  void changeDate(DateTime date) {
    selectedDate = date;
    emit(BookAppointmentSuccessState());
  }

  void changeTime(String time) {
    selectedTime = time;
    emit(BookAppointmentSuccessState());
  }
}
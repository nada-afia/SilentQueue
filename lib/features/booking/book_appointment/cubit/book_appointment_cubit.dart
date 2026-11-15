import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/features/home/models/doctor_model.dart';
import 'book_appointment_state.dart';

class BookAppointmentCubit extends Cubit<BookAppointmentStates> {
  BookAppointmentCubit({required this.doctor})
    : super(BookAppointmentInitialState()) {
    if (doctor.availableTimes.isNotEmpty) {
      selectedTime = doctor.availableTimes.first;
    }
  }

  final DoctorModel doctor;

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
import 'package:flutter_bloc/flutter_bloc.dart';
import 'book_appointment_state.dart';

class BookAppointmentCubit extends Cubit<BookAppointmentStates> {
  BookAppointmentCubit() : super(BookAppointmentInitialState());

  DateTime selectedDate = DateTime.now();

  String selectedTime = '09:00 AM';

  void changeDate(DateTime date) {
    selectedDate = date;
    emit(BookAppointmentSuccessState());
  }

  void changeTime(String time) {
    selectedTime = time;
    emit(BookAppointmentSuccessState());
  }
}
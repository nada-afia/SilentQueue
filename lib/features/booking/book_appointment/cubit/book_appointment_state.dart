sealed class BookAppointmentStates {}

class BookAppointmentInitialState extends BookAppointmentStates {}

class BookAppointmentLoadingState extends BookAppointmentStates {}

class BookAppointmentSuccessState extends BookAppointmentStates {}

class BookAppointmentErrorState extends BookAppointmentStates {
  final String errorMessage;

  BookAppointmentErrorState(this.errorMessage);
}
import 'package:grad_project/features/booking/models/appointment_model.dart';

sealed class ReviewAppointmentStates {}

class ReviewAppointmentInitialState extends ReviewAppointmentStates {}

class ReviewAppointmentLoadingState extends ReviewAppointmentStates {}

class ReviewAppointmentSuccessState extends ReviewAppointmentStates {
  final AppointmentModel appointment;

  ReviewAppointmentSuccessState(this.appointment);
}

class ReviewAppointmentErrorState extends ReviewAppointmentStates {
  final String errorMessage;

  ReviewAppointmentErrorState(this.errorMessage);
}
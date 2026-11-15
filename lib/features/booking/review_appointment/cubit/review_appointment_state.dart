sealed class ReviewAppointmentStates {}

class ReviewAppointmentInitialState extends ReviewAppointmentStates {}

class ReviewAppointmentLoadingState extends ReviewAppointmentStates {}

class ReviewAppointmentSuccessState extends ReviewAppointmentStates {}

class ReviewAppointmentErrorState extends ReviewAppointmentStates {
  final String errorMessage;

  ReviewAppointmentErrorState(this.errorMessage);
}
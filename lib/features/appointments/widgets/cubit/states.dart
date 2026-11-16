import 'package:grad_project/features/queue_details/models/appointment_model.dart';

abstract class AppointmentsStates {}

class AppointmentsInitial extends AppointmentsStates {}

class AppointmentsEmpty extends AppointmentsStates {}

class AppointmentsLoading extends AppointmentsStates {}

class AppointmentsLoaded extends AppointmentsStates {
  final AppointmentModel appointmentModel;

  AppointmentsLoaded({required this.appointmentModel});
}

class AppointmentsError extends AppointmentsStates {
  final String message;

  AppointmentsError({required this.message});
}

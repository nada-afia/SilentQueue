import 'package:grad_project/features/queue_details/models/appointment_model.dart';

abstract class QueueDetailsStates {}

class QueueDetailsInitial extends QueueDetailsStates {}

class QueueDetailsLoading extends QueueDetailsStates {}

class QueueDetailsLoaded extends QueueDetailsStates {
  final AppointmentModel appointmentModel;
  final String patientName;

  QueueDetailsLoaded({
    required this.appointmentModel,
    required this.patientName,
  });
}

class QueueDetailsError extends QueueDetailsStates {
  final String message;

  QueueDetailsError({required this.message});
}

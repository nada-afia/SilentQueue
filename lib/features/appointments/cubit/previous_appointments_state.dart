import 'package:grad_project/features/booking/models/appointment_model.dart';
import 'package:grad_project/features/home/models/doctor_model.dart';

abstract class PreviousAppointmentsState {}

class PreviousAppointmentsLoading extends PreviousAppointmentsState {}

class PreviousAppointmentsLoaded extends PreviousAppointmentsState {
  final List<AppointmentModel> appointments;
  PreviousAppointmentsLoaded(this.appointments);
}

class PreviousAppointmentsError extends PreviousAppointmentsState {
  final String message;
  PreviousAppointmentsError(this.message);
}

class RebookLoading extends PreviousAppointmentsState {}

class RebookReady extends PreviousAppointmentsState {
  final DoctorModel doctor;
  RebookReady(this.doctor);
}

class RebookDoctorUnavailable extends PreviousAppointmentsState {}

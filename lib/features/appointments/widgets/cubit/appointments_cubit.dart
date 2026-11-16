import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/data_source.dart/firebase_data_source.dart';
import 'package:grad_project/features/appointments/widgets/cubit/states.dart';

class AppointmentsCubit extends Cubit<AppointmentsStates> {
  AppointmentsCubit() : super(AppointmentsInitial());
  final FirebaseDataSource dataSource = FirebaseDataSource();

  Future<void> getActiveAppointment() async {
    emit(AppointmentsLoading());
    try {
      final appointment = await dataSource.getActiveAppointment();
      print('Active appointment: ${appointment?.bookingNumber}');

      if (appointment == null) {
        emit(AppointmentsEmpty());
      } else {
        emit(AppointmentsLoaded(appointmentModel: appointment));
      }
    } catch (e) {
      print('Appointments error: $e');

      emit(AppointmentsError(message: e.toString()));
    }
  }

  Future<void> cancelAppointment(String appointmentId) async {
    emit(AppointmentsLoading());
    try {
      await dataSource.cancelAppointment(appointmentId);
      emit(AppointmentsEmpty());
    } catch (e) {
      emit(AppointmentsError(message: e.toString()));
    }
  }
}

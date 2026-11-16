import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/features/booking/data/booking_firebase_data_source.dart';

import 'previous_appointments_state.dart';

class PreviousAppointmentsCubit extends Cubit<PreviousAppointmentsState> {
  final BookingFirebaseDataSource _dataSource;

  PreviousAppointmentsCubit(this._dataSource)
    : super(PreviousAppointmentsLoading());

  Future<void> load() async {
    emit(PreviousAppointmentsLoading());
    try {
      final items = await _dataSource.getPreviousAppointments();
      emit(PreviousAppointmentsLoaded(items));
    } catch (e) {
      emit(PreviousAppointmentsError(e.toString()));
    }
  }

  Future<void> rebook(String doctorId) async {
    emit(RebookLoading());
    try {
      final doctor = await _dataSource.getDoctorById(doctorId);
      if (doctor == null) {
        emit(RebookDoctorUnavailable());
      } else {
        emit(RebookReady(doctor));
      }
    } catch (e) {
      emit(PreviousAppointmentsError(e.toString()));
    }
  }
}

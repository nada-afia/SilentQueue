import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/data_source.dart/firebase_data_source.dart';
import 'package:grad_project/features/auth/models/user_model.dart';
import 'package:grad_project/features/queue_details/cubit/states.dart';
import 'package:grad_project/features/queue_details/models/appointment_model.dart';

class QueueDetailsCubit extends Cubit<QueueDetailsStates> {
  QueueDetailsCubit() : super(QueueDetailsInitial());
  final FirebaseDataSource dataSource = FirebaseDataSource();

  Future<void> getAppointmentDetails(String bookingNumber) async {
    emit(QueueDetailsLoading());
    try {
      AppointmentModel appointmentModel = await dataSource
          .getAppointmentDetails(bookingNumber);

      UserModel? userModel = await dataSource.getUserData();

      String patientName = userModel?.fullName ?? "Patient Name";

      emit(
        QueueDetailsLoaded(
          appointmentModel: appointmentModel,
          patientName: patientName,
        ),
      );
    } catch (e) {
      emit(QueueDetailsError(message: e.toString()));
    }
  }
}

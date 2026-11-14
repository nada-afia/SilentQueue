import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/data_source.dart/firebase_data_source.dart';
import 'package:grad_project/features/profile/cubit/states.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitialState());
  FirebaseDataSource firebaseDataSource = FirebaseDataSource();

  Future<void> signOut() async {
    emit(ProfileLoadingState());
    try {
      await firebaseDataSource.signOut();
      emit(ProfileSuccessState());
    } catch (e) {
      emit(ProfileErrorState(e.toString()));
    }
  }
}

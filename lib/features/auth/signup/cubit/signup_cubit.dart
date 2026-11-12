import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/data_source.dart/firebase_data_source.dart';
import 'package:grad_project/features/auth/signup/cubit/states.dart';

class SignupCubit extends Cubit<SignUpStates> {
  SignupCubit() : super(SignUpInitialState());
  FirebaseDataSource firebaseDataSource = FirebaseDataSource();

  Future<void> signUp(String email, String password, String fullName) async {
    try {
      emit(SignUpLoadingState());
      await firebaseDataSource.signUp(email, password, fullName);
      emit(SignUpSuccessState());
    } catch (e) {
      emit(SignUpErrorState(e.toString()));
    }
  }
}

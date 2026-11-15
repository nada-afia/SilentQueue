import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/data_source.dart/firebase_data_source.dart';
import 'package:grad_project/features/auth/signin/cubit/states.dart';

class SigninCubit extends Cubit<SignInStates> {
  SigninCubit() : super(SignInInitialState());
  FirebaseDataSource firebaseDataSource = FirebaseDataSource();

  Future<void> signIn(String email, String password) async {
    try {
      emit(SignInLoadingState());
      await firebaseDataSource.login(email: email, password: password);
      emit(SignInSuccessState());
    } catch (e) {
      emit(SignInErrorState(e.toString()));
    }
  }
}

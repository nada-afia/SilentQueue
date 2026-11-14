import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/data_source.dart/firebase_data_source.dart';
import 'package:grad_project/features/profile/cubit/states.dart';
import 'package:image_picker/image_picker.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitialState()) {
    getUserData();
  }

  FirebaseDataSource firebaseDataSource = FirebaseDataSource();

  void toggleEditing() {
    if (state is ProfileLoadedState) {
      final currentState = state as ProfileLoadedState;
      emit(currentState.copyWith(isEditing: !currentState.isEditing));
    }
  }

  Future<void> pickImage() async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        if (state is ProfileLoadedState) {
          final currentState = state as ProfileLoadedState;
          emit(currentState.copyWith(imageFile: File(pickedFile.path)));
        }
      }
    } catch (e) {
      emit(ProfileErrorState(e.toString()));
    }
  }

  void saveProfile(String name, String email) async {
    emit(ProfileLoadingState());
    try {
      await firebaseDataSource.updateUserData(name: name, email: email);

      emit(
        ProfileLoadedState(
          isEditing: false,
          name: name,
          email: email,
          profileImageUrl: 'assets/images/Sarah Jenkins.png',
        ),
      );
    } catch (e) {
      print("Error saving profile: $e");
      emit(ProfileErrorState(e.toString()));
    }
  }

  Future<void> getUserData() async {
    emit(ProfileLoadingState());
    try {
      final userModel = await firebaseDataSource.getUserData();

      if (userModel != null) {
        emit(
          ProfileLoadedState(
            name: userModel.fullName,
            email: userModel.email,
            profileImageUrl: 'https://pixabay.com/vectors/blank-profile-picture-mystery-man-973460/',
          ),
        );
      } else {
        emit(ProfileErrorState('User data not found'));
      }
    } catch (e) {
      emit(ProfileErrorState(e.toString()));
    }
  }

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

import 'dart:io';

sealed class ProfileStates {}

class ProfileInitialState extends ProfileStates {}

class ProfileLoadingState extends ProfileStates {}

class ProfileLoadedState extends ProfileStates {
  final bool isEditing;
  final String name;
  final String email;
  final String profileImageUrl;
  final File? imageFile;

  ProfileLoadedState({
    this.isEditing = false,
    required this.name,
    required this.email,
    required this.profileImageUrl,
    this.imageFile,
  });

  ProfileLoadedState copyWith({
    bool? isEditing,
    String? name,
    String? email,
    String? profileImageUrl,
    File? imageFile,
  }) {
    return ProfileLoadedState(
      isEditing: isEditing ?? this.isEditing,
      name: name ?? this.name,
      email: email ?? this.email,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      imageFile: imageFile ?? this.imageFile,
    );
  }
}

class ProfileSuccessState extends ProfileStates {}

class ProfileErrorState extends ProfileStates {
  final String errorMessage;

  ProfileErrorState(this.errorMessage);
}

sealed class ProfileStates {}

class ProfileInitialState extends ProfileStates {}

class ProfileLoadingState extends ProfileStates {}

class ProfileSuccessState extends ProfileStates {}

class ProfileErrorState extends ProfileStates {
  final String errorMessage;
  ProfileErrorState(this.errorMessage);
}

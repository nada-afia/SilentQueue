sealed class BookingConfirmedStates {}

class BookingConfirmedInitialState extends BookingConfirmedStates {}

class BookingConfirmedLoadingState extends BookingConfirmedStates {}

class BookingConfirmedSuccessState extends BookingConfirmedStates {}

class BookingConfirmedErrorState extends BookingConfirmedStates {
  final String errorMessage;

  BookingConfirmedErrorState(this.errorMessage);
}
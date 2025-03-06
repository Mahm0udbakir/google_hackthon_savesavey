abstract class HomeStates {}

class InitialHomeState extends HomeStates {}

class LoadingHomeState extends HomeStates {}

class SuccessHomeState extends HomeStates {
  final String extractedText;
  SuccessHomeState(this.extractedText);
}

class ErrorHomeState extends HomeStates {
  final String error;
  ErrorHomeState(this.error);
}

abstract class SignupStates {}

class InitialSignupState extends SignupStates {}

class SignupLoadingState extends SignupStates {}

class SignupSuccessState extends SignupStates {}

class SignupErrorState extends SignupStates {
  final String error;
  SignupErrorState(this.error);

}

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_hackthon_savesavey/helpers/local_auth.dart';

import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(InitialLoginState());

  static LoginCubit get(BuildContext context) => BlocProvider.of(context);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  bool authenticated = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> userLogin(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;
    emit(LoginLoadingState());
    try {
      await _auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      emit(LoginSuccessState());
    } on FirebaseAuthException catch (e) {
      emit(LoginErrorState(e.message ?? "Login failed"));
    } catch (e) {
      emit(LoginErrorState("Something went wrong"));
    }
  }

  Future<void> checkBiometrics() async {
    final authenticate = await LocalAuth.authenticate();
    authenticated = authenticate;
    emit(ToggleAuthentication());

    if (authenticated) {
      emit(LoginSuccessState());
    } else {
      emit(LoginErrorState('Error while authentication'));
    }
  }
}

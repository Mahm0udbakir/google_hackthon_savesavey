import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(InitialLoginState());

  static LoginCubit get(BuildContext context) => BlocProvider.of(context);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// **User Login Method**
  Future<void> userLogin(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;

    emit(LoginLoadingState());

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      print("✅ Login successful: ${userCredential.user?.uid}");

      emit(LoginSuccessState());

      // Navigate to Home Screen
      Navigator.pushReplacementNamed(context, "/homeScreen");
    } on FirebaseAuthException catch (e) {
      print("❌ Firebase Auth Error: ${e.code} - ${e.message}");
      emit(LoginErrorState(e.message ?? "Login failed"));
    } catch (e) {
      print("❌ General Login Error: $e");
      emit(LoginErrorState("Something went wrong"));
    }
  }
}

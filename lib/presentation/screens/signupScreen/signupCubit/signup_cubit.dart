import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/models/user_model.dart';
import 'signup_states.dart';

class SignupCubit extends Cubit<SignupStates> {
  SignupCubit() : super(InitialSignupState());

  static SignupCubit get(context) => BlocProvider.of(context);

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// **Sign up method**
  Future<void> userSignup() async {
    if (!formKey.currentState!.validate()) return;

    emit(SignupLoadingState());

    try {
      // Create user with Firebase Auth
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      UserModel user = UserModel(
        uid: userCredential.user!.uid,
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        phone: phoneController.text.trim(),
        createdAt: DateTime.now(),
      );

      debugPrint("✅ User created: ${user.uid}");
      debugPrint("📝 Saving user to Firestore...");

      // Save user to Firestore
      await _firestore.collection("users").doc(user.uid).set(user.toMap());

      emit(SignupSuccessState());

    } on FirebaseAuthException catch (e) {
      emit(SignupErrorState(e.message ?? "Signup failed"));
    } catch (e) {
      emit(SignupErrorState("Something went wrong"));
    }
  }



}

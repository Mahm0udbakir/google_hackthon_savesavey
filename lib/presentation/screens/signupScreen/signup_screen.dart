import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_hackthon_savesavey/presentation/screens/signUpScreen/widgets/already_have_account.dart';
import 'package:google_hackthon_savesavey/presentation/screens/signUpScreen/widgets/signup_button.dart';
import 'package:google_hackthon_savesavey/presentation/screens/signUpScreen/widgets/terms_and_verification.dart';
import '../../../helpers/text_styles.dart';
import '../../../router/routes.dart';
import '../signUpScreen/signupCubit/signup_cubit.dart';
import '../signUpScreen/signupCubit/signup_states.dart';
import 'widgets/signup_text_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupStates>(
      listener: (context, state) {
        if (state is SignupSuccessState) {
          // Navigate to the success screen
          Navigator.pushReplacementNamed(context, Routes.signupSuccessfulScreen);
        } else if (state is SignupErrorState) {
          // Show error message in a snackbar
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error, style: TextStyles.font16WhiteRegular),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Sign up for SAVE SAVEY',
                      style: TextStyles.font22BlackBold,
                    ),
                  ),
                  const SignUpTextField(),
                  const TermsAndVerification(),
                  const SignUpButton(),
                  const AlreadyHaveAccount(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

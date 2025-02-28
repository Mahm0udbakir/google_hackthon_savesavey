import 'package:flutter/material.dart';
import 'package:google_hackthon_savesavey/presentation/screens/signUpScreen/widgets/already_have_account.dart';
import 'package:google_hackthon_savesavey/presentation/screens/signUpScreen/widgets/signup_button.dart';
import 'package:google_hackthon_savesavey/presentation/screens/signUpScreen/widgets/terms_and_verification.dart';

import '../../../helpers/text_styles.dart';
import 'widgets/signup_text_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      child: Text('Sign up for the SAVE SAVEY',
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
        );


  }
}
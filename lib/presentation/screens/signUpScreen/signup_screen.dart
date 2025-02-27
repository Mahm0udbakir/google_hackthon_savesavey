import 'package:flutter/material.dart';

import '../../../helpers/color_manager.dart';
import '../../../helpers/text_styles.dart';
import 'widgets/signup_text_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: ColorManager.lightGreen,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text('Welcome!' ,
                        style: TextStyles.font24BlackRegular,),
                    ),
                    const SizedBox(height:20),
                    Text('Sign up for the SAVE SAVEY',
                      style: TextStyles.font18BlackRegular,
                    ),
                    const SignUpTextField(),
                    // const TermsAndVerification(),
                    // const SignUpButton(),
                    // const AlreadyHaveAccount(),
                  ],
                ),
              ),
            ),
          ),
        );


  }
}
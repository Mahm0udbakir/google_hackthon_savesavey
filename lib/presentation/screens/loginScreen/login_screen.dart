import 'package:flutter/material.dart';

import '../../../helpers/text_styles.dart';
import 'widgets/check_biometrics.dart';
import 'widgets/login_bloc_listener.dart';
import 'widgets/login_button.dart';
import 'widgets/dont_have_account.dart';
import 'widgets/email_password_form_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //TODO SAVE SAVEY LOGO
                const SizedBox(height: 20),
                // Title
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Welcome to SAVE SAVEY',
                    style: TextStyles.font22BlackBold,
                  ),
                ),
                const SizedBox(height: 80),

                // Email & Password Fields
                const EmailPasswordFormField(),
                const SizedBox(height: 20),

                // Login Button
                const LoginButton(),
                const SizedBox(height: 15),

                // Don't have an account? Sign Up
                const DontHaveAccount(),
                const CheckBiometrics(),

                const LoginBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

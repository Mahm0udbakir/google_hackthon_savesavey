import 'package:flutter/material.dart';
import 'package:google_hackthon_savesavey/helpers/color_manager.dart';
import 'package:google_hackthon_savesavey/presentation/widgets/app_logo.dart';

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
      backgroundColor: ColorManager.gray80,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(0),
          child: Column(
            children: [
              AppLogo(),
              const SizedBox(height: 200),
              const EmailPasswordFormField(),
              const LoginButton(),
              const DontHaveAccount(),
              const CheckBiometrics(),
              const LoginBlocListener(),
            ],
          ),
        ),
      ),
    );
  }
}

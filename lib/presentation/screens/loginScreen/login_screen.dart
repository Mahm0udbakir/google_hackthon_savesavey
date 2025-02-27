import 'package:flutter/material.dart';

import '../../widgets/login_button.dart';
import 'dont_have_account.dart';
import 'email_password_form_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              EmailPasswordFormField(),
              LoginButton(),
              DontHaveAccount(),
            ],
          ),
        ),
      ),
    );
  }
}

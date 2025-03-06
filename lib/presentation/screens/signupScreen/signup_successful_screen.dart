import 'package:flutter/material.dart';

import '../../../helpers/color_manager.dart';
import '../../../helpers/text_styles.dart';
import '../../../router/routes.dart';



class SignupSuccessfulScreen extends StatelessWidget {
  const SignupSuccessfulScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.check,
                  color: ColorManager.darkBlue,
                  size: 90,
                ),
                const SizedBox(height: 20),
                Text(
                  'Your Sign up was successful',
                  style: TextStyles.font16BlackRegular,
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, Routes.bankCustomerCheck);
                  },
                  child: Text(
                    'Continue to Home',
                    style: TextStyles.font20DarkBlueMedium.copyWith(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

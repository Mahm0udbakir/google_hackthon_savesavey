import 'package:flutter/material.dart';

import '../../../../helpers/app_regex.dart';
import '../../../../helpers/text_styles.dart';
import '../../../widgets/app_text_form_field.dart';

class EmailPasswordFormField extends StatefulWidget {
  const EmailPasswordFormField({super.key});

  @override
  State<EmailPasswordFormField> createState() => _EmailPasswordFormFieldState();
}

class _EmailPasswordFormFieldState extends State<EmailPasswordFormField> {
  bool isObscured = true;
  String? emailError;
  String? passwordError;
  TextEditingController? emailController;
  TextEditingController? passwordController;
  var formKey = GlobalKey<FormState>();

  void updateErrorMessages(String email, String password) {
    setState(() {
      emailError = (!AppRegex.isEmailValid(email)) ? 'Enter a valid email' : null;
      passwordError = (!AppRegex.hasSpecialCharacter(password) ||
          !AppRegex.hasUpperCase(password) ||
          !AppRegex.hasLowerCase(password) ||
          !AppRegex.hasMinLength(password) ||
          !AppRegex.hasNumber(password))
          ? 'Enter a valid password'
          : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'Enter your email',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter a valid email';
              }
              return null;
            },
            inputTextStyle: TextStyles.font18BlackRegular,
            backgroundColor: Colors.white,
            controller: emailController,
            onChanged: (value) {},
          ),
          const SizedBox(height: 30),
          AppTextFormField(
            hintText: 'Enter your password',
            validator: (value) {
              if (value == null || value.isEmpty || !AppRegex.isPasswordValid(value)) {
                return 'Enter a valid password';
              }
              return null;
            },
            inputTextStyle: TextStyles.font18BlackRegular,
            controller: passwordController,
            backgroundColor: Colors.white,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscured = !isObscured;
                });
              },
              child: Icon(
                isObscured ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            isObscureText: isObscured,
            onChanged: (value) {},
            onFieldSubmitted: (value) {},
          ),
        ],
      ),
    );
  }
}

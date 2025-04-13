import 'package:flutter/material.dart';
import 'package:google_hackthon_savesavey/helpers/color_manager.dart';
import 'package:google_hackthon_savesavey/presentation/screens/loginScreen/loginCubit/login_cubit.dart';

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
    var cubit = LoginCubit.get(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
      child: Form(
        key: cubit.formKey,
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
              inputTextStyle: TextStyles.font16WhiteRegular,
              backgroundColor: ColorManager.gray70,
              controller: cubit.emailController,
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
              inputTextStyle: TextStyles.font16WhiteRegular,
              controller: cubit.passwordController,
              backgroundColor: ColorManager.gray70,
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
              onFieldSubmitted: (value) {
                cubit.userLogin(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

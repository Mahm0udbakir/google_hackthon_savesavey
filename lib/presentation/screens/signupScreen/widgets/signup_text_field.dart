import 'package:flutter/material.dart';
import 'package:google_hackthon_savesavey/helpers/color_manager.dart';
import 'package:google_hackthon_savesavey/presentation/screens/signUpScreen/signupCubit/signup_cubit.dart';
import '../../../../helpers/app_regex.dart';
import '../../../../helpers/text_styles.dart';
import '../../../widgets/app_text_form_field.dart';

class SignUpTextField extends StatefulWidget {
  const SignUpTextField({super.key});

  @override
  State<SignUpTextField> createState() => _SignUpTextFieldState();
}

class _SignUpTextFieldState extends State<SignUpTextField> {
  bool isObscuredPassword = true;
  bool isObscuredPasswordConfirmation = true;

  @override
  Widget build(BuildContext context) {
    var cubit = SignupCubit.get(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
      child: Form(
        key: cubit.formKey,
        child: Column(
          children: [
            AppTextFormField(
              hintText: 'Name',
              validator: (value) => value == null || value.isEmpty ? 'Enter a valid Name' : null,
              backgroundColor: ColorManager.gray70,
              inputTextStyle: TextStyles.font16WhiteRegular,
              controller: cubit.nameController,
            ),
            const SizedBox(height: 20),
            AppTextFormField(
              hintText: 'Email address',
              validator: (value) =>
              value == null || value.isEmpty || !AppRegex.isEmailValid(value)
                  ? 'Enter a valid Email address'
                  : null,
              backgroundColor: ColorManager.gray70,
              inputTextStyle: TextStyles.font16BlackRegular,
              controller: cubit.emailController,
            ),
            const SizedBox(height: 20),
            AppTextFormField(
              hintText: 'Phone number',
              validator: (value) =>
              value == null || value.isEmpty || !AppRegex.isPhoneValid(value)
                  ? 'Enter a valid Phone number'
                  : null,
              backgroundColor: ColorManager.gray70,
              inputTextStyle: TextStyles.font16WhiteRegular,
              controller: cubit.phoneController,
            ),
            const SizedBox(height: 20),
            AppTextFormField(
              hintText: 'Password',
              validator: (value) =>
              value == null || value.isEmpty || !AppRegex.isPasswordValid(value)
                  ? 'Enter a valid Password'
                  : null,
              backgroundColor: ColorManager.gray70,
              inputTextStyle: TextStyles.font16WhiteRegular,
              controller: cubit.passwordController,
              isObscureText: isObscuredPassword,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isObscuredPassword = !isObscuredPassword;
                  });
                },
                child: Icon(isObscuredPassword ? Icons.visibility_off : Icons.visibility),
              ),
            ),
            const SizedBox(height: 20),
            AppTextFormField(
              hintText: 'Confirm password',
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    !AppRegex.isPasswordValid(value) ||
                    cubit.passwordController.text != cubit.passwordConfirmationController.text) {
                  return 'Passwords do not match';
                }
                return null;
              },
              backgroundColor: ColorManager.gray70,
              inputTextStyle: TextStyles.font16WhiteRegular,
              controller: cubit.passwordConfirmationController,
              isObscureText: isObscuredPasswordConfirmation,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isObscuredPasswordConfirmation = !isObscuredPasswordConfirmation;
                  });
                },
                child: Icon(isObscuredPasswordConfirmation ? Icons.visibility_off : Icons.visibility),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

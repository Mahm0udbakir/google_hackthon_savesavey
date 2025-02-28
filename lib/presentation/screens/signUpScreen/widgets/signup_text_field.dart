import 'package:flutter/material.dart';

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

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 40),
      child: Form(
        key: UniqueKey(),
        child: Column(
          children: [
            AppTextFormField(
              hintText: 'Name',
              validator: (value){
                if(value == null || value.isEmpty) {
                  return 'Enter a valid Name';
                }
              },
              backgroundColor: Colors.white,
              inputTextStyle: TextStyles.font16BlackRegular,
              controller: TextEditingController(),
            ),
            const SizedBox(height: 20),
            AppTextFormField(
                hintText: 'Email address',
                validator: (value){
                  if(value == null || value.isEmpty || !AppRegex.isEmailValid(value)) {
                    return 'Enter a valid Email address';
                  }
                },
              backgroundColor: Colors.white,
              inputTextStyle: TextStyles.font16BlackRegular,
              controller: TextEditingController(),
            ),
            const SizedBox(height: 20),
            AppTextFormField(
                hintText: 'Phone number',
                validator: (value){
                  if (value == null || value.isEmpty || !AppRegex.isPhoneValid(value)){
                    return 'Enter a valid Phone number';
                  }
                },
              backgroundColor: Colors.white,
              inputTextStyle: TextStyles.font16BlackRegular,
              controller: TextEditingController(),
            ),
            const SizedBox(height: 20),
            AppTextFormField(
                hintText: 'Password',
                validator: (value){
                  if (value == null || value.isEmpty || !AppRegex.isPasswordValid(value)){
                    return 'Enter a valid Password';
                  }
                },
              backgroundColor: Colors.white,
              inputTextStyle: TextStyles.font16BlackRegular,
              controller: TextEditingController(),
              isObscureText: isObscuredPassword,
              suffixIcon: GestureDetector(
                onTap: (){
                  setState(() {
                    isObscuredPassword = !isObscuredPassword;
                  });
                },
                child: Icon(isObscuredPassword ?
                Icons.visibility_off :
                Icons.visibility,
                ),
              ),
            ),
             const SizedBox(height: 20),
            AppTextFormField(
              hintText: 'Confirm password',
              validator: (value){
                // if (value == null || value.isEmpty
                //     || !AppRegex.isPasswordValid(value) ||
                //     cubit.passwordController.text != cubit.passwordConfirmationController.text){
                //     return 'Enter a valid Password';
                //   }
                },
              isObscureText: isObscuredPasswordConfirmation,
              suffixIcon: GestureDetector(
                onTap: (){
                  setState(() {
                    isObscuredPasswordConfirmation = !isObscuredPasswordConfirmation;
                  });
                },
                child: Icon(isObscuredPasswordConfirmation ?
                Icons.visibility_off :
                Icons.visibility,
                ),
              ),
              backgroundColor: Colors.white,
              inputTextStyle: TextStyles.font16BlackRegular,
              controller:TextEditingController(),
              onFieldSubmitted: (value){
                // if(cubit.formKey.currentState!.validate()){
                //   cubit.emitSignUpState();
                }

            ),
          ],
        ),
      ),

    );
  }
}

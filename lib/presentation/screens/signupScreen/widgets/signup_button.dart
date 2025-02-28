// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../router/routes.dart';
import '../signupCubit/signup_cubit.dart';
import '../signupCubit/signup_states.dart';
import '../../../../helpers/color_manager.dart';
import '../../../../helpers/text_styles.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = SignupCubit.get(context);

    return BlocConsumer<SignupCubit, SignupStates>(
      listener: (context, state) {
        if (state is SignupSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Sign-up successful!"))
          );
          Navigator.pushReplacementNamed(context, Routes.homeScreen); // Navigate after signup
        } else if (state is SignupErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Error with signing up'))
          );
        }
      },
      builder: (context, state) {
        return Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: TextButton(
              style: ButtonStyle(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                backgroundColor: WidgetStatePropertyAll(ColorManager.blueDark),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                minimumSize: const WidgetStatePropertyAll(Size(196, 50)),
              ),
              onPressed: state is SignupLoadingState
                  ? null
                  : () {
                if (cubit.formKey.currentState!.validate()) {
                  cubit.userSignup();
                  Navigator.pushReplacementNamed(context, Routes.signUpSuccessfulScreen);
                }
              },
              child: state is SignupLoadingState
                  ? const CircularProgressIndicator(color: Colors.white)
                  : Text('Sign Up', style: TextStyles.font20WhiteSemiBold),
            ),
          ),
        );
      },
    );
  }
}

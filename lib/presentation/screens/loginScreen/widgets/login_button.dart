import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_hackthon_savesavey/presentation/screens/loginScreen/loginCubit/login_cubit.dart';
import 'package:google_hackthon_savesavey/presentation/widgets/primary_button.dart';

import '../loginCubit/login_states.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is LoginErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error), backgroundColor: Colors.red),
          );
        }
      },
      builder: (context, state) {
        var cubit = LoginCubit.get(context);

        return Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 35),
            child: PrimaryButton(
                text: 'Login',
              onPressed: () {
              cubit.userLogin(context);
            },
            ),
          ),
        );
      },
    );
  }
}

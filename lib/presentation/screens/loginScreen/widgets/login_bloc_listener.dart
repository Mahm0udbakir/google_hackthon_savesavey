import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_hackthon_savesavey/presentation/screens/loginScreen/loginCubit/login_cubit.dart';
import 'package:google_hackthon_savesavey/presentation/screens/loginScreen/loginCubit/login_states.dart';
import 'package:google_hackthon_savesavey/presentation/widgets/components.dart';

import '../../../../router/routes.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit ,LoginStates>(
        listener: (context , state) {
          if(state is LoginSuccessState){
            Navigator.pushReplacementNamed(context, Routes.homeScreen);
            showToast(text: 'Login Success', color: Colors.green, context: context);
          } else if (state is LoginErrorState){
            showToast(text: 'Login Failed ,Try again!', color: Colors.red, context: context);
          }
        },
        child: Container(),
    );
  }
}

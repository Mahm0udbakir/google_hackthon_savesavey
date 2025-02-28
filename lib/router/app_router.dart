import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_hackthon_savesavey/presentation/screens/loginScreen/loginCubit/login_cubit.dart';
import 'package:google_hackthon_savesavey/presentation/screens/signUpScreen/signupCubit/signup_cubit.dart';
import 'package:google_hackthon_savesavey/presentation/screens/signUpScreen/signup_screen.dart';
import 'package:google_hackthon_savesavey/presentation/screens/signupScreen/signup_successful_screen.dart';

import 'package:google_hackthon_savesavey/router/routes.dart';

import '../presentation/screens/homeScreen/home_screen.dart';
import '../presentation/screens/loginScreen/login_screen.dart';

class AppRouter {
  Route? generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (BuildContext context) => LoginCubit(),
                child: const LoginScreen()));
      case Routes.signUpScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (BuildContext context) => SignupCubit(),
                child: const SignUpScreen()));
      case Routes.signUpSuccessfulScreen:
        return MaterialPageRoute(
          builder: (_) => const SignupSuccessfulScreen(),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return null;
    }
  }
}

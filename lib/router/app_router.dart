import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_hackthon_savesavey/presentation/screens/chatBotScreen/chatBotScreen.dart';
import 'package:google_hackthon_savesavey/presentation/screens/doNotHaveAnAccountScreen/doNotHaveAnAccountScreen.dart';
import 'package:google_hackthon_savesavey/presentation/screens/homeScreen/auth_screen.dart';
import 'package:google_hackthon_savesavey/presentation/screens/loginScreen/loginCubit/login_cubit.dart';
import 'package:google_hackthon_savesavey/presentation/screens/servicesScreen/servicesScreen.dart';
import 'package:google_hackthon_savesavey/presentation/screens/signUpScreen/signupCubit/signup_cubit.dart';
import 'package:google_hackthon_savesavey/presentation/screens/signUpScreen/signup_screen.dart';
import 'package:google_hackthon_savesavey/presentation/screens/signupScreen/signup_successful_screen.dart';
import 'package:google_hackthon_savesavey/router/routes.dart';
import '../presentation/screens/homeScreen/home_screen.dart';
import '../presentation/screens/loginScreen/login_screen.dart';

class AppRouter {
  Route<dynamic> generateRoutes(RouteSettings settings) {
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

      case Routes.bankCustomerCheck:
        // final bankName = settings.arguments as String? ?? 'Unknown Bank';
        // return MaterialPageRoute(
        //   builder: (_) => const BankCustomerCheck(),
        // );
        case Routes.authScreen:
        return MaterialPageRoute(
          builder: (_) => const AuthScreen(),
        );
        case Routes.doNotHaveAnAccountScreen:
        return MaterialPageRoute(
          builder: (_) => const DoNotHaveAnAccountScreen(),
        );
      case Routes.servicesScreen:
        return MaterialPageRoute(
          builder: (_) => const ServicesScreen(),
        );
        case Routes.chatBotScreen:
        return MaterialPageRoute(
          builder: (_) => const ChatBotScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
    }
  }
}

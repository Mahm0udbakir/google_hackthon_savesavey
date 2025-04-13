import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_hackthon_savesavey/business_logic/cardCubit/card_cubit.dart';
import 'package:google_hackthon_savesavey/presentation/screens/budget_screen.dart';
import 'package:google_hackthon_savesavey/presentation/screens/chatBotScreen.dart';
import 'package:google_hackthon_savesavey/presentation/screens/credit_card_screen.dart';
import 'package:google_hackthon_savesavey/presentation/screens/loginScreen/loginCubit/login_cubit.dart';
import 'package:google_hackthon_savesavey/presentation/screens/signUpScreen/signupCubit/signup_cubit.dart';
import 'package:google_hackthon_savesavey/presentation/screens/signUpScreen/signup_screen.dart';
import 'package:google_hackthon_savesavey/presentation/screens/signupScreen/signup_successful_screen.dart';
import 'package:google_hackthon_savesavey/router/routes.dart';
import '../presentation/layouts/home_layout.dart';
import '../presentation/screens/add_card_screen.dart';
import '../presentation/screens/loginScreen/login_screen.dart';
import '../presentation/screens/onboarding_screen.dart';



class AppRouter {
  Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
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

      case Routes.signupSuccessfulScreen:
        return MaterialPageRoute(
          builder: (_) => const SignupSuccessfulScreen(),
        );

      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => CardCubit()..getUserCard(),
            child: const HomeLayout(),
          ),
        );

      case Routes.budgetScreen:
        return MaterialPageRoute(builder: (_) => const BudgetScreen());
      case Routes.creditCardScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => CardCubit()..getUserCard(), // optionally call getUserCard
            child: const CreditCardScreen(),
          ),
        );


      case Routes.addCardScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create:(BuildContext context) => CardCubit(),
            child: const AddCardScreen(),
          ),
        );


      case Routes.chatBotScreen:
        return MaterialPageRoute(
          builder: (_) => const ChatBotScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const HomeLayout(),
        );
    }
  }
}

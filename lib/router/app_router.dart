import 'package:flutter/material.dart';
import 'package:google_hackthon_savesavey/presentation/screens/signUpScreen/signup_screen.dart';

import 'package:google_hackthon_savesavey/router/routes.dart';

import '../presentation/screens/loginScreen/login_screen.dart';

class AppRouter {
  Route? generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.signUpScreen:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      default:
        return null;
    }
  }
}
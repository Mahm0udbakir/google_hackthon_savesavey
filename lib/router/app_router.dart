import 'package:flutter/material.dart';

import 'package:google_hackthon_savesavey/router/routers.dart';

import '../presentation/screens/loginScreen/login_screen.dart';

class AppRouter {
  Route? generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      default:
        return null;
    }
  }
}
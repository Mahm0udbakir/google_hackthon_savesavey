import 'package:flutter/material.dart';
import 'package:google_hackthon_savesavey/helpers/color_manager.dart';
import 'package:google_hackthon_savesavey/router/app_router.dart';


class SaveSaveyApp extends StatelessWidget {
  final AppRouter appRouter;

  const SaveSaveyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoutes,
      theme: ThemeData(
        fontFamily: "Inter",
        colorScheme: ColorScheme(
            brightness: Brightness.dark,
            primary: ColorManager.primary,
            onPrimary: ColorManager.white,
            secondary: ColorManager.secondary,
            onSecondary: ColorManager.white,
            error: ColorManager.red,
            onError: ColorManager.white,
            surface: ColorManager.gray80,
            onSurface: ColorManager.white
        ),
        useMaterial3: false
      ),
    );
  }
}

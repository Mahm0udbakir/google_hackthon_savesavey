import 'package:flutter/material.dart';
import 'package:google_hackthon_savesavey/router/app_router.dart';

class SaveSaveyApp extends StatelessWidget {
  final AppRouter appRouter;
  const SaveSaveyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoutes,
    );
  }
}

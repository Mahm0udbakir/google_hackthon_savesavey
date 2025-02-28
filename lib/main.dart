import 'package:flutter/material.dart';
import 'package:google_hackthon_savesavey/presentation/screens/onBoardingScreen/onboarding_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OnBoardingScreen(),
    );
  }
}

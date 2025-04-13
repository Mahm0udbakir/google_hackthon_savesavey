import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_hackthon_savesavey/helpers/color_manager.dart';
import 'package:google_hackthon_savesavey/presentation/widgets/app_logo.dart';
import 'package:google_hackthon_savesavey/presentation/widgets/primary_button.dart';

import '../../router/routes.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(
            'assets/images/onboardingBackground.png',
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppLogo(),
                const Spacer(),
                Text(
                  'Track smarter. Save better. Welcome to SaveSavey.',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                PrimaryButton(
                    text: 'Get Started',
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, Routes.signUpScreen);
                    }),
                const SizedBox(
                  height: 20,
                ),
                PrimaryButton(
                  text: 'I have an account',
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Routes.loginScreen);
                  },
                  backgroundColor: ColorManager.gray70,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

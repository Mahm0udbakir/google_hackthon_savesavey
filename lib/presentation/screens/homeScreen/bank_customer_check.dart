import 'package:flutter/material.dart';
import 'package:google_hackthon_savesavey/presentation/screens/homeScreen/auth_screen.dart';
import 'package:google_hackthon_savesavey/presentation/widgets/components.dart';

import '../../../router/routes.dart';

class BankCustomerCheck extends StatelessWidget {
  const BankCustomerCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Welcome! How would you like to proceed?",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),

              /// BUTTON ROW
              SizedBox(
                width: double.infinity, // Make buttons stretch evenly
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          navigateTo(context, AuthScreen());
                        },
                        icon: const Icon(Icons.login, color: Colors.white),
                        label: const FittedBox(
                          child: Text(
                            "Have an Account",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, Routes.doNotHaveAnAccountScreen);
                        },
                        icon: const Icon(Icons.person_add,
                            color: Colors.blueAccent),
                        label: const FittedBox(
                          child: Text(
                            "New Customer",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.blueAccent,
                          side: const BorderSide(
                              color: Colors.blueAccent, width: 2),
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

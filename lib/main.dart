import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_hackthon_savesavey/firebase_options.dart';
import 'package:google_hackthon_savesavey/presentation/screens/chatBotScreen/chatBotScreen.dart';
import 'package:google_hackthon_savesavey/presentation/screens/createCCScreen/createCC.dart';
import 'package:google_hackthon_savesavey/presentation/screens/doNotHaveAnAccountScreen/doNotHaveAnAccountScreen.dart';
import 'package:google_hackthon_savesavey/presentation/screens/homeScreen/home_screen.dart';
import 'package:google_hackthon_savesavey/presentation/screens/loginScreen/widgets/dont_have_account.dart';
import 'package:google_hackthon_savesavey/presentation/screens/servicesScreen/servicesScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    print("✅ Firebase initialized successfully!");
  } catch (e) {
    print("❌ Firebase initialization failed: $e");
  }

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CreateCCScreen(), 
    ),
  );
}

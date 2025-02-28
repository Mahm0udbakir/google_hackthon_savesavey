import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_hackthon_savesavey/router/app_router.dart';
import 'package:google_hackthon_savesavey/save_savey_app.dart';

import 'firebase_options.dart';



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
      SaveSaveyApp(
          appRouter: AppRouter()));
}
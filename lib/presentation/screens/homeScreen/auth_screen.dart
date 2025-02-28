import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_hackthon_savesavey/helpers/text_styles.dart';
import 'package:google_hackthon_savesavey/presentation/screens/servicesScreen/servicesScreen.dart';
import 'package:google_hackthon_savesavey/presentation/widgets/components.dart';
import 'package:local_auth/local_auth.dart';


class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

enum SupportState {
  unknown,
  supported,
  unSupported,
}

class _AuthScreenState extends State<AuthScreen> {
  late final LocalAuthentication auth;
  SupportState supportState = SupportState.unknown;
  List<BiometricType>? availableBiometrics;

  @override
  void initState() {
    super.initState();
    auth = LocalAuthentication();

    // Check if device supports biometrics
    auth.isDeviceSupported().then((bool isSupported) {
      setState(() {
        supportState = isSupported ? SupportState.supported : SupportState.unSupported;
      });
    });

    checkBiometric();
  }

  Future<void> checkBiometric() async {
    try {
      bool canCheckBiometric = await auth.canCheckBiometrics;
      print("Biometric supported: $canCheckBiometric");
    } on PlatformException catch (e) {
      print("Error checking biometrics: $e");
    }
  }

  Future<void> getAvailableBiometrics() async {
    try {
      List<BiometricType> biometrics = await auth.getAvailableBiometrics();
      if (!mounted) return;
      setState(() {
        availableBiometrics = biometrics;
      });
      print('Available biometrics: $biometrics');
    } on PlatformException catch (e) {
      print('Error getting biometrics: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Biometric Authentication'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              supportState == SupportState.supported
                  ? 'The device is supported'
                  : 'The device is not supported',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: getAvailableBiometrics,
              child: const Text('Get available biometrics'),
            ),
            const SizedBox(height: 20),
            if (availableBiometrics != null)
              Text(
                'Available Biometrics: ${availableBiometrics!.join(", ")}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),

            Align(
              alignment: Alignment.center,

                child: TextButton(onPressed: (){
                  // Navigator.pushReplacementNamed(context, Routes.servicesScreen);
                  navigateTo(context, ServicesScreen());
                },
                    child: Text(
                        'Pass' ,
                      style: TextStyles.font24BlackRegular,
                    ))),
          ],
        ),
      ),
    );
  }
}

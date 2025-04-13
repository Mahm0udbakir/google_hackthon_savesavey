import 'package:flutter/material.dart';
import 'package:google_hackthon_savesavey/helpers/color_manager.dart';
import 'package:google_hackthon_savesavey/presentation/screens/loginScreen/loginCubit/login_cubit.dart';
import 'package:google_hackthon_savesavey/presentation/widgets/primary_button.dart';



class CheckBiometrics extends StatelessWidget {
  const CheckBiometrics({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: PrimaryButton(
        text: 'Check Biometrics',
        backgroundColor: ColorManager.primary,
        onPressed: (){
          LoginCubit.get(context).checkBiometrics();
        },)
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_hackthon_savesavey/helpers/color_manager.dart';
import 'package:google_hackthon_savesavey/presentation/screens/loginScreen/loginCubit/login_cubit.dart';

import '../../../../helpers/text_styles.dart';

class CheckBiometrics extends StatelessWidget {
  const CheckBiometrics({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextButton(
          onPressed: (){
            LoginCubit.get(context).checkBiometrics();
          },
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(
              ColorManager.lightGreen
            ),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
            ),
          ),
          child: Text(
              'Check Biometrics',
            style: TextStyles.font16LightBlackRegular,
          )
      ),
    );
  }
}

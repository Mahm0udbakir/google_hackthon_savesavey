import 'package:flutter/material.dart';

import '../../../../helpers/text_styles.dart';
import '../../../../router/routes.dart';


class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Already have an account?' ,
          style: TextStyles.font13BlackRegular,
        ),
        TextButton(
          onPressed: (){
          Navigator.pushReplacementNamed(context, Routes.loginScreen);
          },
          style:const ButtonStyle(
              padding: WidgetStatePropertyAll(
                EdgeInsets.zero,
              )
          ),
          child: Text('Login' ,
            style: TextStyles.font13DarkBlueBold,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../../helpers/color_manager.dart';
import '../../helpers/text_styles.dart';


class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 35),
        child: TextButton(
          style: ButtonStyle(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              backgroundColor:  WidgetStatePropertyAll(
                ColorManager.blueDark,
              ),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                ),
              ),
              minimumSize: const WidgetStatePropertyAll(
                  Size(196,50)
              )
          ),
          onPressed: (){
          }
          ,
          child: Text(
            'Login' ,
            style: TextStyles.font20WhiteSemiBold,
          )
          ,),
      ),
    );
  }
}
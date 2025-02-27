import 'package:flutter/material.dart';
import '../../../helpers/text_styles.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Don\'t have an account?' ,
          style: TextStyles.font13BlackRegular,),
        TextButton(
          onPressed: (){

          },
          style:const ButtonStyle(
              padding: WidgetStatePropertyAll(
                  EdgeInsets.zero
              )
          ),
          child: Text('Sign Up' ,
            style: TextStyles.font13DarkBlueBold,
          ),
        ),
      ],
    );
  }
}

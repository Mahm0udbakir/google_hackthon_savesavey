import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/appLogo.png',
          width: 35,
          height: 35,
        ),
        const SizedBox(width: 10,),
        Text(
          'SAVESAVEY' ,
          style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.bold
          ),
        )
      ],
    );
  }
}

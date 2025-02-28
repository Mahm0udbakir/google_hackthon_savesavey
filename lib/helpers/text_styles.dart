

import 'package:flutter/material.dart';

import 'color_manager.dart';
import 'font_weight_helper.dart';

class TextStyles {

  static TextStyle font28WhiteBold = const TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static TextStyle font22BlackBold = const TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  static TextStyle font16WhiteRegular = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: Colors.white,
  );
  static TextStyle font26BlackBold = const TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  static TextStyle font16BlackLight = const TextStyle(
    fontSize: 16,
    color: Colors.black,
  );
  static TextStyle font28MatBlueBold = TextStyle(
      fontSize: 28,
      color: ColorManager.matBlue,
      fontWeight: FontWeight.bold
  );
  static TextStyle font16LightBlackRegular = TextStyle(
      fontSize: 16,
      color: ColorManager.lightBlack,
      fontWeight: FontWeight.bold
  );
  static TextStyle font20SmoothGreenBold = TextStyle(
      fontSize: 20,
      color: ColorManager.smoothGreen,
      fontWeight: FontWeight.bold
  );
  static TextStyle font24BlackRegular = const TextStyle(
      fontSize: 24,
      color: Colors.black,
      fontWeight: FontWeight.normal
  );
  static TextStyle font14BlackRegular = const TextStyle(
      fontSize: 14,
      color: Colors.black,
      fontWeight: FontWeight.normal
  );
  static TextStyle font18BlackRegular = const TextStyle(
      fontSize: 18,
      color: Colors.black,
      fontWeight: FontWeight.normal
  );
  static TextStyle font14GreyMedium = const TextStyle(
      fontSize: 14,
      color: Colors.grey,
      fontWeight: FontWeight.w500
  );
  static TextStyle font14DarkBlueMedium = TextStyle(
      fontSize: 14,
      color: ColorManager.darkBlue,
      fontWeight: FontWeight.w500
  );
  static TextStyle font20WhiteSemiBold = const TextStyle(
      fontSize: 20,
      color: Colors.white,
      fontWeight: FontWeightHelper.semiBold
  );
  static TextStyle font16BlackRegular = const TextStyle(
      fontSize: 16,
      color: Colors.black,
      fontWeight: FontWeightHelper.regular
  );
  static TextStyle font13BlackRegular = const TextStyle(
      fontSize: 15,
      color: Colors.black,
      fontWeight: FontWeightHelper.regular
  );
  static TextStyle font13DarkBlueBold = TextStyle(
      fontSize: 13,
      color: ColorManager.blueDark,
      fontWeight: FontWeightHelper.bold
  );
  static TextStyle font20DarkBlueMedium = TextStyle(
      fontSize: 20,
      color: ColorManager.darkBlue,
      fontWeight: FontWeightHelper.medium
  );

}
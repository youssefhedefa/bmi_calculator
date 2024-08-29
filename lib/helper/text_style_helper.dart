import 'package:bmi_calculator/helper/color_helper.dart';
import 'package:flutter/material.dart';

abstract class AppTextStyleHelper{

  static const TextStyle font30PrimaryBold = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: AppColorHelper.primaryColor,
  );


  static const TextStyle font22GreyMedium = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w500,
    color: Colors.grey
  );

  static const TextStyle font28WhiteBold = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const TextStyle font28BlueBold = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColorHelper.blueColor,
  );

}
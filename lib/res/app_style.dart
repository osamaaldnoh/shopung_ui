import 'package:flutter/material.dart';
import 'package:shopung_ui/res/app_colors.dart';

class AppStyles
{
  static const TextStyle titleLarge = TextStyle( 
    height: 32.0 / 22.0,
    fontWeight: FontWeight.bold,
    color: AppColors.kblackColor,
    letterSpacing: 0.5,
  );

 static const TextStyle titleMedium = TextStyle( 
    fontSize: 17.0,
    height: 27.0 / 17.0,
    fontWeight: FontWeight.bold,
    color: AppColors.kblackColor,
    letterSpacing: 0.5,
  );

  static const TextStyle titleSmall = TextStyle( 
    fontSize: 15.0,
    height: 25.0 / 15.0,
    fontWeight: FontWeight.bold,
    color: AppColors.kblackColor,
    letterSpacing: 0.5,
  );

  static const TextStyle bodyLarge = TextStyle( 
    fontSize: 17.0,
    height: 27.0 / 17.0,
    fontWeight: FontWeight.bold,
    color: AppColors.kblackColor,
    letterSpacing: 0.5,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 15.0, 
    height: 25.0 / 15.0,
    fontWeight: FontWeight.bold,
    color: AppColors.kblackColor,
    letterSpacing: 0.5,
  );

  //   static const TextStyle bodyMediumSmallHeight = TextStyle(
  //   fontSize: 15.0, 
  //   // height: 25.0 / 18.0,
  //   fontWeight: FontWeight.bold,
  //   color: AppColors.kblackColor,
  //   // letterSpacing: 0.5,
  // );

  static const TextStyle bodySmall = TextStyle( 
    height: 15.0 / 12.0,
    color: AppColors.kblackColor,
    letterSpacing: 0.5,
  );
}
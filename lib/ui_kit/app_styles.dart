import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class AppStyles {
  static TextStyle gilroyMediumBlack(double fontSize) {
    return TextStyle(
      fontFamily: 'Gilroy',
      height: 1.25,
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
      color: AppColors.black,
    );
  }

  static TextStyle gilroyMediumWhite(double fontSize) {
    return TextStyle(
      fontFamily: 'Gilroy',
      height: 1.25,
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
      color: AppColors.white,
    );
  }

  static TextStyle gilroyLightWhite(double fontSize) {
    return TextStyle(
      fontFamily: 'Gilroy',
      height: 1.25,
      fontSize: fontSize,
      fontWeight: FontWeight.w300,
      color: AppColors.white,
    );
  }

  static TextStyle gilroyRegularWhite(double fontSize) {
    return TextStyle(
      fontFamily: 'Gilroy',
      height: 1.25,
      fontSize: fontSize,
      fontWeight: FontWeight.w400,
      color: AppColors.white,
    );
  }

  static TextStyle gilroyMediumLightGrey2(double fontSize) {
    return TextStyle(
      fontFamily: 'Gilroy',
      height: 1.25,
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
      color: AppColors.lightGrey2,
    );
  }

  static TextStyle gilroySemiBoldGreen(double fontSize) {
    return TextStyle(
      fontFamily: 'Gilroy',
      height: 1.25,
      fontSize: fontSize,
      fontWeight: FontWeight.w600,
      color: AppColors.green,
    );
  }

  static TextStyle gilroyBoldGreen(double fontSize) {
    return TextStyle(
      fontFamily: 'Gilroy',
      height: 1.25,
      fontSize: fontSize,
      fontWeight: FontWeight.w700,
      color: AppColors.green,
      );
    }


}
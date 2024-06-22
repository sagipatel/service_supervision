import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ss/app/core/helper/colors.dart';

class UIConstants {
  static final TextTheme textTheme = TextTheme(
    titleMedium: TextStyle(
        color: primaryColor,
        fontSize: 26.sp,
        fontFamily: "GlacialIndifference-Regular"),
    titleSmall: TextStyle(
      color: primaryColor,
      fontSize: 18.sp,
      fontFamily: "GlacialIndifference-Regular",
    ),
    titleLarge: TextStyle(
        color: primaryColor,
        fontSize: 34.sp,
        fontFamily: "GlacialIndifference-Regular"),
    bodyLarge: TextStyle(
      color: primaryColor,
      fontSize: 26.sp,
      fontFamily: "GlacialIndifference-Regular",
    ),

    bodyMedium: TextStyle(
        color: primaryColor,
        fontSize: 16.sp,
        fontFamily: "GlacialIndifference-Regular"),
    bodySmall: TextStyle(
        color: primaryColor,
        fontSize: 12.sp,
        fontFamily: "GlacialIndifference-Regular"),

    /////////////////////// EXCEPTIONAL CASES /////////////////

    // headlineLarge: TextStyle(
    //   color: Colors.black,
    //   fontSize: 24.sp,
    //   fontWeight: FontWeight.w600,
    // ),
    //
    // labelSmall: TextStyle(
    //   color: Colors.black,
    //   fontSize: 8.sp,
    //   fontWeight: FontWeight.w600,
    // ),
  );
}

extension FontWeightConverter on TextStyle {
  TextStyle normal() => copyWith(fontFamily: "GlacialIndifference-Regular");
  TextStyle bold() => copyWith(fontFamily: "GlacialIndifference-Bold");
}

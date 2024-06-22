import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  static normal(
      {required fontSize,
      required fontColor,
      bool? isUnderLine,
      bool? isLineThrough}) {
    return TextStyle(
      color: fontColor,
      fontFamily: "GlacialIndifference-Regular",
      fontSize: fontSize ?? 12.0.sp,
      decoration: isUnderLine == true
          ? TextDecoration.underline
          : isLineThrough == true
              ? TextDecoration.lineThrough
              : TextDecoration.none,
    );
  }

  static bold({required fontSize, required fontColor, bool? isUnderLine}) {
    return TextStyle(
        color: fontColor,
        fontFamily: "GlacialIndifference-Bold",
        fontSize: fontSize,
        decoration: isUnderLine == true
            ? TextDecoration.underline
            : TextDecoration.none);
  }
}

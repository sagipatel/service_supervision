import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:ss/app/core/helper/colors.dart';
import 'package:ss/app/core/helper/text_style.dart';

class CommonButton {
  static normalButton(
      {title,
      onTap,
      backgroundColor,
      txtColor,
      fontSize,
      height,
      borderRadius,
      EdgeInsets? padding,
      isLoading = false}) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: MaterialButton(
        minWidth: Get.width,
        onPressed: onTap,
        color: secondaryColor,
        height: height ?? 52.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 14.0),
        ),
        disabledColor: grayColor,
        child: Text(title,
            style: TextStyles.normal(fontSize: 20.0.sp, fontColor: whiteColor)),
      ),
    );
  }

  static borderButton(
      {title,
      Function? onPress,
      borderColor,
      borderWidth,
      textColor,
      padding,
      bgColor}) {
    return InkWell(
      onTap: () {
        if (onPress != null) {
          onPress();
        }
      },
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
        margin: padding ?? EdgeInsets.zero,
        decoration: BoxDecoration(
            color: bgColor ?? Colors.transparent,
            border: Border.all(
                color: borderColor ?? secondaryColor,
                width: borderWidth ?? 2.0),
            borderRadius: BorderRadius.circular(10.0)),
        child: Text(title ?? "",
            style:
                TextStyles.bold(fontSize: 20.0.sp, fontColor: secondaryColor)),
      ),
    );
  }

  static addButton({Function? onPress}) {
    return InkWell(
      onTap: () {
        if (onPress != null) {
          onPress();
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.0.h, horizontal: 16.w),
        // margin: padding ?? EdgeInsets.zero,
        decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: secondaryColor, width: 1.0),
            borderRadius: BorderRadius.circular(14.0)),
        child: Text("Add",
            style: TextStyles.normal(
                fontSize: 16.0.sp,
                fontColor: Color(0xff09BE61).withOpacity(0.70))),
      ),
    );
  }

  // static backButton({Function? onPress}) {
  //   return IconButton(
  //       onPressed: () {
  //         if (onPress != null) {
  //           onPress();
  //         } else {
  //           Get.back();
  //         }
  //       },
  //       icon: SvgPicture.asset(SvgResources.backArrowIc));
  // }
}

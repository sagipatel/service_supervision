import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ss/app/core/helper/colors.dart';
import 'package:ss/app/core/helper/text_style.dart';

class Utilities {
  static Future<bool> isConnectedNetwork() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print("Internet available");
        return true;
      } else {
        print("Internet not available");
        return false;
      }
    } on SocketException catch (_) {
      print("Something went wrong with connection");
      return false;
    }
  }

  static hideKeyBoard() {
    FocusScope.of(Get.context!).requestFocus(FocusNode());
  }

  static dateFormatConv(date, {formate = "dd MMM yyyy"}) {
    if (date != null) {
      var selectedDate = DateTime.parse(date.toString());
      var formattedDate = DateFormat(formate).format(selectedDate);
      return formattedDate;
    } else {
      return "";
    }
  }

  static pickDate() async {
    var selectedDate = "";
    final DateTime? picked = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime.now(),
      builder: (BuildContext? context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: primaryColor,
            // accentColor: const Color(0xFF8CE7F1),
            colorScheme: ColorScheme.light(primary: secondaryColor),
            // buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      Utilities.hideKeyBoard();
      var pickedDate = picked.toString().split(" ");
      selectedDate =
          Utilities.dateFormatConv(pickedDate[0], formate: "MM/dd/yyyy")
              .toString();
      // controller.dateOfGraduationsController.text = pickedDate[0].toString();
      return selectedDate;
    }
  }

  static showToast({message, bgColor}) {
    return Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: bgColor ?? Colors.black45,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static errorWidget(
      {errorText,
      Key? key,
      bool isValid = false,
      correctIc,
      bool isErrorCenter = false}) {
    return Padding(
      key: key,
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment:
            isErrorCenter ? MainAxisAlignment.center : MainAxisAlignment.start,
        children: [
          Icon(
            isValid ? Icons.check_circle : Icons.error,
            color: isValid ? Colors.green : Colors.red,
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Text("$errorText",
                style: isValid
                    ? TextStyles.normal(
                        fontColor: Colors.green,
                        fontSize: 14.0.sp,
                      )
                    : TextStyles.normal(
                        fontColor: Colors.red,
                        fontSize: 14.0.sp,
                      )),
          )
        ],
      ),
    );
  }
}

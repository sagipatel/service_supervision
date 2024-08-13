import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ss/app/core/helper/text_style.dart';


getSnackToast({
  title = "Error",
  message = '',
  snackPosition = SnackPosition.TOP,
  backgroundColor = Colors.black,
  colorText = Colors.white,
  Widget? icon,
  Duration? duration,
  Function? onTapSnackBar,
  Function? onTapButton,
  bool withButton = false,
  buttonText = 'Ok',
  Function? onDismissed,
}) {
  Get.snackbar(
    title,
    message,
    messageText: Text(
      message,
      style: TextStyles.normal(fontSize: 18.0, fontColor: colorText),
    ),
    mainButton: withButton
        ? TextButton(
            onPressed: () {
              if (onTapButton != null) onTapButton();
            },
            child: Text(
              buttonText,
              style:
              TextStyles.bold(fontSize: 14.0, fontColor: colorText),
            ))
        : null,
    onTap: (tap) {
      if (onTapSnackBar != null) onTapSnackBar(tap);
    },
    duration: duration ?? const Duration(seconds: 4),
    snackPosition: snackPosition,
    backgroundColor: backgroundColor,
    icon: icon,
    colorText: colorText,
    snackbarStatus: (status) {
      if (kDebugMode) {
        print(status);
      }
      if (status == SnackbarStatus.CLOSED) {
        if (onDismissed != null) onDismissed();
      }
    },
  );
}

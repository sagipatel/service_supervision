import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ss/app/core/helper/api_loader.dart';
import 'package:ss/app/core/helper/constants.dart';
import 'package:ss/app/core/helper/widgets/custom_snack_toast.dart';
import 'package:ss/app/core/service/web_services.dart';
import 'package:ss/app/routes/app_pages.dart';


class VerificationCodeController extends GetxController {
  TextEditingController otpController = TextEditingController();
  Timer? _timer;
  var timerStart = 0.obs;
  var email = "".obs;
  var password = "";
  var tempToken = "";

  var previousScreen = "";

  @override
  void onInit() {
    if (Get.arguments != null) {
      email.value = Get.arguments[0];
      password = Get.arguments[1];
      tempToken = Get.arguments[2];
    }
    timerStart.value = 120;
    startTimer();
    previousScreen = Get.previousRoute;
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();

    timerStart.value = 0;
  }

  void startTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        print(timerStart.value);
        print("START");
        if (timerStart.value < 1) {
          _timer!.cancel();
        } else {
          timerStart.value = timerStart.value - 1;
        }
      },
    );
    print(_timer);
  }

  resetTimer({seconds}) {
    if (timerStart.value == 0) {
      timerStart.value = seconds ?? 180;
    }
    startTimer();
  }

  String formatHHMMSS(int seconds) {
    if (seconds > 0) {
      int minutes = (seconds / 60).truncate();
      int second = seconds - (minutes * 60);
      String minutesStr = (minutes).toString().padLeft(2, '0');
      String secondsStr = (second).toString().padLeft(2, '0');
      return "$minutesStr:$secondsStr";
    } else {
      return "";
    }
  }

  // resendCodeApi() async {
  //   var body = {"email": email.value};
  //   Webservice.postRequest(
  //       uri: Global.sendForgotPassword,
  //       body: body,
  //       hasBearer: false,
  //       onSuccess: (response) {
  //         timerStart.value = 120;
  //         startTimer();
  //       },
  //       onFailure: (res) {
  //         hideAppLoader();
  //       });
  // }

  // verifyOtpApi() async {
  //   var body = {"email": email.value, "otp": otpController.text};
  //   apiLoader(
  //     asyncCall: () => Webservice.postRequest(
  //       uri: Global.validatePasswordOtp,
  //       body: body,
  //       hasBearer: false,
  //       onSuccess: (response) {
  //         hideAppLoader();
  //         var res = jsonDecode(response);
  //         // Get.toNamed(Routes.createNewPassView,
  //         //     arguments: [email.value, res['token']]);
  //       },
  //       onFailure: (res) {
  //         hideAppLoader();
  //         getSnackToast(
  //           title: "Error",
  //           message: res['message'],
  //           backgroundColor: Colors.red,
  //         );
  //       },
  //     ),
  //   );
  // }
}

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ss/app/core/helper/api_loader.dart';
import 'package:ss/app/core/helper/constants.dart';
import 'package:ss/app/core/helper/widgets/custom_snack_toast.dart';
import 'package:ss/app/core/service/web_services.dart';
import 'package:ss/app/modules/auth/signup/model/signup.dart';
import 'package:ss/app/modules/auth/verify_otp/model/verify_otp.dart';
import 'package:ss/app/routes/app_pages.dart';


class VerificationCodeController extends GetxController {
  TextEditingController otpController = TextEditingController();
  Timer? _timer;
  var timerStart = 0.obs;
  var email = "".obs;
  var password = "";
  var tempToken = "";

  var previousScreen = "";
  SignupModel signupModel = SignupModel();
  @override
  void onInit() {
    // if (Get.arguments != null) {
    //   signupModel = Get.arguments;
    // }
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

  verifyOtpApi() async {
    var body = {
    "userId":AppConst.ID,
      "otp":otpController.text,
      "token":AppConst.TOKEN,
    };
    apiLoader(
        asyncCall: () => Webservice.postRequest(
            uri: Global.verifyOtp,
            body: body,
            hasBearer: false,
            onSuccess: (response) {
              hideAppLoader();
              VerifyOtpModel verifyOtpData = verifyOtpModelFromJson(response);
                AppConst.ID = verifyOtpData.data!.id;
                AppConst.TOKEN = verifyOtpData.data!.token;
                userNavigate(verifyOtpData.data!.stage!, message: verifyOtpData.message);

            },
            onFailure: (res) {
              hideAppLoader();
              getSnackToast(
                title: "Error",
                message: res['message'],
                backgroundColor: Colors.red,
              );
            }));
  }

}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:ss/app/core/helper/colors.dart';
import 'package:ss/app/core/helper/text_style.dart';
import 'package:ss/app/core/helper/utilites.dart';
import 'package:ss/app/core/helper/widgets/common_buttons.dart';
import 'package:ss/app/core/helper/widgets/custom_snack_toast.dart';
import 'package:ss/app/core/helper/widgets/keyboard_avoider.dart';
import 'package:ss/app/modules/auth/verify_otp/verify_otp_controller.dart';

class VerificationCodeView extends GetWidget<VerificationCodeController> {
  VerificationCodeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: whiteColor,
      body: Container(
        color: whiteColor,
        child: SafeArea(
          child: KeyboardAvoider(
            autoScroll: true,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.arrow_back)),
                ),
                // SvgPicture.asset(SvgResources.verificationCodeVector),
                Text(
                  "Verification code",
                  style: TextStyles.normal(
                      fontSize: 26.0, fontColor: blackColor),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4, bottom: 4),
                  child: Text(
                    "Please enter the verification code that\nwe have sent to",
                    style: TextStyles.normal(
                        fontSize: 16.0, fontColor: grayColor),
                    textAlign: TextAlign.center,
                  ),
                ),
                Obx(
                  () => Text(
                    controller.email.value,
                    style: TextStyles.normal(
                        fontSize: 14.0.sp, fontColor: blackColor),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 28, bottom: 28),
                  child: Pinput(
                    length: 4,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: focusedPinTheme,
                    submittedPinTheme: submittedPinTheme,
                    pinputAutovalidateMode: PinputAutovalidateMode.disabled,
                    showCursor: true,
                    controller: controller.otpController,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                    ],
                    onChanged: (v) {
                      // isTxtBlank.value = v.length == 4 ? false : true;
                    },
                    onCompleted: (val) {
                      // callVerifyOTP(val);
                    },
                  ),
                ),
                CommonButton.normalButton(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  title: "Verify account",
                  onTap: () {
                    Utilities.hideKeyBoard();
                    Get.closeAllSnackbars();
                    if (controller.otpController.text.isEmpty ||
                        controller.otpController.text.length != 4) {
                      getSnackToast(
                          title: "Error",
                          message: controller.otpController.text.isNotEmpty &&
                                  controller.otpController.text.length != 4
                              ? "Please enter valid otp"
                              : "Please enter otp",
                          backgroundColor: Colors.red,
                          colorText: whiteColor);
                    } else {
                      controller.verifyOtpApi();
                    }
                  },
                ),
                Obx(
                  () => Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: InkWell(
                        onTap: controller
                                .formatHHMMSS(controller.timerStart.value)
                                .isEmpty
                            ? () {
                                // controller.resendCodeApi();

                              }
                            : null,
                        child: controller
                                .formatHHMMSS(controller.timerStart.value)
                                .isEmpty
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                      child: Text(
                                    "Didn’t receive a code? ",
                                    style: TextStyles.normal(
                                        fontSize: 15.0.sp,
                                        fontColor: grayColor),
                                  )),
                                  Text(
                                    "Resend code",
                                    style: TextStyles.normal(
                                      fontSize: 15.0.sp,
                                      fontColor: blackColor,
                                    ),
                                  )
                                ],
                              )
                            : Text(
                                "(${controller.formatHHMMSS(controller.timerStart.value)})",
                                style: TextStyles.normal(
                                  fontSize: 15.0,
                                  fontColor: blackColor,
                                ),
                              )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  final defaultPinTheme = PinTheme(
    width: 82,
    height: 56,
    textStyle: const TextStyle(
        fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffD9D9D9)),
        borderRadius: BorderRadius.circular(12),
        color: Colors.transparent),
  );

  final focusedPinTheme = PinTheme(
    width: 82,
    height: 56,
    textStyle: const TextStyle(
        fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
        border: Border.all(color: blackColor, width: 2.0),
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xffF4F4FD)),
  );

  final submittedPinTheme = PinTheme(
    width: 82,
    height: 56,
    textStyle: const TextStyle(
        fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffD9D9D9)),
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xffF4F4FD)),
  );
}

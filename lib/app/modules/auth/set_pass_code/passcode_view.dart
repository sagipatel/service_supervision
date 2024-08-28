import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:ss/app/core/helper/colors.dart';
import 'package:ss/app/core/helper/text_style.dart';
import 'package:ss/app/core/helper/utilites.dart';
import 'package:ss/app/core/helper/widgets/common_buttons.dart';
import 'package:ss/app/core/helper/widgets/custom_snack_toast.dart';
import 'package:ss/app/modules/auth/set_pass_code/passcode_controller.dart';
import 'package:ss/app/routes/app_pages.dart';


class PasscodeView extends GetWidget<PasscodeController> {
  const PasscodeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: whiteColor,
      extendBody: true,
      body: Container(
        color: whiteColor,
        child: SafeArea(
          child:

         controller.forSetPasscode.value ? Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
           Text(
             "Set Your Passcode",
             style: TextStyles.normal(
                 fontSize: 26.0, fontColor: blackColor),
           ),
           Padding(
             padding: const EdgeInsets.only(top: 4, bottom: 4),
             child: Text(
               "To make accessing your account faster and more convenient, please set a passcode.",
               style: TextStyles.normal(
                   fontSize: 16.0, fontColor: grayColor),
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
               controller: controller.passCodeController,
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
             title: "Continue",
             onTap: () {
               Utilities.hideKeyBoard();
               Get.closeAllSnackbars();
               if (controller.passCodeController.text.isEmpty ||
                   controller.passCodeController.text.length != 4) {
                 getSnackToast(
                     title: "Error",
                     message: controller.passCodeController.text.isNotEmpty &&
                         controller.passCodeController.text.length != 4
                         ? "Please enter valid passcode"
                         : "Please enter passcode",
                     backgroundColor: Colors.red,
                     colorText: whiteColor);
               } else {
                 controller.setPassCodeApi();
               }
             },
           ),
         ],): ScreenLock(
            correctString: '1234',
            onCancelled: Navigator.of(context).pop,
            onUnlocked: (){
              Get.toNamed(Routes.USER_DETAILS);
            },
            onValidate:(input)async{
              await Future.delayed(Duration(seconds: 1)); // Simulates delay
              return input == '1234';
            }
          ),
        ),
      ),
    );
  }
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


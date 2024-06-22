import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:ss/app/core/helper/colors.dart';
import 'package:ss/app/core/helper/images_resources.dart';
import 'package:ss/app/core/helper/text_style.dart';
import 'package:ss/app/core/helper/widgets/common_buttons.dart';
import 'package:ss/app/core/helper/widgets/common_text_fields.dart';
import 'package:ss/app/core/helper/widgets/keyboard_avoider.dart';
import 'package:ss/app/modules/auth/login/controller/login_controller.dart';
import 'package:ss/app/modules/auth/login/view/login_view.dart';
import 'package:ss/app/routes/app_pages.dart';

class LoginView extends GetWidget<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: whiteColor,
      extendBody: true,
      body: Container(
        color: whiteColor,
        child: SafeArea(
          child: KeyboardAvoider(
            autoScroll: true,
            child: Padding(
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Welcome Back ",
                        style: TextStyles.bold(
                            fontSize: 28.sp, fontColor: secondaryColor),
                        textAlign: TextAlign.center,
                      ),
                      Image.asset(
                        PngResources.handIc,
                        height: 26.h,
                        width: 29.w,
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    "Enter your Mobile number and Password for\nSIGN IN.",
                    style: TextStyles.normal(
                        fontSize: 16.0.sp, fontColor: secondaryColor),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 12.h),
                  CommonTextField(
                    key: controller.keyEmail,
                    controller: controller.emailController,
                    validateTypes: ValidateTypes.empty,
                    errorMsg: "Mobile",
                    textInputType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    hintText: "Mobile number",
                    labelText: "Mobile number",
                    maxLength: 10,
                    inputFormat: [
                      FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                    ],
                    focusNode: controller.userNameFocusNode,
                    focusNext: controller.passwordFocusNode,
                    onChange: (v) {},
                  ),
                  Obx(
                    () => CommonTextField(
                      key: controller.keyPassword,
                      controller: controller.passwordController,
                      validateTypes: ValidateTypes.empty,
                      errorMsg: "Password",
                      textInputType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      hintText: "Password",
                      labelText: "Password",
                      obscureText: controller.isObSecure.value,
                      suffixIcon: InkWell(
                          onTap: () {
                            controller.isObSecure.value =
                                !controller.isObSecure.value;
                          },
                          child: SvgPicture.asset(controller.isObSecure.value
                              ? SvgResources.eyeIc
                              : SvgResources.eyeOpenIc)),
                      focusNode: controller.passwordFocusNode,
                      focusNext: controller.passwordFocusNode,
                      onChange: (v) {},
                    ),
                  ),
                  SizedBox(height: 18.h),
                  Row(
                    children: [
                      Obx(() => InkWell(
                          onTap: () {
                            controller.rememberMe.value =
                                !controller.rememberMe.value;
                          },
                          child: SvgPicture.asset(controller.rememberMe.value
                              ? SvgResources.checkBoxIc
                              : SvgResources.unCheckIc))),
                      Expanded(
                          child: Text(
                        " Remember Me",
                        style: TextStyles.normal(
                            fontSize: 14.0.sp, fontColor: blackColor),
                      )),
                      Text(
                        "Forgot password?",
                        style: TextStyles.normal(
                            fontSize: 14.0.sp, fontColor: blackColor),
                      )
                    ],
                  ),
                  CommonButton.normalButton(
                      title: "Sign In",
                      onTap: () {
                        var isValid = true;
                        if (controller.keyEmail.currentState!
                            .checkValidation(false)) {
                          isValid = false;
                        }
                        if (controller.keyPassword.currentState!
                            .checkValidation(false)) {
                          isValid = false;
                        }
                        if (isValid) {
                          // Get.offAllNamed(Routes.DASHBOARD);
                          Get.toNamed(Routes.DASHBOARD);
                        }
                      },
                      padding: const EdgeInsets.only(top: 26, bottom: 16)),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don’t have account? ",
                          style: TextStyles.normal(
                              fontSize: 16.0.sp, fontColor: blackColor),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "Sign Up",
                          style: TextStyles.bold(
                              fontSize: 16.0.sp, fontColor: secondaryColor),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

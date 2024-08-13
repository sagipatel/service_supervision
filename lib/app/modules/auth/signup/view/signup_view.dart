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
import 'package:ss/app/modules/auth/signup/controller/signup_controller.dart';
import 'package:ss/app/routes/app_pages.dart';

class SignupView extends GetWidget<SignupController> {
  const SignupView({Key? key}) : super(key: key);

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
              const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Create Account",
                    style: TextStyles.bold(
                        fontSize: 28.sp, fontColor: secondaryColor),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    "Enter your name,email,mobile and password for\nSIGN UP.",
                    style: TextStyles.normal(
                        fontSize: 16.0.sp, fontColor: secondaryColor),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 12.h),
                  CommonTextField(
                    key: controller.keyFullName,
                    controller: controller.fullNameController,
                    validateTypes: ValidateTypes.name,
                    errorMsg: "Full Name",
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    hintText: "Full Name",
                    labelText: "Full Name",

                    focusNode: controller.fullNameFocusNode,
                    focusNext: controller.emailFocusNode,
                    onChange: (v) {},
                  ),
                  CommonTextField(
                    key: controller.keyEmail,
                    controller: controller.emailController,
                    validateTypes: ValidateTypes.email,
                    errorMsg: "Email Address",
                    textInputType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    hintText: "Email Address",
                    labelText: "Email Address",
                    focusNode: controller.emailFocusNode,
                    focusNext: controller.mobileFocusNode,
                    onChange: (v) {},
                  ),
                  CommonTextField(
                    key: controller.keyMobile,
                    controller: controller.mobileController,
                    validateTypes: ValidateTypes.mobile,
                    errorMsg: "Mobile",
                    textInputType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    hintText: "Mobile number",
                    labelText: "Mobile number",
                    maxLength: 10,
                    inputFormat: [
                      FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                    ],
                    focusNode: controller.mobileFocusNode,
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
                  
                  CommonButton.normalButton(
                      title: "Sign Up",
                      onTap: () {
                        var isValid = true;
                        if (controller.keyFullName.currentState!
                            .checkValidation(false)) {
                          isValid = false;
                        }
                        if (controller.keyEmail.currentState!
                            .checkValidation(false)) {
                          isValid = false;
                        }
                        if (controller.keyMobile.currentState!
                            .checkValidation(false)) {
                          isValid = false;
                        }
                        if (controller.keyPassword.currentState!
                            .checkValidation(false)) {
                          isValid = false;
                        }
                        if (isValid) {
                          controller.signupApi();
                        }
                      },
                      padding: const EdgeInsets.only(top: 26, bottom: 16)),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account? ",
                          style: TextStyles.normal(
                              fontSize: 16.0.sp, fontColor: blackColor),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "Sign In",
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

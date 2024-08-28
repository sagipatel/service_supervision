import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ss/app/core/helper/colors.dart';
import 'package:ss/app/core/helper/text_style.dart';
import 'package:ss/app/core/helper/widgets/common_buttons.dart';
import 'package:ss/app/core/helper/widgets/common_text_fields.dart';
import 'package:ss/app/core/helper/widgets/keyboard_avoider.dart';
import 'package:ss/app/modules/auth/user_details/controller/user_detail_controller.dart';
import 'package:ss/app/routes/app_pages.dart';

class UserDetailView extends GetWidget<UserDetailController> {
  const UserDetailView({Key? key}) : super(key: key);

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
                    "User Details",
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
                    key: controller.keyBsName,
                    controller: controller.bsNameController,
                    validateTypes: ValidateTypes.name,
                    errorMsg: "Business Name",
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    hintText: "Business Name",
                    labelText: "Business Name",

                    focusNode: controller.bsNameFocusNode,
                    focusNext: controller.bsTypeFocusNode,
                    onChange: (v) {},
                  ),
                  CommonTextField(
                    key: controller.keyBsType,
                    controller: controller.bsTypeController,
                    validateTypes: ValidateTypes.empty,
                    errorMsg: "Business Type",
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    hintText: "Business Type",
                    labelText: "Business Type",

                    focusNode: controller.bsTypeFocusNode,
                    focusNext: controller.gstFocusNode,
                    onChange: (v) {},
                  ),
                  CommonTextField(
                    key: controller.keyGst,
                    controller: controller.gstController,
                    validateTypes: ValidateTypes.empty,
                    errorMsg: "Gst",
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    hintText: "Gst",
                    labelText: "Gst",

                    focusNode: controller.gstFocusNode,
                    focusNext: controller.addressFocusNode,
                    onChange: (v) {},
                  ),
                  CommonTextField(
                    key: controller.keyAddress,
                    controller: controller.addressController,
                    validateTypes: ValidateTypes.empty,
                    errorMsg: "Address",
                    textInputType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    hintText: "Address",
                    labelText: "Address",
                    focusNode: controller.addressFocusNode,
                    focusNext: controller.cityFocusNode,
                    onChange: (v) {},
                  ),
                  CommonTextField(
                    key: controller.keyCity,
                    controller: controller.cityController,
                    validateTypes: ValidateTypes.empty,
                    errorMsg: "City",
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    hintText: "City",
                    labelText: "City",
                    focusNode: controller.cityFocusNode,
                    focusNext: controller.stateFocusNode,
                    onChange: (v) {},
                  ),
                  CommonTextField(
                    key: controller.keyState,
                    controller: controller.stateController,
                    validateTypes: ValidateTypes.empty,
                    errorMsg: "State",
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    hintText: "State",
                    labelText: "State",
                    focusNode: controller.stateFocusNode,
                    focusNext: controller.pinCodeFocusNode,
                    onChange: (v) {},
                  ),
                  CommonTextField(
                    key: controller.keyPinCode,
                    controller: controller.pinCodeController,
                    validateTypes: ValidateTypes.zipCode,
                    errorMsg: "Zipcode",
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    hintText: "Zipcode",
                    labelText: "Zipcode",
                    focusNode: controller.pinCodeFocusNode,
                    focusNext: controller.pinCodeFocusNode,
                    onChange: (v) {},
                  ),

                  SizedBox(height: 18.h),

                  CommonButton.normalButton(
                      title: "Continue",
                      onTap: () {
                        var isValid = true;
                        // if (controller.keyFullName.currentState!
                        //     .checkValidation(false)) {
                        //   isValid = false;
                        // }
                        // if (controller.keyEmail.currentState!
                        //     .checkValidation(false)) {
                        //   isValid = false;
                        // }
                        // if (controller.keyMobile.currentState!
                        //     .checkValidation(false)) {
                        //   isValid = false;
                        // }
                        // if (controller.keyPassword.currentState!
                        //     .checkValidation(false)) {
                        //   isValid = false;
                        // }
                        if (isValid) {
                          Get.toNamed(Routes.PASSCODE);
                        }
                      },
                      padding: const EdgeInsets.only(top: 26, bottom: 16)),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

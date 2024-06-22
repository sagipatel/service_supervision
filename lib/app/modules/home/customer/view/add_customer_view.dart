import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ss/app/core/helper/colors.dart';
import 'package:ss/app/core/helper/constants.dart';
import 'package:ss/app/core/helper/text_style.dart';
import 'package:ss/app/core/helper/widgets/common_buttons.dart';
import 'package:ss/app/core/helper/widgets/common_text_fields.dart';
import 'package:ss/app/core/helper/widgets/keyboard_avoider.dart';
import 'package:ss/app/modules/common/upcoming_service/controller/upcoming_service_controller.dart';
import 'package:ss/app/modules/home/customer/controller/add_customer_controller.dart';
import 'package:ss/app/modules/home/customer/controller/customer_controller.dart';

class AddCustomerView extends GetWidget<AddCustomerController> {
  const AddCustomerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: whiteColor,
      extendBody: true,
      body: Container(
        color: whiteColor,
        child: SafeArea(
          child: Column(
            children: [appBar(), body(), button()],
          ),
        ),
      ),
    );
  }

  appBar() {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
      decoration: const BoxDecoration(color: whiteColor, boxShadow: [
        BoxShadow(color: Colors.black12, blurRadius: 20.0, spreadRadius: 1.0),
      ]),
      child: Row(
        children: [
          InkWell(
              onTap: () {
                Get.back();
              },
              child: const Icon(Icons.arrow_back)),
          Expanded(
              child: Text(
            "Add Customer",
            style: TextStyles.bold(fontSize: 22.0.sp, fontColor: blackColor),
            textAlign: TextAlign.center,
          )),
          const SizedBox(width: 20),
        ],
      ),
    );
  }

  body() {
    return Expanded(
        child: KeyboardAvoider(
            child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          CommonTextField(
            key: controller.keyName,
            controller: controller.nameController,
            validateTypes: ValidateTypes.empty,
            errorMsg: "Name",
            textInputType: TextInputType.text,
            textInputAction: TextInputAction.next,
            hintText: "Full Name",
            labelText: "Full Name",
            focusNode: controller.nameFocusNode,
            focusNext: controller.mobileFocusNode,
            onChange: (v) {},
          ),
          CommonTextField(
            key: controller.keyMobileNo,
            controller: controller.mobileController,
            validateTypes: ValidateTypes.mobile,
            errorMsg: "Mobile",
            textInputType: TextInputType.number,
            textInputAction: TextInputAction.next,
            hintText: "Mobile number",
            labelText: "Mobile number",
            maxLength: 10,
            inputFormat: [FilteringTextInputFormatter.allow(RegExp("[0-9]"))],
            focusNode: controller.mobileFocusNode,
            focusNext: controller.addressFocusNode,
            onChange: (v) {},
          ),
          CommonTextField(
            key: controller.keyAddress,
            controller: controller.addressController,
            validateTypes: ValidateTypes.empty,
            errorMsg: "Address",
            // textInputType: TextInputType.multiline,
            textInputAction: TextInputAction.done,
            hintText: "Address",
            labelText: "Address",
            maxLines: 3,
            minLines: 1,
            focusNode: controller.addressFocusNode,
            focusNext: controller.addressFocusNode,
            onChange: (v) {},
          ),
        ],
      ),
    )));
  }

  button() {
    return CommonButton.borderButton(
        title: "Continue",
        onPress: () {
          var isValid = true;
          if (controller.keyName.currentState!.checkValidation(false)) {
            isValid = false;
          }
          if (controller.keyMobileNo.currentState!.checkValidation(false)) {
            isValid = false;
          }
          if (controller.keyAddress.currentState!.checkValidation(false)) {
            isValid = false;
          }
          if (isValid) {
            Get.back();
          }
        },
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 20));
  }
}

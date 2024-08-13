import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ss/app/core/helper/widgets/common_text_fields.dart';

class AddInquiryController extends GetxController {
  var from = "".obs;
  @override
  void onInit() {
    if (Get.arguments != null) {
      from.value = Get.arguments;
    }
    super.onInit();
  }


  final GlobalKey<CommonTextFieldState> keyName =
  GlobalKey<CommonTextFieldState>(),
      keyAddress = GlobalKey<CommonTextFieldState>(),
      keyRemark = GlobalKey<CommonTextFieldState>(),
      keyMobileNo = GlobalKey<CommonTextFieldState>();

  final nameFocusNode = FocusNode(),
      addressFocusNode = FocusNode(),
      remarkFocusNode = FocusNode(),
      mobileFocusNode = FocusNode();

  TextEditingController nameController = TextEditingController(),
      mobileController = TextEditingController(),
      remarkController = TextEditingController(),
      addressController = TextEditingController();
}

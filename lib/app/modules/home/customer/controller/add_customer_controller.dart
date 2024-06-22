import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ss/app/core/helper/widgets/common_text_fields.dart';

class AddCustomerController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  final GlobalKey<CommonTextFieldState> keyName =
          GlobalKey<CommonTextFieldState>(),
      keyAddress = GlobalKey<CommonTextFieldState>(),
      keyMobileNo = GlobalKey<CommonTextFieldState>();

  final nameFocusNode = FocusNode(),
      addressFocusNode = FocusNode(),
      mobileFocusNode = FocusNode();

  TextEditingController nameController = TextEditingController(),
      mobileController = TextEditingController(),
      addressController = TextEditingController();
}

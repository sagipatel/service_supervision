import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ss/app/core/helper/widgets/common_text_fields.dart';

class LoginController extends GetxController {
  var showPassword = false.obs;
  var isObSecure = true.obs;
  var rememberMe = false.obs;
  @override
  void onInit() {
    print("dsadasda");
    super.onInit();
  }

  final GlobalKey<CommonTextFieldState> keyEmail =
          GlobalKey<CommonTextFieldState>(),
      keyPassword = GlobalKey<CommonTextFieldState>();

  final userNameFocusNode = FocusNode(), passwordFocusNode = FocusNode();

  TextEditingController emailController = TextEditingController(),
      passwordController = TextEditingController();
}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ss/app/core/helper/api_loader.dart';
import 'package:ss/app/core/helper/constants.dart';
import 'package:ss/app/core/helper/widgets/common_text_fields.dart';
import 'package:ss/app/core/helper/widgets/custom_snack_toast.dart';
import 'package:ss/app/core/service/web_services.dart';
import 'package:ss/app/modules/auth/set_pass_code/model/set_pass_code.dart';
import 'package:ss/app/modules/auth/signup/model/signup.dart';
import 'package:ss/app/routes/app_pages.dart';

class PasscodeController extends GetxController {
  var showPassword = false.obs;
  var isObSecure = true.obs;
  var rememberMe = false.obs;
  var forSetPasscode = true.obs;
  TextEditingController passCodeController = TextEditingController();
  @override
  void onInit() {
if(Get.arguments != null){
  forSetPasscode.value = Get.arguments;
}
    super.onInit();
  }

  final GlobalKey<CommonTextFieldState> keyEmail =
  GlobalKey<CommonTextFieldState>(),
      keyPassword = GlobalKey<CommonTextFieldState>(),
      keyMobile = GlobalKey<CommonTextFieldState>(),
      keyFullName = GlobalKey<CommonTextFieldState>()
  ;

  final emailFocusNode = FocusNode(), passwordFocusNode = FocusNode(),fullNameFocusNode = FocusNode(),mobileFocusNode = FocusNode();

  TextEditingController emailController = TextEditingController(),
      fullNameController = TextEditingController(),
      mobileController = TextEditingController(),
      passwordController = TextEditingController();

  setPassCodeApi() async {
    var body = {
      "pass_code": passCodeController.text,
      "userId":AppConst.ID,
      "token":AppConst.TOKEN
    };
    apiLoader(
        asyncCall: () => Webservice.postRequest(
            uri: Global.setPasscode,
            body: body,
            hasBearer: false,
            onSuccess: (response) {
              hideAppLoader();
              SetPasscodeModel passcodeModel = setPasscodeModelFromJson(response);
              AppConst.ID = passcodeModel.data!.id;
              AppConst.TOKEN = passcodeModel.data!.token;
              userNavigate(passcodeModel.data!.stage!, message: passcodeModel.message);
            },
            onFailure: (res) {
              print(res);
              hideAppLoader();

              getSnackToast(
                title: "Error",
                message: res['message'],
                backgroundColor: Colors.red,
              );
            }));
  }

}

import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ss/app/core/helper/api_loader.dart';
import 'package:ss/app/core/helper/constants.dart';
import 'package:ss/app/core/helper/storages.dart';
import 'package:ss/app/core/helper/widgets/common_text_fields.dart';
import 'package:ss/app/core/helper/widgets/custom_snack_toast.dart';
import 'package:ss/app/core/service/web_services.dart';
import 'package:ss/app/routes/app_pages.dart';

class SignupController extends GetxController {
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
      keyPassword = GlobalKey<CommonTextFieldState>(),
      keyMobile = GlobalKey<CommonTextFieldState>(),
      keyFullName = GlobalKey<CommonTextFieldState>()
  ;

  final emailFocusNode = FocusNode(), passwordFocusNode = FocusNode(),fullNameFocusNode = FocusNode(),mobileFocusNode = FocusNode();

  TextEditingController emailController = TextEditingController(),
  fullNameController = TextEditingController(),
  mobileController = TextEditingController(),
      passwordController = TextEditingController();

  signupApi() async {
    var body = {
      "password": passwordController.text,
      "mobile_number": emailController.text,
      "full_name":fullNameController.text,
      "email":emailController.text,
    };
    apiLoader(
        asyncCall: () => Webservice.postRequest(
            uri: Global.register,
            body: body,
            hasBearer: false,
            onSuccess: (response) {
              hideAppLoader();

              // LoginUserModel loginUserModelData =
              // loginUserModelFromJson(response);
              //
              // AppStorages.setLoginProfileModel(loginUserModelData.response!);
              // AppStorages.userLoginRes = AppStorages.getLoginProfileModel();
              // if (AppStorages.userLoginRes.rhCustomerDl != null) {
              //   AppStorages.customerDL.value =
              //       AppStorages.userLoginRes.rhCustomerDl;
              // }
              // if (AppStorages.userLoginRes.selfieHoldingDl != null) {
              //   AppStorages.selfieHoldingDl.value =
              //       AppStorages.userLoginRes.selfieHoldingDl;
              // }
              // if (AppStorages.userLoginRes.rhCustomerInsurance != null) {
              //   AppStorages.customerAI.value =
              //       AppStorages.userLoginRes.rhCustomerInsurance;
              // }

              // AppStorages.setAccessToken(loginUserModelData.token);
              // AppStorages.accessToken = loginUserModelData.token;
              // if (AppStorages.userLoginRes.user!.rhUserProfilePicture != null) {
              //   AppStorages.profileImage.value =
              //       AppStorages.userLoginRes.user!.rhUserProfilePicture;
              // }
              // AppStorages.userName.value =
              //     AppStorages.userLoginRes.rhCustomerName ?? "";

              Get.offAllNamed(Routes.VERIFY_OTP);
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

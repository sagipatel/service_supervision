import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ss/app/core/helper/widgets/common_text_fields.dart';


class UserDetailController extends GetxController {
  var showPassword = false.obs;
  var isObSecure = true.obs;
  var rememberMe = false.obs;
  @override
  void onInit() {
    print("dsadasda");
    super.onInit();
  }

  final GlobalKey<CommonTextFieldState> keyName =
  GlobalKey<CommonTextFieldState>(),
      keyAddress = GlobalKey<CommonTextFieldState>(),
      keyCity = GlobalKey<CommonTextFieldState>(),
      keyState = GlobalKey<CommonTextFieldState>(),
      keyPinCode = GlobalKey<CommonTextFieldState>(),
      keyBsName = GlobalKey<CommonTextFieldState>(),
      keyBsType = GlobalKey<CommonTextFieldState>(),
      keyGst = GlobalKey<CommonTextFieldState>(),
      keyAlternateNumber = GlobalKey<CommonTextFieldState>()
  ;

  final nameFocusNode = FocusNode(), addressFocusNode = FocusNode(),cityFocusNode = FocusNode(),stateFocusNode = FocusNode(),pinCodeFocusNode = FocusNode(),bsNameFocusNode = FocusNode(),bsTypeFocusNode = FocusNode(),gstFocusNode = FocusNode(),alternateMobileFocusNode = FocusNode();

  TextEditingController nameController = TextEditingController(),
      addressController = TextEditingController(),
      cityController = TextEditingController(),
      stateController = TextEditingController(),
      pinCodeController = TextEditingController(),
      bsNameController = TextEditingController(),
      bsTypeController = TextEditingController(),
      gstController = TextEditingController(),
      alternateNumberController = TextEditingController();



}

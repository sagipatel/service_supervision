import 'package:get/get.dart';

class InquiryController extends GetxController {
  var from = "".obs;
  @override
  void onInit() {
    if (Get.arguments != null) {
      from.value = Get.arguments;
    }
    super.onInit();
  }
}

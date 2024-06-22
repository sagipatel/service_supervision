import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  var selectedTab = "Home".obs;

  @override
  void onInit() {
    print("DASHBOARD");
    super.onInit();
  }
}

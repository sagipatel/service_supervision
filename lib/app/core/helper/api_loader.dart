
import 'package:flutter/material.dart';
import 'package:get/get.dart';


apiLoader({
  loadingText = "Loading...",
  bool showPathBackground = false,
  Function? asyncCall,
  asyncDuration = const Duration(seconds: 1),
  bool showTimer = false,
  Function? onCompleted,
}) {
  Get.closeAllSnackbars();
  Future.delayed(const Duration(milliseconds: 100), () {
    Get.dialog(
      Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          color: Colors.transparent,
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 25),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.transparent),
              child: Center(
                  child:  SizedBox(
                          height: 80,
                          width: 80,
                          child: Image.asset("assets/png/loader.gif"))),
            ),
          ),
        ),
      ),
      useSafeArea: true,
    );
    Future.delayed(asyncDuration, () {
      if (asyncCall != null) asyncCall();
    });
  });
}

hideAppLoader({hideSnacks = true}) {
  if (Get.isDialogOpen!) {
    if (hideSnacks) {
      if (Get.isSnackbarOpen) {
        Get.back();
      }
      Get.back();
    }
  }
}

appLoader() {
  return Expanded(
      child: Center(
          child: SizedBox(
              height: 80, width: 80, child: Image.asset("assets/loader.gif"))));
}


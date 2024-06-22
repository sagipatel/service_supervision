import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ss/app/core/helper/colors.dart';
import 'package:ss/app/core/helper/images_resources.dart';
import 'package:ss/app/core/helper/text_style.dart';
import 'package:ss/app/modules/dashboard/dashboard/controller/dashboard_controller.dart';
import 'package:ss/app/modules/home/customer/controller/customer_controller.dart';
import 'package:ss/app/modules/home/customer/view/customer_view.dart';
import 'package:ss/app/modules/home/home/controller/home_controller.dart';
import 'package:ss/app/modules/home/home/view/home_view.dart';

class DashboardView extends GetWidget<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);

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
              children: [
                Expanded(
                  child: Obx(() => controller.selectedTab.value == "Home"
                      ? HomeView()
                      : controller.selectedTab.value == "Customer"
                          ? CustomerView(showAppbar: false)
                          : SizedBox.shrink()),
                ),
                // Obx(
                //       () => controller.selectedTab.value == "Cart"
                //       ? const SizedBox.shrink()
                //       : Padding(
                //     padding: const EdgeInsets.symmetric(
                //         vertical: 12, horizontal: 20),
                //     child: Row(
                //       children: [
                //         SvgPicture.asset(SvgResources.menuIc),
                //         Expanded(
                //             child: controller.selectedTab.value == "Home"
                //                 ? homeHeader()
                //                 : controller.selectedTab.value ==
                //                 "Settings"
                //                 ? settingsHeader()
                //                 : menuHeader()),
                //         controller.selectedTab.value == "Settings"
                //             ? const SizedBox.shrink()
                //             : SvgPicture.asset(
                //             SvgResources.notificationIc)
                //       ],
                //     ),
                //   ),
                // ),

                // Expanded(
                //   child: Obx(() => controller.selectedTab.value == "Home"
                //       ? HomeView()
                //       : controller.selectedTab.value == "Cart"
                //       ? const CartView()
                //       : controller.selectedTab.value == "Settings"
                //       ? const SettingsView()
                //       : const MenuView()),
                // ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 22.0),
                  decoration: const BoxDecoration(
                      color: whiteColor,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 12.0,
                            blurRadius: 20.0)
                      ],
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16.0),
                          topRight: Radius.circular(16.0))),
                  child: Row(
                    children: [
                      tabItem(
                          title: "Home",
                          inActiveIc: SvgResources.inactiveHome,
                          activeIc: SvgResources.activeHome),
                      tabItem(
                          title: "Inquiry",
                          inActiveIc: SvgResources.inactiveMenu,
                          activeIc: SvgResources.activeMenu),
                      tabItem(
                          title: "Customer",
                          inActiveIc: SvgResources.inactiveCart,
                          activeIc: SvgResources.activeCart),
                      tabItem(
                          title: "More",
                          inActiveIc: SvgResources.inactiveSetting,
                          activeIc: SvgResources.activeSetting),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }

  tabItem({inActiveIc, title, activeIc}) {
    return Obx(
      () => Expanded(
        child: InkWell(
          onTap: () {
            controller.selectedTab.value = title;
            if (controller.selectedTab.value == "Home") {
              HomeController homeController = Get.find();
              homeController.onInit();
            }
            if (controller.selectedTab.value == "Customer") {
              CustomerController customerController = Get.find();
              customerController.onInit();
            }
            // if (controller.selectedTab.value == "Menu") {
            //   MenusController menusController = Get.find();
            //   menusController.onInit();
            // }
            // if (controller.selectedTab.value == "Cart") {
            //   CartController cartController = Get.find();
            //   cartController.onInit();
            // }
            // if (controller.selectedTab.value == "Settings") {
            //   SettingsController settingsController = Get.find();
            //   settingsController.onInit();
            // }
          },
          child: Column(
            children: [
              SvgPicture.asset(controller.selectedTab.value == title
                  ? activeIc
                  : inActiveIc),
              const SizedBox(height: 2),
              Text(title,
                  style: TextStyles.normal(
                      fontSize: 14.0.sp,
                      fontColor: controller.selectedTab.value == title
                          ? secondaryColor
                          : blackColor))
            ],
          ),
        ),
      ),
    );
  }

  homeHeader() {
    return Column(
      children: [
        Text(
          "Fresh Bites from",
          style: TextStyles.normal(fontSize: 18.0.sp, fontColor: grayColor),
        ),
        const SizedBox(height: 6),
        SvgPicture.asset(SvgResources.appLogo, height: 32, width: 32),
      ],
    );
  }

  settingsHeader() {
    return Column(
      children: [
        Text(
          "Settings",
          style: TextStyles.normal(fontSize: 22.0.sp, fontColor: whiteColor),
        ),
      ],
    );
  }

  menuHeader() {
    return Column(
      children: [
        Text(
          "Pizza Perfection",
          style: TextStyles.normal(fontSize: 22.0.sp, fontColor: grayColor),
        ),
        const SizedBox(height: 6),
        Text(
          "Our Special Menu",
          style: TextStyles.normal(fontSize: 22.0.sp, fontColor: whiteColor),
        ),
      ],
    );
  }
}

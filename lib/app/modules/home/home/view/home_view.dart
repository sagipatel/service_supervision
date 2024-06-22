import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ss/app/core/helper/colors.dart';
import 'package:ss/app/core/helper/constants.dart';
import 'package:ss/app/core/helper/images_resources.dart';
import 'package:ss/app/core/helper/text_style.dart';
import 'package:ss/app/modules/dashboard/dashboard/controller/dashboard_controller.dart';
import 'package:ss/app/routes/app_pages.dart';

class HomeView extends GetWidget<DashboardController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: whiteColor,
      extendBody: true,
      body: Container(
        color: whiteColor,
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 20, bottom: 12),
                  child: RichText(
                    text: TextSpan(
                      text: 'Hello,Good Morning ',
                      style: TextStyles.normal(
                          fontSize: 26.sp, fontColor: grayColor),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'SR ZADAFIYA',
                          style: TextStyles.bold(
                              fontSize: 28.sp, fontColor: secondaryColor),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xffFFEFD8),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          "Upcoming Services",
                          style: TextStyles.bold(
                              fontSize: 22.0.sp, fontColor: blackColor),
                        ),
                      ),
                      SizedBox(
                        height: 120.h,
                        width: Get.width,
                        child: ListView.separated(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Get.toNamed(Routes.UPCOMING_SERVICE,
                                      arguments:
                                          AppCommonKeys.UPCOMING_SERVICE);
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 60.0.h,
                                      width: 60.w,
                                      alignment: Alignment.center,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white),
                                      child: const Icon(Icons.calendar_month,
                                          color: Color(0xff72A5F6)),
                                    ),
                                    Text(
                                      index == 0
                                          ? "Today"
                                          : index == 1
                                              ? "Weekly"
                                              : index == 2
                                                  ? "Monthly"
                                                  : "Due",
                                      style: TextStyles.normal(
                                          fontSize: 16.0.sp,
                                          fontColor: blackColor),
                                    )
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(width: 12.w);
                            },
                            itemCount: 4),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Row(
                    children: [
                      commonCard(
                          icon: PngResources.dueServiceIc,
                          title: "Expired Contract",
                          subTitle: "Key Dates & Deadlines",
                          color: const Color(0xffDDEEFC),
                          onPress: () {
                            Get.toNamed(Routes.UPCOMING_SERVICE,
                                arguments: AppCommonKeys.EXPIRED_CONTRACT);
                          }),
                      const SizedBox(width: 16),
                      commonCard(
                          icon: PngResources.serviceIc,
                          title: "Service",
                          subTitle: "Simply Efficient",
                          color: const Color(0xffE7FFE7),
                          onPress: () {
                            Get.toNamed(Routes.UPCOMING_SERVICE,
                                arguments: AppCommonKeys.SERVICE);
                          }),
                    ],
                  ),
                ),
                Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Row(
                      children: [
                        commonCard(
                            icon: PngResources.contractIc,
                            title: "Contract",
                            subTitle: "Outlining Rights & Responsibilities",
                            color: const Color(0xffFFEFD8),
                            onPress: () {
                              Get.toNamed(Routes.UPCOMING_SERVICE,
                                  arguments: AppCommonKeys.CONTRACT);
                            }),
                        const SizedBox(width: 18),
                        commonCard(
                            icon: PngResources.customerIc,
                            title: "Customer",
                            subTitle: "The Customer Experience Awaits",
                            color: const Color(0xffFBE0E0),
                            onPress: () {
                              Get.toNamed(Routes.CUSTOMERS);
                            }),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  commonCard({icon, title, color, subTitle, Function? onPress}) {
    return Expanded(
      child: InkWell(
        onTap: () {
          if (onPress != null) {
            onPress();
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          height: 210.h,
          decoration: BoxDecoration(
            color: color ?? whiteColor,
            borderRadius: BorderRadius.circular(12.0),
            // boxShadow: const [
            //   BoxShadow(color: Colors.black26, blurRadius: 8.0, spreadRadius: 1)
            // ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(icon, height: 48.h, width: 48.w),
              SizedBox(height: 36.h),
              Text(
                title,
                style: TextStyles.bold(fontSize: 22.0, fontColor: blackColor),
              ),
              Text(
                subTitle ?? "",
                style:
                    TextStyles.normal(fontSize: 14.0.sp, fontColor: grayColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}

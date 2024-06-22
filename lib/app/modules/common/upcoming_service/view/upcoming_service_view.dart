import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ss/app/core/helper/colors.dart';
import 'package:ss/app/core/helper/constants.dart';
import 'package:ss/app/core/helper/text_style.dart';
import 'package:ss/app/modules/common/upcoming_service/controller/upcoming_service_controller.dart';

class UpcomingServiceView extends GetWidget<UpcomingServiceController> {
  const UpcomingServiceView({Key? key}) : super(key: key);

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
            children: [appBar(), serviceList()],
          ),
        ),
      ),
    );
  }

  appBar() {
    return Obx(
      () => Container(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
        decoration: const BoxDecoration(color: whiteColor, boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 20.0, spreadRadius: 1.0),
        ]),
        child: Row(
          children: [
            InkWell(
                onTap: () {
                  Get.back();
                },
                child: const Icon(Icons.arrow_back)),
            Expanded(
                child: Text(
              controller.from.value == AppCommonKeys.CONTRACT
                  ? "Contract"
                  : controller.from.value == AppCommonKeys.SERVICE
                      ? "Service"
                      : controller.from.value == AppCommonKeys.EXPIRED_CONTRACT
                          ? "Expired Contract"
                          : "Upcoming service",
              style: TextStyles.bold(fontSize: 22.0.sp, fontColor: blackColor),
              textAlign: TextAlign.center,
            )),
            const SizedBox(width: 20),
          ],
        ),
      ),
    );
  }

  serviceList() {
    return Expanded(
      child: ListView.separated(
          padding: const EdgeInsets.all(20.0),
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                  border: Border.all(color: grayColor),
                  borderRadius: BorderRadius.circular(12.0)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Remark",
                              style: TextStyles.normal(
                                  fontSize: 16.0.sp, fontColor: grayColor),
                            ),
                            Text(
                              "Remark Note here",
                              style: TextStyles.normal(
                                  fontSize: 18.0.sp, fontColor: blackColor),
                            ),
                          ],
                        )),
                        const Padding(
                          padding: EdgeInsets.only(right: 6, left: 6),
                          child: VerticalDivider(width: 1.0, color: grayColor),
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Due Date",
                              style: TextStyles.normal(
                                  fontSize: 16.0.sp, fontColor: grayColor),
                            ),
                            Text(
                              "12 Jan 2024",
                              style: TextStyles.normal(
                                  fontSize: 18.0.sp, fontColor: blackColor),
                            ),
                          ],
                        )),
                      ],
                    ),
                  ),
                  const SizedBox(height: 22),
                  Text(
                    "Customer Name",
                    style: TextStyles.normal(
                        fontSize: 16.0.sp, fontColor: grayColor),
                  ),
                  Text(
                    "Filter repairing",
                    style: TextStyles.normal(
                        fontSize: 20.0.sp, fontColor: blackColor),
                  ),
                  const SizedBox(height: 22),
                  Text(
                    "Customer Address",
                    style: TextStyles.normal(
                        fontSize: 16.0.sp, fontColor: grayColor),
                  ),
                  Text(
                    "204,Kesar Apartment,Nr.Janam Hospital,Shyamal CrossRoad Ahmedabad-380015",
                    style: TextStyles.normal(
                        fontSize: 20.0.sp, fontColor: blackColor),
                  ),
                  const SizedBox(height: 22),
                  Text(
                    "Contact No:",
                    style: TextStyles.normal(
                        fontSize: 16.0.sp, fontColor: grayColor),
                  ),
                  Text(
                    "+91 834790800",
                    style: TextStyles.normal(
                        fontSize: 20.0.sp, fontColor: blackColor),
                  ),
                  if (controller.from.value == AppCommonKeys.CONTRACT) ...[
                    const Padding(
                      padding: EdgeInsets.only(top: 8, bottom: 8),
                      child: Divider(
                          height: 1.0, color: grayColor, thickness: 0.5),
                    ),
                    Text(
                      "You have 1 Year(s) Contract",
                      style: TextStyles.normal(
                          fontSize: 16.0.sp, fontColor: redColor),
                    )
                  ]
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 20);
          },
          itemCount: 6),
    );
  }
}

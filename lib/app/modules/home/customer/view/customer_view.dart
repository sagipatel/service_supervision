import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ss/app/core/helper/colors.dart';
import 'package:ss/app/core/helper/constants.dart';
import 'package:ss/app/core/helper/text_style.dart';
import 'package:ss/app/modules/common/upcoming_service/controller/upcoming_service_controller.dart';
import 'package:ss/app/modules/home/customer/controller/customer_controller.dart';
import 'package:ss/app/routes/app_pages.dart';

class CustomerView extends GetWidget<CustomerController> {
  var showAppbar = true;
  CustomerView({Key? key, this.showAppbar = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: whiteColor,
      extendBody: true,
      floatingActionButton: InkWell(
        onTap: () {
          Get.toNamed(Routes.ADD_CUSTOMER);
        },
        child: CircleAvatar(
            radius: 28.w,
            backgroundColor: secondaryColor,
            child: Icon(Icons.add, color: whiteColor)),
      ),
      body: Container(
        color: whiteColor,
        child: SafeArea(
          child: Column(
            children: [appBar(), customerList()],
          ),
        ),
      ),
    );
  }

  appBar() {
    return showAppbar
        ? Container(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
            decoration: const BoxDecoration(color: whiteColor, boxShadow: [
              BoxShadow(
                  color: Colors.black12, blurRadius: 20.0, spreadRadius: 1.0),
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
                  "Customers",
                  style:
                      TextStyles.bold(fontSize: 22.0.sp, fontColor: blackColor),
                  textAlign: TextAlign.center,
                )),
                const SizedBox(width: 20),
              ],
            ),
          )
        : SizedBox.shrink();
  }

  customerList() {
    return Expanded(
      child: ListView.separated(
          padding:
              const EdgeInsets.only(left: 20.0, right: 20, top: 20, bottom: 90),
          itemBuilder: (context, index) {
            return Card(
              elevation: 12.0,
              color: whiteColor,
              // padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              // decoration: BoxDecoration(
              //     // border: Border.all(color: grayColor),
              //     boxShadow: [BoxShadow()],
              //     borderRadius: BorderRadius.circular(12.0)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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

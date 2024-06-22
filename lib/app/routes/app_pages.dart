import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:ss/app/modules/auth/login/controller/login_controller.dart';
import 'package:ss/app/modules/auth/login/view/login_view.dart';
import 'package:ss/app/modules/common/upcoming_service/controller/upcoming_service_controller.dart';
import 'package:ss/app/modules/common/upcoming_service/view/upcoming_service_view.dart';
import 'package:ss/app/modules/dashboard/dashboard/controller/dashboard_controller.dart';
import 'package:ss/app/modules/dashboard/dashboard/view/dashboard_view.dart';
import 'package:ss/app/modules/home/customer/controller/add_customer_controller.dart';
import 'package:ss/app/modules/home/customer/controller/customer_controller.dart';
import 'package:ss/app/modules/home/customer/view/add_customer_view.dart';
import 'package:ss/app/modules/home/customer/view/customer_view.dart';
import 'package:ss/app/modules/home/home/controller/home_controller.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static var INITIAL = Routes.DASHBOARD;

  static final routes = [
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => LoginController());
      }),
    ),
    GetPage(
      name: Routes.DASHBOARD,
      page: () => const DashboardView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => DashboardController());
        Get.lazyPut(() => HomeController());
        Get.lazyPut(() => CustomerController());
      }),
    ),
    GetPage(
      name: Routes.UPCOMING_SERVICE,
      page: () => const UpcomingServiceView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => UpcomingServiceController());
      }),
    ),
    GetPage(
      name: Routes.CUSTOMERS,
      page: () => CustomerView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => CustomerController());
      }),
    ),
    GetPage(
      name: Routes.ADD_CUSTOMER,
      page: () => const AddCustomerView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => AddCustomerController());
      }),
    ),
  ];
}

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ss/app/core/helper/ui_constants.dart';
import 'package:ss/app/core/helper/utilites.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  // await AppStorages.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Utilities.hideKeyBoard();
        },
        child: ScreenUtilInit(
            designSize: const Size(390, 844),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (_, child) {
              return GetMaterialApp(
                title: "Service Supervision",
                initialRoute: AppPages.INITIAL,
                theme: ThemeData(
                  focusColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  fontFamily: "GlacialIndifference-Regular",
                  // textTheme: UIConstants.textTheme,
                ),
                getPages: AppPages.routes,
                debugShowCheckedModeBanner: false,
              );
            }));
  }
}

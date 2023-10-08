import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controllers/splash_screen_controller.dart';
import '../../utils/colors.dart';

/*Created By: Suhail Thakrani on 22-Sept-2023*/
class SplashScreen extends GetView<SplashScreenController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var splashTextStyle = const TextStyle(
      color: Colors.white,
      fontFamily: "Poppins",
      fontSize: 28.0,
      fontWeight: FontWeight.w700,
      height: 0,
    );
    return GestureDetector(
      onTap: controller.onScreenTap,
      child: SafeArea(
      child: ScreenUtilInit(
        designSize: const Size(428, 926),
        builder: (context, widget) => Scaffold(
          backgroundColor: kPrimaryColor,
          body: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(
                left: 35.w, // 35
                right: 30.w, // 70
                top: 300.h, // 20
              ),
              height: Get.height,
              width: Get.width,
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/steth.png",
                      ),
                      SizedBox(width: Get.width * 0.02),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("E-CLINIC", style: splashTextStyle),
                          Container(
                            margin: EdgeInsets.only(top: 100.h, bottom: 50.h),
                            child: Image.asset("assets/images/small-steth.png"),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Center(child: CircularProgressIndicator()),
                ],
              ),
            ),
          ),
        ),
      ),
    )
    );
  }
}



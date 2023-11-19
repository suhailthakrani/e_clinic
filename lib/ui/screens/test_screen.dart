import 'package:android_intent_plus/android_intent.dart';
import 'package:e_clinic/ui/widgets/button1.dart';
import 'package:e_clinic/ui/widgets/user_tile.dart';
import 'package:e_clinic/ui/widgets/widget_svg.dart';
import 'package:e_clinic/utils/colors.dart';
import 'package:e_clinic/utils/constants.dart';
import 'package:e_clinic/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controllers/test_screen_controller.dart';

class TestScreen extends GetView<TestScreenController> {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kWhiteColor,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          elevation: 0,
          backgroundColor: kWhiteColor,
          foregroundColor: kBlackColor,
          centerTitle: true,
          title: WSvgWidget(
            imageUrl: 'assets/images/logo.svg',
            height: 120,
          ),
          toolbarHeight: 70,
        ),
        body: SingleChildScrollView(
          child: ScreenUtilInit(
            designSize: Size(Get.width, Get.height),
            builder: (context, widget) => Container(
              margin: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Create Free Account",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Poppins",
                    ),
                  ),
                  SizedBox(height: 10.h),
                  const Text("Choose an option below to continue"),
                  SizedBox(height: 30.h),
                  RichText(
                    text: const TextSpan(
                      text: "I am Registering as ",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Poppins",
                      ),
                      children: [
                        TextSpan(
                          text: "*",
                          style: TextStyle(
                            color: kRequiredRedColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Obx(
                    () => InkWell(
                      onTap: () {
                        controller.onIndexChanged(0);
                      },
                      child: UserTile(
                          image: 'assets/images/male.svg',
                          title: "Patient",
                          isSelected: controller.currentIndex.value == 0),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Obx(
                    () => InkWell(
                      onTap: () {
                        controller.onIndexChanged(1);
                      },
                      child: UserTile(
                          image: 'assets/images/stethoscope.svg',
                          title: "Doctor",
                          isSelected: controller.currentIndex.value == 1),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Obx(
                    () => InkWell(
                      onTap: () {
                        controller.onIndexChanged(2);
                      },
                      child: UserTile(
                          image: 'assets/images/microscope.png',
                          title: "Register Lab",
                          isSelected: controller.currentIndex.value == 2),
                    ),
                  ),
                  SizedBox(height: 50.h),
                  Container(
                    height: 51.h,
                    width: 390.w,
                    decoration: BoxDecoration(
                      // apply shadow to the container
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 10,
                          // shadow on botom and right
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Button1(
                      textStyle: textTheme.labelLarge!,
                      buttonColor: button2Color,
                      text: "Continue",
                      borderRadius: 30,
                      onPress: () {
                        if (controller.currentIndex.value == 0) {
                          Get.toNamed(kLoginScreenRoute);
                        } else if(controller.currentIndex.value == 2){
                          Get.toNamed(kLabLoginScreenRoute);
                        }
                        else {
                          openOtherInterApp();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void openOtherInterApp() async {
    AndroidIntent intent = const AndroidIntent(
      action: 'action_view',
      data: 'doctorapp://open', // Replace with your custom scheme and action
    );
    if (intent.data != null) {
      await intent.launch();
    }
  }
}

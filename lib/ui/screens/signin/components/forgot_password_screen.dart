import '../../../../controllers/forgot_password_controller.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../widgets/button1.dart';
import 'reset_by_sms_screen.dart';

class ForgotPasswordScreen extends GetView<ForgotPasswordScreenController> {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
         appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: kWhiteColor,
        foregroundColor: kBlackColor,
        title: Text(
          'Forgot Password',
          style: TextStyle(fontSize: 24.w, fontWeight: FontWeight.bold),
        ),
      ),
        body: SingleChildScrollView(
          child: ScreenUtilInit(
            designSize:  Size(Get.width, Get.height),
            builder: (context, widget) => Container(
              margin: EdgeInsets.all(20.w),
              child: Column(
                children: [
                 
                  SizedBox(height: 50.h),
                  Image.asset("assets/images/forgot-pass.png", height: Get.height * 0.18,),
                  const Text(
                    "Select which contact details should we use to reset your password",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Poppins",
                    ),
                  ),
                  SizedBox(height: 20.h),
                  controller.passwordResetMethods[0],
                  SizedBox(height: 20.h),
                  controller.passwordResetMethods[1],
                  SizedBox(height: 60.h),
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
                        Get.to(const ResetBySmsScreen());
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
}
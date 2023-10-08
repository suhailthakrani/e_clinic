import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../util/button1.dart';
import '../util/colors.dart';
import '../util/text_styles.dart';
import 'providers/forgot_password_provider.dart';
import 'reset_by_sms_screen/reset_by_sms_screen.dart';

class ForgotPasswordScreen extends GetView<ForgotPasswordProvider> {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  static const routeName = "forgot_password_screen";

  @override
  Widget build(BuildContext context) {
    Get.put(ForgotPasswordProvider());
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: ScreenUtilInit(
            designSize: const Size(428, 926),
            builder: (context, widget) => Container(
              margin: EdgeInsets.all(20.w),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      SizedBox(width: 0.w),
                      Text("Forgot Password", style: textTheme.headline1),
                    ],
                  ),
                  SizedBox(height: 50.h),
                  Image.asset("assets/images/forgot-pass.png"),
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
                    child: Obx(
                      () => Button1(
                        textStyle: textTheme.button!,
                        buttonColor: controller.checkIfAllSelected()
                            ? button2Color
                            : Colors.grey,
                        text: "Continue",
                        borderRadius: 30,
                        onPress: controller.checkIfAllSelected()
                            ? () {
                                Navigator.pushNamed(
                                  context,
                                  ResetBySmsScreen.routeName,
                                );
                              }
                            : null,
                      ),
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
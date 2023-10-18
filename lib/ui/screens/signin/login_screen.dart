import '../../../controllers/login_screen_controller.dart';
import '../../../ui/widgets/general_text_field.dart';
import '../../../utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/colors.dart';
import '../../../utils/text_styles.dart';
import '../../widgets/button1.dart';
import '../../widgets/input_field.dart';

class LoginScreen extends GetView<LoginScreenController> {
  const LoginScreen({Key? key}) : super(key: key);

  static const routeName = 'login_screen';

  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Builder(builder: (context) {
        return SafeArea(
          child: SingleChildScrollView(
            child: ScreenUtilInit(
              designSize: const Size(428, 926),
              builder: (context, widget) => Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 30.h),
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // IconButton(
                        //   icon: const Icon(Icons.arrow_back_ios),
                        //   onPressed: () {
                        //     // Navigator.pop(context);
                        //   },
                        // ),
                        SizedBox(height: 5.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Login to Your Account",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 24.w,
                                  color: kBlackColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Image.asset("assets/images/login_pic.png"),
                  SizedBox(height: 30.h),
                  GeneralTextField.withBorder(
                    tfManager: controller.usernameManager,
                  ),
                  GeneralTextField.withBorder(
                    tfManager: controller.passwordManager,
                  ),
                  SizedBox(height: 30.h),
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
                      text: "Login",
                      borderRadius: 30,
                      onPress: () {
                        controller.onLoginClick();
                        // Navigator.pushNamed(context, ForgotPasswordScreen.routeName);
                      },
                    ),
                  ),
                  SizedBox(height: 16.h),
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
                      text: "Continue As Guest",
                      borderRadius: 30,
                      onPress: () {
                        Get.toNamed(kMainScreenRoute);
                        // Navigator.pushNamed(context, ForgotPasswordScreen.routeName);
                      },
                    ),
                  ),
                  SizedBox(height: 16.h),
                  TextButton(
                      child: Text(
                        "Forgot Your Password",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: button2Color),
                      ),
                      onPressed: () {
                        Get.toNamed(kForgotPasswordScreenRoute);
                        // Navigator.pushNamed(context, ForgotPasswordScreen.routeName);
                      }),
                  // SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Dont have an account?", style: textTheme.bodySmall),
                      SizedBox(width: 14.w),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(kRegisterScreenRoute);
                          // Navigator.of(context)
                          //     .pushReplacementNamed(SignUpScreen.routeName);
                        },
                        child: Text("Sign Up", style: textTheme.labelSmall),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

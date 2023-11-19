import 'package:android_intent_plus/android_intent.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_clinic/controllers/labs/lab_signin_screen_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../controllers/login_screen_controller.dart';
import '../../../ui/widgets/general_text_field.dart';
import '../../../utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/colors.dart';
import '../../../utils/text_styles.dart';
import '../../widgets/button1.dart';
import '../../widgets/custom_dialogs.dart';
import '../../widgets/input_field.dart';

class LabSignInScreen extends GetView<LabSignInScreenController> {
  const LabSignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Builder(builder: (context) {
        return SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
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
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)),
                    child: TextField(
                      obscureText: false,
                      controller: controller.usernameManager.controller,
                      focusNode: controller.usernameManager.focusNode,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide.none),
                        filled: true,
                        fillColor: kWhiteColor,
                        contentPadding: const EdgeInsets.only(
                            top: 10.0, left: 10, bottom: 10),
                        hintText: controller.usernameManager.fieldName,
                        hintStyle: const TextStyle(
                            color: kTextHintColor, fontSize: 16),
                        prefixIcon: Icon(Icons.person, color: kPrimaryColor),
                      ),
                      onChanged: (value) {
                        controller.usernameManager.validate();
                      },
                    ),
                  ),
                  _getErrorMessage(
                      errorMessage: controller.usernameManager.errorMessage),
                  if (controller.usernameManager.errorMessage.isEmpty)
                    SizedBox(height: 20.h)
                  else
                    SizedBox(height: 16.h),

                  Obx(
                    () => Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24)),
                      child: TextField(
                        obscureText: controller.obscureText.value,
                        controller: controller.passwordManager.controller,
                        focusNode: controller.passwordManager.focusNode,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.text,
                        style:
                            const TextStyle(fontSize: 20, color: Colors.black),
                        decoration: InputDecoration(
                          fillColor: kWhiteColor,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide.none),
                          prefixIcon: Icon(Icons.lock, color: kPrimaryColor),
                          contentPadding: const EdgeInsets.only(
                              top: 10.0, left: 10, bottom: 10),
                          hintText: controller.passwordManager.fieldName,
                          hintStyle: const TextStyle(
                              color: kTextHintColor, fontSize: 16),
                          suffixIcon: GestureDetector(
                            onTap: controller.onObscureText,
                            child: controller.obscureText.value
                                ? Icon(CupertinoIcons.eye_slash_fill,
                                    color: kPrimaryColor)
                                : Icon(CupertinoIcons.eye_fill,
                                    color: kPrimaryColor),
                          ),
                        ),
                        onChanged: (value) {
                          controller.passwordManager.validate();
                        },
                      ),
                    ),
                  ),
                  _getErrorMessage(
                      errorMessage: controller.passwordManager.errorMessage),
                  // GeneralTextField.withShadow(
                  //   paddingHorizontal: 16,
                  //   tfManager: controller.passwordManager,
                  // ),

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
                  // Container(
                  //   height: 51.h,
                  //   width: 390.w,
                  //   decoration: BoxDecoration(
                  //     // apply shadow to the container
                  //     boxShadow: [
                  //       BoxShadow(
                  //         color: Colors.black.withOpacity(0.2),
                  //         spreadRadius: 1,
                  //         blurRadius: 10,
                  //         // shadow on botom and right
                  //         offset: const Offset(0, 5),
                  //       ),
                  //     ],
                  //   ),
                  //   child: Button1(
                  //     textStyle: textTheme.labelLarge!,
                  //     buttonColor: button2Color,
                  //     text: "Continue As Doctor",
                  //     borderRadius: 30,
                  //     onPress: ()  {
                  //        openOtherInterApp();
                  //       // Navigator.pushNamed(context, ForgotPasswordScreen.routeName);
                  //     },
                  //   ),
                  // ),
                  // SizedBox(height: 16.h),
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
                          Get.toNamed(kLabRegisterScreenRoute);
                          // Navigator.of(context)
                          //     .pushReplacementNamed(SignUpScreen.routeName);
                        },
                        child: Text("Register", style: textTheme.labelSmall),
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

  Widget _getErrorMessage({required RxString errorMessage}) {
    return Obx(
      () => Visibility(
          visible: errorMessage.isNotEmpty,
          child: Padding(
            padding: const EdgeInsets.only(left: 4, top: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  errorMessage.value,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: kRequiredRedColor,
                  ),
                ),
              ],
            ),
          )),
    );
  }

 
  // Future<void> openOtherInterApp() async {
  //   AndroidIntent intent = const AndroidIntent(
  //     action: 'action_view',
  //     // data: 'doctorapp://open',
  //     package: 'com.example.e_clinic_dr',
  //   );
  //   await intent.launch();
  // }
}

import '../../widgets/general_date_picker_field.dart';
import '/../controllers/register_screen_controller.dart';
import '/../ui/widgets/general_text_field.dart';
import '/../ui/widgets/widget_svg.dart';
import '/../utils/colors.dart';
import '/../utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/text_styles.dart';
import '../../widgets/button2.dart';
import '../../widgets/general_dropdown.dart';
import '../../widgets/checkbox.dart';
import '../signin/login_screen.dart';

class SignUpScreen extends GetView<RegisterScreenController> {
  const SignUpScreen({Key? key}) : super(key: key);

  static const routeName = "signup_screen";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: ScreenUtilInit(
            designSize: Size(Get.width, Get.height),
            builder: (context, widget) => Container(
              // margin: EdgeInsets.all(8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      WSvgWidget(
                        imageUrl: 'assets/images/logo.svg',
                        height: 50,
                      ),
                    ],
                  ),
                  Text("Join As a Patient", style: textTheme.headline1),
                  Row(
                    children: [
                      Text("Already a member?",
                          style: textTheme.headlineMedium),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(kLoginScreenRoute);
                          // Navigator.of(context)
                          //     .pushReplacementNamed(LoginScreen.routeName);
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Color.fromRGBO(87, 98, 182, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                  GeneralTextField.withShadow(
                    tfManager: controller.firstNameController,
                    paddingVertical: 0,
                    paddingHorizontal: 8,
                  ),
                  GeneralTextField.withShadow(
                    tfManager: controller.lastNameController,
                    paddingVertical: 0,
                    paddingHorizontal: 8,
                  ),
                
                  GeneralTextField.withShadow(
                    tfManager: controller.emailController,
                    paddingVertical: 0,
                    paddingHorizontal: 8,
                  ),
                  GeneralTextField.withShadow(
                    tfManager: controller.passwordController,
                    paddingVertical: 0,
                    paddingHorizontal: 8,
                  ),
                  GeneralTextField.withShadow(
                    tfManager: controller.phoneNoController,
                    paddingVertical: 0,
                    paddingHorizontal: 8,
                  ),
                  GeneralDatePickerField.withShadow(
                        dateManager: controller.dateOfBirthController,
                      ),
                  GeneralDropdown.withShadow(controller: controller.genderDDController),
                
                  SizedBox(height: 20.h),
                  SizedBox(
                    width: Get.width,
                    child: Button2(
                        text: "Register",
                        onPress: () {
                          controller.onRegisterClicked();
                        }),
                  ),
                  SizedBox(height: 16.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

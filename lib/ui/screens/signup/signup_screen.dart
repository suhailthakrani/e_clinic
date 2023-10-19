import 'package:e_clinic/ui/widgets/general_dropdown.dart';
import 'package:e_clinic/utils/constants.dart';

import '../../../controllers/register_screen_controller.dart';
import '../../../ui/widgets/general_text_field.dart';
import '../../../ui/widgets/widget_svg.dart';
import '../../../utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/text_styles.dart';
import '../../widgets/button2.dart';
import '../../widgets/general_date_picker_field.dart';
import '../../widgets/input_field.dart';
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
          physics:const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(16),
          //  margin: EdgeInsets.all(8.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  WSvgWidget(
                    imageUrl: 'assets/images/logo.svg',
                    height: 40,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Join As a Patient", style: textTheme.displayLarge),
              ),
              Row(
                children: [
                  const SizedBox(width: 10),
                  Text("Already a member?", style: textTheme.headlineMedium),
                  TextButton(
                    onPressed: () {
                      Get.toNamed(kLoginScreenRoute);
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
              GeneralTextField.withBorder(
                tfManager: controller.firstNameController,
                paddingVertical: 0,
                paddingHorizontal: 0,
              ),
              GeneralTextField.withBorder(
                tfManager: controller.lastNameController,
                paddingVertical: 0,
                paddingHorizontal: 0,
              ),
              // GeneralTextField.withBorder(
              //   tfManager: controller.cnicController,
              //   paddingVertical: 0,
              //   paddingHorizontal: 0,
              // ),
              GeneralTextField.withBorder(
                tfManager: controller.emailController,
                paddingVertical: 0,
                paddingHorizontal: 0,
              ),
              GeneralTextField.withBorder(
                tfManager: controller.passwordController,
                paddingVertical: 0,
                paddingHorizontal: 0,
              ),
              GeneralTextField.withBorder(
                tfManager: controller.phoneNoController,
                paddingVertical: 0,
                paddingHorizontal: 0,
              ),
              GeneralDatePickerField.withShadow(
                dateManager: controller.dateOfBirthController,
                paddingVertical: 0,
                paddingHorizontal: 0,
              ),
              GeneralDropdown.withShadow(
                controller: controller.genderDDontroller,
                paddingHorizontal: 0,
              ),

              SizedBox(height: 16.h),
              SizedBox(
                width: Get.width * 0.9,
                child: Button2(
                    text: "SignUp",
                    onPress: () {
                      controller.onRegisterClicked();
                    }),
              ),
              SizedBox(height: Get.height* 0.3),
            ],
          ),
        ),
      ),
    );
  }
}

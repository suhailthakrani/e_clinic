import '../../../controllers/register_screen_controller.dart';
import '../../../ui/widgets/general_text_field.dart';
import '../../../ui/widgets/widget_svg.dart';
import '../../../utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/text_styles.dart';
import '../../widgets/button2.dart';
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
          child: ScreenUtilInit(
            designSize: Size(Get.width, Get.height),
            builder: (context, widget) => Container(
              margin: EdgeInsets.all(8.w),
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
                  Text("Join As a Doctor", style: textTheme.headline1),
                  Row(
                    children: [
                      Text("Already a member?",
                          style: textTheme.headlineMedium),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed(LoginScreen.routeName);
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
                    paddingHorizontal: 8,
                  ),
                  GeneralTextField.withBorder(
                    tfManager: controller.lastNameController,
                    paddingVertical: 0,
                    paddingHorizontal: 8,
                  ),
                  GeneralTextField.withBorder(
                    tfManager: controller.cnicController,
                    paddingVertical: 0,
                    paddingHorizontal: 8,
                  ),
                  GeneralTextField.withBorder(
                    tfManager: controller.emailController,
                    paddingVertical: 0,
                    paddingHorizontal: 8,
                  ),
                  GeneralTextField.withBorder(
                    tfManager: controller.passwordController,
                    paddingVertical: 0,
                    paddingHorizontal: 8,
                  ),
                  GeneralTextField.withBorder(
                    tfManager: controller.phoneNoController,
                    paddingVertical: 0,
                    paddingHorizontal: 8,
                  ),
                  GeneralTextField.withBorder(
                    tfManager: controller.specializationController,
                    paddingVertical: 0,
                    paddingHorizontal: 8,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    height: 30.h,
                    width: Get.width - 20,
                    child: const Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text('Gender'),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text("Experience"),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Obx(
                            () => DropdownButton(
                                value: controller.selectedGeder.value,
                                borderRadius: BorderRadius.circular(12),
                                underline: const SizedBox(),
                                items: controller.genderList
                                    .map((e) => DropdownMenuItem(
                                          child: Text(e),
                                          value: e,
                                        ))
                                    .toList(),
                                onChanged: (value) {
                                  // controller.selectedGeder.value = '';
                                  controller.selectedGeder.value = value!;
                                }),
                          ),
                        ),

                        Expanded(
                          flex: 1,
                          child: Obx(
                            () => DropdownButton(
                                underline: const SizedBox(),
                                value: controller.selectedExperience.value,
                                items: controller.experienceList
                                    .map((e) => DropdownMenuItem(
                                          child: Text(e),
                                          value: e,
                                        ))
                                    .toList(),
                                onChanged: (value) {
                                  // controller.selectedGeder.value = '';
                                  controller.selectedExperience.value = value!;
                                }),
                          ),
                        ),
                        // Expanded(
                        //   flex: 1,
                        //   child: Obx(
                        //     () => DropdownButton(
                        //         value: controller.selectedExperience.value,
                        //         items: controller.experienceList
                        //             .map((e) => DropdownMenuItem(
                        //                   child: Text(e),
                        //                   value: e,
                        //                 ))
                        //             .toList(),
                        //         onChanged: (value) {
                        //           // controller.selectedGeder.value = '';
                        //           controller.selectedExperience.value = value!;
                        //         }),
                        //   ),
                        // )
                      ],
                    ),
                  ),
                  GeneralTextField.withBorder(
                    tfManager: controller.hospitalController,
                    paddingVertical: 0,
                    paddingHorizontal: 8,
                  ),
                  GeneralTextField.withBorder(
                    tfManager: controller.cityController,
                    paddingVertical: 0,
                    paddingHorizontal: 8,
                  ),
                  GeneralTextField.withBorder(
                    tfManager: controller.stateController,
                    paddingVertical: 0,
                    paddingHorizontal: 8,
                  ),
                  GeneralTextField.withBorder(
                    tfManager: controller.addressController,
                    paddingVertical: 0,
                    paddingHorizontal: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Selecte Degree File',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Obx(
                          () => ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: kWhiteColor,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 2,
                                    color: controller
                                            .degreeDocument.value.isNotEmpty
                                        ? kGreenNormalColor
                                        : kBlueColor),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () async {
                              await controller.pickImage();
                            },
                            child: Text(
                              'Browse',
                              style: TextStyle(
                                  color:
                                      controller.degreeDocument.value.isNotEmpty
                                          ? kGreenNormalColor
                                          : kBlueColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    // margin: EdgeInsets.only(right: 16.w, left: 20.w),
                    // color: Colors.red,
                    height: 34.h,
                    width: Get.width,
                    child: const CheckBoxWidget(
                      text:
                          "I agree to receive Email and SMS that may contain personal health information.",
                    ),
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(
                    width: Get.width,
                    child: Button2(
                        text: "SignUp",
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

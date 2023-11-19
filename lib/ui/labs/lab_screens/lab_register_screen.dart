import 'package:android_intent_plus/android_intent.dart';
import 'package:e_clinic/controllers/labs/lab_register_screen_controller.dart';
import 'package:e_clinic/utils/colors.dart';
import 'package:e_clinic/utils/constants.dart';
import 'package:flutter/cupertino.dart';

import '../../../ui/widgets/general_text_field.dart';
import '../../../ui/widgets/widget_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/text_styles.dart';
import '../../widgets/button2.dart';

class LabRegisterScreen extends GetView<LabRegisterScreenController> {
  const LabRegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kWhiteColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: kWhiteColor,
          foregroundColor: kBlackColor,
          centerTitle: true,
          title: WSvgWidget(
            imageUrl: 'assets/images/logo.svg',
            height: 120,
          ),
          // toolbarHeight: 70,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(16),
          //  margin: EdgeInsets.all(8.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  "Register As a Lab",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                    color: kTextColor,
                  ),
                ),
              ),

              Row(
                children: [
                  const SizedBox(width: 10),
                  Text("Already registered?", style: textTheme.headlineMedium),
                  TextButton(
                    onPressed: () {
                      Get.toNamed(kLabLoginScreenRoute);
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                        color: Color.fromRGBO(87, 98, 182, 1),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              GeneralTextField.withBorder(
                tfManager: controller.nameController,
                paddingVertical: 0,
                paddingHorizontal: 0,
              ),
              GeneralTextField.withBorder(
                tfManager: controller.addressController,
                paddingVertical: 0,
                paddingHorizontal: 0,
              ),
             
              GeneralTextField.withBorder(
                tfManager: controller.cityController,
                paddingVertical: 0,
                paddingHorizontal: 0,
              ),

                GeneralTextField.withBorder(
                tfManager: controller.stateController,
                paddingVertical: 0,
                paddingHorizontal: 0,
              ),
                GeneralTextField.withBorder(
                tfManager: controller.emailController,
                paddingVertical: 0,
                paddingHorizontal: 0,
              ),

              Text(
                controller.passwordController.fieldName,
                style: const TextStyle(color: kBlackColor, fontSize: 14),
              ),
              const SizedBox(height: 6),
              Obx(
                    () => Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: TextField(
                    obscureText: controller.obscureText.value,
                    controller: controller.passwordController.controller,
                    focusNode: controller.passwordController.focusNode,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.text,
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                    decoration: InputDecoration(
                      fillColor: kWhiteColor,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide.none),
                      // prefixIcon: Icon(Icons.lock, color: kPrimaryColor),
                      contentPadding: const EdgeInsets.only(
                          top: 10.0, left: 10, bottom: 10),
                      hintText: controller.passwordController.fieldName,
                      hintStyle:
                      const TextStyle(color: kTextHintColor, fontSize: 16),
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
                      controller.passwordController.validate();
                    },
                  ),
                ),
              ),
              _getErrorMessage(
                  errorMessage: controller.passwordController.errorMessage),
             
              SizedBox(height: 40.h),
              SizedBox(
                width: Get.width * 0.9,
                child: Button2(
                    text: "Register",
                    onPress: () {
                      controller.onRegisterClicked();
                    }),
              ),
              SizedBox(height: Get.height * 0.3),
            ],
          ),
        ),
      ),
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

  void openOtherInterApp() async {
    AndroidIntent intent = const AndroidIntent(
      action: 'action_view',
      data: 'doctorapp://open', // Replace with your custom scheme and action
    );
    if (intent.data != null) {
      await intent.launch();
    }
  }

// Future<void> _openDrApp() async {
//   bool isInstalled =
//       await DeviceApps.isAppInstalled('com.example.e_clinic_dr');
//   if (isInstalled) {
//     await DeviceApps.openApp('com.example.e_clinic_dr');
//   } else {
//     CustomDialogs()
//         .showDialog("Alert", "App is not installed", DialogType.warning);
//   }
// }
}

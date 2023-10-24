import 'dart:io';

import '../../../../controllers/forgot_password_controller.dart';
import '../../../../ui/widgets/button1.dart';
import '../../../../ui/widgets/button2.dart';
import '../../../../ui/widgets/general_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controllers/general_controllers.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/text_field_manager.dart';
import '../../../../utils/text_filter.dart';
import '../../../widgets/general_date_picker_field.dart';
import '../../../widgets/general_text_field.dart';

class PersonalInfoSettingsScreen
    extends GetView<PersonalInfoSettingsController> {
  const PersonalInfoSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: kWhiteColor,
        foregroundColor: kBlackColor,
        title: Text(
          'Personal Info Settings',
          style: TextStyle(fontSize: 24.w, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Container(
              height: Get.height,
              width: Get.width,
              padding: EdgeInsets.all(16.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h),
                    const Text(
                      'Personal information',
                      style: TextStyle(
                        color: Color(0xFF333333),
                        fontSize: 18,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        height: 0.07,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 100,
                      width: 100,
                      child: Obx(
                        () => ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: controller.profileUrl.value.isEmpty
                              ? Image.asset('assets/images/personal_info.png')
                              : Image.file(
                                  File(controller.profileUrl.value),
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 180,
                          height: 50,
                          child: ElevatedButton.icon(
                            onPressed: () async {
                              await controller.pickImage();
                            },
                            icon: Image.asset(
                              'assets/images/upload.png',
                              height: 30,
                              width: 30,
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: kWhiteColor,
                              foregroundColor: kBlueColor,
                            ),
                            label: const Padding(
                              padding: EdgeInsets.only(top: 8.0),
                              child: Text(
                                'Change photo',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF166FFF),
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  height: 0.09,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Padding(
                          padding: EdgeInsets.only(top: 8.0),
                          child: Text(
                            'Allowed JPG, GIF or PNG. Max size of 2MB',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF999999),
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 0.11,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        GeneralTextField.withShadow(
                          tfManager: controller.firstNameController,
                          paddingVertical: 0,
                          paddingHorizontal: 4,
                        ),
                        GeneralTextField.withShadow(
                          tfManager: controller.lastNameController,
                          paddingVertical: 0,
                          paddingHorizontal: 4,
                        ),
                        GeneralDropdown.withShadow(
                            controller: controller.genderDDController),
                        GeneralDatePickerField.withShadow(
                          dateManager: controller.dateOfBirthController,
                        ),
                        GeneralTextField.withShadow(
                          tfManager: controller.cniController,
                          paddingVertical: 0,
                          paddingHorizontal: 4,
                        ),
                        const SizedBox(height: 8),
                        Center(
                          child: SizedBox(
                            width: Get.width * 0.9,
                            height: 50,
                            child: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    side:  BorderSide(color: kPrimaryColor)),
                                foregroundColor: kWhiteColor,
                                backgroundColor: kPrimaryColor,
                              ),
                              child: const Text(
                                "Save Changes",
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Center(
                          child: SizedBox(
                            width: Get.width * 0.9,
                            height: 50,
                            child: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    side:  BorderSide(color: kPrimaryColor)),
                                backgroundColor: kWhiteColor,
                                foregroundColor: kBlueColor,
                              ),
                              child: const Text(
                                "Cancel",
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

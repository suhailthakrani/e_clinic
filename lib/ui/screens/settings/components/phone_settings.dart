import '../../../../controllers/general_controllers.dart';
import '../../../../ui/screens/settings/components/otp_verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../utils/colors.dart';
import '../../../widgets/general_text_field.dart';

class PhoneNoSettingsScreen extends GetView<PhoneNoSettingsController> {
  const PhoneNoSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: kWhiteColor,
        foregroundColor: kBlackColor,
        title: Text(
          'Phone Number Settings',
          style: TextStyle(fontSize: 24.w, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Container(
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(
              color: kWhiteColor,
              borderRadius: BorderRadius.circular(8.r),
              boxShadow: const [
                BoxShadow(color: kFieldShadowColor, offset: Offset(-1, -1)),
                BoxShadow(color: kFieldShadowColor, offset: Offset(1, 1))
              ]),
          padding: EdgeInsets.all(16.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Add a number so confirmed it’s you and eclinic can get in touch. You can add other numbers and choose how they’re used.',
                    maxLines: 4,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 20),
                GeneralTextField.withShadow(
                  tfManager: controller.currentPhoneControler,
                  paddingVertical: 0,
                  paddingHorizontal: 4,
                ),
                SizedBox(height: 20.h),
                GeneralTextField.withShadow(
                  tfManager: controller.newPhoneControler,
                  paddingVertical: 0,
                  paddingHorizontal: 4,
                ),
                SizedBox(height: 20.h),
                Center(
                  child: SizedBox(
                    width: Get.width * 0.9,
                    height: 50,
                    child: TextButton(
                      onPressed: () {
                        Get.to(const OtpVerificationScreen());
                      },
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: const BorderSide(color: kBlueColor)),
                        foregroundColor: kWhiteColor,
                        backgroundColor: kBlueColor,
                      ),
                      child: const Text(
                        "Send OTP",
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: SizedBox(
                    width: Get.width * 0.9,
                    height: 50,
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: const BorderSide(color: kBlueColor)),
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
            ),
          ),
        ),
      ),
    );
  }
}

import '../../../../controllers/general_controllers.dart';
import '../../../../ui/screens/settings/components/check_you_email.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../utils/colors.dart';
import '../../../widgets/general_text_field.dart';

class EmailSettingsScreen extends GetView<EmailSettingsController> {
  const EmailSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: kWhiteColor,
        foregroundColor: kBlackColor,
        title: Text(
          'Email Settings',
          style: TextStyle(fontSize: 24.w, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Container(
          height: Get.height,
          width: Get.width,
          //  margin: EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: kWhiteColor,
              borderRadius: BorderRadius.circular(12.r),
              boxShadow:  [
                BoxShadow(color: Colors.grey.shade200, offset: Offset(-2, -2)),
                BoxShadow(color: Colors.grey.shade200, offset: Offset(2, 2))
              ]),
          padding: EdgeInsets.all(16.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              
               
                const SizedBox(height: 40),
                GeneralTextField.withShadow(
                  tfManager: controller.currentEmailControler,
                  paddingVertical: 0,
                  paddingHorizontal: 0,
                ),
                SizedBox(height: 20.h),
                GeneralTextField.withShadow(
                  tfManager: controller.newEmailControler,
                  paddingVertical: 0,
                  paddingHorizontal: 0,
                ),
                SizedBox(height: 20.h),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Note: New Email address can only be updated once you are verified',
                    maxLines: 2,
                    style: TextStyle(
                      color: kRequiredRedColor,
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                GeneralTextField.withShadow(
                  tfManager: controller.confrimEmailControler,
                  paddingVertical: 0,
                  paddingHorizontal: 0,
                ),
                const SizedBox(height: 50),
                Center(
                  child: SizedBox(
                    width: Get.width * 0.9,
                    height: 50,
                    child: TextButton(
                      onPressed: () {
                        Get.to(const CheckYourEmailScreen());
                      },
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: const BorderSide(color: kBlueColor)),
                        foregroundColor: kWhiteColor,
                        backgroundColor: kPrimaryColor,
                      ),
                      child: const Text(
                        "Confrim",
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
                            side: BorderSide(color: kPrimaryColor)),
                        backgroundColor: kWhiteColor,
                        foregroundColor: kPrimaryColor,
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

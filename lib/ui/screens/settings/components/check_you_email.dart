import '../../../../controllers/general_controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../utils/colors.dart';
import '../../../widgets/general_text_field.dart';

class CheckYourEmailScreen extends StatelessWidget {
  const CheckYourEmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: kWhiteColor,
        foregroundColor: kBlackColor,
        title: Text(
          'Check Your Email',
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
                SizedBox(height: 60.h),
                Padding(
                  padding:const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'We have sent an confirmation to your new added email',
                    maxLines: 3,
                    style: TextStyle(
                      color: kBlack90Color.withOpacity(0.8),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.02,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Text(
                    'mo****e@ou***.com.',
                    style: TextStyle(
                      color: kBlack90Color.withOpacity(0.8),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.02,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                SizedBox(height: 20.h),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Didn’t receive the email? Check spam or promotion folder or',
                    maxLines: 2,
                    style: TextStyle(
                      color: Color(0xFF166FFF),
                      fontSize: 15,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Container(
                  padding: const EdgeInsets.only(left: 16),
                    width: Get.width * 0.5,
                    height: 45,
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                        ),
                        foregroundColor: kWhiteColor,
                        backgroundColor:  Color(0xFF166FFF),
                      ),
                      child: const Text(
                        "Confrim",
                         style: TextStyle(
                      color: kWhiteColor,
                      fontSize: 15,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
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

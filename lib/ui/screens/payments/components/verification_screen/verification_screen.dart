import '../../../../../ui/widgets/checkbox.dart';
import '../../../../../utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../controllers/payments/id_verification_controller.dart';
import '../../../../widgets/button2.dart';
import 'verification_id_screen.dart';

class VerificationScreen extends GetView<IdVerificationController> {
  const VerificationScreen({Key? key}) : super(key: key);

  static const routeName = "verification_screen";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: ScreenUtilInit(
            designSize: Size(
              MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height,
            ),
            builder: (context, widget) => Container(
              margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
              child: Center(
                child: Container(
                  margin: EdgeInsets.all(15.w),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.arrow_back_ios_new),
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            "Verification",
                            style: textTheme.headline1,
                          ),
                        ],
                      ),
                      SizedBox(height: 30.h),
                      Image.asset("assets/images/verification.png"),
                      SizedBox(height: 20.h),
                      const Text(
                        "Click the type of ID will you using?",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 18.h),
                      Obx(() => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            controller.idTypes[0],
                            controller.idTypes[1],
                            controller.idTypes[2],
                          ],
                        ),),
                      SizedBox(height: 28.h),
                      const CheckBoxWidget(
                          text: "I don’t have one of these cards."),
                      SizedBox(height: 6.h),
                      SizedBox(
                        height: 68.h,
                        child: const CheckBoxWidget(
                          text:
                              "By using this service, you agree to\nBrebix Inc.’s Terms of service and\nPrivacy Policy",
                        ),
                      ),
                      SizedBox(height: 40.h),
                      Button2(
                        text: "Save And Continue",
                        onPress: () {
                          Navigator.pushNamed(
                              context, VerificationIdScreen.routeName);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

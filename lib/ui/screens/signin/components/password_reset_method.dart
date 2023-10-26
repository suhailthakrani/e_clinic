import '/../controllers/forgot_password_controller.dart';
import '/../utils/colors.dart';
import '/../utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PasswordResetMethodWidget extends GetView<ForgotPasswordScreenController> {
  PasswordResetMethodWidget({
    Key? key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.index,
  }) : super(key: key);

  final String image;
  final String title;
  final String subtitle;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (context, w) => Material(
        borderRadius: BorderRadius.circular(20),
        elevation: 10,
        child: Obx(
          ()=> Container(
            alignment: Alignment.center,
            height: 100.h,
            width: 370.w,
            decoration: BoxDecoration(
              color: index == controller.selectedIndex.value ? kPrimaryColor : Colors.transparent,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
            ),
            
            child: InkWell(
              customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              onTap: () {
                controller.selectMethod(
                  index,
                );
              },
              // splashColor: const Color.fromARGB(248, 157, 162, 197),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: 20),
                   CircleAvatar(
                    radius: 24,
                      child: Image.asset(
                        image,
                        color: Colors.white,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                      title,
                      style: titleStyle,
                    ),
                    Text(subtitle, style: subtitleStyle),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import '../../../../controllers/appointments/appointments_screen_cntroller.dart';
import '../../../../utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentType extends StatelessWidget {
  final String title;
  final int index;
  final AppointmentScreenController controller;
  const AppointmentType({
    Key? key,
    required this.index,
    required this.title,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(
        MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height,
      ),
      builder: (context, w) => InkWell(
        onTap: () {
          // controller.selectAppointmentType(index);
        },
        child: AnimatedOpacity(
          opacity:
              controller.selectedAppointmentType.value == index ? 1.0 : 0.8,
          duration: const Duration(milliseconds: 300),
          child: Container(
            alignment: Alignment.center,
            height: 32.h,
            width: 156.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.w),
              color: controller.selectedAppointmentType.value == index
                  ? kPrimaryColor
                  : Colors.white,
            ),
            child: Text(
              title,
              style: TextStyle(
                color: controller.selectedAppointmentType.value == index
                    ? Colors.white
                    : Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

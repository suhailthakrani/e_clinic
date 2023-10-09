import 'package:e_clinic/controllers/tabs/appointments/appointments_screen_cntroller.dart';
import 'package:e_clinic/ui/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';



class AppointmentsScreen extends GetView<AppointmentScreenController> {
  const AppointmentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      scaffoldKey: controller.scaffoldKey,
      className: runtimeType.toString(),
      screenName: "Appointment Screen",
      body: SingleChildScrollView(
        child: ScreenUtilInit(
          designSize: Size(
            MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height,
          ),
          builder: (context, w) => Center(
            child:Obx(
              () => Column(
                children: [
                  SizedBox(height: 20.h),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [...controller.appointmentType],
                  // ),
                  // SizedBox(height: 25.h),
                  // if (controller.appointmentType[0].selected)
                  //   ...upComingAppointments
                  // else
                  //   ...previousAppointments
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

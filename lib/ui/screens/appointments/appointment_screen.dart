import '../../../controllers/appointments/appointments_screen_cntroller.dart';
import '../../../ui/screens/appointments/components/appointment_type_widget.dart';

import '../../../ui/widgets/custom_scaffold.dart';
import '../../../utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'appointments_list.dart';

class AppointmentsScreen extends GetView<AppointmentScreenController> {
  const AppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      scaffoldKey: controller.scaffoldKey,
      className: runtimeType.toString(),
      screenName: 'Appointments',
      body: ScreenUtilInit(
        designSize: Size(
          MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height,
        ),
        builder: (context, w) => Center(
          child: Obx(
            () => Column(
              children: [
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < controller.appointmentTypes.length; i++)
                      AppointmentType(
                        title: controller.appointmentTypes[i],
                        index: i,
                        controller: controller,
                      )
                  ],
                ),
                SizedBox(height: 25.h),
                if (controller.selectedAppointmentType.value == 1)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                          width: 150,
                          child: TextButton(
                            style: ElevatedButton.styleFrom(
                                side: BorderSide(color: kBlack45Color)),
                            onPressed: () {},
                            child: Text('Date Filter'),
                          )),
                      SizedBox(width: 20.w),
                    ],
                  ),
                SizedBox(height: 25.h),
                if (controller.selectedAppointmentType.value == 0)
                  ...upComingAppointments
                else
                  ...previousAppointments
              ],
            ),
          ),
        ),
      ),
    );
  }
}

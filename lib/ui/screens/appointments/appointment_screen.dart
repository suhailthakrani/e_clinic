import 'package:e_clinic/ui/screens/appointments/components/appointment_card.dart';
import 'package:e_clinic/ui/screens/appointments/components/appointment_card_new.dart';

import '../../../controllers/appointments/appointments_screen_cntroller.dart';

import '../../../ui/widgets/custom_scaffold.dart';
import '../../../utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class AppointmentsScreen extends GetView<AppointmentScreenController> {
  const AppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("=======================${controller.appointmentsList}");
    return CustomScaffold(
      scaffoldKey: controller.scaffoldKey,
      className: runtimeType.toString(),
      screenName: 'Appointments',
      body: SingleChildScrollView(
        child: Obx(
          ()=> Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    
                    SizedBox(height: 20.h),
                    if(controller.appointmentsList.isEmpty) 
                    Center(child: CircularProgressIndicator(color: kPrimaryColor),)
                    else
                    for(int i = 0; i<controller.appointmentsList.length; i++)
                      AppointmentCardNew(controller.appointmentsList[i])
                     
                  ],
                ),
        ),
            ),
            
      
    );
  }
}


// class AppointmentType extends StatelessWidget {
//   final String title;
//   final int index;
//   final AppointmentScreenController controller;
//   const AppointmentType({
//     Key? key,
//     required this.index,
//     required this.title,
//     required this.controller,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       designSize: Size(
//         MediaQuery.of(context).size.width,
//         MediaQuery.of(context).size.height,
//       ),
//       builder: (context, w) => InkWell(
//         onTap: () {
//           controller.onDrIndexChanged(index);
//         },
//         child: AnimatedOpacity(
//           opacity:
//               controller.selectedAppointmentType.value == index ? 1.0 : 0.8,
//           duration: const Duration(milliseconds: 300),
//           child: Container(
//             alignment: Alignment.center,
//             height: 32.h,
//             width: 156.w,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(16.w),
//               color: controller.selectedAppointmentType.value == index
//                   ? kPrimaryColor
//                   : Colors.white,
//             ),
//             child: Text(
//               title,
//               style: TextStyle(
//                 color: controller.selectedAppointmentType.value == index
//                     ? Colors.white
//                     : Colors.grey,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


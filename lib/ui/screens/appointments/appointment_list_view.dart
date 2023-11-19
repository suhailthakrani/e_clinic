import 'package:e_clinic/ui/screens/appointments/components/appointment_card.dart';
import 'package:e_clinic/ui/screens/appointments/components/appointment_card_new.dart';

import '../../../controllers/appointments/appointments_screen_cntroller.dart';

import '../../../ui/widgets/custom_scaffold.dart';
import '../../../utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class AppointmentsListView extends GetView<AppointmentScreenController> {
  const AppointmentsListView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AppointmentScreenController());

    print("=======================${controller.appointmentsList}");
    return Scaffold(
     appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: kWhiteColor,
        foregroundColor: kBlackColor,
        title: Text(
          'Appointments',
          style: TextStyle(fontSize: 24.w, fontWeight: FontWeight.bold),
        ),
      ),
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


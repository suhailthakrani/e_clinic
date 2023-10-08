import '/../models/appointment_model.dart';
import '/../models/doctor_model.dart';
import '/../models/patient_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../services/appointment_service.dart';
import '../utils/app_enum.dart';
import '../utils/text_field_manager.dart';
import '../utils/text_filter.dart';

class MainScreenController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  RxList<Appointment> appointmentsRequests = <Appointment>[].obs;
  RxList<Appointment> appointmentsCompleted = <Appointment>[].obs;
  
     @override
  Future<void> onInit() async {
    // appointmentsRequests.value =
    //     await AppointmentService().getRequestedAppointmentsList();
    // appointmentsCompleted.value =
    //     await AppointmentService().getCompletedAppointmentsList();
    super.onInit();
  }

    String convertDateFormat(String inputDate) {
    DateTime dateTime = DateTime.parse(inputDate);
    String formattedDate = DateFormat('d MMMM y').format(dateTime);
    return formattedDate;
  }

  String convertToAMPM(String timeString) {
    DateTime dateTime = DateFormat('HH:mm').parse(timeString);
    String formattedTime = DateFormat('h:mm a').format(dateTime);
    return formattedTime;
  }
  
}

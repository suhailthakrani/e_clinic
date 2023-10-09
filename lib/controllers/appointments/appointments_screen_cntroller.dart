import '../../models/appointment_type.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentsController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  List<String> appointmentTypes = [
    'Upcoming',
    'Previous',
  ];
  RxInt selectedAppointmentType = 0.obs;

  void selectAppointmentType(int index) {
    selectedAppointmentType.value = index;
  }
}

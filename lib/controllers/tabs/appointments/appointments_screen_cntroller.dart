import 'package:awesome_dialog/awesome_dialog.dart';
import '/../models/appointment_model.dart';
import '/../models/appointment_type.dart';
import '/../services/appointment_service.dart';
import '/../ui/widgets/custom_dialogs.dart';
import '/../utils/common_code.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../ui/widgets/custom_progress_dialog.dart';
import '../../../utils/date_time_manager.dart';

class AppointmentScreenController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  RxList<Appointment> appointmentsRequests = <Appointment>[].obs;
  RxList<Appointment> appointmentsCompleted = <Appointment>[].obs;
  DateTimeManager sortingDate = DateTimeManager("Date of Birth");

  List<String> appointmentTypes = [
    'Upcoming',
    'Previous',
  ];
  RxInt selectedAppointmentType = 0.obs;

  @override
  Future<void> onInit() async {
   
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

  Future<void> selectAppointmentType(int index) async {
    selectedAppointmentType.value = index;
    if (appointmentTypes.isEmpty) {
      appointmentsRequests.value =
          await AppointmentService().getRequestedAppointmentsList();
    }
    if (index == 1 && appointmentsCompleted.isEmpty) {
      appointmentsCompleted.value =
          await AppointmentService().getCompletedAppointmentsList();
    }
  }

  Future<void> acceptAppointment(String appointmentId) async {
    String response =
        await AppointmentService().acceptAppointment(appId: appointmentId);
    if (response == "Success") {
      CommonCode().showSuccessToast(
        message: "The Appointment has been Accepted!",
      );
    } else {
      CommonCode().showToast(
        message: "Unable to Accept an Appointment!",
      );
    }
  }

  Future<void> rejectAppointment(String appointmentId) async {
    CustomDialogs().showAwesomeConfirmationDialog(
      "Are you sure you want to cancel appointment?",
      onOkBtnPressed: () async {
        String response =
            await AppointmentService().acceptAppointment(appId: appointmentId);
        if (response == "Success") {
          CommonCode().showToast(
            message: "The Appointment has been Rejected!",
          );
        } else {
          CommonCode().showToast(
            message: "Unable to Reject an Appointment!",
          );
        }
      },
    );
  }
}

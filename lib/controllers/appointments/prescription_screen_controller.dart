import 'dart:convert';
import 'dart:developer';

import '/../models/appointment_model.dart';
import '/../services/appointment_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/text_field_manager.dart';
import '../../utils/text_filter.dart';

class PrescriptionScreenController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final RxInt selectedScreenIndex = 0.obs;

  TextFieldManager appointIdController =
      TextFieldManager('Appointment ID', length: 50, filter: TextFilter.none);

  TextFieldManager patientNameController =
      TextFieldManager('Patient Name', length: 50, filter: TextFilter.none);
  // TextFieldManager patientNumberController =
  //     TextFieldManager('Phone Number', length: 50, filter: TextFilter.number);
  // TextFieldManager ageController =
  //     TextFieldManager('Age', length: 2, filter: TextFilter.number);
  // TextFieldManager gederController =
  //     TextFieldManager('Gender', length: 2, filter: TextFilter.name);
  TextFieldManager chargesController =
      TextFieldManager('Charges', length: 4, filter: TextFilter.name);
  TextFieldManager typeController =
      TextFieldManager('Charges', length: 4, filter: TextFilter.name);
  TextFieldManager appointmntTimeController =
      TextFieldManager('Appointment Time', length: 2, filter: TextFilter.name);
  TextFieldManager appointmnDateController =
      TextFieldManager('Appointment Date', length: 2, filter: TextFilter.name);
  RxString imageUrl = ''.obs;

  TextFieldManager medicalHistoryController =
      TextFieldManager('Medical Details', length: 50, filter: TextFilter.none);

  TextFieldManager descriptionController =
      TextFieldManager('Description', length: 50, filter: TextFilter.none);

  TextFieldManager diagnosis1Controller =
      TextFieldManager('Diagnosis 1', length: 50, filter: TextFilter.none);
  TextFieldManager diagnosis2Controller =
      TextFieldManager('Diagnosis 2', length: 50, filter: TextFilter.none);
  TextFieldManager diagnosis3Controller =
      TextFieldManager('Diagnosis 3', length: 50, filter: TextFilter.none);
  TextFieldManager diagnosis4Controller =
      TextFieldManager('Diagnosis 4', length: 50, filter: TextFilter.none);

  @override
  void onInit() {
    Map<String, String?> params = Get.parameters ?? {};
    log('Received parameters: $params');
    if (params != null) {
      appointIdController.controller.text = params["id"] ?? '';
      patientNameController.controller.text = params["patient_name"] ?? '';
      appointmnDateController.controller.text = params["date"] ?? '';
      appointmntTimeController.controller.text = params["time"] ?? '';
      typeController.controller.text = params["type"] ?? '';
      chargesController.controller.text = '${params["charges"] ?? 0}';
      descriptionController.controller.text = params["message"] ?? '';
      imageUrl.value = params["image"] ?? '';
    }
    super.onInit();
  }

  // bool validate() {
  //   bool valid = true;
  //   return valid &
  //       diagnosis1Controller.validate() &
  //       diagnosis2Controller.validate() &
  //       diagnosis3Controller.validate() &
  //       diagnosis4Controller.validate() &
  //       descriptionController.validate();
  // }

  // Future<void> addPrescription() async {
  //   if(validate()) {
  //     // await AppointmentService().prescribeAppointmentRequestByID(appointmentId: );
  //   }
  // }
}

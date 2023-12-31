import 'dart:developer';

import 'package:e_clinic/services/doctors_service.dart';
import 'package:e_clinic/utils/text_field_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/doctor_model.dart';

class DoctorDetailsScreenController extends GetxController {

  Rx<Doctor> doctor = Rx(Doctor.empty());
  RxString image = 'assets/images/doctor.png'.obs;

  
  

  @override
  Future<void> onInit() async {
    Map<String, dynamic> arguments = Get.arguments??{};
    if(arguments.isNotEmpty) {
      doctor.value = arguments['dotor'] ?? Doctor.empty();
      image.value = arguments['image'] ?? '';
    }
    // doctorsList.refresh();
    super.onInit();
  }
 


}


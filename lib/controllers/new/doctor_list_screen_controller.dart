import 'dart:developer';

import 'package:e_clinic/services/doctors_service.dart';
import 'package:e_clinic/utils/text_field_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/doctor_model.dart';

class DoctorListScreenController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();


  RxList<Doctor> doctors = <Doctor>[].obs;
  
TextFieldManager searchController = TextFieldManager("");
  

  @override
  Future<void> onInit() async {
     Map<String, dynamic> arguments = Get.arguments??{};
    if(arguments.isNotEmpty) {
      String category = arguments['category'] ?? 'Oncology';
      doctors.value = await DoctorsService().getDoctorsListByCategory(specialization: category);
    }

    

    doctors.value = await DoctorsService().getDoctorsList();
    super.onInit();
  }
 


}

import 'dart:developer';

import 'package:e_clinic/controllers/a_new/doctor_list_controller.dart';
import 'package:e_clinic/services/doctors_service.dart';
import 'package:e_clinic/utils/text_field_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/doctor_model.dart';

class MainScreenController extends GetxController {

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  RxList<Doctor> doctorsList = <Doctor>[].obs;

  TextFieldManager searchController = TextFieldManager("");


  @override
  Future<void> onInit() async {
    doctorsList = await DoctorsService().getDoctorsList();
    log("-------------${doctorsList.map((element) => element.firstName).toList()}");
    doctorsList.refresh();
    super.onInit();
  }

  
  final RxInt selectedScreenIndex = 0.obs;

  void selectScreen(int index) {
    selectedScreenIndex.value = index;
    Get.back(); // Close the drawer after selecting a screen
  }
}

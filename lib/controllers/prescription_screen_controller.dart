import 'package:e_clinic/models/general_models.dart';
import 'package:e_clinic/services/appointment_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrescriptionScreenController extends GetxController {

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  RxList<Prescription> prescriptionList = RxList([]);

  
  final RxInt selectedScreenIndex = 0.obs;


  @override
  Future<void> onInit() async {
    prescriptionList.value = await AppointmentService().getPrescriptionModelsList();
    super.onInit();
  }
  
  


  void selectScreen(int index) {
    selectedScreenIndex.value = index;
    Get.back(); // Close the drawer after selecting a screen
  }
  
  
}
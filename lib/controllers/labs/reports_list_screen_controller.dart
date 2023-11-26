import 'package:e_clinic/models/general_models.dart';
import 'package:e_clinic/models/lab_model.dart';
import 'package:e_clinic/models/lab_test_model.dart';
import 'package:e_clinic/models/new_lab_model.dart';
import 'package:e_clinic/models/report_model.dart';
import 'package:e_clinic/services/appointment_service.dart';
import 'package:e_clinic/services/lab_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReportsListScreenController extends GetxController {

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  RxList<Report> labList = RxList([]);

  
  final RxInt selectedScreenIndex = 0.obs;


  @override
  Future<void> onInit() async {
    labList.value = await LabService().getReportsList();
    super.onInit();
  }
  
  


  void selectScreen(int index) {
    selectedScreenIndex.value = index;
    Get.back(); // Close the drawer after selecting a screen
  }
  
  
}
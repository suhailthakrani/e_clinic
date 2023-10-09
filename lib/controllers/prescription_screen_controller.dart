import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrescriptionScreenController extends GetxController {

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  
  final RxInt selectedScreenIndex = 0.obs;

  void selectScreen(int index) {
    selectedScreenIndex.value = index;
    Get.back(); // Close the drawer after selecting a screen
  }
}
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

  RxList<CategoryModel> doctorsCategories = [
    CategoryModel(dept: 'Dermatology', image: "assets/images/dermatology.png", noOfDr: '12'),
    CategoryModel(dept: 'Surgery', image: "assets/images/surgery.png", noOfDr: '8'),
    CategoryModel(dept: 'Ophthalmology', image: "assets/images/ophthalmology.png", noOfDr: '10'),
    CategoryModel(dept: 'Orthopedics', image: "assets/images/orthopedics.png", noOfDr: '7'),
    CategoryModel(dept: 'Cardiology', image: "assets/images/cardiology.png", noOfDr: '15'),
    CategoryModel(dept: 'Radiology', image: "assets/images/radiology.png", noOfDr: '9'),
    CategoryModel(dept: 'Gastroenterology', image: "assets/images/gastroenterology.png", noOfDr: '11'),
    CategoryModel(dept: 'Urology', image: "assets/images/urology.png", noOfDr: '6'),
    CategoryModel(dept: 'Anesthesiology', image: "assets/images/anesthesiology.png", noOfDr: '8'),
    CategoryModel(dept: 'Oncology', image: "assets/images/oncology.png", noOfDr: '13'),
  ].obs;

  TextFieldManager searchController = TextFieldManager("");

  @override
  Future<void> onInit() async {
    doctorsList.value = await DoctorsService().getDoctorsList();
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
class CategoryModel {
  String dept;
  String image;
  String noOfDr;

  CategoryModel({
    required this.dept,
    required this.image,
    required this.noOfDr,
  });
}


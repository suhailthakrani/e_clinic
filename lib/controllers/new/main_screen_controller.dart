import 'dart:developer';

import 'package:e_clinic/services/doctors_service.dart';
import 'package:e_clinic/utils/text_field_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/doctor_model.dart';

class MainScreenController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  RxInt selectedDrIndex = RxInt(-1);
  RxString category = ''.obs;

  RxList<Doctor> doctorsList = <Doctor>[].obs;
  RxList<Doctor> categorywiseDOctors = RxList([]); 

  // RxList<CategoryModel> doctorsCategories = [
  //   CategoryModel(dept: 'Psychiatry', image: "assets\images\Psychiatry.png", noOfDr: '12'),
  //   CategoryModel(dept: 'Oncology', image: "assets/images/oncology.png", noOfDr: '13'),
  //   CategoryModel(dept: 'Gastroenterology', image: "assets/images/gastroenterology.png", noOfDr: '11'),
  //   CategoryModel(dept: 'Hematology', image: "assets/images/Hematology.png", noOfDr: '11'),
  //   CategoryModel(dept: 'Cardiology', image: "assets/images/Cardiology.png", noOfDr: '15'),
  //   CategoryModel(dept: 'Pediatrics', image: "assets/images/Pediatrics.png", noOfDr: '15'),
  //   CategoryModel(dept: 'Neurology', image: "assets/images/Neurology.png", noOfDr: '15'),
  //   CategoryModel(dept: 'Endocrinology', image: "assets/images/Endocrinology.png", noOfDr: '15'),
  //   CategoryModel(dept: 'Dermatology', image: "assets/images/dermatology.png", noOfDr: '12'),
  //   CategoryModel(dept: 'Urology', image: "assets/images/urology.png", noOfDr: '6'),
  //   CategoryModel(dept: 'Cardo', image: "assets/images/surgery.png", noOfDr: '8'),
  //   // CategoryModel(dept: 'Ophthalmology', image: "assets/images/ophthalmology.png", noOfDr: '10'),
  //   // CategoryModel(dept: 'Orthopedics', image: "assets/images/orthopedics.png", noOfDr: '7'),

  //   // CategoryModel(dept: 'Radiology', image: "assets/images/radiology.png", noOfDr: '9'),

  //   // CategoryModel(dept: 'Anesthesiology', image: "assets/images/anesthesiology.png", noOfDr: '8'),

  //   // CategoryModel(dept: 'Oncology', image: "assets/images/oncology.png", noOfDr: '13'),
  // ].obs;

  List<String> imagesList = [
    "assets/images/Psychiatry.png",
    "assets/images/oncology.png",
    "assets/images/gastroenterology.png",
    "assets/images/Hematology.png",
    "assets/images/cardiology.png",
    "assets/images/Pediatrics.png",
    "assets/images/Neurology.png",
    "assets/images/Endocrinology.png",
    "assets/images/dermatology.png",
    "assets/images/urology.png",
    "assets/images/surgery.png",
    // Add more image paths as needed
  ];

  RxList<String> categoriesList = RxList([]);

  RxList<String> categoriesImagesList =
      RxList([]);

  TextFieldManager searchController = TextFieldManager("");

  @override
  Future<void> onInit() async {
    categoriesList.value = await DoctorsService().getSpecializationList();
    for (int i = 0; i < categoriesList.length; i++) {
      String image = imagesList[i % imagesList.length];
      categoriesImagesList.add(image);
    }
    categoriesList.add('Dermatology');
    categoriesImagesList.add("assets/images/dermatology.png");

    doctorsList.value = await DoctorsService().getDoctorsList();
    doctorsList.add(
      Doctor(
        id: 'id',
        specialization: "Test",
        hospitalClinicName: "hospitalClinicName",
        verification: "verification",
        about: "about",
        locationId: "locationId",
        userId: "userId",
        appointmentTypesAllowed: ["Physical"],
        firstName: "firstName",
        lastName: "lastName",
        image: "assets/images/doctor.png",
        address: "address",
        city: "city",
        state: "state",
        workingHours: WorkingHours(startTime: 'startTime', endTime: 'endTime'),
        charges: Charges(physical: 'physical', virtual: 'virtual'),
        reviewsCount: 'reviewsCount',
        rating: '3.2',
      ),
    );
    // doctorsList.refresh();
    super.onInit();
  }
 
  final RxInt selectedScreenIndex = 0.obs;

  void selectScreen(int index) {
    selectedScreenIndex.value = index;
    Get.back();
  }

  void onDrIndexChanged(int index) {
    selectedDrIndex.value = index;
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

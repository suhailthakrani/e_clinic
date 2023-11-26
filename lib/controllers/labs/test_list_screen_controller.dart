import 'dart:io';

import 'package:e_clinic/models/general_models.dart';
import 'package:e_clinic/models/lab_test_model.dart';
import 'package:e_clinic/models/new_lab_model.dart';
import 'package:e_clinic/services/appointment_service.dart';
import 'package:e_clinic/services/lab_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class TestListScreenController extends GetxController {

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  RxList<NewLabModel> testList = RxList([]);

  
  final RxInt selectedScreenIndex = 0.obs;


  @override
  Future<void> onInit() async {
    testList.value = await LabService().getTestList();
    super.onInit();
  }
  

  
  Future<File?> pickImage(ImageSource source, BuildContext context) async {
    XFile? pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
        return File(pickedFile.path);
    }
  }

  Future<void> showImagePickerDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Choose an option'),
          actions: <Widget>[
            TextButton(
              onPressed: () => pickImage(ImageSource.gallery, context),
              child: Text('Pick from Gallery'),
            ),
            TextButton(
              onPressed: () => pickImage(ImageSource.camera,context),
              child: Text('Take a Photo'),
            ),
          ],
        );
      },
    );
  }


  


  void selectScreen(int index) {
    selectedScreenIndex.value = index;
    Get.back(); // Close the drawer after selecting a screen
  }
  
  
}
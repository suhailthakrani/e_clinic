import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_clinic/models/lab_test_model.dart';
import 'package:e_clinic/services/lab_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../models/appointment_model.dart';
import '../../models/doctor_model.dart';
import '../../models/response_model.dart';
import '../../models/user_model.dart';
import '../../services/appointment_service.dart';
import '../../services/user_service.dart';
import '../../ui/widgets/custom_dialogs.dart';
import '../../ui/widgets/custom_progress_dialog.dart';
import '../../utils/constants.dart';
import '../../utils/dropdown_controller.dart';
import '../../utils/text_field_manager.dart';
import '../../utils/text_filter.dart';
import '../../utils/user_session.dart';

/// Created by Suhail Thakrani 23-Sep-2023
class BookLabAppointmentScreenController extends GetxController {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  Rx<String> labId = Rx('');

  RxList<String> halfHourSlots = List.generate(32, (index) {
    int hour = (index + 16) ~/ 2; // Start from 8 AM (16 slots ahead)
    int minute = (index % 2) * 30;
    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
  }).obs;

  RxString degreeDocument = ''.obs;

  RxString selectedTime = ''.obs;
  Rx<DateTime?> selectedDate = DateTime.now().obs;

  DropdownController selectTestDDontroller = DropdownController(
      title: 'Select Test Type',
      items: RxList([
        'SELECT',
        'Blood Test',
        'Urine Test',
      ]));

  //     TextFieldManager firstNameController = TextFieldManager(
  //   'Patient Name',
  //   length: 50,
  //   filter: TextFilter.name,
  // );
  TextFieldManager descriptionController = TextFieldManager(
    'Description',
    length: 50,
    filter: TextFilter.name,
  );

  @override
  void onInit() {
    Map<String, dynamic> args = Get.arguments ?? {};
    if (args != null && args.isNotEmpty) {
      labId.value = Get.arguments['labId'] ?? '';
    }
    super.onInit();
  }

  Future<void> boolTest() async {
    ProgressDialog pd = ProgressDialog()..showDialog();
    String result = await LabService().bookTest(
      test: selectTestDDontroller.selectedItem.value,
      labId: labId.value,
      description: descriptionController.text,
    );

    pd.dismissDialog();
    if (result == 'Success') {
      CustomDialogs().showDialog("Success",
          "The test has been Submitted successfully", DialogType.success, onOkBtnPressed: (){
            Get.offAllNamed(kTestListViewScreenRoute);
          });
    } else {
      pd.dismissDialog();
      CustomDialogs().showDialog("Alert", result, DialogType.error);
    }
  }

  Future<void> pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      degreeDocument.value = image.path;
    } else {
      print('---------------------- [Unable to Pick Image!]');
    }
  }

  void onSelectionChanged(DateRangePickerSelectionChangedArgs dateRangePickerSelectionChangedArgs) {
    selectedDate.value = dateRangePickerSelectionChangedArgs.value;
    log("-------------------${dateRangePickerSelectionChangedArgs.value}");
  }
}

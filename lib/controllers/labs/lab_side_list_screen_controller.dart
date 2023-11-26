import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_clinic/models/general_models.dart';
import 'package:e_clinic/models/lab_test_model.dart';
import 'package:e_clinic/models/new_lab_model.dart';
import 'package:e_clinic/services/appointment_service.dart';
import 'package:e_clinic/services/lab_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../ui/widgets/custom_dialogs.dart';
import '../../ui/widgets/custom_progress_dialog.dart';

class LabSideTestListScreenController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  RxList<NewLabModel> testList = RxList([]);

  RxList<String> testUploadReportUrlList = RxList([]);

  Future<void> pickImage(int index) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      testUploadReportUrlList[index] = image.path;
      if (testUploadReportUrlList[index].isNotEmpty) {
        testUploadReportUrlList.refresh();
      }
    } else {
      print('---------------------- [Unable to Pick Image!]');
    }
    testList.refresh();
  }

  final RxInt selectedScreenIndex = 0.obs;

  @override
  Future<void> onInit() async {
    testList.value = await LabService().getLabTestListForLab();
    for (var i = 0; i < testList.length; i++) {
      testUploadReportUrlList.add('');
    }
    super.onInit();
  }

  Future<void> uploadReport(String testId, int index) async {
    // ProgressDialog pd = ProgressDialog()..showDialog();
    // String result = await LabService()
    //     .uploadReport(testId: testId, url: testUploadReportUrlList[index]);
    // pd.dismissDialog();
    String result = 'Success';
    if (result == 'Success') {
      CustomDialogs().showDialog("Success",
          "You have successfully submitted report", DialogType.success);
    } else {
      // pd.dismissDialog();
      CustomDialogs().showDialog("Alert", result, DialogType.error);
    }
  }

  @override
  void onClose() {
    testUploadReportUrlList.clear();
    super.onClose();
  }

  void selectScreen(int index) {
    selectedScreenIndex.value = index;
    Get.back(); // Close the drawer after selecting a screen
  }
}

import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_clinic/models/lab_model.dart';
import 'package:e_clinic/utils/dropdown_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/common_code.dart';
import '../../utils/date_time_manager.dart';
import '../../utils/text_field_manager.dart';
import '../../utils/text_filter.dart';

import '../../models/user_model.dart';
import '../../services/user_service.dart';
import '../../ui/widgets/custom_dialogs.dart';
import '../../ui/widgets/custom_progress_dialog.dart';
import '../../utils/constants.dart';
import '../../utils/text_field_manager.dart';
import '../../utils/text_filter.dart';
import '../../utils/user_session.dart';


/// Created by Suhail Thakrani 23-Sep-2023
class LabRegisterScreenController extends GetxController {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  TextFieldManager nameController =  TextFieldManager('Lab Name', length: 100, filter: TextFilter.none);
  TextFieldManager addressController = TextFieldManager('Address', length: 100, filter: TextFilter.none);
  TextFieldManager cityController = TextFieldManager('City', length: 50, filter: TextFilter.name);
  TextFieldManager stateController = TextFieldManager('State', length: 50, filter: TextFilter.name);
    TextFieldManager emailController = TextFieldManager('Email', length: 50, filter: TextFilter.email);
  TextFieldManager passwordController =  TextFieldManager('Password', length: 50, filter: TextFilter.none);


  Rx<String> selectedExperience = ''.obs;

  RxString degreeDocument = ''.obs;

  RxBool obscureText = true.obs;


  void onObscureText() {
    if (obscureText.value) {
      obscureText.value = false;
    } else {
      obscureText.value = true;
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

  bool validateAllData() {

    bool valid = true;
    return valid &
        nameController.validate() &
        addressController.validate() &
        cityController.validate()&
        stateController.validate() &
        emailController.validate() &
        passwordController.validate()
        ;
  }

  void onRegisterClicked() async {
    if (!validateAllData()) {
      CommonCode().showToast(message: 'Please Enter Valid Data!');
    } else {
      LabModel labModel = LabModel(
        email:emailController.text , 
        name: nameController.text, 
        address: addressController.text, 
        city: cityController.text, 
        state: stateController.text, 
        password: passwordController.text
        )
      ;
     
      print('-------------------- ${labModel.toJson()}');
      ProgressDialog pd = ProgressDialog()..showDialog();
      await UserService().registerLab(labModel: labModel);
      pd.dismissDialog();
      if (labModel.responseMessage == 'Success') {
        CustomDialogs()
            .showDialog("Success", "You have been registered successfully", DialogType.success);
        Get.offAllNamed(kLabLoginScreenRoute);
      } else {
        pd.dismissDialog();
        CustomDialogs()
            .showDialog("Alert", labModel.responseMessage, DialogType.error);
      }
    }
  }
  
}

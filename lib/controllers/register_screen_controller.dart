import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_clinic/utils/dropdown_controller.dart';
import '../utils/common_code.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../models/user_model.dart';
import '../services/user_service.dart';
import '../ui/widgets/custom_dialogs.dart';
import '../ui/widgets/custom_progress_dialog.dart';
import '../utils/constants.dart';
import '../utils/date_time_manager.dart';
import '../utils/text_field_manager.dart';
import '../utils/text_filter.dart';
import '../utils/user_session.dart';

/// Created by Suhail Thakrani 23-Sep-2023
class RegisterScreenController extends GetxController {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  TextFieldManager firstNameController =
      TextFieldManager('First Name', length: 50, filter: TextFilter.name);
  TextFieldManager lastNameController =
      TextFieldManager('Last Name', length: 50, filter: TextFilter.name);
  TextFieldManager emailController =
      TextFieldManager('Email', length: 50, filter: TextFilter.email);
  TextFieldManager passwordController =
      TextFieldManager('Password', length: 50, filter: TextFilter.none);
  Rx<String> selectedGeder = 'SELECT'.obs;
  DropdownController genderDDontroller = DropdownController(title: 'Gender', items: RxList([
    'SELECT',
    'MALE',
    'FEMALE',
  ]));

 DateTimeManager dateOfBirthController = DateTimeManager("Date of Birth",
      firstDate: DateTime(DateTime.now().year - 80),
      lastDate: DateTime(
          DateTime.now().year - 18, DateTime.now().month, DateTime.now().day));
           

  Rx<String> selectedExperience = ''.obs;

  List<String> experienceList = [
    'SELECT',
    '6 Months'
        '1 Year',
    '2 Years',
    '3 Years',
    '4 Years',
    '5 Years',
    '6 Years',
    'Or More'
  ];

  TextFieldManager phoneNoController =
      TextFieldManager('Phone Number', length: 50, filter: TextFilter.number);
  TextFieldManager specializationController =
      TextFieldManager('Specialization', length: 50, filter: TextFilter.none);
  TextFieldManager hospitalController = TextFieldManager(
      'Hospital/ Clinic Name',
      length: 50,
      filter: TextFilter.none);
  // TextFieldManager cnicController =
  //     TextFieldManager('CNIC', length: 50, filter: TextFilter.cnic);
  TextFieldManager addressController =
      TextFieldManager('State', length: 50, filter: TextFilter.alphaNumeric);
  TextFieldManager cityController =
      TextFieldManager('City', length: 50, filter: TextFilter.none);
  TextFieldManager stateController =
      TextFieldManager('Address', length: 50, filter: TextFilter.none);

  RxString degreeDocument = ''.obs;

  RxBool obscureText = true.obs;

  @override
  void onInit() {
    selectedExperience.value = experienceList.first;
    super.onInit();
  }

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
        firstNameController.validate() &
        lastNameController.validate() &
        genderDDontroller.validate()&
        emailController.validate() &
        passwordController.validate() &
        phoneNoController.validate() &
        (selectedExperience.value.isNotEmpty &&
            selectedExperience.value != experienceList.first) &
        specializationController.validate();
  }

  void onRegisterClicked() async {
    if (!validateAllData()) {
      CommonCode().showToast(message: 'Please Enter Valid Data!');
    } else {
      UserModel userModel = UserModel(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        cnic: '',
        email: emailController.text,
        gender: selectedGeder.value,
        specialization: specializationController.text,
        degreeDocument: degreeDocument.value,
        hospitalClinicName: hospitalController.text,
        city: cityController.text,
        state: stateController.text,
        address: addressController.text,
        password: passwordController.text,
      );
      print('-------------------- ${userModel.toJson()}');
      ProgressDialog pd = ProgressDialog()..showDialog();
      await UserService().registerUser(userModel: userModel);
      pd.dismissDialog();
      if (userModel.responseMessage == 'Success') {
        await UserSession().createSession(user: userModel);
        Get.offAllNamed(kMainScreenRoute);
      } else {
        pd.dismissDialog();
        CustomDialogs()
            .showDialog("Alert", userModel.responseMessage, DialogType.error);
      }
    }
  }
}

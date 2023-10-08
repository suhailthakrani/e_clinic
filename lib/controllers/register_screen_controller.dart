import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import '../utils/date_time_manager.dart';
import '/../models/general_models.dart';
import '/../utils/common_code.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../models/user_model.dart';
import '../services/user_service.dart';
import '../ui/widgets/custom_dialogs.dart';
import '../ui/widgets/custom_progress_dialog.dart';
import '../utils/constants.dart';
import '../utils/dropdown_controller.dart';
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

  DropdownController genderDDController = DropdownController(
    title: "Gender",
    items: ["MALE", "FEMALE"].obs,
  );

  TextFieldManager phoneNoController =
      TextFieldManager('Phone Number', length: 50, filter: TextFilter.number);
  DateTimeManager dateOfBirthController = DateTimeManager("Date of Birth",
      firstDate: DateTime(DateTime.now().year - 80),
      lastDate: DateTime(
          DateTime.now().year - 18, DateTime.now().month, DateTime.now().day));
  TextFieldManager hospitalController = TextFieldManager(
      'Hospital/ Clinic Name',
      length: 50,
      filter: TextFilter.none);
  TextFieldManager cnicController =
      TextFieldManager('CNIC', length: 50, filter: TextFilter.cnic);
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
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

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
        genderDDController.validate() &
        emailController.validate() &
        passwordController.validate() &
        phoneNoController.validate() &
        hospitalController.validate() &
        cityController.validate() &
        addressController.validate() &
        stateController.validate() &
        cnicController.validate();
  }

  void onRegisterClicked() async {
    if (!validateAllData()) {
      CommonCode().showToast(message: 'Please Enter Valid Data!');
    } else {
      UserModel userModel = UserModel(
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          cnic: cnicController.text,
          email: emailController.text,
          gender: genderDDController.selectedItem.value,
          specialization: ''/*/dateOfBirthController.validateDate()*/,
          degreeDocument: degreeDocument.value,
          hospitalClinicName: hospitalController.text,
          city: cityController.text,
          state: stateController.text,
          address: addressController.text,
          password: passwordController.text,
          experience: '');
      ProgressDialog pd = ProgressDialog()..showDialog();
      await UserService().registerUser(userModel: userModel);
      pd.dismissDialog();
      if (userModel.responseMessage == 'Success') {
        // await UserSession().createSession(user: userModel);
        CustomDialogs().showDialog("Success",
            "You have been registered successfully!", DialogType.success);
        Get.offAllNamed(kLoginScreenRoute);
      } else {
        pd.dismissDialog();
        CustomDialogs()
            .showDialog("Alert", userModel.responseMessage, DialogType.error);
      }
    }
  }
}

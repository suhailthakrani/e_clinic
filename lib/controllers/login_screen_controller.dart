import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/user_model.dart';
import '../services/user_service.dart';
import '../ui/widgets/custom_dialogs.dart';
import '../ui/widgets/custom_progress_dialog.dart';
import '../utils/constants.dart';
import '../utils/text_field_manager.dart';
import '../utils/text_filter.dart';
import '../utils/user_session.dart';

/// Created by Suhail Thakrani 23-Sep-2023
class LoginScreenController extends GetxController {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  TextFieldManager usernameManager =
      TextFieldManager('Username', length: 50, filter: TextFilter.email);
  TextFieldManager passwordManager =
      TextFieldManager('Password', length: 50, filter: TextFilter.none);

  RxBool obscureText = true.obs;

  void removeFocus() {
    if (usernameManager.focusNode.hasFocus) {
      usernameManager.focusNode.unfocus();
    }
    if (passwordManager.focusNode.hasFocus) {
      passwordManager.focusNode.unfocus();
    }
  }

  void onObscureText() {
    if (obscureText.value) {
      obscureText.value = false;
    } else {
      obscureText.value = true;
    }
  }

  void onLoginClick() async {
    if (usernameManager.validate() & passwordManager.validate()) {
      ProgressDialog pd = ProgressDialog()..showDialog();
      UserModel userModel = await UserService().loginUser(
          username: usernameManager.text, password: passwordManager.text);
      pd.dismissDialog();
      if (userModel.responseMessage == 'Login successful' ||
          userModel.responseMessage == 'Success') {
        await UserSession().createSession(user: userModel);
        Get.offAllNamed(kMainScreenRoute);
      } else {
        pd.dismissDialog();
        log(userModel.responseMessage.toString());
        CustomDialogs()
            .showDialog("Alert", userModel.responseMessage, DialogType.error);
      }
    }
  }
}

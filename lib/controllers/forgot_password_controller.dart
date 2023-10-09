import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ui/screens/forgot_password/components/password_reset_method.dart';

/// Created by Suhail Thakrani 23-Sep-2023
class ForgotPasswordScreenController extends GetxController {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  RxInt selectedIndex = 0.obs;
  List<PasswordResetMethod> passwordResetMethods = [
    PasswordResetMethod(
      image: "assets/images/msg-icon.png",
      title: "Via SMS",
      subtitle: "+11 11*****11",
      selected: false,
    ),
    PasswordResetMethod(
      image: "assets/images/mail-icon.png",
      title: "Via Email",
      subtitle: "abc@gmail.com",
      selected: false,
    ),
  ];

  void selectMethod(int index) {
    for (var element in passwordResetMethods) {
      element.selected = false;
    }
    passwordResetMethods[index].selected = true;
  }

  bool checkIfAllSelected() {
    for (var element in passwordResetMethods) {
      if (element.selected == true) {
        return true;
      }
    }
    return false;
  }
}
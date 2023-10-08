import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/date_time_manager.dart';
import '../utils/dropdown_controller.dart';
import '../utils/text_field_manager.dart';
import '../utils/text_filter.dart';

/// Created by Suhail Thakrani 23-Sep-2023
class ForgotPasswordScreenController extends GetxController {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  RxInt selectedIndex = 0.obs;
  // List<PasswordResetMethodWidget> passwordResetMethods = [
  //   PasswordResetMethodWidget(
  //     image: "assets/images/msg-icon.png",
  //     title: "Via SMS",
  //     subtitle: "+11 11*****11",
  //     index: 0,
  //   ),
  //   PasswordResetMethodWidget(
  //     image: "assets/images/mail-icon.png",
  //     title: "Via Email",
  //     subtitle: "abc@gmail.com",
  //     index: 1,
  //   ),
  // ];

  void selectMethod(int index) {
    selectedIndex.value = index;
    notifyChildrens();
  }

}


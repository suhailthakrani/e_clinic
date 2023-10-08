import '/../ui/widgets/custom_dialogs.dart';
import '/../utils/constants.dart';
import '/../utils/user_session.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> logOut() async {
    CustomDialogs().showAwesomeConfirmationDialog(
      "Are you sure you want to Logout?",
      onOkBtnPressed: () async {
        bool isLogout = await UserSession().logout();
        if (isLogout) {
          await Get.toNamed(kLoginScreenRoute);
        }
      },
    );
  }
}

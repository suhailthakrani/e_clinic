import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/constants.dart';
import '../utils/user_session.dart';

class SplashScreenController extends GetxController {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  late Timer _timer;

  @override
  void onInit() {
    _timer = Timer(const Duration(seconds: 5), () {
      _screenNavigation();
    });
    super.onInit();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _screenNavigation() async {
    Get.offAllNamed(kTestScreenRoute);
    // Get.offAllNamed(kLabTestListScreenRoute);
    // Get.offAllNamed(kLabSideTestListScreenRoute);
    
    // Get.offAllNamed(kBookLabAppointmentScreenRoute);
  }

  void onScreenTap() {
    _timer.cancel();
    _screenNavigation();
  }
}

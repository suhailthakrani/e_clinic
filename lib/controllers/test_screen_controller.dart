import 'package:e_clinic/ui/screens/appointments/appointment_screen.dart';
import 'package:e_clinic/ui/screens/main_screen/main_screen.dart';
import 'package:e_clinic/ui/screens/messages/messages_screen.dart';
import 'package:e_clinic/ui/screens/settings/settigs_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TestScreenController extends GetxController {
  List<Widget> screens = [
    MainScreen(),
    MessagesScreen(),
    AppointmentsScreen(),
    SettingsScreen(),
  ];

  RxInt currentIndex = 0.obs;

  void onIndexChanged(int index) {
    currentIndex.value = index;
    notifyChildrens();
  }
}

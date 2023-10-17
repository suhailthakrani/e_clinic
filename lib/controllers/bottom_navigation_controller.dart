import 'package:e_clinic/models/appointment_model.dart';
import 'package:e_clinic/ui/screens/appointments/appointment_screen.dart';
import 'package:e_clinic/ui/screens/main_screen/main_screen.dart';
import 'package:e_clinic/ui/screens/messages/messages_screen.dart';
import 'package:e_clinic/ui/screens/settings/settigs_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationController extends GetxController {
  final List<Widget> pages = [
    const MainScreen(),
    const AppointmentsScreen(),
    const MessagesScreen(),
    const SettingsScreen(),
  ];

  final List<IconData> icons = [
    Icons.home,
    Icons.settings,
    Icons.person,
    Icons.settings,

  ];

  final List<String> pageTitles = ['Home', 'Settings', 'Profile'];

  final RxInt selectedIndex = 0.obs;
}

import 'package:e_clinic/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/test_screen_controller.dart';
import '../../utils/constants.dart';

class TestScreen extends GetView<TestScreenController> {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.screens[controller.currentIndex.value],
      ),
      bottomNavigationBar: SizedBox(
        height: 70,
        child: Obx(
          ()=> BottomNavigationBar(
            
            type: BottomNavigationBarType.fixed,
            currentIndex: controller.currentIndex.value,
            selectedItemColor: kPrimaryColor,
            unselectedItemColor: kDarkGreyColor,
            onTap: controller.onIndexChanged,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.camera),
                label: 'Messages',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat),
                label: 'Appointments',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat),
                label: 'Settings',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

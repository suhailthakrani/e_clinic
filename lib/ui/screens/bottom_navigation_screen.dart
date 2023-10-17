import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/bottom_navigation_controller.dart';
import '../widgets/nav_bar/curved_navigation_bar.dart';

class BottomNavigationBarScreen extends GetView<BottomNavigationController> {
  const BottomNavigationBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom Navigation Bar'),
      ),
      body: Obx(() => controller.pages[controller.selectedIndex.value]), // new
      bottomNavigationBar: CurvedNavigationBar(
        items: controller.icons,
        index: controller.selectedIndex.value,
        onTap: (index) {
          controller.selectedIndex.value = index;
        },
      ),
    );
  }
}

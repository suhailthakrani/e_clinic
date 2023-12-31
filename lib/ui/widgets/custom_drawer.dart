import '../../ui/widgets/custom_tile.dart';
import '../../ui/widgets/widget_svg.dart';
import '../../utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';
import '../../utils/user_session.dart';

class CustomDrawer extends Drawer {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Drawer(
        width: Get.width * 0.7,
        child: ListView(
          children: [
            DrawerHeader(
              margin: const EdgeInsets.only(bottom: 30, top: 8),
              padding: EdgeInsets.zero,
              child: Image.asset('assets/images/dr_illus.png'),
            ),
            ListTile(
              title: const Text('Dashboard'),
              leading: Padding(
                padding: const EdgeInsets.all(12),
                child: Image.asset(
                  'assets/images/dashboard.png',
                  scale: 0.1,
                  color: kPrimaryColor,
                ),
              ),
              // titleFontSize: 18,
              onTap: () {
                Get.back();
                Get.offAllNamed(kMainScreenRoute,
                    predicate: ((route) =>
                        route.isFirst &&
                        Get.previousRoute == kMainScreenRoute));
              },
            ),
            ListTile(
              title: const Text('Messages'),
              leading: Padding(
                padding: const EdgeInsets.all(12),
                child: Image.asset(
                  'assets/images/messages.png',
                  scale: 0.1,
                  color: kPrimaryColor,
                ),
              ),
              // titleFontSize: 18,
              onTap: () {
                Get.offAllNamed(kMessagesScreenRoute,
                    predicate: ((route) => route.isFirst));
              },
            ),
            ListTile(
              leading: Padding(
                padding: const EdgeInsets.all(12),
                child: Image.asset(
                  'assets/images/appointments.png',
                  color: kPrimaryColor,
                ),
              ),
              title: const Text('Appointments'),
              onTap: () {
                Get.offAllNamed(kAppointmentsScreenRoute,
                    predicate: ((route) => route.isFirst));
              },
            ),
            ListTile(
              leading: Padding(
                padding: const EdgeInsets.all(12),
                child: Image.asset(
                  'assets/images/prescription.png',
                  scale: 0.1,
                  color: kPrimaryColor,
                ),
              ),
              title: const Text('Prescription'),
              onTap: () {
                Get.offAllNamed(kPrescriptionScreenRoute,
                    predicate: ((route) => route.isFirst));
              },
            ),
            ListTile(
              leading: Padding(
                padding: const EdgeInsets.all(12),
                child: Image.asset(
                  'assets/images/mlab.png',
                  // scale: 0.1s,
                  color: kPrimaryColor,
                ),
              ),
              title: const Text('Lab Management'),
              onTap: () {
                Get.offAllNamed(kLabTestListScreenRoute,
                    predicate: ((route) => (route.isFirst && Get.currentRoute != kLabTestListScreenRoute) ));
              },
            ),
            ListTile(
              leading: Padding(
                padding: const EdgeInsets.all(12),
                child: Image.asset(
                  'assets/images/testss.png',
                  // scale: 0.1s,
                  color: kPrimaryColor,
                ),
              ),
              title: const Text('See Test History'),
              onTap: () {
                Get.offAllNamed(kTestListViewScreenRoute,
                    predicate: ((route) => route.isFirst ));
              },
        
            ),
            ListTile(
              leading: Padding(
                padding: const EdgeInsets.all(12),
                child: Image.asset(
                  'assets/images/reports.png',
                  scale: 0.1,
                  color: kPrimaryColor,
                ),
              ),
              title: const Text('Check Reports'),
              onTap: () {
                Get.offAllNamed(kReportListViewScreenRoute,
                    predicate: ((route) => route.isFirst));
              },
            ),
            ListTile(
              leading: Padding(
                padding: const EdgeInsets.all(12),
                child: Image.asset(
                  'assets/images/settings.png',
                  scale: 0.1,
                  color: kPrimaryColor,
                ),
              ),
              title: const Text('Settings'),
              onTap: () {
                Get.offAllNamed(kSettingsScreenRoute,
                    predicate: ((route) => route.isFirst));
              },
            ),
            SizedBox(
              height: Get.height * 0.15,
            ),
            ListTile(
              leading: Padding(
                padding: const EdgeInsets.all(12),
                child: Image.asset(
                  'assets/images/logout.png',
                  scale: 0.1,
                  color: kPrimaryColor,
                ),
              ),
              title: const Text('Logout'),
              onTap: () async {
                bool value = await UserSession().logout();
                if (value) {
                  Get.offAllNamed(kTestScreenRoute);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

import '../../../ui/widgets/custom_scaffold.dart';
import '../../../ui/widgets/custom_tile.dart';
import '../../../utils/colors.dart';
import '../../../utils/constants.dart';
import '../../../utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controllers/settings/settings_screen_controller.dart';

class SettingsScreen extends GetView<SettingsController> {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      scaffoldKey: controller.scaffoldKey,
      screenName: "Settings",
      className: runtimeType.toString(),
      // appBar: AppBar(
      //   automaticallyImplyLeading: true,
      //   elevation: 0,
      //   backgroundColor: kWhiteColor,
      //   foregroundColor: kBlackColor,
      // ),
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        height: Get.height,
        width: Get.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Settings",
              style: TextStyle(fontSize: 28.w, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),
            Text(
              "Personalize Your Account Settings",
              style: TextStyle(fontSize: 16.w, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 40.h),
            Container(
              decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.circular(8.r),
                  boxShadow: const [
                    BoxShadow(color: kFieldShadowColor, offset: Offset(-1, -1)),
                    BoxShadow(color: kFieldShadowColor, offset: Offset(1, 1))
                  ]),
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Column(
                children: [
                  CustomTile(
                      title: 'Account Settings',
                      onTap: () {
                        Get.toNamed(kAccountSettingsScreenRoute);
                      }),
                  const Divider(),
                  CustomTile(
                      title: 'Notifications',
                      onTap: () {
                        Get.toNamed(kNotificationSettingsScreenRoute);
                      }),
                  const Divider(),
                  CustomTile(
                    title: 'Logout',
                    onTap: () {},
                    icon: const SizedBox(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

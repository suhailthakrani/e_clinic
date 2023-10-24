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
        padding: const EdgeInsets.all(16),
        height: Get.height,
        width: Get.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Settings",
              style: TextStyle(fontSize: 32.w, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.h),
            Text(
              "Personalize Your Account Settings",
              style: TextStyle(fontSize: 16.w, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 20.h),
            Container(
              height: Get.height * 0.7,
              decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow:  [
                    BoxShadow(color: kFieldShadowColor.withOpacity(0.5), offset: Offset(-2, -2)),
                    BoxShadow(color: kFieldShadowColor.withOpacity(0.5), offset: Offset(2, 2))
                  ]),
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Column(
                children: [
                  // CustomTile(
                  //     title: 'Account Settings',
                  //     onTap: () {
                  //       Get.toNamed(kAccountSettingsScreenRoute);
                  //     }),
                  // const Divider(),

                  CustomTile(
                      title: 'Personal Info',
                      onTap: () {
                        Get.toNamed(kPersonalInfoSettingsScreenRoute);
                      }),
                  const Divider(),
                  // CustomTile(
                  //     title: 'Professional Info',
                  //     onTap: () {
                  //       Get.toNamed(kProfessionalInfoSettingsScreenRoute);
                  //     }),
                  // const Divider(),
                  CustomTile(
                      title: 'Email',
                      onTap: () {
                        Get.toNamed(kEmailSettingsScreenRoute);
                      }),
                  const Divider(),
                  CustomTile(
                      title: 'Phone Number',
                      onTap: () {
                        Get.toNamed(kPhoneNoSettingsScreenRoute);
                      }),
                  const Divider(),
                  CustomTile(
                      title: 'Password',
                      onTap: () {
                        Get.toNamed(kPasswordSettingsScreenRoute);
                      }),
                  const Divider(),
                  CustomTile(
                      title: 'Notifications',
                      onTap: () {
                        Get.toNamed(kNotificationSettingsScreenRoute);
                      }),
                  const Divider(),

                  ListTile(
                    dense: true,
                    // contentPadding: EdgeInsets.zero,
                    tileColor: kWhiteColor,
                    titleTextStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: kRequiredRedColor),
                    splashColor: kFieldBorderColor,
                    title: const Text('Deactivate Account'),
                    onTap: () {},
                  ),
                  // const Divider(),
                  // CustomTile(
                  //   title: 'Logout',
                  //   onTap: () {},
                  //   icon: const SizedBox(),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

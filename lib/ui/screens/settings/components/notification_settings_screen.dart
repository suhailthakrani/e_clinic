import '../../../../controllers/general_controllers.dart';
import '../../../../utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NotificationsSettingsScreen
    extends GetView<NotificationSettingsController> {
  const NotificationsSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: kWhiteColor,
        foregroundColor: kBlackColor,
        title: Text(
          "Account Settings",
          style: TextStyle(fontSize: 24.w, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        // margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(12.r),
        ),
        // padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
        child: Container(
          decoration: BoxDecoration(
              color: kWhiteColor,
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: const [
                BoxShadow(color: kFieldShadowColor, offset: Offset(-1, -1), blurRadius: 2),
                BoxShadow(color: kFieldShadowColor, offset: Offset(1, 1))
              ]),
          padding: EdgeInsets.all(8.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < 10; i++)
                  ListTile(
                    minVerticalPadding: 12,
                    title: const Text(
                      'Appointment reminders and updates',
                      maxLines: 1,
                    ),
                    titleTextStyle: const TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    
                    ),
                    subtitle: const Padding(
                      padding: EdgeInsets.symmetric(vertical:4.0),
                      child: Text(
                        'You’ve got upcoming appointments or there are other updates about your bookings.',
                        maxLines: 3,
                      ),
                    ),
                    trailing: Switch(value: i%2 != 0, onChanged: (value) {}),
                  ),
                  
              ],
            ),
          ),
        ),
      ),
    );
  }
}

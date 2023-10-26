// import '../../../../controllers/settings/account_settings_screen_controller.dart';
// import '../../../../ui/widgets/custom_scaffold.dart';
// import '../../../../ui/widgets/custom_tile.dart';
// import '../../../../utils/colors.dart';
// import '../../../../utils/constants.dart';
// import '../../../../utils/text_styles.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// class AccountSettingsScreen extends GetView<AccountSettingsController> {
//   const AccountSettingsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: true,
//         elevation: 0,
//         backgroundColor: kWhiteColor,
//         foregroundColor: kBlackColor,
//         title: Text(
//           "Account Settings",
//           style: TextStyle(fontSize: 24.w, fontWeight: FontWeight.bold),
//         ),
//       ),
//       body: Container(
//         margin: const EdgeInsets.symmetric(horizontal: 8),
//         decoration: BoxDecoration(
//           color: Theme.of(context).scaffoldBackgroundColor,
//           borderRadius: BorderRadius.circular(20.r),
//         ),
//         padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           // crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Text(
//             //   "Account Settings",
//             //   style: TextStyle(fontSize: 24.w, fontWeight: FontWeight.bold),
//             // ),
//             SizedBox(height: 20.h),
//             Expanded(
//               child: Card(
//                 elevation: 8,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20.r),
//                 ),
//                 // padding: EdgeInsets.all(8.w),
//                 child: Column(
//                   // mainAxisSize: MainAxisSize.max,
//                   children: [
//                     const SizedBox(height: 20),
//                     CustomTile(
//                         title: 'Personal Info',
//                         onTap: () {
//                           Get.toNamed(kPersonalInfoSettingsScreenRoute);
//                         }),
//                     const Divider(),
//                     // CustomTile(
//                     //     title: 'Professional Info',
//                     //     onTap: () {
//                     //       Get.toNamed(kProfessionalInfoSettingsScreenRoute);
//                     //     }),
//                     // const Divider(),
//                     CustomTile(
//                         title: 'Email',
//                         onTap: () {
//                           Get.toNamed(kEmailSettingsScreenRoute);
//                         }),
//                     const Divider(),
//                     CustomTile(
//                         title: 'Phone Number',
//                         onTap: () {
//                           Get.toNamed(kPhoneNoSettingsScreenRoute);
//                         }),
//                     const Divider(),
//                     CustomTile(
//                         title: 'Password',
//                         onTap: () {
//                           Get.toNamed(kPasswordSettingsScreenRoute);
//                         }),
//                     const Divider(),
//                     ListTile(
//                       dense: true,
//                       // contentPadding: EdgeInsets.zero,
//                       tileColor: kWhiteColor,
//                       titleTextStyle: const TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                           color: kRequiredRedColor),
//                       splashColor: kFieldBorderColor,
//                       title: const Text('Deactivate Account'),
//                       onTap: () {},
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

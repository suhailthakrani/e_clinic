// import '../../../../controllers/forgot_password_controller.dart';
// import '../../../../ui/widgets/checkbox.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// import '../../../../controllers/general_controllers.dart';
// import '../../../../utils/colors.dart';
// import '../../../widgets/general_date_picker_field.dart';
// import '../../../widgets/general_dropdown.dart';
// import '../../../widgets/general_text_field.dart';

// class ProfessionalInfoSettingsScreen
//     extends GetView<ProfessionalInfoSettingsController> {
//   const ProfessionalInfoSettingsScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: true,
//         elevation: 0,
//         backgroundColor: kWhiteColor,
//         foregroundColor: kBlackColor,
//         title: Text(
//           'Professional Info Settings',
//           style: TextStyle(fontSize: 24.w, fontWeight: FontWeight.bold),
//         ),
//       ),
//       body: SafeArea(
//         child: Container(
//           height: Get.height,
//           width: Get.width,
//           decoration: BoxDecoration(
//               color: kWhiteColor,
//               borderRadius: BorderRadius.circular(8.r),
//               boxShadow: const [
//                 BoxShadow(color: kFieldShadowColor, offset: Offset(-1, -1)),
//                 BoxShadow(color: kFieldShadowColor, offset: Offset(1, 1))
//               ]),
//           padding: EdgeInsets.all(16.w),
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(height: 20.h),
//                 const Text(
//                   'About Profession',
//                   style: TextStyle(
//                     color: Color(0xFF333333),
//                     fontSize: 18,
//                     fontFamily: 'Poppins',
//                     fontWeight: FontWeight.w600,
//                     height: 0.07,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 GeneralTextField.withShadow(
//                   tfManager: controller.specializationController,
//                   paddingVertical: 0,
//                   paddingHorizontal: 4,
//                 ),
//                 GeneralDropdown.withShadow(
//                     controller: controller.experienceDDController),
//                 const SizedBox(height: 20),
//                 const Text(
//                   'Hospital/Clinic Info',
//                   style: TextStyle(
//                     color: Color(0xFF333333),
//                     fontSize: 18,
//                     fontFamily: 'Poppins',
//                     fontWeight: FontWeight.w600,
//                     height: 0.07,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 GeneralTextField.withShadow(
//                   tfManager: controller.hospitalNameController,
//                   paddingVertical: 0,
//                   paddingHorizontal: 4,
//                 ),
//                 GeneralTextField.withShadow(
//                   tfManager: controller.addressController,
//                   paddingVertical: 0,
//                   paddingHorizontal: 4,
//                 ),
//                 const SizedBox(height: 20),
//                 GeneralTextField.withShadow(
//                   tfManager: controller.cityController,
//                   paddingVertical: 0,
//                   paddingHorizontal: 4,
//                 ),
//                 GeneralTextField.withShadow(
//                   tfManager: controller.stateController,
//                   paddingVertical: 0,
//                   paddingHorizontal: 4,
//                 ),
//                 const SizedBox(height: 8),
//                 Row(
//                   children: [
//                     Obx(
//                       () => Checkbox(
//                         value: controller.freeOfCost.value,
//                         onChanged: (bool? value) {
//                           if (value != null && value) {
//                             controller.selectCheckBox1();
//                           }
//                         },
//                         shape: CircleBorder(),
//                       ),
//                     ),
//                     Text('Free'),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Obx(
//                       () => Checkbox(
//                         value: controller.customCost.value,
//                         onChanged: (bool? value) {
//                           if (value != null && value) {
//                             controller.selectCheckBox2();
//                           }
//                         },
//                         shape: const CircleBorder(),
//                       ),
//                     ),
//                     Text('Custom Cost (Per Hour)'),
//                   ],
//                 ),
//                 const SizedBox(height: 8),
//                 Center(
//                   child: SizedBox(
//                     width: Get.width * 0.9,
//                     height: 50,
//                     child: TextButton(
//                       onPressed: () {},
//                       style: TextButton.styleFrom(
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8),
//                             side: const BorderSide(color: kBlueColor)),
//                         foregroundColor: kWhiteColor,
//                         backgroundColor: kBlueColor,
//                       ),
//                       child: const Text(
//                         "Save Changes",
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 Center(
//                   child: SizedBox(
//                     width: Get.width * 0.9,
//                     height: 50,
//                     child: TextButton(
//                       onPressed: () {},
//                       style: TextButton.styleFrom(
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8),
//                             side: BorderSide(color: kPrimaryColor)),
//                         backgroundColor: kWhiteColor,
//                         foregroundColor: kPrimaryColor,
//                       ),
//                       child: const Text(
//                         "Cancel",
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

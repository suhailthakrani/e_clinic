// import 'dart:convert';

// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:e_clinic/models/appointment_model.dart';
// import 'package:e_clinic/ui/screens/appointments/components/appointment_card.dart';
// import 'package:e_clinic/ui/widgets/custom_dialogs.dart';
// import 'package:e_clinic/utils/constants.dart';
// import 'package:get/get.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';

// class ConfrimPaymentScreenController extends GetxController {
//   AppointmentModel appointment = AppointmentModel.empty();
//   RxString paymentLink =
//       'https://checkout.stripe.com/c/pay/cs_test_a10YiUee9RDxLZVuLogPY21LAeFPN0PyBMu0wNZDc7MnvDGBp6Yi54H0GY#fidkdWxOYHwnPyd1blpxYHZxWjA0S21DcURCVmNzZG5WY2o2fWRiMU9udVNQVkNAT2NDcnVKQ31nN3RkVGhDYzwwTEw3aEBqd0EyN1BXdTRscnR%2FM0xGfU1tb21EQEtDQWB2Z0loZGhqYFFHNTVGT3BJVWpgMScpJ2N3amhWYHdzYHcnP3F3cGApJ2lkfGpwcVF8dWAnPyd2bGtiaWBabHFgaCcpJ2BrZGdpYFVpZGZgbWppYWB3dic%2FcXdwYHgl'
//           .obs;

//   @override
//   void onInit() {
//     var payment = Get.arguments;
//     if (payment != null) {
//       paymentLink.value = payment['paymentUrl'];
//       appointment = jsonDecode(payment['appointment']);
//     }
//     super.onInit();
//   }

//   void openPaymentLink() async {
//     await Future.delayed(const Duration(milliseconds: 500));
//     bool result = await 
//     if (result) {
//       CustomDialogs().showDialog("Success",
//           "You have Successfully Book an Appointment", DialogType.success);
//       Get.offAllNamed(kMainScreenRoute);
//     } else {
//       CustomDialogs().showDialog(
//           "Error",
//           "Unable to Process the Payment for an Appointment",
//           DialogType.success);
//     }
//   }
// }

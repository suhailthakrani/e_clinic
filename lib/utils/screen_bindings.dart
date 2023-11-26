import 'package:e_clinic/controllers/appointments/book_appointment_screen_controller.dart';
import 'package:e_clinic/controllers/labs/lab_dashboard_screen_controller.dart';
import 'package:e_clinic/controllers/labs/lab_list_screen_controller.dart';
import 'package:e_clinic/controllers/labs/lab_register_screen_controller.dart';
import 'package:e_clinic/controllers/labs/lab_side_list_screen_controller.dart';
import 'package:e_clinic/controllers/labs/lab_signin_screen_controller.dart';
import 'package:e_clinic/controllers/labs/reports_list_screen_controller.dart';
import 'package:e_clinic/controllers/labs/test_list_screen_controller.dart';
import 'package:e_clinic/controllers/new/doctor_details_screen_controller.dart';
import 'package:e_clinic/controllers/new/doctor_list_screen_controller.dart';
import 'package:e_clinic/controllers/payments/payment_screen_controller.dart';
import 'package:e_clinic/controllers/test_screen_controller.dart';
import 'package:e_clinic/ui/labs/lab_screens/lab_dashboard_screen.dart';
import 'package:e_clinic/ui/labs/lab_screens/lab_register_screen.dart';

import '../controllers/general_controllers.dart';
import '../controllers/labs/book_lab_appointment_screen_controller.dart';
import '../controllers/prescription_screen_controller.dart';
import '../controllers/register_screen_controller.dart';
import '../controllers/login_screen_controller.dart';
import '../controllers/new/main_screen_controller.dart';
import 'package:get/get.dart';

import '../controllers/appointments/appointments_screen_cntroller.dart';
import '../controllers/forgot_password_controller.dart';
import '../controllers/messages_screen_controler.dart';
import '../controllers/settings/settings_screen_controller.dart';
import '../controllers/splash_screen_controller.dart';

class ScreensBindings extends Bindings {
  @override
  void dependencies() {
    //
    Get.lazyPut(() => LabSignInScreenController());
    Get.lazyPut(() => LabRegisterScreenController());
    Get.lazyPut(() => LabDashboardScreenController());
    Get.lazyPut(() => BookLabAppointmentScreenController());
    Get.lazyPut(() => LabListScreenController());
    Get.lazyPut(() => LabSideTestListScreenController());
    Get.lazyPut(() => TestListScreenController());
    Get.lazyPut(() => ReportsListScreenController());
    //
    Get.lazyPut(() => LoginScreenController());
    Get.lazyPut(() => RegisterScreenController());
    Get.lazyPut(() => SplashScreenController());
    Get.lazyPut(() => MainScreenController());
    Get.lazyPut(() => MessagesController());
    Get.lazyPut(() => AppointmentScreenController());
    Get.lazyPut(() => PaymentScreenController());
    Get.lazyPut(() => SettingsController());
    Get.lazyPut(() => TestScreenController());
    // Get.lazyPut(() => ResetPasswordBySMSController());
    // Get.lazyPut(() => VerificationIDController());
    // Get.lazyPut(() => VerificationDriverController());
    // Get.lazyPut(() => VerificationPassportController());
    Get.lazyPut(() => NotificationSettingsController());
    Get.lazyPut(() => PersonalInfoSettingsController());
    Get.lazyPut(() => PrescriptionScreenController());

     Get.lazyPut(() => DoctorDetailsScreenController());
     Get.lazyPut(() => DoctorListScreenController());

     Get.lazyPut(() => BookAppointmentScreenController());

    Get.lazyPut(() => EmailSettingsController());
    Get.lazyPut(() => PhoneNoSettingsController());
    Get.lazyPut(() => PasswordSettingsController());
    Get.lazyPut(() => ForgotPasswordScreenController());
  }
}

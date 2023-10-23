import 'package:e_clinic/controllers/a_new/book_appointment_screen_controller.dart';
import 'package:e_clinic/controllers/a_new/confrim_payment_screen_controller.dart';
import 'package:e_clinic/controllers/payments/payment_screen_controller.dart';

import '../controllers/a_new/doctor_list_controller.dart';
import '../controllers/general_controllers.dart';
import '../controllers/prescription_screen_controller.dart';
import '../controllers/register_screen_controller.dart';
import '../controllers/settings/account_settings_screen_controller.dart';
import '../controllers/login_screen_controller.dart';
import '../controllers/new/main_screen_controller.dart';
import '../controllers/test_screen_controller.dart';
import 'package:get/get.dart';

import '../controllers/appointments/appointments_screen_cntroller.dart';
import '../controllers/forgot_password_controller.dart';
import '../controllers/messages_screen_controler.dart';
// import '../controllers/payments/payment_screen_controller.dart';
import '../controllers/settings/settings_screen_controller.dart';
import '../controllers/splash_screen_controller.dart';

class ScreensBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginScreenController());
    Get.lazyPut(() => RegisterScreenController());
    Get.lazyPut(() => TestScreenController());
    Get.lazyPut(() => SplashScreenController());
    Get.lazyPut(() => MainScreenController());
    Get.lazyPut(() => MessagesController());
    Get.lazyPut(() => AppointmentScreenController());
    Get.lazyPut(() => PaymentScreenController());
    Get.lazyPut(() => SettingsController());
    Get.lazyPut(() => AccountSettingsController());
    Get.lazyPut(() => PasswordResetMethodsController());
    Get.lazyPut(() => ResetPasswordBySMSController());
    Get.lazyPut(() => VerificationIDController());
    Get.lazyPut(() => VerificationDriverController());
    Get.lazyPut(() => VerificationPassportController());
    Get.lazyPut(() => NotificationSettingsController());
    Get.lazyPut(() => PersonalInfoSettingsController());
    Get.lazyPut(() => ProfessionalInfoSettingsController());
    Get.lazyPut(() => PrescriptionScreenController());

    //  Get.lazyPut(() => DoctorsListController());

     Get.lazyPut(() => BookAppointmentScreenController());

    Get.lazyPut(() => EmailSettingsController());
    Get.lazyPut(() => PhoneNoSettingsController());
    Get.lazyPut(() => PasswordSettingsController());
    // Get.lazyPut(() => ConfrimPaymentScreenController());
    Get.lazyPut(() => ForgotPasswordScreenController());
  }
}

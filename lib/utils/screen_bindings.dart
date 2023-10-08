import 'package:get/get.dart';

import '../controllers/appointments/appointments_screen_cntroller.dart';
import '../controllers/appointments/prescription_screen_controller.dart';
import '../controllers/appointments/write_report_controller.dart';
import '../controllers/availability_screen_controller.dart';
import '../controllers/forgot_password_controller.dart';
import '../controllers/general_controllers.dart';
import '../controllers/login_screen_controller.dart';
import '../controllers/main_screen_controller.dart';
import '../controllers/messages_screen_controler.dart';
import '../controllers/my_ratings_screen_controller.dart';
import '../controllers/payments/payment_screen_controller.dart';
import '../controllers/payments/request_payment_controller.dart';
import '../controllers/register_screen_controller.dart';
import '../controllers/settings/account_settings_screen_controller.dart';
import '../controllers/settings/settings_screen_controller.dart';
import '../controllers/splash_screen_controller.dart';
import '../controllers/test_screen_controller.dart';

class ScreensBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginScreenController());
    Get.lazyPut(() => RegisterScreenController());
    Get.lazyPut(() => TestScreenController());
    Get.lazyPut(() => SplashScreenController());
    Get.lazyPut(() => MainScreenController());
    // Get.lazyPut(() => MessagesController());
    Get.lazyPut(() => AppointmentsController());
    Get.lazyPut(() => AvailabilityController());
    Get.lazyPut(() => PaymentsController());
    Get.lazyPut(() => RequestPaymentController());

    // Get.lazyPut(() => RatingsController());
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
    Get.lazyPut(() => WriteReportScreenController());
    Get.lazyPut(() => EmailSettingsController());
    Get.lazyPut(() => PhoneNoSettingsController());
    Get.lazyPut(() => PasswordSettingsController());
    Get.lazyPut(() => ForgotPasswordScreenController());
  }
}

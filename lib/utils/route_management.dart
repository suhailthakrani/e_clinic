import 'package:e_clinic/ui/screens/main_screen/main_screen.dart';
import 'package:e_clinic/ui/screens/signup/signup_screen.dart';
import 'package:get/get.dart';

import '../ui/screens/signin/login_screen.dart';
import '../ui/screens/splash_screen.dart';
import 'constants.dart';
import 'screen_bindings.dart';

class RouteManagement {
  static List<GetPage> getPages() {
    return [
       GetPage(
        name: kMainScreenRoute,
        page: () => const MainScreen(),
        binding: ScreensBindings(),
      ),
      GetPage(
        name: kSplashScreenRoute,
        page: () => const SplashScreen(),
        binding: ScreensBindings(),
      ),
      // GetPage(
      //   name: kPrescriptionScreenRoute,
      //   page: () => const PrescriptionsScreen(),
      //   binding: ScreensBindings(),
      // ),
      // GetPage(
      //   name: kMessagesScreenRoute,
      //   page: () => const MessagesScreen(),
      //   binding: ScreensBindings(),
      // ),
      // GetPage(
      //   name: kAppointmentsScreenRoute,
      //   page: () => const AppointmentsScreen(),
      //   binding: ScreensBindings(),
      // ),
      // GetPage(
      //   name: kAvailabilityScreenRoute,
      //   page: () => const AvailabilityScreen(),
      //   binding: ScreensBindings(),
      // ),
      // GetPage(
      //   name: kWriteReportScreenRoute,
      //   page: () => const WriteReportScreen(),
      //   binding: ScreensBindings(),
      // ),
      // GetPage(
      //   name: kPaymentScreenRoute,
      //   page: () => const PaymentsScreen(),
      //   binding: ScreensBindings(),
      // ),
      //  GetPage(
      //   name: kRequestPaymentScreenRoute,
      //   page: () => const RequestPaymentScreen(),
      //   binding: ScreensBindings(),
      // ),
      
      // GetPage(
      //   name: kRatingsScreenRoute,
      //   page: () => const RatingsScreen(),
      //   binding: ScreensBindings(),
      // ),
      // GetPage(
      //   name: kSettingsScreenRoute,
      //   page: () => const SettingsScreen(),
      //   binding: ScreensBindings(),
      // ), 
      // GetPage(
      //   name: kAccountSettingsScreenRoute,
      //   page: () => const AccountSettingsScreen(),
      //   binding: ScreensBindings(),
      // ),
    //   GetPage(
    //     name: kLoginScreenRoute,
    //     page: () => const LoginScreen(),
    //     binding: ScreensBindings(),
    //   ),
    //   GetPage(
    //     name: kRegisterScreenRoute,
    //     page: () => const SignUpScreen(),
    //     binding: ScreensBindings(),
    //   ),
    //   GetPage(
    // name: kForgotPasswordScreenRoute,
    // page: () => const ForgotPasswordScreen(),
    // binding: ScreensBindings(),
  // ),
  // GetPage(
  //   name: kPasswordResetMethodsScreenRoute,
  //   page: () => const ForgotPasswordScreen(),
  //   binding: ScreensBindings(),
  // ),
  // GetPage(
  //   name: kResetPasswordBySMSScreenRoute,
  //   page: () => const ResetPasswordBySMSScreen(),
  //   binding: ScreensBindings(),
  // ),
  // GetPage(
  //   name: kVerificationIDScreenRoute,
  //   page: () => const VerificationIdScreen(),
  //   binding: ScreensBindings(),
  // ),
  // GetPage(
  //   name: kVerificationDriverScreenRoute,
  //   page: () => const VerificationDriverScreen(),
  //   binding: ScreensBindings(),
  // ),
  // GetPage(
  //   name: kVerificationPassportScreenRoute,
  //   page: () => const VerificationPassportScreen(),
  //   binding: ScreensBindings(),
  // ),
  // GetPage(
  //   name: kNotificationSettingsScreenRoute,
  //   page: () => const NotificationsSettingsScreen(),
  //   binding: ScreensBindings(),
  // ),
  // GetPage(
  //   name: kPersonalInfoSettingsScreenRoute,
  //   page: () => const PersonalInfoSettingsScreen(),
  //   binding: ScreensBindings(),
  // ),
  // GetPage(
  //   name: kEmailSettingsScreenRoute,
  //   page: () => const EmailSettingsScreen(),
  //   binding: ScreensBindings(),
  // ),
  // GetPage(
  //   name: kPhoneNoSettingsScreenRoute,
  //   page: () => const PhoneNoSettingsScreen(),
  //   binding: ScreensBindings(),
  // ),
  // GetPage(
  //   name: kPasswordSettingsScreenRoute,
  //   page: () => const PasswordSettingsScreen(),
  //   binding: ScreensBindings(),
  // ),
  // GetPage(
  //   name: kProfessionalInfoSettingsScreenRoute,
  //   page: () => const ProfessionalInfoSettingsScreen(),
  //   binding: ScreensBindings(),
  // ),
  // GetPage(
  //   name: kPrescriptionScreenRoute,
  //   page: () => const PrescriptionsScreen(),
  //   binding: ScreensBindings(),
  // ),
  
      // GetPage(name: '/logout', page: () => LogoutScreen()),
    ];
  }
}

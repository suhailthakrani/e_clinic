import 'package:e_clinic/ui/labs/lab_screens/lab_dashboard_screen.dart';
import 'package:e_clinic/ui/labs/lab_screens/lab_register_screen.dart';
import 'package:e_clinic/ui/labs/lab_screens/lab_side_test_requests_screen.dart';
import 'package:e_clinic/ui/labs/lab_screens/lab_signin_screen.dart';
import 'package:e_clinic/ui/labs/patient_labs/book_lab_appointment_screen.dart';
import 'package:e_clinic/ui/labs/patient_labs/reports_lists_screen.dart';
import 'package:e_clinic/ui/labs/patient_labs/test_lists_screen.dart';
import 'package:e_clinic/ui/screens/main_screen/components/book_appointment_screen.dart';
import 'package:e_clinic/ui/screens/main_screen/components/doctor_list_screen.dart';
import 'package:e_clinic/ui/screens/prescriptions/prescriptions_screen.dart';
import 'package:e_clinic/ui/screens/settings/components/notification_settings_screen.dart';
import 'package:e_clinic/ui/screens/test_screen.dart';
import 'package:flutter/material.dart';

import '../ui/labs/patient_labs/lab_lists_screen.dart';
import '../ui/screens/main_screen/components/doctor_details_screen.dart';
import '../ui/screens/main_screen/main_screen.dart';
// import '../ui/screens/payments/components/verification_screen/verification_driver_screen.dart';
// import '../ui/screens/payments/components/verification_screen/verification_id_screen.dart';
// import '../ui/screens/payments/components/verification_screen/verification_passport_screen.dart';
import '../ui/screens/payments/payment_screen.dart';
import '../ui/screens/settings/components/email_settings.dart';
import '../ui/screens/settings/components/password_reset_settings.dart';
import '../ui/screens/settings/components/personal_info_settings.dart';
import '../ui/screens/settings/components/phone_settings.dart';
import '../ui/screens/signin/components/forgot_password_screen.dart';
import '../ui/screens/signup/signup_screen.dart';
import 'package:get/get.dart';

import '../ui/screens/appointments/appointment_screen.dart';
import '../ui/screens/signin/login_screen.dart';
import '../ui/screens/messages/messages_screen.dart';
import '../ui/screens/settings/settigs_screen.dart';
import '../ui/screens/splash_screen.dart';
import 'constants.dart';
import 'screen_bindings.dart';

class RouteManagement {
  static List<GetPage> getPages() {
    return [
    
      GetPage(
        name: kTestScreenRoute,
        page: () => const TestScreen(),
        binding: ScreensBindings(),
      ), 
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
      GetPage(
        name: kMessagesScreenRoute,
        page: () => const MessagesScreen(),
        binding: ScreensBindings(),
      ),
      GetPage(
        name: kAppointmentsScreenRoute,
        page: () => const AppointmentsScreen(),
        binding: ScreensBindings(),
      ),
      GetPage(
        name: kPaymentScreenRoute,
        page: () => const PaymentsScreen(),
        binding: ScreensBindings(),
      ),

      GetPage(
        name: kSettingsScreenRoute,
        page: () => const SettingsScreen(),
        binding: ScreensBindings(),
      ),
      GetPage(
        name: kLoginScreenRoute,
        page: () => const LoginScreen(),
        binding: ScreensBindings(),
      ),
      GetPage(
        name: kRegisterScreenRoute,
        page: () => const SignUpScreen(),
        binding: ScreensBindings(),
      ),
      GetPage(
        name: kForgotPasswordScreenRoute,
        page: () => const ForgotPasswordScreen(),
        binding: ScreensBindings(),
      ),
     
      GetPage(
        name: kNotificationSettingsScreenRoute,
        page: () => const NotificationsSettingsScreen(),
        binding: ScreensBindings(),
      ),
      GetPage(
        name: kPersonalInfoSettingsScreenRoute,
        page: () => const PersonalInfoSettingsScreen(),
        binding: ScreensBindings(),
      ),
      GetPage(
        name: kEmailSettingsScreenRoute,
        page: () => const EmailSettingsScreen(),
        binding: ScreensBindings(),
      ),
      GetPage(
        name: kPhoneNoSettingsScreenRoute,
        page: () => const PhoneNoSettingsScreen(),
        binding: ScreensBindings(),
      ),
      GetPage(
        name: kPasswordSettingsScreenRoute,
        page: () => const PasswordSettingsScreen(),
        binding: ScreensBindings(),
      ),
      
      GetPage(
        name: kDoctorsListScreenRoute,
        page: () =>  const DoctorsListScreen(),
        binding: ScreensBindings(),
      ),
      GetPage(
        name: kDoctorsDetailsScreenRoute,
        page: () => DoctorDetailsScreen(),
        binding: ScreensBindings(),
      ),
      GetPage(
        name: kBookAppointmentScreenRoute,
        page: () => const BookAppointmentScreen(),
        binding: ScreensBindings(),
      ),
      GetPage(
        name: kPrescriptionScreenRoute,
        page: () => const PrescriptionsScreen(),
        binding: ScreensBindings(),
      ),
      //Lab
       GetPage(
        name: kLabLoginScreenRoute,
        page: () => const LabSignInScreen(),
        binding: ScreensBindings(),
      ),
      GetPage(
        name: kLabRegisterScreenRoute,
        page: () => const LabRegisterScreen(),
        binding: ScreensBindings(),
      ),
        GetPage(
        name: kLabDashboardScreenRoute,
        page: () => const LabDashboardScreen(),
        binding: ScreensBindings(),
      ),
      GetPage(
        name: kBookLabAppointmentScreenRoute,
        page: () => const BookLabAppointmentScreen(),
        binding: ScreensBindings(),
      ),
      GetPage(
        name: kLabTestListScreenRoute,
        page: () => const LabTestScreen(),
        binding: ScreensBindings(),
      ),

      GetPage(
        name: kLabSideTestListScreenRoute,
        page: () => const LabSideTestScreen(),
        binding: ScreensBindings(),
      ), 
      
      GetPage(
        name: kReportListViewScreenRoute,
        page: () => const ReposrtListScreen(),
        binding: ScreensBindings(),
      ),

      GetPage(
        name: kTestListViewScreenRoute,
        page: () => const TestListViewScreen(),
        binding: ScreensBindings(),
      ),
    ];
  }
}

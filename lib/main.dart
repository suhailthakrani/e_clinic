import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'add_payment_method/providers/payment_method_provider.dart';
import 'address_screen/providers/address_card_provider.dart';
import 'doctor_details_screen/providers/doctor_service_provider.dart';
import 'forgot_password/providers/forgot_password_provider.dart';
import 'home_page/tab_bar_screens/appointments/providers/appointment_type_provider.dart';
import 'home_page/tab_bar_screens/messages/providers/messages_provider.dart';
import 'routes/routes.dart';
import 'splash_screen/splash_screen.dart';
import 'verification_screen/providers/id_verification_provider.dart';
import 'util/colors.dart';

void main() {
  runApp(
    DevicePreview(enabled: !kReleaseMode, builder: (context) => const MyApp()),
  );
  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aderis Health App',
      theme: ThemeData(
        backgroundColor: mainColor,
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
      routes: allRoutes,
    );
  }
}

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'routes/routes.dart';
import 'ui/screens/splash_screen/splash_screen.dart';
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

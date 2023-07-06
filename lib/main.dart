import 'package:cspace_flutter_animation/pages/on-boarding_page.dart';
import 'package:cspace_flutter_animation/pages/splash-screen_page.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

void main() => runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      routes: {
        '/': (context) => SplashScreen(),
        '/onboarding': (context) => OnBoarding(),
      },
    );
  }
}

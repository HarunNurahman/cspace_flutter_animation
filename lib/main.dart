import 'package:cspace_flutter_animation/pages/detail-product_page.dart';
import 'package:cspace_flutter_animation/pages/product-category_page.dart';
import 'package:cspace_flutter_animation/pages/home_page.dart';
import 'package:cspace_flutter_animation/pages/login_page.dart';
import 'package:cspace_flutter_animation/pages/on-boarding_page.dart';
import 'package:cspace_flutter_animation/pages/profile_page.dart';
import 'package:cspace_flutter_animation/pages/search-result_page.dart';
import 'package:cspace_flutter_animation/pages/search_page.dart';
import 'package:cspace_flutter_animation/pages/splash-screen_page.dart';
import 'package:cspace_flutter_animation/pages/wishlist_page.dart';
// import 'package:device_preview/device_preview.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// void main() => runApp(
//       DevicePreview(
//         enabled: !kReleaseMode,
//         builder: (context) => const MyApp(),
//       ),
//     );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      routes: {
        '/': (context) => const SplashScreen(),
        '/onboarding': (context) => const OnBoarding(),
        '/login': (context) => const Login(),
        '/home': (context) => const Home(),
        '/search': (context) => const Search(),
        '/search-result': (context) => const SearchResult(),
        '/category': (context) => const ProductCategory(),
        '/wishlist': (context) => const Wishlist(),
        '/profile': (context) => const Profile(),
        '/detail': (context) => const DetailProduct(),
      },
    );
  }
}

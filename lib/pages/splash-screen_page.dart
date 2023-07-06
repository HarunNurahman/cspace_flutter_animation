import 'dart:async';

import 'package:cspace_flutter_animation/configs/styles.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushNamedAndRemoveUntil(
        context,
        '/onboarding',
        (route) => false,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              margin: const EdgeInsets.only(right: 16),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/logo_light.png'),
                ),
              ),
            ),
            Text(
              'Space',
              style: whiteTextStyle.copyWith(
                fontSize: 36,
                fontWeight: bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

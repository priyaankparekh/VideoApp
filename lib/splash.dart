import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:assignment_vc/home.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    // animationTimer();
  }

  animationTimer() async {
    Future.delayed(Duration(seconds: 2));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 2000,
      splash: 'assets/images/vv_logo.png',
      backgroundColor: Colors.white,
      nextScreen: HomePage(),
      splashTransition: SplashTransition.slideTransition,
    );
  }
}

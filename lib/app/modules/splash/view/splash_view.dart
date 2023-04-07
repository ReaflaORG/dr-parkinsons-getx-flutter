import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controller/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: FadeTransition(
          opacity: CurvedAnimation(
            parent: controller.animationController,
            curve: Curves.ease,
          ),
          child: Center(
            child: Image.asset(
              'assets/images/logo/logo.png',
              width: 170.w,
              // height: 100.h,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}

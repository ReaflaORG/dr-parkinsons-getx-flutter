import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controller/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) => Stack(
        alignment: Alignment.topCenter,
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'assets/images/splash/background.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 300,
            child: SvgPicture.asset(
              'assets/images/splash/logo.svg',
              fit: BoxFit.cover,
            ),
          ),
        ],
      );
}

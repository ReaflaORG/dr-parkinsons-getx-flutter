import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/healthcare__controller.dart';

class HealthCareView extends GetView<HealthCareController> {
  const HealthCareView({super.key});

  @override
  Widget build(BuildContext context) => const SafeArea(
        child: Scaffold(
          body: Center(
            child: Text('건강관리'),
          ),
        ),
      );
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/doctor_controller.dart';

class DoctorView extends GetView<DoctorController> {
  const DoctorView({super.key});

  @override
  Widget build(BuildContext context) => const SafeArea(
        child: Scaffold(
          body: Center(
            child: Text('주치의찾기'),
          ),
        ),
      );
}

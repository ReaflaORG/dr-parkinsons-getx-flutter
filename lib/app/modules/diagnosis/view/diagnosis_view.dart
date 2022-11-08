import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/diagnosis_controller.dart';

class DiagnosisView extends GetView<DiagnosisController> {
  const DiagnosisView({super.key});

  @override
  Widget build(BuildContext context) => const SafeArea(
        child: Scaffold(
          body: Center(
            child: Text('내정보'),
          ),
        ),
      );
}

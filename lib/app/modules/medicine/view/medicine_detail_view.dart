import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/medicine_info_controller.dart';

class MedicineInfoView extends GetView<MedicineInfoController> {
  const MedicineInfoView({super.key});

  @override
  Widget build(BuildContext context) => const SafeArea(
        child: Scaffold(
          body: Center(
            child: Text('내정보'),
          ),
        ),
      );
}

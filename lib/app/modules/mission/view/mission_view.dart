import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/mission_controller.dart';

class MissionView extends GetView<MissionController> {
  const MissionView({super.key});

  @override
  Widget build(BuildContext context) => const SafeArea(
        child: Scaffold(
          body: Center(
            child: Text('미션관리'),
          ),
        ),
      );
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/myinfo_controller.dart';

class MyInfoView extends GetView<MyInfoController> {
  const MyInfoView({super.key});

  @override
  Widget build(BuildContext context) => const SafeArea(
        child: Scaffold(
          body: Center(
            child: Text('내정보'),
          ),
        ),
      );
}

import 'package:get/get.dart';

import '../controller/mission_controller.dart';

class MissionBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put(MissionController());
    Get.lazyPut(() => MissionController(), fenix: true);
  }
}

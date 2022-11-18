import 'package:get/get.dart';

import '../controller/disorder_controller.dart';

class DisorderBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put(MissionController());
    Get.lazyPut(() => DisorderController(), fenix: true);
  }
}

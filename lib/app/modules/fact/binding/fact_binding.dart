import 'package:get/get.dart';

import '../controller/fact_controller.dart';

class FactBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put(MissionController());
    Get.lazyPut(() => FactController(), fenix: true);
  }
}

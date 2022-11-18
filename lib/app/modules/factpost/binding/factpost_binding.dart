import 'package:get/get.dart';

import '../controller/factpost_controller.dart';

class FactPostBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put(FactPostController());
    Get.lazyPut(() => FactPostController(), fenix: true);
  }
}

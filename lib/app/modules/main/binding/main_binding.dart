import 'package:get/get.dart';

import '../controller/main_controller.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put(MainController());
    Get.lazyPut(() => MainController(), fenix: true);
  }
}

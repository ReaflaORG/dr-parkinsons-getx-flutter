import 'package:get/get.dart';

import '../controller/theme_controller.dart';

class ThemeBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put(ThemeController());
    Get.lazyPut(() => ThemeController(), fenix: true);
  }
}

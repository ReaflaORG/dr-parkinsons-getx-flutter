import 'package:get/get.dart';

import '../controller/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController(), permanent: true);
    // Get.lazyPut(() => HomeController(), fenix: true);
  }
}

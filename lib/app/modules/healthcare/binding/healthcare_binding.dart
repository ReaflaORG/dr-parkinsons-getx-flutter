import 'package:get/get.dart';

import '../controller/healthcare_controller.dart';

class HealthCareBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put(HealthCareController());
    Get.lazyPut(() => HealthCareController(), fenix: true);
  }
}

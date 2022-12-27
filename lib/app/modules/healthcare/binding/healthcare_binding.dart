import 'package:get/get.dart';

import '../controller/healthcare_controller.dart';

class HealthCareBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HealthCareController(), permanent: true);
    // Get.lazyPut(() => HealthCareController(), fenix: true);
  }
}

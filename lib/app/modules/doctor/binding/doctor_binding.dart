import 'package:get/get.dart';

import '../controller/doctor_controller.dart';

// dortor binding
class DoctorBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put(DoctorController());
    Get.lazyPut(() => DoctorController(), fenix: true);
  }
}

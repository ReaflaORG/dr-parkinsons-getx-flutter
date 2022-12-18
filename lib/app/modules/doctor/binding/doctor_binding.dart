import 'package:get/get.dart';

import '../controller/doctor_controller.dart';

/// 주치의 찾기 바인딩
class DoctorBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put(DoctorController());
    Get.lazyPut(() => DoctorController(), fenix: true);
  }
}

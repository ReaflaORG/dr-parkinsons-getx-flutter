import 'package:get/get.dart';

import '../controller/doctor_detail_controller.dart';

/// 주치의 찾기 바인딩
class DoctorDetailBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put(DoctorDetailController());
    Get.lazyPut(() => DoctorDetailController(), fenix: true);
  }
}

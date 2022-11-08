import 'package:get/get.dart';

import '../controller/medicine_info_controller.dart';

class MedicineInfoBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put(MedicineInfoController());
    Get.lazyPut(() => MedicineInfoController(), fenix: true);
  }
}

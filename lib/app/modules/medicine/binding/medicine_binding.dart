import 'package:get/get.dart';

import '../controller/medicine_controller.dart';

class MedicineBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put(MedicineController());
    Get.lazyPut(() => MedicineController(), fenix: true);
  }
}

import 'package:get/get.dart';

import '../controller/medicine__controller.dart';

class MedicineBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put(MedicineController());
    Get.lazyPut(() => MedicineController(), fenix: true);
  }
}

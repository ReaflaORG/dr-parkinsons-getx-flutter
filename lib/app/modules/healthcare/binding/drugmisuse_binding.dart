import 'package:get/get.dart';

import '../controller/drugmisuse_controller.dart';

class DrugMisuseBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put(DrugMisuseController());
    Get.lazyPut(() => DrugMisuseController(), fenix: true);
  }
}

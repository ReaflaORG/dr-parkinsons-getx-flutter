import 'package:get/get.dart';

import '../controller/fact_detail_controller.dart';

class FactDetailBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put(FactPostController());
    Get.lazyPut(() => FactDetailController(), fenix: true);
  }
}

import 'package:get/get.dart';

import '../controller/disorder_detail_controller.dart';

class DisorderDetailBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put(DisorderDetailController());
    Get.lazyPut(() => DisorderDetailController(), fenix: true);
  }
}

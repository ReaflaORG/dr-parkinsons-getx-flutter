import 'package:get/get.dart';

import '../controller/faq_controller.dart';

// faq binding
class FaqBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put(FaqController());
    Get.lazyPut(() => FaqController(), fenix: true);
  }
}

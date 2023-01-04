import 'package:get/get.dart';

import '../controller/terms_controller.dart';

class TermsBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put(TermsAndConditionController());
    Get.lazyPut(() => TermsController(), fenix: true);
  }
}

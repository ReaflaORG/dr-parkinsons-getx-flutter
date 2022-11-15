import 'package:get/get.dart';

import '../controller/terms_and_condition_controller.dart';

// terms and condition binding
class TermsAndConditionBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put(TermsAndConditionController());
    Get.lazyPut(() => TermsAndConditionController(), fenix: true);
  }
}

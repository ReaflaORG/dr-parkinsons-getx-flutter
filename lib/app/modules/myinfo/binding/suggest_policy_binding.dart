import 'package:get/get.dart';

import '../controller/suggest_policy_controller.dart';

// suggest policy binding
class SuggestPolicyBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put(SuggestPolicyController());
    Get.lazyPut(() => SuggestPolicyController(), fenix: true);
  }
}

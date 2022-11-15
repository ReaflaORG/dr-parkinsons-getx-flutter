import 'package:get/get.dart';

import '../controller/manage_member_controller.dart';

// manage member binding
class ManageMemberBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put(ManageMemeberController());
    Get.lazyPut(() => ManageMemeberController(), fenix: true);
  }
}

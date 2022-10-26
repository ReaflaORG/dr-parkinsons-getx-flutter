import 'package:get/get.dart';

import '../controller/permission_controller.dart';

class PermissionBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put(PermissionController());
    Get.lazyPut(() => PermissionController(), fenix: true);
  }
}

import 'package:get/get.dart';

import '../controller/my_info_controller.dart';

// my info binding
class MyInfoBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MyInfoController(), permanent: true);
    // Get.lazyPut(() => MyInfoController(), fenix: true);
  }
}

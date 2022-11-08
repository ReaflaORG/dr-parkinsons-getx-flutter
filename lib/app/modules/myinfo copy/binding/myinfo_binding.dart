import 'package:get/get.dart';

import '../controller/myinfo_controller.dart';

class MyInfoBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put(MyInfoController());
    Get.lazyPut(() => MyInfoController(), fenix: true);
  }
}

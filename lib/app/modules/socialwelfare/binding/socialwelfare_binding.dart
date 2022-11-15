import 'package:get/get.dart';

import '../controller/socialwelfare_controller.dart';

class SocialWelfareBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put(MissionController());
    Get.lazyPut(() => SocialWelfareController(), fenix: true);
  }
}

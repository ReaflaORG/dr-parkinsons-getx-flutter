import 'package:get/get.dart';

import '../controller/social_welfare_controller.dart';

class SocialWelfareBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put(MissionController());
    Get.lazyPut(() => SocialWelfareController(), fenix: true);
  }
}

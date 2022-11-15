import 'package:get/get.dart';

import '../controller/profile_setting_controller.dart';

// profile setting binding
class ProfileSettingBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put(ProfileSettingController());
    Get.lazyPut(() => ProfileSettingController(), fenix: true);
  }
}

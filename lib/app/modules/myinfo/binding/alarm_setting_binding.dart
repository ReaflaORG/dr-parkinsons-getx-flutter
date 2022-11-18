import 'package:get/get.dart';

import '../controller/alarm_setting_controller.dart';

// alarm setting binding
class AlarmSettingBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put(AlarmSettingController());
    Get.lazyPut(() => AlarmSettingController(), fenix: true);
  }
}

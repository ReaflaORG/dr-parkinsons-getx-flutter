import 'package:get/get.dart';
import '../controller/protector_controller.dart';

class ProtectorBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put(MissionController());
    Get.lazyPut(() => ProtectorController(), fenix: true);
  }
}

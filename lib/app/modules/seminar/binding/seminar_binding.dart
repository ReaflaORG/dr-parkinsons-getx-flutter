import 'package:get/get.dart';
import '../controller/seminar_controller.dart';

class SeminarBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put(MissionController());
    Get.lazyPut(() => SeminarController(), fenix: true);
  }
}

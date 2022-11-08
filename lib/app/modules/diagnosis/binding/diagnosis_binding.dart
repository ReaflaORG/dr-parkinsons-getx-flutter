import 'package:get/get.dart';

import '../controller/diagnosis_controller.dart';

class DiagnosisBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put(DiagnosisController());
    Get.lazyPut(() => DiagnosisController(), fenix: true);
  }
}

import 'package:get/get.dart';

import '../controller/my_symptoms_controller.dart';

// my symptoms binding
class MySymptomsBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put(MySymptomsController());
    Get.lazyPut(() => MySymptomsController(), fenix: true);
  }
}

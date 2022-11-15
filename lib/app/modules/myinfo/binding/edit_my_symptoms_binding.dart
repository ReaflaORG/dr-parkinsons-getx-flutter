import 'package:get/get.dart';

import '../controller/edit_my_symptoms_controller.dart';

// edity my symptoms binding
class EditMySymptomsBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put(EditMySymptomsController());
    Get.lazyPut(() => EditMySymptomsController(), fenix: true);
  }
}

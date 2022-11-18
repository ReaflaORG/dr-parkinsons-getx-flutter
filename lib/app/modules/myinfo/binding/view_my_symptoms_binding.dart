import 'package:get/get.dart';

import '../controller/view_my_symtoms_controller.dart';

// view my symptoms binding
class ViewMySymptomsBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put(ViewMySymptomsController());
    Get.lazyPut(() => ViewMySymptomsController(), fenix: true);
  }
}

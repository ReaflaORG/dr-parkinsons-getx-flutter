import 'package:get/get.dart';

import '../controller/write_my_symtoms_controller.dart';

// write symptoms binding
class WriteMySymptomsBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put(WriteMySymptomsController());
    Get.lazyPut(() => WriteMySymptomsController(), fenix: true);
  }
}

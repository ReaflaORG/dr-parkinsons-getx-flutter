import 'package:get/get.dart';

class DrugMisuse implements Bindings {
  @override
  void dependencies() {
    // Get.put(HealthCareController());
    Get.lazyPut(() => DrugMisuse(), fenix: true);
  }
}

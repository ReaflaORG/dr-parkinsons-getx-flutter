import 'package:get/get.dart';

import '../controller/search_doctors_controller.dart';

// search doctors binding
class SearchDoctorsBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put(SearchDoctorsController());
    Get.lazyPut(() => SearchDoctorsController(), fenix: true);
  }
}

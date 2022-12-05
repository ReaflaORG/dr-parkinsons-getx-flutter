import 'package:get/get.dart';

import '../controller/doctor_search_controller.dart';

// search doctors binding
class SearchDoctorsBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put(SearchDoctorsController());
    Get.lazyPut(() => DoctorSearchController(), fenix: true);
  }
}

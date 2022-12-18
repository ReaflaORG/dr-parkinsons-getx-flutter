import 'package:get/get.dart';

import '../controller/search_doctors_controller.dart';

/// 주치의 찾기 검색 바인딩
class SearchDoctorsBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put(SearchDoctorsController());
    Get.lazyPut(() => DoctorSearchController(), fenix: true);
  }
}

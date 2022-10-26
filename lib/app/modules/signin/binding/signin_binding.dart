import 'package:get/get.dart';

import '../controller/signin_controller.dart';

class SignInBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put(SignInController());
    Get.lazyPut(() => SignInController(), fenix: true);
  }
}

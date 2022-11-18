import 'package:get/get.dart';
import '../controller/socialwelfarepost_controller.dart';

class SocialWelfarePostBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put(SocialWelFarePostViewController());
    Get.lazyPut(() => SocialWelfarePostController(), fenix: true);
  }
}

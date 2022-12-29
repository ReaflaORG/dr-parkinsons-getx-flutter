import 'package:get/get.dart';

import '../controller/social_welfare_detail_controller.dart';

class SocialWelfareDetailBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put(SocialWelFarePostViewController());
    Get.lazyPut(
      () => SocialWelfareDetailController(),
      fenix: true,
    );
  }
}

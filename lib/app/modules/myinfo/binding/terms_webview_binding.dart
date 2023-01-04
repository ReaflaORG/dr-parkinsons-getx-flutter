import 'package:get/get.dart';

import '../controller/terms_webview_controller.dart';

class TermsWebviewBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(TermsWebviewController());
    // Get.lazyPut(() => TermsWebviewController(), fenix: true);
  }
}

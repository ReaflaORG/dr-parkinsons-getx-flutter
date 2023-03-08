import 'dart:async';
import 'dart:ui';

import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TermsWebviewController extends GetxController {
  static TermsWebviewController get to => Get.find();

  // Argument ▼

  dynamic arguments = Get.arguments;

  // Controller ▼

  /// 웹뷰 컨트롤러
  // late final WebViewController webViewController;
  WebViewController webViewController = WebViewController();

  // Variable ▼

  /// 타이머
  Rx<Timer> timer =
      Timer.periodic(const Duration(milliseconds: 0), (timer) {}).obs;
  // Function ▼

  /// 자바스크립트 주입
  dynamic handleOnPageFinished() async {}

  @override
  Future<void> onInit() async {
    webViewController
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            try {
              timer.value =
                  Timer.periodic(const Duration(milliseconds: 100), (timer) {
                webViewController.runJavaScript('''
                  (function() {
                    console.log(window.location.href);
                    window.document.querySelector('.ui-header').remove();
                    window.document.querySelector('.ui-content:nth-of-type(1) > section').style.padding = '0px';
                    const util = window.document.querySelectorAll('.util');
                    const footer = window.document.getElementsByTagName('footer');
                    for (let index = 0; index < util.length; index++) {
                        util[index].remove();
                    }
                    for (let index = 0; index < footer.length; index++) {
                        footer[index].remove();
                    }
                  })()''');
                timer.cancel();
              });
            } catch (e) {
              Logger().d(e);
            }
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith(Get.arguments['url'])) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(Get.arguments['url']));

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    timer.value.cancel();

    super.onClose();
  }

  @override
  InternalFinalCallback<void> get onStart => super.onStart;

  @override
  InternalFinalCallback<void> get onDelete => super.onDelete;
}

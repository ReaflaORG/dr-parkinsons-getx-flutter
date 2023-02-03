import 'dart:async';
import 'dart:io';

// import 'package:flutter_webview_pro/webview_flutter.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class TermsWebviewController extends GetxController {
  static TermsWebviewController get to => Get.find();

  // Argument ▼

  dynamic arguments = Get.arguments;

  // Controller ▼

  /// 웹뷰 컨트롤러
  // late final WebViewController webViewController;

  // Variable ▼

  /// 타이머
  Rx<Timer> timer =
      Timer.periodic(const Duration(milliseconds: 0), (timer) {}).obs;

  /// 뉴탭 리스트
  /// 새로운 탭이 뜨는 형태로 가야하는 경우
  RxList<dynamic> webViewNewTabList = [
    // 'memo.php',
    // 'scrap.php',
    // 'member_confirm.php',
  ].obs;

  // Function ▼

  /// 자바스크립트 주입
  dynamic handleOnPageFinished() async {
    try {
      timer.value = Timer.periodic(const Duration(milliseconds: 100), (timer) {
//         webViewController.runJavascript('''
// (function() {
//   console.log(window.location.href);
//   window.document.querySelector('.ui-header').remove();
//   window.document.querySelector('.ui-content:nth-of-type(1) > section').style.padding = '0px';
//   const util = window.document.querySelectorAll('.util');
//   const footer = window.document.getElementsByTagName('footer');
//   for (let index = 0; index < util.length; index++) {
//       util[index].remove();
//   }
//   for (let index = 0; index < footer.length; index++) {
//       footer[index].remove();
//   }
// })()''');
        timer.cancel();
      });
    } catch (e) {
      Logger().d(e);
    }
  }

  /// 컨트롤러 초기화
  Future<void> Initialization() async {
    /// 웹뷰 문서상 권장방법
    if (Platform.isAndroid) {
      // WebView.platform = AndroidWebView();
    }
  }

  @override
  Future<void> onInit() async {
    await Initialization();

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

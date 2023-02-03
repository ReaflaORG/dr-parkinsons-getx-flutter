import 'package:flutter/material.dart';
// import 'package:flutter_webview_pro/webview_flutter.dart';
import 'package:get/get.dart';

import '../controller/terms_webview_controller.dart';

class TermsWebviewview extends GetView<TermsWebviewController> {
  const TermsWebviewview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  // @override
  // Widget build(BuildContext context) {
  //   return GlobalLayoutWidget(
  //     context: context,
  //     appBar: GlobalAppBarWidget(
  //       appBar: AppBar(),
  //       title: '',
  //     ),
  //     body: WebView(
  //       initialUrl: controller.arguments['url'],
  //       javascriptMode: JavascriptMode.unrestricted,
  //       zoomEnabled: false,
  //       gestureNavigationEnabled: true,
  //       debuggingEnabled: true,
  //       geolocationEnabled: true,
  //       onWebViewCreated: (WebViewController webViewController) {
  //         controller.webViewController = webViewController;
  //       },
  //       onProgress: (int progress) {
  //         // Logger().d("onProgress $progress%");
  //       },
  //       onPageStarted: (String url) {
  //         // Logger().d('onPageStarted $url');
  //       },
  //       onPageFinished: (String url) => controller.handleOnPageFinished(),
  //       navigationDelegate: (NavigationRequest request) async {
  //         // Logger().d('navigationDelegate ${request.url}');

  //         if (Platform.isAndroid) {
  //           /// [AOS] item 이라는 주소가 있는 경우 새로운 탭으로 띄운다.
  //           /// 뒤로가기 했을때 이전 위치를 보여주기 위함
  //           if (controller.webViewNewTabList
  //               .where((element) => request.url.contains(element as Pattern))
  //               .isNotEmpty) {
  //             if (!await launchUrl(Uri.parse(request.url))) {
  //               Logger().e('Could not launch ${request.url}');
  //             }

  //             return NavigationDecision.prevent;
  //           }

  //           /// 전화걸기 체크
  //           if (request.url.contains('tel')) {
  //             Logger().d('전화걸기');
  //             launchUrl(Uri.parse(request.url));

  //             return NavigationDecision.prevent;
  //           }

  //           /// 인텐트 링크 체크
  //           if (request.url.contains('intent')) {
  //             if (!request.url.startsWith('http') &&
  //                 !request.url.startsWith('https')) {
  //               Logger().d('AOS 인텐트');

  //               return NavigationDecision.prevent;
  //             }
  //           }

  //           /// 구글 플레이스 스토어 이동
  //           if (request.url.contains('market')) {
  //             Logger().d('구글 플레이스 스토어');
  //             launchUrl(Uri.parse(request.url));

  //             return NavigationDecision.prevent;
  //           }
  //         } else {
  //           if (Platform.isIOS) {
  //             /// 결제 이동시 "about:blank"가 거쳐가는 경우가 있음
  //             if (request.url != 'about:blank') {
  //               /// 앱스토어 링크 체크
  //               if (!request.url.startsWith('http') &&
  //                   !request.url.startsWith('https')) {
  //                 Logger().d('IOS 인텐트');

  //                 return NavigationDecision.prevent;
  //               }

  //               /// 앱스토어 이동
  //               if (request.url.contains('itms-appss')) {
  //                 Logger().d('앱스토어');
  //                 launchUrl(Uri.parse(request.url));

  //                 return NavigationDecision.prevent;
  //               }
  //             }
  //           }
  //         }

  //         return NavigationDecision.navigate;
  //       },
  //     ),
  //   );
  // }
}

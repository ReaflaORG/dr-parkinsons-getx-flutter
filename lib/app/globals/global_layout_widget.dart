import 'package:flutter/material.dart';

/// 글로벌 레이아웃 위젯
///
/// [context] BuildContext
///
/// [resizeToAvoidBottomInset] bool?
///
/// [appBar] AppBar
///
/// [onWillPop] Future<bool> Function()?
///
/// [child] Widget
///
/// [bottomNavigationBar] Widget?
///
/// [isSafeArea] bool?
class GlobalLayoutWidget extends StatelessWidget {
  const GlobalLayoutWidget({
    super.key,
    required this.context,
    this.resizeToAvoidBottomInset = false,
    this.extendBodyBehindAppBar = false,
    this.appBar,
    this.onWillPop,
    required this.body,
    this.bottomNavigationBar,
    this.isSafeArea = true,
    this.backgroundColor = Colors.white,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
  });

  /// 컨텍스트
  final BuildContext context;

  /// 온스크린 키보드 여부
  final bool resizeToAvoidBottomInset;

  /// 앱 바의 높이를 포함하도록 [body]의 높이가 확장되고 본문의 상단이 앱 바의 상단과 정렬됩니다.
  final bool extendBodyBehindAppBar;

  /// 앱바
  final PreferredSizeWidget? appBar;

  /// 모바일 뒤로가기 버튼 인터렉션 처리
  final Future<bool> Function()? onWillPop;

  /// 자식 위젯
  final Widget body;

  /// 바텀 네비게이션 위젯
  final Widget? bottomNavigationBar;

  /// 세이프 영역 여부
  /// `IOS`의 경우 `SafeArea`를 사용하게 되면 `StatusBar`가 보이지 않는 현상이 있음
  final bool? isSafeArea;

  /// 세이프 영역 여부
  final Color? backgroundColor;

  /// 플로팅 액션 버튼
  final Widget? floatingActionButton;

  /// 플로팅 액션 버튼 위치
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => FocusScope.of(context).unfocus(),
      child: WillPopScope(
        onWillPop: onWillPop,
        child: isSafeArea!
            ? Platform.isAndroid
                ? SafeArea(
                    child: Scaffold(
                      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
                      extendBodyBehindAppBar: extendBodyBehindAppBar,
                      appBar: appBar,
                      backgroundColor: backgroundColor,
                      bottomNavigationBar: bottomNavigationBar,
                      floatingActionButton: floatingActionButton,
                      floatingActionButtonLocation:
                          floatingActionButtonLocation,
                      body: body,
                    ),
                  )
                : Scaffold(
                    resizeToAvoidBottomInset: resizeToAvoidBottomInset,
                    extendBodyBehindAppBar: extendBodyBehindAppBar,
                    appBar: appBar,
                    backgroundColor: backgroundColor,
                    bottomNavigationBar: bottomNavigationBar,
                    floatingActionButton: floatingActionButton,
                    floatingActionButtonLocation: floatingActionButtonLocation,
                    body: body,
                  )
            : Scaffold(
                resizeToAvoidBottomInset: resizeToAvoidBottomInset,
                extendBodyBehindAppBar: extendBodyBehindAppBar,
                appBar: appBar,
                backgroundColor: backgroundColor,
                bottomNavigationBar: bottomNavigationBar,
                floatingActionButton: floatingActionButton,
                floatingActionButtonLocation: floatingActionButtonLocation,
                body: body,
              ),
      ),
    );
  }
}

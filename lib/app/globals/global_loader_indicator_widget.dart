import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../theme/colors.dart';

/// 글로벌 로더 인디케이터 위젯
///
/// [isLogo] bool?
class GlobalLoaderIndicatorWidget extends StatelessWidget {
  const GlobalLoaderIndicatorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.transparent,
      child: Center(
        child: SpinKitFadingFour(
          color: ColorPath.PrimaryColor,
          size: 50.0,
        ),
      ),
    );
  }
}

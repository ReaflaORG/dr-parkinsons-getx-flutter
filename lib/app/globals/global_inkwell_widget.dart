import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/color_path.dart';

/// 글로벌 InkWell 위젯
///
/// [borderRadius] : InkWell의 BorderRadius
///
/// [child] : InkWell의 자식 위젯
///
/// [onTap] : InkWell의 onTap
///
/// [splashFactory] : InkSplash.splashFactory (default) / InkRipple.splashFactory (Native Ripple)
class GlobalInkWellWidget extends StatelessWidget {
  const GlobalInkWellWidget({
    super.key,
    this.padding = EdgeInsets.zero,
    this.borderRadius = 0,
    required this.child,
    this.onTap,
  });

  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final Widget child;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius).r,
        ),
        highlightColor: ColorPath.PrimaryColor.withOpacity(0.05),
        splashColor: ColorPath.PrimaryColor.withOpacity(0.1),
        splashFactory: InkRipple.splashFactory,
        onTap: onTap,
        child: Padding(
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}

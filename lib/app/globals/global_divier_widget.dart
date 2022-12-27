import 'package:flutter/material.dart';

/// 글로벌 디바이더 위젯
class GlobalDividerWidget extends Container {
  GlobalDividerWidget({
    super.key,
    super.margin,
    super.height,
    super.color,
    super.child,
  });

  /// 글로벌 디바이더 위젯
  ///
  /// [margin] EdgeInsetsGeometry
  ///
  /// [indent] double
  ///
  /// [endIndent] double
  ///
  /// [thickness] double
  ///
  /// [height] double
  ///
  /// [color] Color
  factory GlobalDividerWidget.basic({
    EdgeInsetsGeometry? margin = const EdgeInsets.only(
      left: 0,
      top: 20,
      right: 0,
      bottom: 20,
    ),
    double? indent = 0,
    double? endIndent = 0,
    double? thickness = 1.5,
    double? height = 1,
    Color? color = const Color(0XFFF2F2F2),
  }) {
    return GlobalDividerWidget(
      margin: margin,
      color: color,
      height: height,
      child: Divider(
        indent: indent,
        endIndent: endIndent,
        thickness: thickness,
        height: height,
        color: color,
      ),
    );
  }
}

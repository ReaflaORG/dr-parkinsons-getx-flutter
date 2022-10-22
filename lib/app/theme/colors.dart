// ignore_for_file: constant_identifier_names, non_constant_identifier_names, avoid_classes_with_only_static_members

import 'package:flutter/material.dart';

class ColorPath {
  /// 색상표
  /// https://material.io/resources/color/#!/?view.left=0&view.right=0&secondary.color=C5CAE9&primary.color=7d63fd&secondary.text.color=FAFAFA
  // 메인 색상
  static const PrimaryColor = Color(0XFF82c736);
  static const PrimaryLightColor = Color(0XFFb5fa68);
  // static const primaryLightColor = Color(0xFFC4A8F2);
  static const PrimaryDarkColor = Color(0XFF4f9600);

  // 보조 색상
  static const SecondaryColor = Color(0XFFc5cae9);
  static const SecondaryLightColor = Color(0XFFf8fdff);
  static const SecondaryDarkColor = Color(0XFF9499b7);

  static Color BlackColor = const Color(0XFF383A3F);
  // static Color BlackColor = Colors.black;
  static const TextBodyColor = Color(0xFF6B6969);
  static Color GreyColor = Colors.grey.shade300;
  static Color GreyLightColor = Colors.grey.shade200;
  static Color GreyDarkColor = Colors.grey.shade600;
  // Input Placeholder 색상
  static Color PlaceholderColor = Colors.grey.shade400;
  // 오류 색상
  static Color ErrorColor = Colors.red.shade300;
  // const kPrimaryGradientColor = LinearGradient(
  //   begin: Alignment.topLeft,
  //   end: Alignment.bottomRight,
  //   colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
  // );
  // const kTextColor = Color(0xFF757575);
}

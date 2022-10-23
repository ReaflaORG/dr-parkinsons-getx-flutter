// ignore_for_file: constant_identifier_names, non_constant_identifier_names, avoid_classes_with_only_static_members

import 'package:flutter/material.dart';

class ColorPath {
  /// 색상표
  /// https://material.io/resources/color/#!/?view.left=0&view.right=0&secondary.color=C5CAE9&primary.color=7d63fd&secondary.text.color=FAFAFA

  // 메인 색상
  static const PrimaryDarkColor = Color(0XFF2F7ABA);
  static const PrimaryColor = Color(0XFF468CC0);
  static const PrimaryLightColor = Color(0XFFE3F2FD);

  // 보조 색상
  static const SecondaryColor = Color(0XFF04A8B4);
  static const SecondaryLightColor = Color(0XFFCDEEF0);
  // static const SecondaryDarkColor = Color(0XFF9499b7);
  static const TertiaryColor = Color(0XFFFF80AB);
  static const TertiaryLightColor = Color(0XFFFFDDD3);

  //*  빈도수가 높은 컬러는 기본 설정으로 빼기 (의견)
  // text2, border2

  // Text
  static Color TextGrey1 = Colors.grey.shade900;
  static Color TextGrey2 = Colors.grey.shade800;
  static Color TextGrey3 = Colors.grey.shade700;
  static Color TextGrey4 = Colors.grey;
  static Color TextGray5 = Colors.white;

  // Border
  static Color Border1 = Colors.grey;
  static Color Border2 = Colors.blueGrey.shade50;

  // Background
  static Color Background1 = Colors.blueGrey.shade50;
  static Color Background2 = Colors.blueGrey.shade300;
  static Color Background3 = Colors.white;

  // Fucntional Colors
  static Color ErrorColor = Colors.red.shade900;
  static Color WarningColor = Colors.amber;
  static Color SuccessColor = Colors.green;
  static Color FocusedColor = Colors.blue;

  //ETC
  static Color BlackColor = const Color(0XFF383A3F);

  static const TextBodyColor = Color(0xFF424242);
  static Color GreyColor = Colors.grey.shade300;
  static Color GreyLightColor = Colors.grey.shade200;
  static Color GreyDarkColor = Colors.grey.shade600;

  // Input Placeholder 색상
  static Color PlaceholderColor = Colors.grey;
  // static Color PlaceholderColor = Colors.grey.shade400;

  // 오류 색상
  // const kPrimaryGradientColor = LinearGradient(
  //   begin: Alignment.topLeft,
  //   end: Alignment.bottomRight,
  //   colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
  // );
  // const kTextColor = Color(0xFF757575);
}

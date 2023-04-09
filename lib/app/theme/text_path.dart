// ignore_for_file: avoid_classes_with_only_static_members, prefer_const_constructors, slash_for_doc_comments, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'color_path.dart';

/// 텍스트 스타일
///
/// <대표이름><숫자>F<폰트사이즈>W<폰트굵기>
///
/// Thin: 100
///
/// ExtraLight: 200
///
/// Light: 300
///
/// Regular: 400
///
/// Medium: 500
///
/// SemiBold: 600
///
/// Bold: 700
///
/// ExtraBold: 800
///
/// Heavy: 900
class TextPath {
  /// Heading
  ///
  /// fontFamily: SUIT
  ///
  /// fontSize: 14
  ///
  /// fontWeight: SemiBold 600
  static TextStyle Heading4F16W600 = TextStyle(
    color: ColorPath.TextGrey1H212121,
    fontFamily: 'Pretendard',
    fontSize: 14.0.sp,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
    height: 1.3,
    letterSpacing: 0,
  );

  /// Heading
  ///
  /// fontFamily: SUIT
  ///
  /// fontSize: 16
  ///
  /// fontWeight: SemiBold 600
  static TextStyle Heading3F16W600 = TextStyle(
    color: ColorPath.TextGrey1H212121,
    fontFamily: 'Pretendard',
    fontSize: 16.0.sp,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
    height: 1.3,
    letterSpacing: 0,
  );

  /// Heading
  ///
  /// fontFamily: SUIT
  ///
  /// fontSize: 18
  ///
  /// fontWeight: SemiBold 600
  static TextStyle Heading2F18W600 = TextStyle(
    color: ColorPath.TextGrey1H212121,
    fontFamily: 'Pretendard',
    fontSize: 18.0.sp,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
    height: 1.3,
    letterSpacing: 0,
  );

  /// Heading
  ///
  /// fontFamily: SUIT
  ///
  /// fontSize: 24
  ///
  /// fontWeight: SemiBold 600
  static TextStyle Heading1F24W600 = TextStyle(
    color: ColorPath.TextGrey1H212121,
    fontFamily: 'Pretendard',
    fontSize: 24.0.sp,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
    height: 1.3,
    letterSpacing: 0,
  );

  /// fontFamily: SUIT
  ///
  /// fontSize: 10
  ///
  /// fontWeight: Regular 400
  static TextStyle TextF10W400 = TextStyle(
    color: ColorPath.TextGrey1H212121,
    fontFamily: 'Pretendard',
    fontSize: 10.0.sp,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
    height: 1.3,
    letterSpacing: 0,
  );

  // fontFamily: SUIT
  ///
  /// fontSize: 12
  ///
  /// fontWeight: Regular 200
  static TextStyle TextF12W200 = TextStyle(
    color: ColorPath.TextGrey1H212121,
    fontFamily: 'Pretendard',
    fontSize: 12.0.sp,
    fontWeight: FontWeight.w200,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
    height: 1.3,
    letterSpacing: 0,
  );

  /// fontFamily: SUIT
  ///
  /// fontSize: 12
  ///
  /// fontWeight: Regular 400
  static TextStyle TextF12W400 = TextStyle(
    color: ColorPath.TextGrey1H212121,
    fontFamily: 'Pretendard',
    fontSize: 12.0.sp,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
    height: 1.3,
    letterSpacing: 0,
  );

  /// fontFamily: SUIT
  ///
  /// fontSize: 12
  ///
  /// fontWeight: Medium 500
  static TextStyle TextF12W500White = TextStyle(
    color: ColorPath.TextWhite,
    fontFamily: 'Pretendard',
    fontSize: 12.0.sp,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
    height: 1.3,
    letterSpacing: 0,
  );

  /// fontFamily: SUIT
  ///
  /// fontSize: 12
  ///
  /// fontWeight: Medium 500
  static TextStyle TextF12W500 = TextStyle(
    color: ColorPath.TextGrey1H212121,
    fontFamily: 'Pretendard',
    fontSize: 12.0.sp,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
    height: 1.3,
    letterSpacing: 0,
  );

  /// fontFamily: SUIT
  ///
  /// fontSize: 12
  ///
  /// fontWeight: Semibold 600
  static TextStyle TextF12W600 = TextStyle(
    color: ColorPath.TextGrey1H212121,
    fontFamily: 'Pretendard',
    fontSize: 12.0.sp,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
    height: 1.3,
    letterSpacing: 0,
  );

  /// fontFamily: SUIT
  ///
  /// fontSize: 13
  ///
  /// fontWeight: Regular 400
  static TextStyle TextF13W400 = TextStyle(
    color: ColorPath.TextGrey1H212121,
    fontFamily: 'Pretendard',
    fontSize: 13.0.sp,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
    height: 1.3,
    letterSpacing: 0,
  );

  /// fontFamily: SUIT
  ///
  /// fontSize: 13
  ///
  /// fontWeight: Medium 500
  static TextStyle TextF13W500 = TextStyle(
    color: ColorPath.TextGrey1H212121,
    fontFamily: 'Pretendard',
    fontSize: 13.0.sp,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
    height: 1.3,
    letterSpacing: 0,
  );

  /// fontFamily: SUIT
  ///
  /// fontSize: 13
  ///
  /// fontWeight: Medium 500
  static TextStyle TextF13W500Expand = TextStyle(
    color: ColorPath.TextGrey1H212121,
    fontFamily: 'Pretendard',
    fontSize: 13.0.sp,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
    height: 21 / 13,
    letterSpacing: 0,
  );

  /// fontFamily: SUIT
  ///
  /// fontSize: 14
  ///
  /// fontWeight: Regular 400
  static TextStyle TextF14W400 = TextStyle(
    color: ColorPath.TextGrey1H212121,
    fontFamily: 'Pretendard',
    fontSize: 14.0.sp,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
    height: 1.3,
    letterSpacing: 0,
  );

  /// fontFamily: SUIT
  ///
  /// fontSize: 14
  ///
  /// fontWeight: Medium 500
  static TextStyle TextF14W500 = TextStyle(
    color: ColorPath.TextGrey1H212121,
    fontFamily: 'Pretendard',
    fontSize: 14.0.sp,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
    height: 1.3,
    letterSpacing: 0,
  );

  /// fontFamily: SUIT
  ///
  /// fontSize: 14
  ///
  /// fontWeight: SemiBold 600
  static TextStyle TextF14W600 = TextStyle(
    color: ColorPath.TextGrey1H212121,
    fontFamily: 'Pretendard',
    fontSize: 14.0.sp,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
    height: 1.3,
    letterSpacing: 0,
  );

  /// fontFamily: SUIT
  ///
  /// fontSize: 14
  ///
  /// fontWeight: Regular 400
  static TextStyle TextF14W400Expand = TextStyle(
    color: ColorPath.TextGrey1H212121,
    fontFamily: 'Pretendard',
    fontSize: 14.0.sp,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
    height: 24 / 14,
    letterSpacing: 0,
  );

  /// fontFamily: SUIT
  ///
  /// fontSize: 16
  ///
  /// fontWeight: Regular 400
  static TextStyle TextF16W400 = TextStyle(
    color: ColorPath.TextGrey1H212121,
    fontFamily: 'Pretendard',
    fontSize: 16.0.sp,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
    height: 1.3,
    letterSpacing: 0,
  );

  /// fontFamily: SUIT
  ///
  /// fontSize: 16
  ///
  /// fontWeight: Medium 500
  static TextStyle TextF16W500 = TextStyle(
    color: ColorPath.TextGrey1H212121,
    fontFamily: 'Pretendard',
    fontSize: 16.0.sp,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
    height: 1.3,
    letterSpacing: 0,
  );

  /// fontFamily: SUIT
  ///
  /// fontSize: 16
  ///
  /// fontWeight: Medium 500
  static TextStyle TextF16W500Expand = TextStyle(
    color: ColorPath.TextGrey1H212121,
    fontFamily: 'Pretendard',
    fontSize: 16.0.sp,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
    height: 24 / 16,
    letterSpacing: 0,
  );

  /// fontFamily: SUIT
  ///
  /// fontSize: 16
  ///
  /// fontWeight: Medium 600
  static TextStyle TextF16W600 = TextStyle(
    color: ColorPath.TextGrey1H212121,
    fontFamily: 'Pretendard',
    fontSize: 16.0.sp,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
    height: 1.3,
    letterSpacing: 0,
  );

  /// fontFamily: SUIT
  ///
  /// fontSize: 16
  ///
  /// fontWeight: Medium 600
  static TextStyle TextF16W600White = TextStyle(
    color: ColorPath.TextWhite,
    fontFamily: 'Pretendard',
    fontSize: 16.0.sp,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
    height: 1.3,
    letterSpacing: 0,
  );

  /// fontFamily: SUIT
  ///
  /// fontSize: 16
  ///
  /// fontWeight: Medium 700
  static TextStyle TextF16W700 = TextStyle(
    color: ColorPath.TextGrey1H212121,
    fontFamily: 'Pretendard',
    fontSize: 16.0.sp,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
    height: 1.3,
    letterSpacing: 0,
  );

  /// fontFamily: SUIT
  ///
  /// fontSize: 18
  ///
  /// fontWeight: Regular 600
  static TextStyle TextF18W600 = TextStyle(
    color: ColorPath.TextGrey1H212121,
    fontFamily: 'Pretendard',
    fontSize: 18.0.sp,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
    height: 1.3,
    letterSpacing: 0,
  );

  /// fontFamily: SUIT
  ///
  /// fontSize: 20
  ///
  /// fontWeight: Regular 400
  static TextStyle TextF20W400 = TextStyle(
    color: ColorPath.TextGrey1H212121,
    fontFamily: 'Pretendard',
    fontSize: 20.0.sp,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
    height: 1.3,
    letterSpacing: 0,
  );

  /// fontFamily: SUIT
  ///
  /// fontSize: 20
  ///
  /// fontWeight: Regular 600
  static TextStyle TextF20W600 = TextStyle(
    color: ColorPath.TextGrey1H212121,
    fontFamily: 'Pretendard',
    fontSize: 20.0.sp,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
    height: 1.3,
    letterSpacing: 0,
  );

  /// fontFamily: SUIT
  ///
  /// fontSize: 24
  ///
  /// fontWeight: Regular 600
  static TextStyle TextF24W600 = TextStyle(
    color: ColorPath.TextGrey1H212121,
    fontFamily: 'Pretendard',
    fontSize: 24.0.sp,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
    height: 1.3,
    letterSpacing: 0,
  );
}

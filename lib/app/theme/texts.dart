// ignore_for_file: avoid_classes_with_only_static_members, prefer_const_constructors, slash_for_doc_comments, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

/**
 * * 텍스트 스타일
 * @rule <대표이름><숫자>F<폰트사이즈>W<폰트굵기>
 * @ruleDescription 폰트사이즈 앞에 F, 폰트굵기 앞에 W 처럼 앞에 속성값의 첫번째 스펠링을 넣는다.
 * @example Heading1F24W600
 */

class TextPath {
  /// fontFamily: SUIT
  ///
  /// fontSize: 24
  ///
  /// fontWeight: 600
  static TextStyle Heading1F24W600 = TextStyle(
    color: ColorPath.TextGrey1H212121,
    fontFamily: 'SUIT',
    fontSize: 24.0.sp,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
    height: 24 / 24,
    letterSpacing: 0,
  );

  /// fontFamily: SUIT
  ///
  /// fontSize: 18
  ///
  /// fontWeight: 600
  static TextStyle Heading2F18W600 = TextStyle(
    color: ColorPath.TextGrey1H212121,
    fontFamily: 'SUIT',
    fontSize: 18.0.sp,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
    height: 18 / 18,
    letterSpacing: 0,
  );

  /// fontFamily: SUIT
  ///
  /// fontSize: 16
  ///
  /// fontWeight: 600
  static TextStyle Heading3F16W600 = TextStyle(
    color: ColorPath.TextGrey1H212121,
    fontFamily: 'SUIT',
    fontSize: 16.0.sp,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
    height: 16 / 16,
    letterSpacing: 0,
  );

  /// fontFamily: SUIT
  ///
  /// fontSize: 14
  ///
  /// fontWeight: 600
  static TextStyle Heading4F16W600 = TextStyle(
    color: ColorPath.TextGrey1H212121,
    fontFamily: 'SUIT',
    fontSize: 14.0.sp,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
    height: 16 / 16,
    letterSpacing: 0,
  );

  /// fontFamily: SUIT
  ///
  /// fontSize: 16
  ///
  /// fontWeight: 400
  static TextStyle TextF16W400 = TextStyle(
    color: ColorPath.TextGrey1H212121,
    fontFamily: 'SUIT',
    fontSize: 16.0.sp,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
    height: 16 / 16,
    letterSpacing: 0,
  );

  /// fontFamily: SUIT
  ///
  /// fontSize: 16
  ///
  /// fontWeight: 500
  static TextStyle TextF16W500 = TextStyle(
    color: ColorPath.TextGrey1H212121,
    fontFamily: 'SUIT',
    fontSize: 16.0.sp,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
    height: 16 / 16,
    letterSpacing: 0,
  );

  /// fontFamily: SUIT
  ///
  /// fontSize: 16
  ///
  /// fontWeight: 500
  static TextStyle TextF16W500Expand = TextStyle(
    color: ColorPath.TextGrey1H212121,
    fontFamily: 'SUIT',
    fontSize: 16.0.sp,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
    height: 24 / 16,
    letterSpacing: 0,
  );

  /// fontFamily: SUIT
  ///
  /// fontSize: 14
  ///
  /// fontWeight: 400
  static TextStyle TextF14W400 = TextStyle(
    color: ColorPath.TextGrey1H212121,
    fontFamily: 'SUIT',
    fontSize: 14.0.sp,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
    height: 14 / 14,
    letterSpacing: 0,
  );

  /// fontFamily: SUIT
  ///
  /// fontSize: 14
  ///
  /// fontWeight: 500
  static TextStyle TextF14W500 = TextStyle(
    color: ColorPath.TextGrey1H212121,
    fontFamily: 'SUIT',
    fontSize: 14.0.sp,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
    height: 14 / 14,
    letterSpacing: 0,
  );

  /// fontFamily: SUIT
  ///
  /// fontSize: 14
  ///
  /// fontWeight: 600
  static TextStyle TextF14W600 = TextStyle(
    color: ColorPath.TextGrey1H212121,
    fontFamily: 'SUIT',
    fontSize: 14.0.sp,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
    height: 14 / 14,
    letterSpacing: 0,
  );

  /// fontFamily: SUIT
  ///
  /// fontSize: 14
  ///
  /// fontWeight: 400
  static TextStyle TextF14W400Expand = TextStyle(
    color: ColorPath.TextGrey1H212121,
    fontFamily: 'SUIT',
    fontSize: 14.0.sp,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
    height: 24 / 14,
    letterSpacing: 0,
  );

  /// fontFamily: SUIT
  ///
  /// fontSize: 13
  ///
  /// fontWeight: 400
  static TextStyle TextF13W400 = TextStyle(
    color: ColorPath.TextGrey1H212121,
    fontFamily: 'SUIT',
    fontSize: 13.0.sp,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
    height: 13 / 13,
    letterSpacing: 0,
  );

  /// fontFamily: SUIT
  ///
  /// fontSize: 13
  ///
  /// fontWeight: 500
  static TextStyle TextF13W500 = TextStyle(
    color: ColorPath.TextGrey1H212121,
    fontFamily: 'SUIT',
    fontSize: 13.0.sp,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
    height: 13 / 13,
    letterSpacing: 0,
  );

  /// fontFamily: SUIT
  ///
  /// fontSize: 12
  ///
  /// fontWeight: 400
  static TextStyle TextF12W400 = TextStyle(
    color: ColorPath.TextGrey1H212121,
    fontFamily: 'SUIT',
    fontSize: 12.0.sp,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
    height: 12 / 12,
    letterSpacing: 0,
  );

  /// fontFamily: SUIT
  ///
  /// fontSize: 12
  ///
  /// fontWeight: 500
  static TextStyle TextF12W500 = TextStyle(
    color: ColorPath.TextGrey1H212121,
    fontFamily: 'SUIT',
    fontSize: 12.0.sp,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
    height: 12 / 12,
    letterSpacing: 0,
  );
}

// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

/// 테마
/// 폰트
/// - 작은 사이즈 14
/// - 기본 사이즈 18
/// 버튼
/// - 높이 48
/// 텍스트 폼 필드
/// - 높이 기본

const FONT_FAMILY = 'NotoSansKR';
const double DEFAULT_FONT_SIZE = 16;
const double DEFAULT_FONT_S_SIZE = 14;

/// 메인 테마
ThemeData theme() => ThemeData(
      useMaterial3: true,
      fontFamily: FONT_FAMILY,
      brightness: Brightness.light,
      splashColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      primaryColor: ColorPath.PrimaryColor,
      backgroundColor: Colors.white,
      bottomAppBarColor: Colors.white,
      dividerColor: Colors.grey.shade400,
      disabledColor: ColorPath.GreyColor,
      // selectedRowColor: ColorPath.PrimaryColor,
      unselectedWidgetColor: Colors.grey,
      // hintColor: ColorPath.PrimaryColor,
      // errorColor: ColorPath.ErrorColor,
      // toggleableActiveColor: ColorPath.PrimaryColor,
      appBarTheme: appBarThemeData(),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: ColorPath.PrimaryColor,
        secondary: ColorPath.SecondaryColor,
      ),
      textTheme: textThemeData(),
      inputDecorationTheme: inputDecorationThemeData(),
      buttonTheme: buttonThemeData(),
      checkboxTheme: checkboxThemeData(),
      chipTheme: chipThemeData(),
      elevatedButtonTheme: elevatedButtonThemeData(),
      textButtonTheme: textButtonThemeData(),
      bottomSheetTheme: bottomSheetThemeData(),
      textSelectionTheme: textSelectionThemeData(),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );

/// ExpansionTile 위젯 dividerColor 색상 투명
ThemeData themeExpansionTile() => ThemeData(
      fontFamily: FONT_FAMILY,
      brightness: Brightness.light,
      splashColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      primaryColor: ColorPath.PrimaryColor,
      backgroundColor: Colors.white,
      bottomAppBarColor: Colors.white,
      dividerColor: Colors.transparent,
      disabledColor: ColorPath.GreyColor,
      // selectedRowColor: ColorPath.PrimaryColor,
      unselectedWidgetColor: Colors.grey,
      // hintColor: ColorPath.PrimaryColor,
      // errorColor: ColorPath.ErrorColor,
      // toggleableActiveColor: ColorPath.PrimaryColor,
      appBarTheme: appBarThemeData(),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: ColorPath.PrimaryColor,
        secondary: ColorPath.SecondaryColor,
      ),
      textTheme: textThemeData(),
      inputDecorationTheme: inputDecorationThemeData(),
      buttonTheme: buttonThemeData(),
      checkboxTheme: checkboxThemeData(),
      chipTheme: chipThemeData(),
      elevatedButtonTheme: elevatedButtonThemeData(),
      textButtonTheme: textButtonThemeData(),
      bottomSheetTheme: bottomSheetThemeData(),
      textSelectionTheme: textSelectionThemeData(),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );

/// 다크 테마
ThemeData darkTheme({
  required BuildContext context,
}) =>
    Theme.of(context).copyWith(
      backgroundColor: Colors.white,
      brightness: Brightness.light,
      primaryColor: ColorPath.PrimaryColor,
      scaffoldBackgroundColor: Colors.white,
      splashColor: Colors.white,
      bottomAppBarColor: Colors.white,
      dividerColor: Colors.grey.shade400,
      disabledColor: Colors.grey,
      selectedRowColor: ColorPath.PrimaryColor,
      unselectedWidgetColor: Colors.grey,
      hintColor: ColorPath.PrimaryColor,
      errorColor: ColorPath.ErrorColor,
      toggleableActiveColor: ColorPath.PrimaryColor,
      appBarTheme: appBarThemeData(),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: ColorPath.PrimaryColor,
        secondary: ColorPath.SecondaryColor,
      ),
      textTheme: textThemeData(),
      inputDecorationTheme: inputDecorationThemeData(),
      buttonTheme: buttonThemeData(),
      checkboxTheme: checkboxThemeData(),
      chipTheme: chipThemeData(),
      elevatedButtonTheme: elevatedButtonThemeData(),
      bottomSheetTheme: bottomSheetThemeData(),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );

/// 앱바 테마
AppBarTheme appBarThemeData() => AppBarTheme(
      color: Colors.white,
      foregroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(
        color: ColorPath.BlackColor,
        size: 32,
      ),
      actionsIconTheme: IconThemeData(
        color: ColorPath.BlackColor,
        size: 32,
      ),
      toolbarHeight: 60,
      toolbarTextStyle: TextTheme(
        bodyText2: TextStyle(
          color: ColorPath.BlackColor,
          fontSize: 18,
        ),
      ).bodyText2,
      titleTextStyle: TextTheme(
        headline6: TextStyle(
          color: ColorPath.BlackColor,
          fontSize: 18,
        ),
      ).headline6,
      systemOverlayStyle: SystemUiOverlayStyle.light,
    );

/// 텍스트 위젯 테마
TextSelectionThemeData textSelectionThemeData() => TextSelectionThemeData(
      cursorColor: ColorPath.BlackColor,
      selectionColor: ColorPath.BlackColor,
      selectionHandleColor: ColorPath.BlackColor,
    );

/// 텍스트폼필드 위젯 데코레이션 테마
InputDecorationTheme inputDecorationThemeData() => InputDecorationTheme(
      // 상단 라벨
      labelStyle: TextStyle(
        color: Colors.grey.shade400,
        fontSize: 20,
        fontWeight: FontWeight.normal,
      ),
      // Placeholder
      hintStyle: TextStyle(
        color: ColorPath.PlaceholderColor,
        fontSize: DEFAULT_FONT_SIZE,
        fontWeight: FontWeight.normal,
      ),
      // 하단 도움말
      helperStyle: TextStyle(
        color: ColorPath.PlaceholderColor,
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
      // 하단 오류 메세지
      errorStyle: TextStyle(
        color: ColorPath.ErrorColor,
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
      iconColor: ColorPath.GreyColor,
      prefixIconColor: ColorPath.GreyColor,
      prefixStyle: TextStyle(
        color: Colors.grey.shade400,
      ),
      suffixIconColor: ColorPath.GreyColor,
      suffixStyle: TextStyle(
        color: Colors.grey.shade400,
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
      focusColor: ColorPath.BlackColor,
      hoverColor: ColorPath.BlackColor,
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: ColorPath.ErrorColor,
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: ColorPath.GreyColor,
        ),
      ),
      focusedErrorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: ColorPath.ErrorColor,
        ),
      ),
      disabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: ColorPath.GreyLightColor,
        ),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: ColorPath.GreyColor,
        ),
      ),
      border: UnderlineInputBorder(
        borderSide: BorderSide(
          color: ColorPath.GreyColor,
        ),
      ),
    );

/// 텍스트 위젯 테마
TextTheme textThemeData() => TextTheme(
      // displayLarge:
      // displayMedium:,
      // displaySmall:,
      // headlineLarge:,
      // headlineMedium:,
      // headlineSmall:,
      // titleLarge:,
      // titleMedium:,
      // titleSmall:,
      // bodyLarge:,
      // bodyMedium:,
      // bodySmall:,
      // labelLarge:,
      // labelMedium:,
      // labelSmall:,
      headline1: TextStyle(
        fontFamily: FONT_FAMILY,
        color: ColorPath.BlackColor,
        fontSize: 96.0,
        fontWeight: FontWeight.normal,
      ),
      headline2: TextStyle(
        fontFamily: FONT_FAMILY,
        color: ColorPath.BlackColor,
        fontSize: 60.0,
        fontWeight: FontWeight.normal,
      ),
      headline3: TextStyle(
        fontFamily: FONT_FAMILY,
        color: ColorPath.BlackColor,
        fontSize: 48.0,
        fontWeight: FontWeight.normal,
      ),
      headline4: TextStyle(
        fontFamily: FONT_FAMILY,
        color: ColorPath.BlackColor,
        fontSize: 34.0,
        fontWeight: FontWeight.normal,
      ),
      headline5: TextStyle(
        fontFamily: FONT_FAMILY,
        color: ColorPath.BlackColor,
        fontSize: 24.0,
        fontWeight: FontWeight.normal,
      ),
      headline6: TextStyle(
        fontFamily: FONT_FAMILY,
        color: ColorPath.BlackColor,
        fontSize: 20.0,
        fontWeight: FontWeight.normal,
      ),
      subtitle1: TextStyle(
        fontFamily: FONT_FAMILY,
        color: ColorPath.BlackColor,
        fontSize: 16.0,
        fontWeight: FontWeight.normal,
      ),
      subtitle2: TextStyle(
        fontFamily: FONT_FAMILY,
        color: ColorPath.BlackColor,
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
      ),
      bodyText1: TextStyle(
        fontFamily: FONT_FAMILY,
        color: ColorPath.BlackColor,
        fontSize: DEFAULT_FONT_SIZE,
        fontWeight: FontWeight.normal,
      ),
      bodyText2: TextStyle(
        fontFamily: FONT_FAMILY,
        color: ColorPath.BlackColor,
        fontSize: DEFAULT_FONT_SIZE,
        fontWeight: FontWeight.normal,
      ),
      caption: TextStyle(
        fontFamily: FONT_FAMILY,
        color: ColorPath.BlackColor,
        fontWeight: FontWeight.normal,
      ),
      button: TextStyle(
        fontFamily: FONT_FAMILY,
        color: ColorPath.BlackColor,
        fontSize: DEFAULT_FONT_SIZE,
        fontWeight: FontWeight.normal,
      ),
      overline: TextStyle(
        fontFamily: FONT_FAMILY,
        color: ColorPath.BlackColor,
        fontWeight: FontWeight.normal,
      ),
    );

/// 버튼 위젯 테마
ButtonThemeData buttonThemeData() => ButtonThemeData(
      buttonColor: ColorPath.BlackColor,
      disabledColor: ColorPath.GreyColor,
      focusColor: ColorPath.BlackColor,
      hoverColor: ColorPath.BlackColor,
      highlightColor: ColorPath.BlackColor,
      splashColor: ColorPath.BlackColor,
    );

/// ElevatedButton 버튼 위젯 테마
ElevatedButtonThemeData elevatedButtonThemeData() => ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorPath.PrimaryColor,
        disabledForegroundColor: Colors.grey.withOpacity(0.38),
        disabledBackgroundColor: Colors.grey.withOpacity(0.12),
      ),
    );

/// TextButton 버튼 위젯 테마
TextButtonThemeData textButtonThemeData() => TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: ColorPath.PrimaryColor,
        disabledForegroundColor: Colors.grey.withOpacity(0.38),
      ),
    );

/// 바텀시트 위젯 테마
BottomSheetThemeData bottomSheetThemeData() => const BottomSheetThemeData(
      backgroundColor: Colors.white,
      modalBackgroundColor: Colors.white,
    );

/// 체크박스 위젯 테마
CheckboxThemeData checkboxThemeData() => CheckboxThemeData(
      fillColor: MaterialStateProperty.all(
        ColorPath.PrimaryColor,
      ),
      checkColor: MaterialStateProperty.all(
        Colors.white,
      ),
      overlayColor: MaterialStateProperty.all(
        Colors.orange,
      ),
    );

/// 칩(Chip) 위젯 테마
ChipThemeData chipThemeData() => ChipThemeData(
      backgroundColor: Colors.grey.shade300,
      deleteIconColor: Colors.white,
      disabledColor: Colors.grey,
      selectedColor: ColorPath.PrimaryColor,
      secondarySelectedColor: ColorPath.PrimaryColor,
      // Color? shadowColor,
      // Color? selectedShadowColor,
      showCheckmark: true,
      checkmarkColor: Colors.white,
      labelPadding: EdgeInsets.zero,
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      // BorderSide? side,
      // OutlinedBorder? shape,
      labelStyle: const TextStyle(
        color: Colors.white,
      ),
      secondaryLabelStyle: const TextStyle(
        color: Colors.white,
      ),
      brightness: Brightness.light,
      elevation: 0.0,
      pressElevation: 0.0,
    );

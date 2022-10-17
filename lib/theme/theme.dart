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

const double DEFAULT_FONT_SIZE = 16;
const double DEFAULT_FONT_S_SIZE = 14;

/// 메인 테마
ThemeData theme() => ThemeData(
      useMaterial3: false,
      fontFamily: 'SUIT',
      brightness: Brightness.light,
      splashColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      primaryColor: PrimaryColor,
      backgroundColor: Colors.white,
      bottomAppBarColor: Colors.white,
      dividerColor: Colors.grey.shade400,
      disabledColor: GreyColor,
      // selectedRowColor: PrimaryColor,
      unselectedWidgetColor: Colors.grey,
      // hintColor: PrimaryColor,
      // errorColor: ErrorColor,
      // toggleableActiveColor: PrimaryColor,
      appBarTheme: appBarThemeData(),
      colorScheme: ColorScheme.fromSwatch()
          .copyWith(primary: PrimaryColor, secondary: SecondaryColor),
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
      fontFamily: 'SUIT',
      brightness: Brightness.light,
      splashColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      primaryColor: PrimaryColor,
      backgroundColor: Colors.white,
      bottomAppBarColor: Colors.white,
      dividerColor: Colors.transparent,
      disabledColor: GreyColor,
      // selectedRowColor: PrimaryColor,
      unselectedWidgetColor: Colors.grey,
      // hintColor: PrimaryColor,
      // errorColor: ErrorColor,
      // toggleableActiveColor: PrimaryColor,
      appBarTheme: appBarThemeData(),
      colorScheme: ColorScheme.fromSwatch()
          .copyWith(primary: PrimaryColor, secondary: SecondaryColor),
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
      primaryColor: PrimaryColor,
      scaffoldBackgroundColor: Colors.white,
      splashColor: Colors.white,
      bottomAppBarColor: Colors.white,
      dividerColor: Colors.grey.shade400,
      disabledColor: Colors.grey,
      selectedRowColor: PrimaryColor,
      unselectedWidgetColor: Colors.grey,
      hintColor: PrimaryColor,
      errorColor: ErrorColor,
      toggleableActiveColor: PrimaryColor,
      appBarTheme: appBarThemeData(),
      colorScheme: ColorScheme.fromSwatch()
          .copyWith(primary: PrimaryColor, secondary: SecondaryColor),
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
      iconTheme: IconThemeData(color: BlackColor, size: 32),
      actionsIconTheme: IconThemeData(color: BlackColor, size: 32),
      toolbarHeight: 60,
      toolbarTextStyle: TextTheme(
        bodyText2: TextStyle(color: BlackColor, fontSize: 18),
      ).bodyText2,
      titleTextStyle: TextTheme(
        headline6: TextStyle(color: BlackColor, fontSize: 18),
      ).headline6,
      systemOverlayStyle: SystemUiOverlayStyle.light,
    );

/// 텍스트 위젯 테마
TextSelectionThemeData textSelectionThemeData() => TextSelectionThemeData(
      cursorColor: BlackColor,
      selectionColor: BlackColor,
      selectionHandleColor: BlackColor,
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
        color: PlaceholderColor,
        fontSize: DEFAULT_FONT_SIZE,
        fontWeight: FontWeight.normal,
      ),
      // 하단 도움말
      helperStyle: TextStyle(
        color: PlaceholderColor,
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
      // 하단 오류 메세지
      errorStyle: TextStyle(
        color: ErrorColor,
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
      iconColor: GreyColor,
      prefixIconColor: GreyColor,
      prefixStyle: TextStyle(
        color: Colors.grey.shade400,
      ),
      suffixIconColor: GreyColor,
      suffixStyle: TextStyle(
        color: Colors.grey.shade400,
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
      focusColor: BlackColor,
      hoverColor: BlackColor,
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: ErrorColor),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: GreyColor),
      ),
      focusedErrorBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: ErrorColor),
      ),
      disabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: GreyLightColor),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: GreyColor),
      ),
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: GreyColor),
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
        fontFamily: 'SUIT',
        color: BlackColor,
        fontSize: 96.0,
        fontWeight: FontWeight.normal,
      ),
      headline2: TextStyle(
        fontFamily: 'SUIT',
        color: BlackColor,
        fontSize: 60.0,
        fontWeight: FontWeight.normal,
      ),
      headline3: TextStyle(
        fontFamily: 'SUIT',
        color: BlackColor,
        fontSize: 48.0,
        fontWeight: FontWeight.normal,
      ),
      headline4: TextStyle(
        fontFamily: 'SUIT',
        color: BlackColor,
        fontSize: 34.0,
        fontWeight: FontWeight.normal,
      ),
      headline5: TextStyle(
        fontFamily: 'SUIT',
        color: BlackColor,
        fontSize: 24.0,
        fontWeight: FontWeight.normal,
      ),
      headline6: TextStyle(
        fontFamily: 'SUIT',
        color: BlackColor,
        fontSize: 20.0,
        fontWeight: FontWeight.normal,
      ),
      subtitle1: TextStyle(
        fontFamily: 'SUIT',
        color: BlackColor,
        fontSize: 16.0,
        fontWeight: FontWeight.normal,
      ),
      subtitle2: TextStyle(
        fontFamily: 'SUIT',
        color: BlackColor,
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
      ),
      bodyText1: TextStyle(
        fontFamily: 'SUIT',
        color: BlackColor,
        fontSize: DEFAULT_FONT_SIZE,
        fontWeight: FontWeight.normal,
      ),
      bodyText2: TextStyle(
        fontFamily: 'SUIT',
        color: BlackColor,
        fontSize: DEFAULT_FONT_SIZE,
        fontWeight: FontWeight.normal,
      ),
      caption: TextStyle(
        fontFamily: 'SUIT',
        color: BlackColor,
        fontWeight: FontWeight.normal,
      ),
      button: TextStyle(
        fontFamily: 'SUIT',
        color: BlackColor,
        fontSize: DEFAULT_FONT_SIZE,
        fontWeight: FontWeight.normal,
      ),
      overline: TextStyle(
        fontFamily: 'SUIT',
        color: BlackColor,
        fontWeight: FontWeight.normal,
      ),
    );

/// 버튼 위젯 테마
ButtonThemeData buttonThemeData() => ButtonThemeData(
      buttonColor: BlackColor,
      disabledColor: GreyColor,
      focusColor: BlackColor,
      hoverColor: BlackColor,
      highlightColor: BlackColor,
      splashColor: BlackColor,
    );

/// ElevatedButton 버튼 위젯 테마
ElevatedButtonThemeData elevatedButtonThemeData() => ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: PrimaryColor,
        disabledForegroundColor: Colors.grey.withOpacity(0.38),
        disabledBackgroundColor: Colors.grey.withOpacity(0.12),
      ),
    );

/// TextButton 버튼 위젯 테마
TextButtonThemeData textButtonThemeData() => TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: PrimaryColor,
        disabledForegroundColor: Colors.grey.withOpacity(0.38),
      ),
    );

/// 바텀시트 위젯 테마
BottomSheetThemeData bottomSheetThemeData() => const BottomSheetThemeData(
    backgroundColor: Colors.white, modalBackgroundColor: Colors.white);

/// 체크박스 위젯 테마
CheckboxThemeData checkboxThemeData() => CheckboxThemeData(
      fillColor: MaterialStateProperty.all(PrimaryColor),
      checkColor: MaterialStateProperty.all(Colors.white),
      overlayColor: MaterialStateProperty.all(Colors.orange),
    );

/// 칩(Chip) 위젯 테마
ChipThemeData chipThemeData() => ChipThemeData(
      backgroundColor: Colors.grey.shade300,
      deleteIconColor: Colors.white,
      disabledColor: Colors.grey,
      selectedColor: PrimaryColor,
      secondarySelectedColor: PrimaryColor,
      // Color? shadowColor,
      // Color? selectedShadowColor,
      showCheckmark: true,
      checkmarkColor: Colors.white,
      labelPadding: EdgeInsets.zero,
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      // BorderSide? side,
      // OutlinedBorder? shape,
      labelStyle: const TextStyle(color: Colors.white),
      secondaryLabelStyle: const TextStyle(color: Colors.white),
      brightness: Brightness.light,
      elevation: 0.0,
      pressElevation: 0.0,
    );

// ignore_for_file: constant_identifier_names, non_constant_identifier_names, slash_for_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'color_path.dart';

/**
 * * 테마
 */

/// Primary FontFamily ▼ =========================
const FontFamily = 'NotoSansKR';

/// Primary FontSize ▼ ===========================
const double PrimaryFontSize = 16;

/// Secondary FontSize ▼ =========================
const double SecondaryFontSize = 14;

/// Main Theme ▼ =================================
ThemeData theme() => ThemeData(
      useMaterial3: false,
      fontFamily: FontFamily,
      brightness: Brightness.light,
      splashColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      primaryColor: ColorPath.PrimaryColor,
      primaryColorDark: ColorPath.PrimaryDarkColor,
      primaryColorLight: ColorPath.PrimaryLightColor,
      backgroundColor: Colors.white,
      bottomAppBarColor: Colors.white,
      dividerColor: Colors.grey.shade400,
      disabledColor: ColorPath.DisabledColor,
      // selectedRowColor: ColorPath.PrimaryColor as Color,
      unselectedWidgetColor: Colors.grey,
      // hintColor: ColorPath.PrimaryColor as Color,
      // errorColor: ColorPath.ErrorColor,
      // toggleableActiveColor: ColorPath.PrimaryColor as Color,
      // appBarTheme: appBarThemeData(),
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
      outlinedButtonTheme: outlinedButtonThemeData(),
      textButtonTheme: textButtonThemeData(),
      bottomSheetTheme: bottomSheetThemeData(),
      textSelectionTheme: textSelectionThemeData(),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );

/// ExpansionTile, dividerColor ▼ ================
ThemeData themeExpansionTile() => ThemeData(
      fontFamily: FontFamily,
      brightness: Brightness.light,
      splashColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      primaryColor: ColorPath.PrimaryColor,
      backgroundColor: Colors.white,
      bottomAppBarColor: Colors.white,
      dividerColor: Colors.transparent,
      disabledColor: ColorPath.DisabledColor,
      // selectedRowColor: ColorPath.PrimaryColor as Color,
      unselectedWidgetColor: Colors.grey,
      // hintColor: ColorPath.PrimaryColor as Color,
      // errorColor: ColorPath.ErrorColor,
      // toggleableActiveColor: ColorPath.PrimaryColor as Color,
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

/// Dark Theme ▼ =================================
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
      outlinedButtonTheme: outlinedButtonThemeData(),
      bottomSheetTheme: bottomSheetThemeData(),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );

/// Appbar ▼ =====================================
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
          height: 1.1,
        ),
      ).bodyText2,
      titleTextStyle: TextTheme(
        headline6: TextStyle(
          color: ColorPath.BlackColor,
          fontSize: 18,
          height: 1.1,
        ),
      ).headline6,
      systemOverlayStyle: SystemUiOverlayStyle.light,
    );

/// Text Selection ▼ =============================
TextSelectionThemeData textSelectionThemeData() => TextSelectionThemeData(
      cursorColor: ColorPath.BlackColor,
      selectionColor: ColorPath.BlackColor,
      selectionHandleColor: ColorPath.BlackColor,
    );

/// TextFormField ▼ ==============================
InputDecorationTheme inputDecorationThemeData() => InputDecorationTheme(
      // 상단 라벨
      labelStyle: TextStyle(
        color: Colors.grey.shade400,
        fontSize: 20,
        fontWeight: FontWeight.normal,
        height: 1.1,
      ),
      // Placeholder
      hintStyle: TextStyle(
        color: ColorPath.PlaceholderColor,
        fontSize: PrimaryFontSize,
        fontWeight: FontWeight.normal,
        height: 1.1,
      ),
      // 하단 도움말
      helperStyle: TextStyle(
        color: ColorPath.PlaceholderColor,
        fontSize: 14,
        fontWeight: FontWeight.normal,
        height: 1.1,
      ),
      // 하단 오류 메세지
      errorStyle: TextStyle(
        color: ColorPath.ErrorColor,
        fontSize: 14,
        fontWeight: FontWeight.normal,
        height: 1.1,
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
        height: 1.1,
      ),
      focusColor: ColorPath.FocusedColor,
      hoverColor: ColorPath.BlackColor,
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: ColorPath.ErrorColor,
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: ColorPath.Border1H9E9E9E,
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

/// Text ▼ =======================================
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
      // heading1: TextStyle(
      //   FontFamily,
      //   color: ColorPath.BlackColor as Color,
      //   fontSize: 18.0,
      //   fontWeight: FontWeight.normal,
      //   height: 1.1,
      // ),
      headline1: TextStyle(
        fontFamily: FontFamily,
        color: ColorPath.BlackColor,
        fontSize: 18.0,
        fontWeight: FontWeight.normal,
        height: 1.1,
      ),
      headline2: TextStyle(
        fontFamily: FontFamily,
        color: ColorPath.BlackColor,
        fontSize: 60.0,
        fontWeight: FontWeight.normal,
        height: 1.1,
      ),
      headline3: TextStyle(
        fontFamily: FontFamily,
        color: ColorPath.BlackColor,
        fontSize: 48.0,
        fontWeight: FontWeight.normal,
        height: 1.1,
      ),
      headline4: TextStyle(
        fontFamily: FontFamily,
        color: ColorPath.BlackColor,
        fontSize: 34.0,
        fontWeight: FontWeight.normal,
        height: 1.1,
      ),
      headline5: TextStyle(
        fontFamily: FontFamily,
        color: ColorPath.BlackColor,
        fontSize: 24.0,
        fontWeight: FontWeight.normal,
        height: 1.1,
      ),
      headline6: TextStyle(
        fontFamily: FontFamily,
        color: ColorPath.BlackColor,
        fontSize: 20.0,
        fontWeight: FontWeight.normal,
        height: 1.1,
      ),
      subtitle1: TextStyle(
        fontFamily: FontFamily,
        color: ColorPath.BlackColor,
        fontSize: 16.0,
        fontWeight: FontWeight.normal,
        height: 1.1,
      ),
      subtitle2: TextStyle(
        fontFamily: FontFamily,
        color: ColorPath.BlackColor,
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
        height: 1.1,
      ),
      bodyText1: TextStyle(
        fontFamily: FontFamily,
        color: ColorPath.BlackColor,
        fontSize: PrimaryFontSize,
        fontWeight: FontWeight.normal,
        height: 1.1,
      ),
      // 텍스트 메인
      bodyText2: TextStyle(
        fontFamily: FontFamily,
        color: ColorPath.BlackColor,
        fontSize: PrimaryFontSize,
        fontWeight: FontWeight.normal,
        height: 1.1,
      ),

      caption: TextStyle(
        fontFamily: FontFamily,
        color: ColorPath.BlackColor,
        fontWeight: FontWeight.normal,
        height: 1.1,
      ),
      button: TextStyle(
        fontFamily: FontFamily,
        color: ColorPath.BlackColor,
        fontSize: PrimaryFontSize,
        fontWeight: FontWeight.normal,
        height: 1.1,
      ),
      overline: TextStyle(
        fontFamily: FontFamily,
        color: ColorPath.BlackColor,
        fontWeight: FontWeight.normal,
        height: 1.1,
      ),
    );

/// Button ▼ =====================================
ButtonThemeData buttonThemeData() => ButtonThemeData(
      buttonColor: ColorPath.BlackColor,
      disabledColor: ColorPath.DisabledColor,
      focusColor: ColorPath.BlackColor,
      hoverColor: ColorPath.BlackColor,
      highlightColor: ColorPath.BlackColor,
      splashColor: ColorPath.BlackColor,
    );

/// ElevatedButton ▼ =============================
ElevatedButtonThemeData elevatedButtonThemeData() => ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorPath.PrimaryColor,
        disabledForegroundColor: Colors.grey.withOpacity(0.38),
        disabledBackgroundColor: Colors.grey.withOpacity(0.12),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
        ),
      ),
    );

/// OutlinedButton ▼ =============================
OutlinedButtonThemeData outlinedButtonThemeData() => OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: ColorPath.BackgroundWhite,
        disabledForegroundColor: Colors.grey.withOpacity(0.38),
        disabledBackgroundColor: Colors.grey.withOpacity(0.12),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
        ),
      ),
    );

/// TextButton ▼ =================================
TextButtonThemeData textButtonThemeData() => TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: ColorPath.PrimaryColor,
        disabledForegroundColor: Colors.grey.withOpacity(0.38),
      ),
    );

/// BottomSheet ▼ ================================
BottomSheetThemeData bottomSheetThemeData() => const BottomSheetThemeData(
      backgroundColor: Colors.white,
      modalBackgroundColor: Colors.white,
    );

/// Checkbox ▼ ===================================
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

/// Chip ▼ =======================================
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
        height: 1.1,
      ),
      secondaryLabelStyle: const TextStyle(
        color: Colors.white,
        height: 1.1,
      ),
      brightness: Brightness.light,
      elevation: 0.0,
      pressElevation: 0.0,
    );

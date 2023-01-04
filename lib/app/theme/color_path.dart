import '../utils/color_hex_convert.dart';

/// 컬러 색상표
/// https://material.io/resources/color/#!/?view.left=0&view.right=0&secondary.color=C5CAE9&primary.color=7d63fd&secondary.text.color=FAFAFA
/// 빈도수가 높은 컬러는 기본 설정으로 빼기 (의견)
class ColorPath {
  //  Primary ▼

  /// #2F7ABA
  ///
  /// ![](https://flutter.s3.ap-northeast-2.amazonaws.com/color/2F7ABA.jpg)
  static final PrimaryDarkColor = Color('2F7ABA');

  /// #468CC0
  ///
  /// ![](https://flutter.s3.ap-northeast-2.amazonaws.com/color/468CC0.jpg)
  static final PrimaryColor = Color('468CC0');

  /// #E3F2FD
  ///
  /// ![](https://flutter.s3.ap-northeast-2.amazonaws.com/color/E3F2FD.jpg)
  static final PrimaryLightColor = Color('E3F2FD');

  //  Secondary ▼

  /// #04A8B4
  ///
  /// ![](https://flutter.s3.ap-northeast-2.amazonaws.com/color/04A8B4.jpg)
  static final SecondaryColor = Color('04A8B4');

  /// #CDEEF0
  ///
  /// ![](https://flutter.s3.ap-northeast-2.amazonaws.com/color/CDEEF0.jpg)
  static final SecondaryLightColor = Color('CDEEF0');

  /// #9499b7
  ///
  /// ![](https://flutter.s3.ap-northeast-2.amazonaws.com/color/9499b7.jpg)
  static final SecondaryDarkColor = Color('9499b7');

  /// #FF80AB
  ///
  /// ![](https://flutter.s3.ap-northeast-2.amazonaws.com/color/FF80AB.jpg)
  static final TertiaryColor = Color('FF80AB');

  /// #FFDDD3
  ///
  /// ![](https://flutter.s3.ap-northeast-2.amazonaws.com/color/FFDDD3.jpg)
  static final TertiaryLightColor = Color('FFDDD3');

  //  Text ▼

  /// #FFFFFF
  ///
  /// ![](https://flutter.s3.ap-northeast-2.amazonaws.com/color/FFFFFF.jpg)
  static final TextWhite = Color('FFFFFF');

  /// #212121
  ///
  /// ![](https://flutter.s3.ap-northeast-2.amazonaws.com/color/212121.jpg)
  static final TextGrey1H212121 = Color('212121');

  /// #424242
  ///
  /// ![](https://flutter.s3.ap-northeast-2.amazonaws.com/color/424242.jpg)
  static final TextGrey2H424242 = Color('424242');

  /// #616161
  ///
  /// ![](https://flutter.s3.ap-northeast-2.amazonaws.com/color/616161.jpg)
  static final TextGrey3H616161 = Color('616161');

  /// #9E9E9E
  ///
  /// ![](https://flutter.s3.ap-northeast-2.amazonaws.com/color/9E9E9E.jpg)
  static final TextGrey4H9E9E9E = Color('9E9E9E');

  //  Border ▼

  /// #9E9E9E
  ///
  /// ![](https://flutter.s3.ap-northeast-2.amazonaws.com/color/9E9E9E.jpg)
  static final Border1H9E9E9E = Color('9E9E9E');

  /// #ECEFF1
  ///
  /// ![](https://flutter.s3.ap-northeast-2.amazonaws.com/color/ECEFF1.jpg)
  static final Border2HECEFF1 = Color('ECEFF1');

  /// #E7E7E7
  ///
  /// ![](https://flutter.s3.ap-northeast-2.amazonaws.com/color/E7E7E7.jpg)
  static final Border3E7E7E7 = Color('E7E7E7');

  //  Background ▼

  /// #FFFFFF
  ///
  /// ![](https://flutter.s3.ap-northeast-2.amazonaws.com/color/FFFFFF.jpg)
  static final BackgroundWhite = Color('FFFFFF');

  /// #ECEFF1
  ///
  /// ![](https://flutter.s3.ap-northeast-2.amazonaws.com/color/ECEFF1.jpg)
  static final Background1HECEFF1 = Color('ECEFF1');

  /// #D9D9D9
  ///
  /// ![](https://flutter.s3.ap-northeast-2.amazonaws.com/color/D9D9D9.jpg)
  static final Background2HD9D9D9 = Color('D9D9D9');

  /// #FEE500
  ///
  /// ![](https://flutter.s3.ap-northeast-2.amazonaws.com/color/FEE500.jpg)
  static final Background3HFEE500 = Color('FEE500');

  //  Fucntional Colors ▼

  /// #B00020
  ///
  /// ![](https://flutter.s3.ap-northeast-2.amazonaws.com/color/B00020.jpg)
  static final ErrorColor = Color('B00020');

  /// #e74c3c
  static final ErrorColor2 = Color('e74c3c');

  /// #c0392b
  static final ErrorColor3 = Color('c0392b');

  /// #EB455F
  static final ErrorColor4 = Color('EB455F');

  /// #E81E25
  static final ErrorColor5 = Color('E81E25');

  /// #FFC107
  ///
  /// ![](https://flutter.s3.ap-northeast-2.amazonaws.com/color/FFC107.jpg)
  static final WarningColor = Color('FFC107');

  /// #4CAF50
  ///
  /// ![](https://flutter.s3.ap-northeast-2.amazonaws.com/color/4CAF50.jpg)
  static final SuccessColor = Color('4CAF50');

  /// #2196F3
  ///
  /// ![](https://flutter.s3.ap-northeast-2.amazonaws.com/color/2196F3.jpg)
  static final FocusedColor = Color('2196F3');

  ///  PlaceHolder ▼

  /// #BDBDBD
  ///
  /// ![](https://flutter.s3.ap-northeast-2.amazonaws.com/color/BDBDBD.jpg)
  static final PlaceholderColor = Color('BDBDBD');

  ///  Disabled ▼

  /// #BDBDBD
  ///
  /// ![](https://flutter.s3.ap-northeast-2.amazonaws.com/color/BDBDBD.jpg)
  static final DisabledColor = Color('BDBDBD');

  //  Etc ▼

  /// #383A3F
  ///
  /// ![](https://flutter.s3.ap-northeast-2.amazonaws.com/color/383A3F.jpg)
  static final BlackColor = Color('383A3F');

  /// #424242
  ///
  /// ![](https://flutter.s3.ap-northeast-2.amazonaws.com/color/424242.jpg)
  static final TextBodyColor = Color('424242');

  /// #E0E0E0
  ///
  /// ![](https://flutter.s3.ap-northeast-2.amazonaws.com/color/E0E0E0.jpg)
  static final GreyColor = Color('E0E0E0');

  /// #EEEEEE
  ///
  /// ![](https://flutter.s3.ap-northeast-2.amazonaws.com/color/EEEEEE.jpg)
  static final GreyLightColor = Color('EEEEEE');

  /// #757575
  ///
  /// ![](https://flutter.s3.ap-northeast-2.amazonaws.com/color/757575.jpg)
  static final GreyDarkColor = Color('757575');

  /// #cccccc
  ///
  /// ![](https://flutter.s3.ap-northeast-2.amazonaws.com/color/cccccc.jpg)
  static final GrayCCCColor = Color('cccccc');

  /// #333333
  ///
  /// ![](https://flutter.s3.ap-northeast-2.amazonaws.com/color/333333.jpg)
  static final Gray333Color = Color('333333');

  /// #2F7ABA
  ///
  /// ![](https://flutter.s3.ap-northeast-2.amazonaws.com/color/2F7ABA.jpg)
  static final Blue2F7ABAColor = Color('2F7ABA');
}

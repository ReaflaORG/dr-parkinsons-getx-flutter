import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/color_path.dart';
import '../../../theme/text_path.dart';

/// 약재 설명 : 이미지 + 설명글
///
/// [assest] String 이미지
///
/// [text] String 설명글
class MedicineImageItem extends StatelessWidget {
  final String? assest;
  final String text;

  const MedicineImageItem({
    super.key,
    this.assest,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (assest != null)
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(bottom: 6).w,
            child: Image.asset(
              assest!,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width * .35.w,
              // height: 70.w,
            ),
          ),
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(bottom: 12).w,
          child: Text(
            text,
            style: TextPath.TextF13W400.copyWith(
              color: ColorPath.TextGrey2H424242,
            ),
          ),
        ),
      ],
    );
  }
}

/// 약재 제목 위젯
///
/// [text] String
class MedicineItemTitleWidget extends StatelessWidget {
  final String text;

  const MedicineItemTitleWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 34.w,
      child: Text(
        text,
        textAlign: TextAlign.left,
        style: TextPath.TextF14W400.copyWith(
          color: ColorPath.TextGrey4H9E9E9E,
        ),
      ),
    );
  }
}

/// 약재 설명 위젯
///
/// [text] String
class MedicineItemDescriptionWidget extends StatelessWidget {
  final String text;

  const MedicineItemDescriptionWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: TextPath.TextF14W400Expand.copyWith(
            color: ColorPath.TextGrey1H212121),
      ),
    );
  }
}

/// 약재 정보 라벨1 위젯
///
/// [text] String
///
/// 약재 정보 라벨2 위젯과 다른 점은 폰트 색상이 다르다.
class MedicineItemLabel1Widget extends StatelessWidget {
  final String text;

  const MedicineItemLabel1Widget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 30.w,
      child: Text(
        text,
        style: TextPath.TextF14W500.copyWith(
          color: ColorPath.TextGrey1H212121,
        ),
      ),
    );
  }
}

/// 약재 정보 라벨2 위젯
///
/// [text] String
///
/// 약재 정보 라벨1 위젯과 다른 점은 폰트 색상이 다르다.
class MedicineItemLabel2Widget extends StatelessWidget {
  final String text;

  const MedicineItemLabel2Widget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(bottom: 6).w,
      height: 30.w,
      child: Text(
        text,
        style: TextPath.TextF14W500.copyWith(
          color: ColorPath.PrimaryDarkColor,
        ),
      ),
    );
  }
}

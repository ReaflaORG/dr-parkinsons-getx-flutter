import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../globals/global_dialog_widget.dart';
import '../../../globals/global_inkwell_widget.dart';
import '../../../globals/global_toast_widget.dart';
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
            padding: const EdgeInsets.symmetric(vertical: 10).w,
            child: Image.asset(
              assest!,
              width: MediaQuery.of(context).size.width,
              cacheWidth: 640,
              // cacheHeight: 349,
              fit: BoxFit.cover,
            ),
          ),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(
            top: 0,
            bottom: 10,
          ).w,
          child: Text(
            '<$text>',
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
      padding: const EdgeInsets.only(
        top: 10,
        bottom: 0,
      ).w,
      child: Text(
        text,
        textAlign: TextAlign.left,
        style: TextPath.TextF18W600.copyWith(
          color: ColorPath.BlackColor,
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
      padding: const EdgeInsets.symmetric(vertical: 10).w,
      child: Text(
        text,
        style: TextPath.TextF16W400.copyWith(
          color: ColorPath.TextGrey3H616161,
        ),
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
      padding: const EdgeInsets.only(
        top: 10,
        bottom: 0,
      ).w,
      child: Text(
        text,
        style: TextPath.TextF16W500.copyWith(
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
      padding: const EdgeInsets.symmetric(vertical: 10).w,
      child: Text(
        text,
        style: TextPath.TextF16W500.copyWith(
          color: ColorPath.PrimaryDarkColor,
        ),
      ),
    );
  }
}

// 약제 정보 테이블
class MedicineItemTableWidget extends StatelessWidget {
  final Map<int, TableColumnWidth>? columnWidths;
  final TableBorder? border;
  final List<TableRow> children;

  const MedicineItemTableWidget({
    super.key,
    this.columnWidths,
    this.border,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0).w,
      child: Table(
        columnWidths: columnWidths ??
            {
              1: FlexColumnWidth(1.2.w),
              2: FlexColumnWidth(0.6.w),
            },
        border: border ??
            TableBorder.all(
              color: Colors.grey.shade300,
            ),
        children: children,
      ),
    );
  }
}

// 출처
class CopyrightWidget extends StatelessWidget {
  const CopyrightWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 40,
        bottom: 30,
      ).w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '이 문서는 일반 정보 목적으로 제공되며, 어떠한 의학적 조언도 제공하지 않습니다. 이 문서에 포함된 정보를 사용함으로 인해 발생하는 어떠한 문제에 대해서도 저희는 책임지지 않습니다. 모든 의학적 문제에 대해서는 전문의와 상담하시기 바랍니다.',
            style: TextPath.TextF12W400.copyWith(
              color: ColorPath.TextGrey4H9E9E9E,
            ),
          ),
          SizedBox(height: 10.w),
          GlobalInkWellWidget(
            onTap: () async {
              GlobalConfirmModalWidget(
                title: '링크 열기',
                content: '열기를 누르면 약학정보원 홈페이지로 이동합니다.',
                okText: '열기',
                okOnPressed: () async {
                  Get.back();

                  if (!await launchUrl(
                    Uri.parse('https://www.health.kr'),
                  )) {
                    GlobalToastWidget('잠시 후 다시 시도해주세요');
                  }
                },
              );
            },
            child: Text(
              '출처: 약학정보원 (https://www.health.kr)',
              style: TextPath.TextF12W400.copyWith(
                color: ColorPath.TextGrey4H9E9E9E,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

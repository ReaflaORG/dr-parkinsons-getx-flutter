import 'package:dr_parkinsons/app/globals/global_toast_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../globals/global_dialog_widget.dart';
import '../../../globals/global_inkwell_widget.dart';
import '../../../theme/color_path.dart';
import 'medicine_item.dart';

/// 도파민제 약제 설명 페이지
class MedicineInfoDopaminePage extends StatelessWidget {
  final String url =
      'https://www.health.kr/searchDrug/result_drug.asp?drug_cd=';

  const MedicineInfoDopaminePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const MedicineItemTitleWidget(text: '약제명'),
        const MedicineItemDescriptionWidget(
          text: '도파민제',
        ),
        SizedBox(height: 20.w),
        const MedicineItemTitleWidget(text: '설명'),
        const MedicineItemDescriptionWidget(
          text:
              '파킨슨병은 도파민의 부족 혹은 결핍으로 인해 발생하는 질환으로 파킨슨병에 대한 치료제는 이 부족한 도파민을 보충해주는 것으로 도파민제는 가장 근간이 되는 파킨슨 치료제이다.\r\n\r\n약물이 뇌 속으로 들어가기위한 혈액뇌장벽을 통과해야 하는데 도파민은 통과가 되지 않으므로 도파민으로 만들어지기 전 단계의 물질인 전구체, 레보도파를 복용한다.\r\n\r\n레보도파는 파킨슨 치료 약물중 가장 운동 개선 효과가 뛰어나며 부작용이 적다.\r\n\r\n레보도파가 뇌에 도달하기전에 도파민으로 활성화 되는 것을 막기위해서 방향족 L-아미노산 탈카복실화효소 (Aromatic L-amino acid decarboxylase, DOPA decarboxylase)를 억제하는 카르비도파, 벤세라지드와 같은 DOPA decarboxylase inhibitor 를 결합해서 복용하도록 한다.',
        ),
        SizedBox(height: 20.w),
        const MedicineItemTitleWidget(text: '부작용'),
        const MedicineItemDescriptionWidget(
          text:
              '오심, 구토, 어지러움, 식욕부진, 환각, 망상, 기립성 저혈압, 졸림, 이상운동증, 도파민 조절장애, 충동조절장애 등',
        ),
        SizedBox(height: 20.w),
        const MedicineItemTitleWidget(text: '종류'),
        const MedicineItemLabel1Widget(text: '레보도파 일반형'),
        const MedicineItemDescriptionWidget(
          text:
              '소장상부에서 흡수되어 복용 1시간후 최고 혈중농도 도달한다. 신속한 작용을 위해서 가능하다면 식전 30분~ 1시간 또는 식후 1-2시간후 복용 권장한다.',
        ),
        SizedBox(height: 20.w),
        const MedicineItemLabel1Widget(text: '퍼킨슨 일반정'),
        const MedicineImageItem(
          assest: 'assets/images/medicine/pill0101.webp',
          text: '레보도파 100mg, 카르비도파수화물 27mg',
        ),
        const MedicineImageItem(
          assest: 'assets/images/medicine/pill0102.webp',
          text: '레보도파 250mg, 카르비도파수화물 27mg',
        ),
        SizedBox(height: 20.w),
        const MedicineItemLabel1Widget(text: '명도파 일반정'),
        const MedicineImageItem(
          assest: 'assets/images/medicine/pill0103.webp',
          text: '레보도파 100mg, 벤세라지드염산염 28.5mg',
        ),
        const MedicineImageItem(
          assest: 'assets/images/medicine/pill0104.webp',
          text: '레보도파 200mg, 벤세라지드염산염 28.5mg',
        ),
        SizedBox(height: 20.w),
        const MedicineItemTitleWidget(text: '출처'),
        MedicineItemTableWidget(
          columnWidths: {
            1: FlexColumnWidth(0.17.w),
          },
          children: [
            TableRow(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0).w,
                  alignment: Alignment.centerLeft,
                  height: 48,
                  child: const Text('퍼킨정25/100mg'),
                ),
                GlobalInkWellWidget(
                  onTap: () async {
                    GlobalConfirmModalWidget(
                      title: '링크 열기',
                      content: '열기를 누르면 약학정보원 홈페이지로 이동합니다.',
                      okText: '열기',
                      okOnPressed: () async {
                        Get.back();

                        if (!await launchUrl(
                          Uri.parse('${url}A11A0920A0216'),
                        )) {
                          GlobalToastWidget('잠시 후 다시 시도해주세요');
                        }
                      },
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: Get.width,
                    height: 48,
                    child: Text(
                      '링크',
                      style: TextStyle(
                        color: ColorPath.PrimaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0).w,
                  alignment: Alignment.centerLeft,
                  height: 48,
                  child: const Text('퍼킨정25/250mg'),
                ),
                GlobalInkWellWidget(
                  onTap: () async {
                    if (!await launchUrl(
                      Uri.parse('${url}A11A0920A0216'),
                    )) {
                      GlobalToastWidget('잠시 후 다시 시도해주세요');
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: Get.width,
                    height: 48,
                    child: Text(
                      '링크',
                      style: TextStyle(
                        color: ColorPath.PrimaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0).w,
                  alignment: Alignment.centerLeft,
                  height: 48,
                  child: const Text('명도파정25/100mg'),
                ),
                GlobalInkWellWidget(
                  onTap: () async {
                    if (!await launchUrl(
                      Uri.parse('${url}2021060400005'),
                    )) {
                      GlobalToastWidget('잠시 후 다시 시도해주세요');
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: Get.width,
                    height: 48,
                    child: Text(
                      '링크',
                      style: TextStyle(
                        color: ColorPath.PrimaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0).w,
                  alignment: Alignment.centerLeft,
                  height: 48,
                  child: const Text('명도파정25/200mg'),
                ),
                GlobalInkWellWidget(
                  onTap: () async {
                    if (!await launchUrl(
                      Uri.parse('${url}2021051700004'),
                    )) {
                      GlobalToastWidget('잠시 후 다시 시도해주세요');
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: Get.width,
                    height: 48,
                    child: Text(
                      '링크',
                      style: TextStyle(
                        color: ColorPath.PrimaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        const CopyrightWidget(),
      ],
    );
  }
}

import 'package:dr_parkinsons/app/globals/global_inkwell_widget.dart';
import 'package:dr_parkinsons/app/modules/medicine/widget/medicine_item.dart';
import 'package:dr_parkinsons/app/theme/color_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../globals/global_dialog_widget.dart';
import '../../../globals/global_toast_widget.dart';

/// 복합제 약제 설명 페이지
class MedicineInfoComplexPage extends StatelessWidget {
  final String url =
      'https://www.health.kr/searchDrug/result_drug.asp?drug_cd=';

  const MedicineInfoComplexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const MedicineItemTitleWidget(text: '약제명'),
        const MedicineItemDescriptionWidget(
          text: '레보도파 엔타카폰 복합제',
        ),
        SizedBox(height: 20.w),
        const MedicineItemTitleWidget(text: '설명'),
        const MedicineItemDescriptionWidget(
          text:
              '레보도파/도파탈탄산효소(Dopadecarboxylase) 억제제 표준치료제로 개선되지 않는 파킨슨병 환자의 운동 동요증상의 치료제로 쓰이며 약효소진 증상의 호전과 악화된 파킨슨 증상을 감소 시킬 수 있다.',
        ),
        SizedBox(height: 20.w),
        const MedicineItemTitleWidget(text: '부작용'),
        const MedicineItemDescriptionWidget(
          text: '구토, 설사, 혼돈, 환각, 비정상적인 꿈, 색뇨증, 빈혈, 식욕감퇴, 이상운동증 등',
        ),
        SizedBox(height: 20.w),
        const MedicineItemTitleWidget(text: '종류'),
        const MedicineImageItem(
          assest: 'assets/images/medicine/pill0201.webp',
          text: '레보도파/카르비도파/엔타카폰 50/12.5/200',
        ),
        const MedicineImageItem(
          assest: 'assets/images/medicine/pill0202.webp',
          text: '레보도파/카르비도파/엔타카폰 75/18.75/200',
        ),
        const MedicineImageItem(
          assest: 'assets/images/medicine/pill0203.webp',
          text: '레보도파/카르비도파/엔타카폰 100/25/200',
        ),
        const MedicineImageItem(
          assest: 'assets/images/medicine/pill0204.webp',
          text: '레보도파/카르비도파/엔타카폰 125/31.25/200',
        ),
        const MedicineImageItem(
          assest: 'assets/images/medicine/pill0205.webp',
          text: '레보도파/카르비도파/엔타카폰 150/37.7/200',
        ),
        const MedicineImageItem(
          assest: 'assets/images/medicine/pill0206.webp',
          text: '레보도파/카르비도파/엔타카폰 200/50/200',
        ),
        SizedBox(height: 20.w),
        const MedicineItemLabel2Widget(text: '레보도파 그외'),
        MedicineItemTableWidget(
          children: [
            TableRow(
              decoration: BoxDecoration(
                color: Colors.grey.shade200.withOpacity(0.5),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text('제조사'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '이름',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '용량',
                  ),
                ),
              ],
            ),
            TableRow(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text('알보젠코리아'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '스타레보필름코팅정',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '-',
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '제일약품',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '트리도파정',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '-',
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '일화',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '이지레보',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '-',
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '명인제약',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '트리레보정',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '-',
                  ),
                ),
              ],
            ),
          ],
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
                  child: const Text('스타레보필름코팅정50/12.5/200mg'),
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
                          Uri.parse('${url}A11AOOOOO4881'),
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
                  child: const Text('스타레보필름코팅정75/18.75/200mg'),
                ),
                GlobalInkWellWidget(
                  onTap: () async {
                    if (!await launchUrl(
                      Uri.parse('${url}2009120800004'),
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
                  child: const Text('스타레보필름코팅정100/25/200mg'),
                ),
                GlobalInkWellWidget(
                  onTap: () async {
                    if (!await launchUrl(
                      Uri.parse('${url}A11AOOOOO4880'),
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
                  child: const Text('스타레보필름코팅정125/31.25/200mg'),
                ),
                GlobalInkWellWidget(
                  onTap: () async {
                    if (!await launchUrl(
                      Uri.parse('${url}2009120800015'),
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
                  child: const Text('스타레보필름코팅정150/37.5/200mg'),
                ),
                GlobalInkWellWidget(
                  onTap: () async {
                    if (!await launchUrl(
                      Uri.parse('${url}A11AOOOOO5482'),
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
                  child: const Text('스타레보필름코팅정200/50/200mg'),
                ),
                GlobalInkWellWidget(
                  onTap: () async {
                    if (!await launchUrl(
                      Uri.parse('${url}A11AKP08G3747'),
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

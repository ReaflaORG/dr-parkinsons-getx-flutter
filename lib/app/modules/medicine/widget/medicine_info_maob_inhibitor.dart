import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widget/medicine_item.dart';

/// 마오비 억제제 약제 설명 페이지
class MedicineInfoMaobInhibitorPage extends StatelessWidget {
  const MedicineInfoMaobInhibitorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const MedicineItemTitleWidget(text: '약제명'),
        const MedicineItemDescriptionWidget(
          text: '마오비 억제제',
        ),
        SizedBox(height: 20.w),
        const MedicineItemTitleWidget(text: '설명'),
        const MedicineItemDescriptionWidget(
          text:
              '마오비 억제제는 레보도파가 뇌에서 마오비로 인해 대사되는 것을 막아서 레보도파의 효능을 증진시키고, 도파민이 신경계에 더 오래 남아있을 수 있도록 돕는 약제이다.\r\n\r\n현재 국내에서 사용가능한 마오비 억제제는 1세대 셀레길린, 2세대 라사질린, 최근 도입된 3세대 사피나마이드가 있다.',
        ),
        SizedBox(height: 20.w),
        const MedicineItemTitleWidget(text: '부작용'),
        const MedicineItemDescriptionWidget(
          text: '구역, 어지러움, 불면, 이상운동증, 환각, 기립성저혈압 등',
        ),
        SizedBox(height: 20.w),
        const MedicineItemTitleWidget(text: '종류'),
        const MedicineItemLabel1Widget(text: '1. 셀레길린'),
        const MedicineImageItem(
          assest: 'assets/images/medicine/pill0501.webp',
          text: '마오비정 5mg',
        ),
        // SizedBox(height: 20.w),
        // const MedicineItemLabel2Widget(text: '셀레길린 그외'),
        // MedicineItemTableWidget(
        //   columnWidths: {
        //     1: FlexColumnWidth(0.8.w),
        //     2: FlexColumnWidth(0.3.w),
        //   },
        //   children: [
        //     TableRow(
        //       decoration: BoxDecoration(
        //         color: Colors.grey.shade200.withOpacity(0.5),
        //       ),
        //       children: [
        //         Padding(
        //           padding: const EdgeInsets.all(8.0).w,
        //           child: const Text('제조사'),
        //         ),
        //         Padding(
        //           padding: const EdgeInsets.all(8.0).w,
        //           child: const Text(
        //             '이름',
        //           ),
        //         ),
        //         Padding(
        //           padding: const EdgeInsets.all(8.0).w,
        //           child: const Text(
        //             '용량',
        //           ),
        //         ),
        //       ],
        //     ),
        //     TableRow(
        //       decoration: const BoxDecoration(
        //         color: Colors.white,
        //       ),
        //       children: [
        //         Padding(
        //           padding: const EdgeInsets.all(8.0).w,
        //           child: const Text('초당약품공업'),
        //         ),
        //         Padding(
        //           padding: const EdgeInsets.all(8.0).w,
        //           child: const Text(
        //             '마오비정',
        //           ),
        //         ),
        //         Padding(
        //           padding: const EdgeInsets.all(8.0).w,
        //           child: const Text(
        //             '-',
        //           ),
        //         ),
        //       ],
        //     ),
        //   ],
        // ),
        SizedBox(height: 20.w),
        const MedicineItemLabel1Widget(text: '2. 라자질린'),
        const MedicineImageItem(
          assest: 'assets/images/medicine/pill0502.webp',
          text: '아질렉트 0.5mg',
        ),
        const MedicineImageItem(
          assest: 'assets/images/medicine/pill0503.webp',
          text: '아질렉트정 1mg',
        ),
        SizedBox(height: 20.w),
        const MedicineItemLabel2Widget(text: '라자질린 그외'),
        MedicineItemTableWidget(
          columnWidths: {
            1: FlexColumnWidth(0.9.w),
            2: FlexColumnWidth(0.3.w),
          },
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
                  child: const Text('한국룬드벡'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '아질렉트',
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
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text('한국파마'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '파카라사길린정',
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
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text('이연제약'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '이연라사길린메실산염정',
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
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text('한화제약'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '한화라사길린정',
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
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text('한국유니온제약'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '유니온라사길린정',
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
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text('녹십자'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '녹십자라사길린정',
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
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text('보령'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '보령라사길린정',
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
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text('삼성제약'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '삼성라사길린정',
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
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text('한국글로벌제약'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '라사민정',
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
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text('유유제약'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '유렉트정',
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
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text('에이치엘비제약'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '라사렉트정',
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
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text('고려제약'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '라질렌정',
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
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text('경보제약'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '파키스정',
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
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text('파마사이언스코리아'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '라사렉트정',
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
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text('대웅바이오'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '아질라사정',
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
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text('환인제약'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '라사핀정',
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
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text('하나제약'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '뉴질렉트정',
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
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text('현대약품'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '라사질트',
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
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text('명인제약'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '라사린정',
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
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text('종근당'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '에도파벨정',
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
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text('대웅제약'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '베아렉트정',
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
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text('초당약품공업'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '마오렉스정',
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
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text('셀트리온제약'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '셀파린정',
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
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text('한국프라임제약'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '라사트정',
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
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text('한국파비스제약'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '알사킨정',
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
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text('메디카코리아'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '라사길정',
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
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text('대우제약'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '파질렉트정',
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
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text('일화'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '마오렉트정',
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
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text('한풍제약'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '라사갈린정',
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
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text('삼일제약'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '길렉트정',
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
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text('마더스제약'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '이지렉트정',
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
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text('제일제약'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '라사원정',
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
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text('안국뉴팜'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '라시렉트정',
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
        const MedicineItemLabel1Widget(text: '3. 사파나마이드'),
        const MedicineItemDescriptionWidget(
            text:
                '사파나마이드는 3세대 마오비 억제제로 dural 작용기전을 가지고 있어, 이전 세대의 MAO-B 억제제와는 차별적으로 Dopaminergic 경로 뿐만 아니라 glutamate 경로를 조절함으로서 진통제사용감소, 기분 개선, 삶의 질 개선 등의 비운동증상 개선에 도움이 된다.'),
        SizedBox(height: 20.w),
        const MedicineImageItem(
          assest: 'assets/images/medicine/pill0504.webp',
          text: '에퀴피나필름코팅정 50mg',
        ),
        SizedBox(height: 20.w),
        const MedicineItemLabel2Widget(text: '사파나마이드 그외'),
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
                  child: const Text('한국에자이'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '에퀴피나필름코팅정',
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
        const CopyrightWidget(),
      ],
    );
  }
}

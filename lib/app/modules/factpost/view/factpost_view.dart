import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../theme/colors.dart';
import '../../../theme/texts.dart';
import '../controller/factpost_controller.dart';

class FactPostView extends GetView<FactPostController> {
  const FactPostView({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          body: Container(
            child: SingleChildScrollView(
              child: Column(children: [
                Stack(children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 8,
                    ),
                    width: double.infinity,
                    height: 242,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage(
                              'assets/images/mock/page2/factpost 360x242.jpg'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(16)),
                  ),
                  Positioned(
                    left: 20,
                    top: 12,
                    child: InkWell(
                      onTap: () => Get.back(),
                      child: SizedBox(
                        width: 36.w,
                        height: 36.h,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.arrow_back,
                            size: 24,
                            color: ColorPath.TextGrey1H212121,
                          ),
                        ),
                      ),
                    ),
                  )
                ]),
                const SizedBox(
                  height: 24,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '파킨슨 병과 치료과정 소개',
                        style: TextPath.Heading2F18W600.copyWith(
                            color: ColorPath.TextGrey1H212121),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        '22.10.11',
                        style: TextPath.TextF12W500.copyWith(
                            color: ColorPath.TextGrey4H9E9E9E),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        height: 552.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "'노인장기요양보험법'에 따라, 고령이나 노인성 질병 때문에 일상생활을 혼자서 수행하기 어려운 노인들에게 신체활동 또는 가사활동 지원 등을 제공하여 건강증진과 생활안정을 도모하고 그 가족의 부담을 덜어주려는 목적으로 시행하는 ‘사회보험제도’입니다. 국민건강보험공단이 관리 운영하고, 건강보험제도와는 별개로 운영되고 있습니다.",
                              style: TextPath.TextF14W400Expand.copyWith(
                                  color: ColorPath.TextGrey2H424242),
                            ),
                            Text(
                                style: TextPath.TextF14W400Expand.copyWith(
                                    color: ColorPath.TextGrey2H424242),
                                '대상자는 65세 이상 어르신 또는 65세 미만자 중 치매, 뇌졸중, 파킨슨병 등 노인성 질병으로 6개월 이상의 기간 동안 혼자서 일상생활을 수행하기 어려우신 분으로, 등급판정기준에 따라 장기요양 1등급~5등급을 인정받는 자입니다.'),
                            Text(
                                style: TextPath.TextF14W400Expand.copyWith(
                                    color: ColorPath.TextGrey2H424242),
                                '이용절차는, 전국 국민건강보험공단 지사 (노인장기요양보험 운영센터)에 신청-->공단직원이 댁으로 방문 조사하여 등급판정위원회에서 장기요양 인정 및 등급판정 --> (1~5등급 및 등급 외)이 확정되면, 장기요양인정서 및 표준 장기이용 계획서 등을 신청자가 수령--> 급여종류 및 내용에 따라 적절한 장기요양기관을 선택--> 계약체결 후에 장기요양급여 서비스를 이용.'),
                            Text(
                              "공단에 먼저 신청을 하시고나서 공단에서 요청받으신 날짜에 맞추어 담당 주치의사에게 장기요양소견서를 발급받으셔야 합니다. (치매학회 발췌)",
                              style: TextPath.TextF14W400Expand.copyWith(
                                  color: ColorPath.TextGrey2H424242),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ),
      );
}

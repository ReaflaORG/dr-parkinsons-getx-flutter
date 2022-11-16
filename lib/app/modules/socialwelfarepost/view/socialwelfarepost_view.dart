import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../theme/colors.dart';
import '../../../theme/texts.dart';
import '../controller/socialwelfarepost_controller.dart';

class SocialWelfarePostView extends GetView<SocialWelfarePostController> {
  const SocialWelfarePostView({super.key});

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
                        '장기요양보험 안내',
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
                        height: 504.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              '고령이나 노인성 질병 등의 사유로 일상생활을 혼자서 수행하기 어려운 노인 등에게 신체활동 또는 가사활동 지원 등의 장기요양급여를 제공하는 사회보험제도입니다. 보통 만65세 이상 노인이 대상이지만, 파킨슨병 환자는 65세 이하라도 노인성 질병으로 분류되어 신청할 수 있습니다.',
                              style: TextPath.TextF16W400.copyWith(
                                  color: ColorPath.TextGrey2H424242),
                            ),
                            Text(
                                style: TextPath.TextF14W400Expand.copyWith(
                                    color: ColorPath.TextGrey2H424242),
                                '노인장기요양보험 신청은 국민건강보험공단 지사에 직접 방문하거나 우편, 팩스, 인터넷 접수 물론 앱으로도 가능합니다. 신청이 되면 담당자가 인정조사를 하기 위해 환자를 방문하고, 이후 공단이 안내한 의사소견서발급의뢰서를 가지고 병원에 가서 담당 의사로부터 의사소견서를 발급받아 국민건강보험공단에 제출합니다. 이 경우 소견서 발급비용 일부를 공단이 부담합니다. 물론 이것도 기한 만료가 있고, 그때마다 공단에서 미리 알려주므로 기한 내 갱신 절차를 밟으면 됩니다.'),
                            Text(
                                style: TextPath.TextF14W400Expand.copyWith(
                                    color: ColorPath.TextGrey2H424242),
                                '국민건강보험 공단 홈페이지로 접속하여 노인장기요양보험으로 들어가서 확인하세요.'),
                            Text(
                              '국민건강보험공단 장기요양보험 - [https://www.longtermcare.or.kr]',
                              style: TextPath.TextF14W400Expand.copyWith(
                                  color: ColorPath.TextGrey2H424242),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 91)
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ),
      );
}

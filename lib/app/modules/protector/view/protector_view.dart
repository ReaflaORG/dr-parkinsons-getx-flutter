import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../theme/color_path.dart';
import '../../../theme/texts.dart';
import '../controller/protector_controller.dart';
import '../widget/protector_card_widget.dart';

/// 보호자 알림 서비스 페이지
class ProtectorView extends GetView<ProtectorController> {
  const ProtectorView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '보호자 알림 서비스',
            style: TextPath.Heading2F18W600.copyWith(
              color: ColorPath.TextGrey1H212121,
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_rounded,
              color: ColorPath.TextGrey1H212121,
            ),
          ),
          centerTitle: true,
          backgroundColor: ColorPath.Background1HECEFF1,
          elevation: 0,
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          color: ColorPath.Background1HECEFF1,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 56.w),
                Text(
                  '보호자 알림 설정 체크리스트',
                  style: TextPath.Heading1F24W600.copyWith(
                    color: ColorPath.TextGrey1H212121,
                  ),
                ),
                SizedBox(height: 32.w),
                const ProtectorCardWidget(
                  num: 1,
                  title: '주치의 찾기 > 의사명을 검색',
                  sub: '주치의 체크하기',
                ),
                const ProtectorCardWidget(
                  num: 2,
                  title: '내 정보 > 긴급 연락처 관리',
                  sub: '보호자 연락처를 입력해주세요',
                ),
                const ProtectorCardWidget(
                  num: 3,
                  title: '내 정보 > 알림 동의',
                  sub: '보호자 연락 동의를 해주세요',
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  width: 320.w,
                  // height: 150.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10).r,
                    color: ColorPath.Background1HECEFF1,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 36.w,
                        height: 36.w,
                        child: CircleAvatar(
                          backgroundColor: ColorPath.BackgroundWhite,
                          child: Text(
                            '4',
                            style: TextPath.TextF16W700.copyWith(
                              color: ColorPath.SecondaryColor,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '주치의 찾기 > 의사명을 검색',
                            style: TextPath.TextF14W400.copyWith(
                              color: ColorPath.TextGrey3H616161,
                            ),
                          ),
                          Text(
                            '앱 우상단의  알람 버튼을 누르시면\r\n등록된 병원에 응급 알림 메세지가\r\n동시에 전송됩니다.',
                            style: TextPath.TextF16W500.copyWith(
                              color: ColorPath.TextGrey1H212121,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 20.w)
                    ],
                  ),
                ),
                SizedBox(height: 18.w),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

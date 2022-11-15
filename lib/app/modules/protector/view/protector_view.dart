import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../theme/colors.dart';
import '../../../theme/texts.dart';
import '../controller/protector_controller.dart';
import '../widget/checkList.dart';

class ProtectorView extends GetView<ProtectorController> {
  const ProtectorView({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              '보호자 알림 서비스',
              style: TextPath.Heading2F18W600.copyWith(
                  color: ColorPath.TextGrey1H212121),
            ),
            leading: const SizedBox.shrink(),
            centerTitle: true,
            backgroundColor: ColorPath.Background1HECEFF1,
            elevation: 0,
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: ColorPath.TextGrey1H212121,
                ),
              ),
              const SizedBox(
                width: 16.5,
              ),
            ],
          ),
          body: Container(
            color: ColorPath.Background1HECEFF1,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 56,
                  ),
                  Text(
                    '보호자 알림 설정 체크리스트',
                    style: TextPath.Heading1F24W600.copyWith(
                      color: ColorPath.TextGrey1H212121,
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  const CheckList(
                      num: 1, title: '주치의 찾기 > 의사명을 검색', sub: '주치의 체크하기'),
                  const CheckList(
                    num: 2,
                    title: '내 정보 > 긴급 연락처 관리',
                    sub: '보호자 연락처를 입력해주세요.',
                  ),
                  const CheckList(
                    num: 3,
                    title: '내 정보 > 알림 동의',
                    sub: '보호자 연락 동의를 해주세요.',
                  ),
                  Container(
                    width: 320.w,
                    height: 100.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorPath.Background1HECEFF1,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 36.w,
                          height: 36.h,
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
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '주치의 찾기 > 의사명을 검색',
                              style: TextPath.TextF14W400.copyWith(
                                color: ColorPath.TextGrey3H616161,
                              ),
                            ),
                            Text(
                              '앱 우상단의  알람 버튼을 누르시면\n등록된 병원에 응급 알림 메세지가\n동시에 전송됩니다.',
                              style: TextPath.TextF16W500.copyWith(
                                  color: ColorPath.TextGrey1H212121),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}

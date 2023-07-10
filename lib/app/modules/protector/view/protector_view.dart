import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../globals/global_appbar_widget.dart';
import '../../../globals/global_inkwell_widget.dart';
import '../../../globals/global_layout_widget.dart';
import '../../../theme/color_path.dart';
import '../../../theme/text_path.dart';
import '../controller/protector_controller.dart';

/// 보호자 알림 서비스 페이지
class ProtectorView extends GetView<ProtectorController> {
  const ProtectorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GlobalLayoutWidget(
        context: context,
        appBar: GlobalAppBarWidget(
          appBar: AppBar(),
          title: '주치의 검색 및 보호자 정보',
          elevation: controller.isScrollCheck.value ? 1 : 0,
          backgroundColor: ColorPath.Background1HECEFF1,
        ),
        body: Container(
          color: ColorPath.Background1HECEFF1,
          child: SingleChildScrollView(
            controller: controller.scrollController.value,
            padding: const EdgeInsets.symmetric(horizontal: 20).w,
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 50).w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '보호자 알림 설정 체크리스트',
                    style: TextPath.Heading1F24W600.copyWith(
                      color: ColorPath.TextGrey1H212121,
                    ),
                  ),
                  SizedBox(height: 32.w),
                  const CardWidget(
                    index: 1,
                    title: '주치의 찾기 > 검색',
                    sub: '주치의 체크하기',
                  ),
                  const CardWidget(
                    index: 2,
                    title: '내 정보 > 긴급 연락처 관리',
                    sub: '보호자 연락처를 입력해주세요',
                  ),
                  const CardWidget(
                    index: 3,
                    title: '내 정보 > 알림 동의',
                    sub: '보호자 연락 동의를 해주세요',
                  ),
                  const CardWidget(
                    index: 4,
                    title: '주치의 찾기 > 검색',
                    sub: '앱 우상단의 알람 버튼을 누르시면 등록된 보호자에게 응급 알림 메세지가 동시에 전송됩니다',
                    isIconVisible: true,
                  ),
                  SizedBox(height: 100.w),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// 보호자 알림 서비스 카드 위젯
///
/// [index] : 카드 번호
///
/// [title] : 카드 제목
///
/// [sub] : 카드 서브 타이틀
class CardWidget extends GetView<ProtectorController> {
  const CardWidget({
    super.key,
    required this.index,
    required this.title,
    required this.sub,
    this.isIconVisible = false,
  });

  final int index;
  final String title;
  final String sub;
  final isIconVisible;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: index != 4 ? 110.w : 150.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8).r,
            color: ColorPath.BackgroundWhite,
            boxShadow: [
              BoxShadow(
                color: ColorPath.PrimaryColor.withOpacity(0.15),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(5, 5),
              ),
            ],
          ),
          child: GlobalInkWellWidget(
            borderRadius: 8.r,
            onTap: () {
              controller.handleCheckListOnTap(index);
            },
            child: Padding(
              padding: const EdgeInsets.all(20).w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 36.w,
                    height: 36.w,
                    child: CircleAvatar(
                      backgroundColor: ColorPath.Background1HECEFF1,
                      child: Text(
                        index.toString(),
                        style: TextPath.TextF16W700.copyWith(
                          color: ColorPath.SecondaryColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 190.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextPath.TextF14W400.copyWith(
                            color: ColorPath.TextGrey3H616161,
                          ),
                        ),
                        Text(
                          sub,
                          style: TextPath.TextF16W500.copyWith(
                            color: ColorPath.TextGrey1H212121,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: isIconVisible
                        ? Colors.transparent
                        : ColorPath.PrimaryColor,
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 20.w),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../globals/global_appbar_widget.dart';
import '../../../globals/global_dialog_widget.dart';
import '../../../globals/global_layout_widget.dart';
import '../../../service/auth_service.dart';
import '../../../theme/color_path.dart';
import '../../../theme/text_path.dart';
import '../controller/terms_controller.dart';

class TermsAndConditionView extends GetView<TermsController> {
  const TermsAndConditionView({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalLayoutWidget(
      context: context,
      appBar: GlobalAppBarWidget(
        appBar: AppBar(),
        title: '약관 및 정책',
        actions: [
          Container(
            padding: const EdgeInsets.fromLTRB(0, 10, 18, 10).w,
            child: InkWell(
              onTap: () {
                AuthService.to.userData.value.guardianPhoneNumber != null
                    ? GlobalEmergencyModalWidget(context: context)
                    : GlobalEmergencyModalWidget2(context: context);
              },
              child: Container(
                alignment: Alignment.centerRight,
                child: Image.asset(
                  'assets/search_doctors/search_doctors_icon.png',
                  width: 24.w,
                  height: 24.w,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.termsData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return MenuWidget(
                        index: index,
                      );
                    },
                  ),
                  SizedBox(height: 100.w),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 내정보 메뉴 위젯
class MenuWidget extends GetView<TermsController> {
  const MenuWidget({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(
          '/myinfo/terms/webview',
          arguments: {
            'url': controller.termsData[index].url,
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16).r,
        ),
        child: Container(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Container(
                height: 50,
                padding: const EdgeInsets.only(left: 10).w,
                alignment: Alignment.centerLeft,
                child: Text(
                  controller.termsData[index].title,
                  style: TextPath.TextF14W500.copyWith(
                    color: ColorPath.TextGrey1H212121,
                  ),
                ),
              ),
              const Spacer(),
              Icon(
                Icons.open_in_new_rounded,
                color: ColorPath.SecondaryDarkColor,
                size: 18.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 약관 및 정책 위젯
///
/// [index] int : 인덱스
class TermsAndConditionItemWidget extends GetView<TermsController> {
  const TermsAndConditionItemWidget({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        backgroundColor: Colors.transparent,
        title: Text(
          controller.termsData[index].title,
          style: TextStyle(
            fontFamily: 'SUIT',
            color: ColorPath.TextGrey1H212121,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: Image.asset(
          'assets/my_symptoms/expandable_lower_icon.png',
          width: 12,
          height: 6,
        ),
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(18, 16, 18, 16).w,
                decoration: BoxDecoration(
                  color: ColorPath.Background1HECEFF1,
                ),
                child: Text(
                  controller.termsData[index].content,
                  style: const TextStyle(
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

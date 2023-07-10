import 'package:dr_parkinsons/app/globals/global_toast_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../globals/global_appbar_widget.dart';
import '../../../globals/global_dialog_widget.dart';
import '../../../globals/global_inkwell_widget.dart';
import '../../../globals/global_layout_widget.dart';
import '../../../globals/global_loader_indicator_widget.dart';
import '../../../routes/app_pages.dart';
import '../../../service/auth_service.dart';
import '../../../theme/color_path.dart';
import '../../../theme/text_path.dart';
import '../../main/controller/main_controller.dart';
import '../controller/home_controller.dart';

/// 홈 페이지
class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoad.value
          ? const GlobalLoaderIndicatorWidget()
          : GlobalLayoutWidget(
              context: context,
              appBar: GlobalAppBarWidget(
                title: '닥터 파킨슨',
                appBar: AppBar(),
                isLeadingVisible: true,
                actions: [
                  GlobalInkWellWidget(
                    onTap: () {
                      AuthService.to.userData.value.guardianPhoneNumber != null
                          ? GlobalEmergencyModalWidget(context: context)
                          : GlobalEmergencyModalWidget2(context: context);
                    },
                    child: SizedBox(
                      width: 24.w,
                      height: 24.w,
                      child: Image.asset(
                        'assets/images/icons/page2/24 alert.png',
                      ),
                    ),
                  ),
                  SizedBox(width: 20.w),
                ],
              ),
              body: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20).w,
                physics: const ClampingScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      width: 320.w,
                      height: 36.w,
                      decoration: BoxDecoration(
                        color: ColorPath.Background1HECEFF1,
                        borderRadius: BorderRadius.circular(36).r,
                      ),
                      child: GlobalInkWellWidget(
                        borderRadius: 36.r,
                        onTap: () {
                          Get.toNamed('/protector');
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20).w,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 18.w,
                                height: 18.w,
                                child: Image.asset(
                                  'assets/images/icons/bell.webp',
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: Text(
                                  '파킨슨 환자 보호를 위한 서비스가 필요하신가요?',
                                  style: TextPath.TextF13W500.copyWith(
                                    color: ColorPath.TextGrey3H616161,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.w),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 128.w,
                          height: 164.w,
                          decoration: BoxDecoration(
                            color: ColorPath.PrimaryLightColor,
                            borderRadius: BorderRadius.circular(5).r,
                          ),
                          child: GlobalInkWellWidget(
                            borderRadius: 5.r,
                            onTap: () {
                              Get.toNamed('/disorder');
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 60.w,
                                  height: 60.w,
                                  child: CircleAvatar(
                                    backgroundColor: ColorPath.BackgroundWhite,
                                    child: Image.asset(
                                      'assets/images/icons/medical_treatment/medical_treatment_32.webp',
                                      width: 38.w,
                                      cacheWidth: 76,
                                      // cacheHeight: 76,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 14.w),
                                Text(
                                  '파킨슨 병이란?',
                                  style: TextPath.TextF12W500.copyWith(
                                    color: ColorPath.TextGrey3H616161,
                                  ),
                                ),
                                SizedBox(height: 2.w),
                                Text(
                                  '파킨슨병 소개',
                                  style: TextPath.TextF16W500.copyWith(
                                    color: ColorPath.TextGrey1H212121,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 180.w,
                              height: 76.w,
                              decoration: BoxDecoration(
                                color: ColorPath.SecondaryLightColor,
                                borderRadius: BorderRadius.circular(5).r,
                              ),
                              child: GlobalInkWellWidget(
                                borderRadius: 5.r,
                                onTap: () {
                                  Get.toNamed('/seminar');
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10).w,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 48.w,
                                        height: 48.w,
                                        child: CircleAvatar(
                                          backgroundColor:
                                              ColorPath.BackgroundWhite,
                                          child: Image.asset(
                                            'assets/images/icons/medical_treatment/medical_treatment_31.webp',
                                            width: 28.w,
                                            cacheWidth: 56,
                                            // cacheHeight: 51,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10.w),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '처음 오셨나요?',
                                            style:
                                                TextPath.TextF12W500.copyWith(
                                              color: ColorPath.TextGrey3H616161,
                                            ),
                                          ),
                                          SizedBox(height: 4.w),
                                          Text(
                                            '학회 및 앱 소개',
                                            style:
                                                TextPath.TextF14W500.copyWith(
                                              color: ColorPath.TextGrey1H212121,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10.w),
                            Container(
                              width: 180.w,
                              height: 76.w,
                              decoration: BoxDecoration(
                                color: ColorPath.TertiaryLightColor,
                                borderRadius: BorderRadius.circular(5).r,
                              ),
                              child: GlobalInkWellWidget(
                                borderRadius: 5.r,
                                onTap: () {
                                  Get.toNamed('/fact');
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10).w,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 48.w,
                                        height: 48.w,
                                        child: CircleAvatar(
                                          backgroundColor:
                                              ColorPath.BackgroundWhite,
                                          child: Image.asset(
                                            'assets/images/icons/medical_treatment/medical_treatment_34.webp',
                                            width: 26.w,
                                            cacheWidth: 52,
                                            // cacheHeight: 52,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10.w),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '팩트체크',
                                            style:
                                                TextPath.TextF12W500.copyWith(
                                              color: ColorPath.TextGrey3H616161,
                                            ),
                                          ),
                                          SizedBox(height: 4.w),
                                          Text(
                                            '파킨슨병 완전정복',
                                            style:
                                                TextPath.TextF13W500.copyWith(
                                              color: ColorPath.TextGrey1H212121,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 42.w),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '다가오는 미션',
                          style: TextPath.Heading2F18W600.copyWith(
                            color: ColorPath.TextGrey1H212121,
                          ),
                        ),
                        GlobalInkWellWidget(
                          onTap: () {
                            MainController.to.navigationCurrentIndex.value = 2;
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '미션관리',
                                style: TextPath.TextF13W400.copyWith(
                                  color: ColorPath.TextGrey3H616161,
                                ),
                              ),
                              Icon(
                                Icons.keyboard_arrow_right,
                                size: 16.w,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.w),
                    controller.homeData.value!.mission.isEmpty
                        ? const MissionItemEnptyWidget()
                        : const MissionItemNotEnptyWidget(),
                    SizedBox(height: 42.w),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: '복지 혜택 ',
                            style: TextPath.Heading2F18W600.copyWith(
                              color: ColorPath.TextGrey1H212121,
                            ),
                            children: [
                              TextSpan(
                                text: '(사회복지제도 안내)',
                                style: TextPath.TextF14W500.copyWith(
                                  color: ColorPath.TextGrey3H616161,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 38.w),
                        GlobalInkWellWidget(
                          onTap: () {
                            Get.toNamed('/socialwelfare');
                          },
                          child: Row(
                            children: [
                              Text(
                                '더보기',
                                style: TextPath.TextF13W400.copyWith(
                                  color: ColorPath.TextGrey3H616161,
                                ),
                              ),
                              Icon(
                                Icons.keyboard_arrow_right,
                                size: 16.sp,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.w),
                    SizedBox(
                      width: 320.w,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.homeData.value!.welfare.length,
                        itemBuilder: (context, index) {
                          return GlobalInkWellWidget(
                            onTap: () {
                              Get.toNamed(
                                '/socialwelfare/socialwelfarepost',
                                arguments: {
                                  'id': controller.homeData.value!
                                      .welfare[index].welfare_id,
                                  'image': controller
                                      .homeData.value!.welfare[index].image
                                },
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 10,
                              ).w,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      controller
                                          .homeData.value!.welfare[index].title,
                                      style: TextPath.TextF13W500.copyWith(
                                        color: ColorPath.TextGrey2H424242,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  SizedBox(width: 10.w),
                                  Text(
                                    DateFormat('yy.MM.dd').format(
                                      controller.homeData.value!.welfare[index]
                                          .created_at,
                                    ),
                                    style: TextPath.TextF12W500.copyWith(
                                      color: ColorPath.TextGrey2H424242,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 42.w),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '바로가기',
                          style: TextPath.Heading2F18W600.copyWith(
                            color: ColorPath.TextGrey1H212121,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.w),
                    Row(
                      children: [
                        SizedBox(
                          width: 64.w,
                          height: 71.w,
                          child: GlobalInkWellWidget(
                            onTap: () {
                              // Get.toNamed(page);
                              Get.toNamed(Routes.MY_SYMPTOMS);
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                  ).w,
                                  width: 48.w,
                                  height: 48.w,
                                  child: CircleAvatar(
                                    backgroundColor:
                                        ColorPath.Background1HECEFF1,
                                    child: Image.asset(
                                      'assets/images/icons/medical_treatment/medical_treatment_28.webp',
                                      width: 28.w,
                                      height: 28.w,
                                      cacheWidth: 55,
                                      // cacheHeight: 56,
                                    ),
                                  ),
                                ),
                                Text(
                                  '내증상기록',
                                  style: TextPath.TextF12W500.copyWith(
                                    color: ColorPath.TextGrey1H212121,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 64.w,
                          height: 71.w,
                          child: GlobalInkWellWidget(
                            onTap: () {
                              MainController.to.navigationCurrentIndex.value =
                                  1;
                            },
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                    ).w,
                                    width: 48.w,
                                    height: 48.w,
                                    child: CircleAvatar(
                                      backgroundColor:
                                          ColorPath.Background1HECEFF1,
                                      child: Image.asset(
                                        'assets/images/icons/medical_treatment/medical_treatment_15.webp',
                                        width: 28.w,
                                        height: 28.w,
                                        cacheWidth: 55,
                                        // cacheHeight: 56,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '자가진단',
                                    style: TextPath.TextF12W500.copyWith(
                                      color: ColorPath.TextGrey1H212121,
                                    ),
                                  ),
                                ]),
                          ),
                        ),
                        SizedBox(
                          width: 64.w,
                          height: 71.w,
                          child: GlobalInkWellWidget(
                            onTap: () {
                              Get.toNamed(Routes.PROFILE_SETTING);
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                  ).w,
                                  width: 48.w,
                                  height: 48.w,
                                  child: CircleAvatar(
                                    backgroundColor:
                                        ColorPath.Background1HECEFF1,
                                    child: Image.asset(
                                      'assets/images/icons/medical_treatment/medical_treatment_27.webp',
                                      width: 28.w,
                                      height: 28.w,
                                      cacheWidth: 56,
                                      // cacheHeight: 56,
                                    ),
                                  ),
                                ),
                                Text(
                                  '응급 연락망',
                                  style: TextPath.TextF12W500.copyWith(
                                    color: ColorPath.TextGrey1H212121,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 64.w,
                          height: 71.w,
                          child: GlobalInkWellWidget(
                            onTap: () {
                              // Get.toNamed(page);
                              Get.toNamed(Routes.MEDICINE);
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                  ).w,
                                  width: 48.w,
                                  height: 48.w,
                                  child: CircleAvatar(
                                    backgroundColor:
                                        ColorPath.Background1HECEFF1,
                                    child: Image.asset(
                                      'assets/images/icons/medical_treatment/medical_treatment_26.webp',
                                      width: 28.w,
                                      height: 28.w,
                                      cacheWidth: 56,
                                      // cacheHeight: 56,
                                    ),
                                  ),
                                ),
                                Text(
                                  '의약정보',
                                  style: TextPath.TextF12W500.copyWith(
                                    color: ColorPath.TextGrey1H212121,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 64.w,
                          height: 71.w,
                          child: GlobalInkWellWidget(
                            onTap: () {
                              Get.toNamed(Routes.SUGGEST_POLICY);
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 8)
                                          .w,
                                  width: 48.w,
                                  height: 48.w,
                                  child: CircleAvatar(
                                    backgroundColor:
                                        ColorPath.Background1HECEFF1,
                                    child: Image.asset(
                                      'assets/images/icons/medical_treatment/medical_treatment_1.webp',
                                      width: 28.w,
                                      height: 28.w,
                                      cacheWidth: 56,
                                      // cacheHeight: 56,
                                    ),
                                  ),
                                ),
                                Text(
                                  '의견제안',
                                  style: TextPath.TextF12W500.copyWith(
                                    color: ColorPath.TextGrey1H212121,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 60),
                    Row(
                      children: [
                        GlobalInkWellWidget(
                          onTap: () async {
                            if (!await launchUrl(Uri.parse(
                                'https://www.gilhospital.com/web/mobile/lemon1'))) {
                              GlobalToastWidget('잠시 후 다시 시도해주세요');
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 5,
                              vertical: 2.5,
                            ).w,
                            child: Text(
                              '이용약관',
                              style: TextPath.TextF12W400.copyWith(
                                color: ColorPath.TextGrey3H616161,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 2.5).w,
                          child: Text(
                            '|',
                            style: TextPath.TextF12W400.copyWith(
                              color: ColorPath.TextGrey3H616161,
                            ),
                          ),
                        ),
                        GlobalInkWellWidget(
                          onTap: () async {
                            if (!await launchUrl(Uri.parse(
                                'https://www.kmds.or.kr/popup/person_info.php'))) {
                              GlobalToastWidget('잠시 후 다시 시도해주세요');
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 5,
                              vertical: 2.5,
                            ).w,
                            child: Text(
                              '개인정보처리방침',
                              style: TextPath.TextF12W400.copyWith(
                                color: ColorPath.TextGrey3H616161,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 6.5.w),
                    Row(
                      children: [
                        GlobalInkWellWidget(
                          onTap: () async {
                            if (!await launchUrl(Uri.parse(
                                'https://www.kmds.or.kr/popup/person_info.php'))) {
                              GlobalToastWidget('잠시 후 다시 시도해주세요');
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 5,
                              vertical: 2.5,
                            ).w,
                            child: Text(
                              '위치기반서비스이용약관',
                              style: TextPath.TextF12W400.copyWith(
                                color: ColorPath.TextGrey3H616161,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 2.5).w,
                          child: Text(
                            ' | ',
                            style: TextPath.TextF12W400.copyWith(
                              color: ColorPath.TextGrey3H616161,
                            ),
                          ),
                        ),
                        GlobalInkWellWidget(
                          onTap: () async {
                            if (!await launchUrl(Uri.parse(
                                'https://www.kmds.or.kr/popup/person_info.php'))) {
                              GlobalToastWidget('잠시 후 다시 시도해주세요');
                            }
                          },
                          child: Text(
                            '고유식별정보수집동의',
                            style: TextPath.TextF12W400.copyWith(
                              color: ColorPath.TextGrey3H616161,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 2.5).w,
                          child: Text(
                            ' | ',
                            style: TextPath.TextF12W400.copyWith(
                              color: ColorPath.TextGrey3H616161,
                            ),
                          ),
                        ),
                        GlobalInkWellWidget(
                          onTap: () async {
                            if (!await launchUrl(Uri.parse(
                                'https://www.kmds.or.kr/popup/person_info.php'))) {
                              GlobalToastWidget('잠시 후 다시 시도해주세요');
                            }
                          },
                          child: Text(
                            '면책조항',
                            style: TextPath.TextF12W400.copyWith(
                              color: ColorPath.TextGrey3H616161,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.w),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        // ignore: prefer_const_constructors
                        padding: EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 2.5,
                        ).w,
                        child: Text(
                          'Copyright © 2022 가천대 길 의료재단. All right reserved.',
                          style: TextPath.TextF10W400.copyWith(
                            color: ColorPath.TextGrey3H616161,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 50.w),
                  ],
                ),
              ),
            ),
    );
  }
}

/// 미션 아이템 위젯
class MissionItemNotEnptyWidget extends GetView<HomeController> {
  const MissionItemNotEnptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 96.w,
      decoration: BoxDecoration(
        color: ColorPath.BackgroundWhite,
        borderRadius: BorderRadius.circular(8).r,
        boxShadow: [
          BoxShadow(
            color: ColorPath.PrimaryColor.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(5, 5),
          ),
        ],
      ),
      child: GlobalInkWellWidget(
        borderRadius: 8.r,
        onTap: () async {
          MainController.to.navigationCurrentIndex.value = 2;
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 20, 10).w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 64.w,
                height: 64.w,
                child: CircleAvatar(
                  backgroundColor: Colors.grey[200],
                  child: Image.asset(
                    'assets/images/icons/page2/48 pill.png',
                    width: 48.w,
                    height: 48.w,
                    cacheWidth: 96,
                    // cacheHeight: 95,
                  ),
                ),
              ),
              SizedBox(width: 20.w),
              Flexible(
                child: Column(
                  children: [
                    SizedBox(height: 5.w),
                    Expanded(
                      child: Row(
                        children: [
                          Text(
                            controller.homeData.value!.mission[0].mission_type,
                            style: TextPath.TextF16W500.copyWith(
                              color: ColorPath.TextGrey1H212121,
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  '${controller.getDeffMinit(controller.homeData.value!.mission[0].mission_time)}',
                                  style: TextPath.Heading1F24W600.copyWith(
                                    color: ColorPath.TextGrey1H212121,
                                  ),
                                ),
                                SizedBox(width: 5.w),
                                Text(
                                  '분 전',
                                  style: TextPath.TextF13W500.copyWith(
                                    color: ColorPath.TextGrey1H212121,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Text(
                            controller
                                .homeData.value!.mission[0].mission_time_string
                                .replaceAll('오전', '')
                                .replaceAll('오후', '')
                                .replaceAll('시', '시 '),
                            style: TextPath.TextF14W500.copyWith(
                              color: ColorPath.TextGrey3H616161,
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: GlobalInkWellWidget(
                                borderRadius: 100.r,
                                onTap: () async {
                                  await controller.clearMission(
                                    mission_id: controller
                                        .homeData.value!.mission[0].mission_id,
                                  );
                                },
                                child: const Icon(
                                  Icons.check_circle_outline,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5.w),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 미션 아이템이 없을 경우 위젯
class MissionItemEnptyWidget extends StatelessWidget {
  const MissionItemEnptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 96.w,
      decoration: BoxDecoration(
        color: ColorPath.BackgroundWhite,
        borderRadius: BorderRadius.circular(8).r,
        boxShadow: [
          BoxShadow(
            color: ColorPath.PrimaryColor.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(5, 5),
          ),
        ],
      ),
      child: GlobalInkWellWidget(
        borderRadius: 8.r,
        onTap: () {
          MainController.to.navigationCurrentIndex.value = 2;
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '미션 추가',
              style: TextPath.TextF16W500.copyWith(
                color: ColorPath.TextGrey1H212121,
              ),
            ),
            SizedBox(height: 10.w),
            Text(
              '다가오는 미션이 존재하지 않습니다.',
              style: TextPath.TextF14W500.copyWith(
                color: ColorPath.TextGrey3H616161,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

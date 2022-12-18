import 'package:base/app/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../globals/global_dialog_widget.dart';
import '../../../routes/app_pages.dart';
import '../../../theme/colors.dart';
import '../../../theme/texts.dart';
import '../controller/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) => Obx(
        () => SafeArea(
          child: Scaffold(
              appBar: AppBar(
                elevation: 0,
                shadowColor: Colors.white,
                title: Text(
                  '닥터 파킨슨',
                  style: TextPath.Heading2F18W600.copyWith(
                    color: ColorPath.TextGrey1H212121,
                  ),
                ),
                actions: [
                  InkWell(
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
                backgroundColor: Colors.white,
              ),
              body: controller.process.value == false
                  ? Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              width: 320.w,
                              height: 36.w,
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              decoration: BoxDecoration(
                                color: ColorPath.Background1HECEFF1,
                                borderRadius: BorderRadius.circular(36.r),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 18.w,
                                    height: 18.w,
                                    child: Image.asset(
                                        'assets/images/icons/page2/18 bell.png'),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.toNamed('/protector');
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        '파킨슨 환자 보호를 위한 서비스가 필요하신가요?',
                                        style: TextPath.TextF13W500.copyWith(
                                          color: ColorPath.TextGrey3H616161,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20.w),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.toNamed('/disorder');
                                  },
                                  child: Container(
                                    width: 128.w,
                                    height: 164.w,
                                    decoration: BoxDecoration(
                                      color: ColorPath.PrimaryLightColor,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        SizedBox(
                                          width: 60.w,
                                          height: 60.w,
                                          child: CircleAvatar(
                                            backgroundColor:
                                                ColorPath.BackgroundWhite,
                                            child: Image.asset(
                                                width: 44.w,
                                                height: 43.2.w,
                                                'assets/images/icons/page2/44 DNA.png'),
                                          ),
                                        ),
                                        SizedBox(height: 14.w),
                                        Text(
                                          '파킨슨 병이란?',
                                          style: TextPath.TextF13W500.copyWith(
                                            color: ColorPath.TextGrey3H616161,
                                          ),
                                        ),
                                        SizedBox(height: 2.w),
                                        Text(
                                          '파킨슨 병이란?',
                                          style: TextPath.TextF16W500.copyWith(
                                              color:
                                                  ColorPath.TextGrey1H212121),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(width: 12.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Get.toNamed('/seminar');
                                      },
                                      child: Container(
                                        width: 180.w,
                                        height: 76.w,
                                        decoration: BoxDecoration(
                                          color: ColorPath.SecondaryLightColor,
                                          borderRadius:
                                              BorderRadius.circular(5.r),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width: 52.w,
                                              height: 52.w,
                                              child: CircleAvatar(
                                                  backgroundColor:
                                                      ColorPath.BackgroundWhite,
                                                  child: Image.asset(
                                                      width: 36.w,
                                                      height: 27.w,
                                                      'assets/images/icons/page2/36 Hospital.png')),
                                            ),
                                            SizedBox(width: 8.w),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  '처음 오셨나요?',
                                                  style: TextPath.TextF13W500
                                                      .copyWith(
                                                    color: ColorPath
                                                        .TextGrey3H616161,
                                                  ),
                                                ),
                                                SizedBox(height: 4.w),
                                                Text('학회 및 앱 소개',
                                                    style: TextPath.TextF16W500
                                                        .copyWith(
                                                      color: ColorPath
                                                          .TextGrey1H212121,
                                                    )),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 15.w),
                                    InkWell(
                                      onTap: () {
                                        Get.toNamed('/fact');
                                      },
                                      child: Container(
                                        width: 180.w,
                                        height: 76.w,
                                        decoration: BoxDecoration(
                                          color: ColorPath.TertiaryLightColor,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width: 52.w,
                                              height: 52.w,
                                              child: CircleAvatar(
                                                backgroundColor:
                                                    ColorPath.BackgroundWhite,
                                                child: Image.asset(
                                                    width: 36.w,
                                                    height: 27.w,
                                                    'assets/images/icons/page2/36 Medical Record.png'),
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  '오해와 진실',
                                                  style: TextPath.TextF13W500
                                                      .copyWith(
                                                    color: ColorPath
                                                        .TextGrey3H616161,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 4,
                                                ),
                                                Text('파킨슨 완전정복',
                                                    style: TextPath.TextF16W500
                                                        .copyWith(
                                                      color: ColorPath
                                                          .TextGrey1H212121,
                                                    )),
                                              ],
                                            ),
                                          ],
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
                                  '다가오는 미션 보기',
                                  style: TextPath.Heading2F18W600.copyWith(
                                    color: ColorPath.TextGrey1H212121,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.toNamed('/mission');
                                  },
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '미션관리',
                                        style: TextPath.TextF13W400.copyWith(
                                            color: ColorPath.TextGrey3H616161),
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_right,
                                        size: 24.w,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 12.w),
                            Obx(
                              () => controller.homeData.value.mission.isEmpty
                                  ? _missionItemNot()
                                  : _missionItem(),
                            ),
                            SizedBox(height: 40.w),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '복지 혜택 보기',
                                  style: TextPath.Heading2F18W600.copyWith(
                                    color: ColorPath.TextGrey1H212121,
                                  ),
                                ),
                                Text(
                                  '(사회복지제도 안내)',
                                  style: TextPath.TextF14W500.copyWith(
                                    color: ColorPath.TextGrey3H616161,
                                  ),
                                ),
                                const SizedBox(
                                  width: 38,
                                ),
                                InkWell(
                                  onTap: () => Get.toNamed('/socialwelfare'),
                                  child: Row(
                                    children: [
                                      Text(
                                        '더보기',
                                        style: TextPath.TextF13W400.copyWith(
                                            color: ColorPath.TextGrey3H616161),
                                      ),
                                      const Icon(Icons.keyboard_arrow_right),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Container(
                              width: 320.w,
                              padding: const EdgeInsets.only(
                                  top: 10, left: 20, bottom: 10, right: 21),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: ColorPath.Border2HECEFF1,
                                  width: 1,
                                ),
                              ),
                              child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount:
                                    controller.homeData.value.welfare.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () => Get.toNamed(
                                        '/socialwelfare/socialwelfarepost',
                                        arguments: {
                                          'id': controller.homeData.value
                                              .welfare[index].welfare_id
                                        }),
                                    child: Container(
                                      margin: const EdgeInsets.all(6),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              controller.homeData.value
                                                  .welfare[index].description,
                                              style:
                                                  TextPath.TextF13W500.copyWith(
                                                color:
                                                    ColorPath.TextGrey2H424242,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          SizedBox(width: 10.w),
                                          Text(
                                            DateFormat('yyyy-MM-dd').format(
                                                controller.homeData.value
                                                    .welfare[index].created_at),
                                            style:
                                                TextPath.TextF13W500.copyWith(
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
                            const SizedBox(height: 40),
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
                            const SizedBox(height: 12),
                            Row(children: [
                              SizedBox(
                                width: 64.w,
                                height: 71.w,
                                child: InkWell(
                                  onTap: () {
                                    // Get.toNamed(page);
                                  },
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 8),
                                          width: 48.w,
                                          height: 48.w,
                                          child: CircleAvatar(
                                              backgroundColor:
                                                  ColorPath.Background1HECEFF1,
                                              child: Image.asset(
                                                  width: 36.w,
                                                  height: 36.w,
                                                  'assets/images/icons/page2/36 Sketch Book.png')),
                                        ),
                                        Text(
                                          '내증상기록',
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
                                child: InkWell(
                                  onTap: () {
                                    // Get.toNamed(page);
                                  },
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 8),
                                          width: 48.w,
                                          height: 48.w,
                                          child: CircleAvatar(
                                              backgroundColor:
                                                  ColorPath.Background1HECEFF1,
                                              child: Image.asset(
                                                  width: 36.w,
                                                  height: 36.w,
                                                  'assets/images/icons/page2/36 Medical Record.png')),
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
                                child: InkWell(
                                  onTap: () {
                                    // Get.toNamed(page);
                                  },
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 8),
                                          width: 48.w,
                                          height: 48.w,
                                          child: CircleAvatar(
                                              backgroundColor:
                                                  ColorPath.Background1HECEFF1,
                                              child: Image.asset(
                                                  width: 36.w,
                                                  height: 36.w,
                                                  'assets/images/icons/page2/36 ambulance.png')),
                                        ),
                                        Text(
                                          '응급 연락망',
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
                                child: InkWell(
                                  onTap: () {
                                    // Get.toNamed(page);
                                  },
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 8),
                                          width: 48.w,
                                          height: 48.w,
                                          child: CircleAvatar(
                                              backgroundColor:
                                                  ColorPath.Background1HECEFF1,
                                              child: Image.asset(
                                                  width: 36.w,
                                                  height: 36.w,
                                                  'assets/images/icons/page2/36 pharmacy.png')),
                                        ),
                                        Text(
                                          '의약정보',
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
                                child: InkWell(
                                  onTap: () {
                                    // Get.toNamed(page);
                                  },
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 8.w),
                                          width: 48.w,
                                          height: 48.w,
                                          child: CircleAvatar(
                                              backgroundColor:
                                                  ColorPath.Background1HECEFF1,
                                              child: Image.asset(
                                                  width: 36.w,
                                                  height: 36.w,
                                                  'assets/images/icons/page2/36 Help.png')),
                                        ),
                                        Text(
                                          '자주묻는질문',
                                          style: TextPath.TextF12W500.copyWith(
                                            color: ColorPath.TextGrey1H212121,
                                          ),
                                        ),
                                      ]),
                                ),
                              ),
                            ]),
                            const SizedBox(height: 60),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Text(
                                    '이용약관',
                                    style: TextPath.TextF12W400.copyWith(
                                        color: ColorPath.TextGrey3H616161),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Text(
                                    ' | ',
                                    style: TextPath.TextF12W400.copyWith(
                                        color: ColorPath.TextGrey3H616161),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Text(
                                    '개인정보처리방침',
                                    style: TextPath.TextF12W400.copyWith(
                                        color: ColorPath.TextGrey3H616161),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6.5),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Text(
                                    '위치기반서비스이용약관',
                                    style: TextPath.TextF12W400.copyWith(
                                        color: ColorPath.TextGrey3H616161),
                                  ),
                                ),
                                Container(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                  child: Text(
                                    ' | ',
                                    style: TextPath.TextF12W400.copyWith(
                                        color: ColorPath.TextGrey3H616161),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Text(
                                    '고유식별정보수집동의',
                                    style: TextPath.TextF12W400.copyWith(
                                        color: ColorPath.TextGrey3H616161),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.w),
                            Row(children: [
                              Text(
                                'Copyright © 2022 길 의료재단. All right reserved.',
                                style: TextPath.TextF12W500.copyWith(
                                    color: ColorPath.TextGrey3H616161),
                              ),
                            ]),
                            SizedBox(height: 99.w),
                          ],
                        ),
                      ),
                    )
                  : const SizedBox.shrink()),
        ),
      );

  /// 미션 남은 시간 계산
  int deffMinit(int time) {
    print(time);
    String now = DateFormat('HH:mm').format(DateTime.now());
    return time - int.parse(now.replaceAll(":", ''));
  }

  /// 미션 아이템 [다가오는 미션]
  Widget _missionItem() {
    return InkWell(
      onTap: () async {
        Get.toNamed(Routes.MISSION);
        await controller.getUpdateHomeData();
      },
      child: Container(
        width: 310.w,
        height: 96.w,
        decoration: BoxDecoration(
          color: ColorPath.BackgroundWhite,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              color: ColorPath.PrimaryColor.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(5, 5), // changes position of shadow
            ),
          ],
        ),
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
                    width: 48.w,
                    height: 48.w,
                    'assets/images/icons/page2/48 pill.png'),
              ),
            ),
            SizedBox(
              width: 12.w,
            ),
            Container(
              alignment: Alignment.centerLeft,
              width: 110.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.homeData.value.mission[0].mission_type,
                    style: TextPath.TextF16W500.copyWith(
                      color: ColorPath.TextGrey1H212121,
                    ),
                  ),
                  SizedBox(height: 7.w),
                  Text(
                    controller.homeData.value.mission[0].mission_time_string,
                    style: TextPath.TextF14W500.copyWith(
                      color: ColorPath.TextGrey3H616161,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 24.w),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Text(
                          '${deffMinit(controller.homeData.value.mission[0].mission_time)}',
                          style: TextPath.Heading1F24W600.copyWith(
                            color: ColorPath.TextGrey1H212121,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          '분 전',
                          style: TextPath.TextF13W500.copyWith(
                            color: ColorPath.TextGrey1H212121,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 7.w),
                    InkWell(
                        onTap: () async {
                          await controller.clearMission(
                              mission_id: controller
                                  .homeData.value.mission[0].mission_id);
                        },
                        child: const Icon(Icons.check_circle_outline)),
                  ]),
            ),
          ],
        ),
      ),
    );
  }

  // 미션이 없을 경우
  Widget _missionItemNot() {
    return InkWell(
      onTap: () async {
        Get.toNamed(Routes.MISSION);
        await controller.getUpdateHomeData();
      },
      child: Container(
        width: 320.w,
        height: 96.w,
        decoration: BoxDecoration(
          color: ColorPath.BackgroundWhite,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: ColorPath.PrimaryColor.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(5, 5), // changes position of shadow
            ),
          ],
        ),
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
            SizedBox(height: 7.w),
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

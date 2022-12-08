import 'package:base/app/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../global/global_dialog_widget.dart';
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
                  const SizedBox(width: 20),
                ],
                backgroundColor: Colors.white,
              ),
              body: controller.process.value == false
                  ? Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              width: 320.w,
                              height: 36.w,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              decoration: BoxDecoration(
                                color: ColorPath.Background1HECEFF1,
                                borderRadius: BorderRadius.circular(36),
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
                            const SizedBox(
                              height: 20,
                            ),
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
                                        const SizedBox(height: 14),
                                        Text(
                                          '파킨슨 병이란?',
                                          style: TextPath.TextF13W500.copyWith(
                                            color: ColorPath.TextGrey3H616161,
                                          ),
                                        ),
                                        const SizedBox(height: 2),
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
                                const SizedBox(
                                  width: 12,
                                ),
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
                                                      'assets/images/icons/page2/36 Hospital.png')),
                                            ),
                                            const SizedBox(width: 8),
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
                                                const SizedBox(
                                                  height: 4,
                                                ),
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
                                    const SizedBox(
                                      height: 15,
                                    ),
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
                            SizedBox(
                              height: 42.w,
                            ),
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
                                      const Icon(
                                        Icons.keyboard_arrow_right,
                                        size: 24,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Container(
                              width: 320.w,
                              height: 96.w,
                              decoration: BoxDecoration(
                                color: ColorPath.BackgroundWhite,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                        ColorPath.PrimaryColor.withOpacity(0.1),
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                    offset: const Offset(
                                        5, 5), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    width: 150,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '투약',
                                          style: TextPath.TextF16W500.copyWith(
                                            color: ColorPath.TextGrey1H212121,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 7,
                                        ),
                                        Text(
                                          '매일 07:00',
                                          style: TextPath.TextF14W500.copyWith(
                                            color: ColorPath.TextGrey3H616161,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(right: 24),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                '30',
                                                style: TextPath.Heading1F24W600
                                                    .copyWith(
                                                  color: ColorPath
                                                      .TextGrey1H212121,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 4,
                                              ),
                                              Text(
                                                '분 전',
                                                style: TextPath.TextF13W500
                                                    .copyWith(
                                                  color: ColorPath
                                                      .TextGrey1H212121,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 7,
                                          ),
                                          const Icon(
                                              Icons.check_circle_outline),
                                        ]),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
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
                                          SizedBox(
                                            width: 220.w,
                                            height: 16.w,
                                            child: Text(
                                              controller.homeData.value
                                                  .welfare[index].description,
                                              style:
                                                  TextPath.TextF13W500.copyWith(
                                                color:
                                                    ColorPath.TextGrey2H424242,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
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
                                    '고유식별정보수집동의',
                                    style: TextPath.TextF12W400.copyWith(
                                        color: ColorPath.TextGrey3H616161),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(children: [
                              Text(
                                'Copyright © 2022 길 의료재단. All right reserved.',
                                style: TextPath.TextF12W500.copyWith(
                                    color: ColorPath.TextGrey3H616161),
                              ),
                            ]),
                            const SizedBox(height: 99),
                          ],
                        ),
                      ),
                    )
                  : const SizedBox.shrink()),
        ),
      );
}

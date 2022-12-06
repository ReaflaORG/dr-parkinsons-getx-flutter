import 'package:base/app/global/global_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../../../theme/colors.dart';
import '../../../theme/texts.dart';
import '../controller/mission_controller.dart';
import '../widgets/mini_calendar_widget.dart';
import '../widgets/mission_card_widget.dart';

class MissionView extends GetView<MissionController> {
  const MissionView({super.key});

  @override
  Widget build(BuildContext context) => Obx(
        () => SafeArea(
          child: Scaffold(
            floatingActionButton: SizedBox(
              width: 110.w,
              height: 34.h,
              child: FloatingActionButton.extended(
                extendedPadding:
                    const EdgeInsets.symmetric(horizontal: 23.5, vertical: 8),
                elevation: 4,
                onPressed: () {
                  GlobalMakeAlarm(context: context);
                },
                label: Text(
                  '+ 미션추가',
                  style: TextPath.TextF14W500.copyWith(
                    color: ColorPath.BackgroundWhite,
                  ),
                ),
                backgroundColor: ColorPath.PrimaryColor,
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            appBar: AppBar(
              elevation: 0,
              shadowColor: Colors.white,
              title: Text(
                '미션관리',
                style: TextPath.Heading2F18W600.copyWith(
                  color: ColorPath.TextGrey1H212121,
                ),
              ),
              actions: [
                InkWell(
                  onTap: () {
                    GlobalEmergencyModalWidget(context: context);
                  },
                  child: SizedBox(
                    width: 24.w,
                    height: 24.h,
                    child: Image.asset(
                      'assets/images/medicine/pill0102.jpg',
                    ),
                  ),
                ),
                const SizedBox(width: 20),
              ],
              backgroundColor: Colors.white,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "2022.9.",
                          style: TextPath.Heading3F16W600.copyWith(
                            color: ColorPath.BlackColor,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ...List.generate(
                              7,
                              (index) => const MiniCalendar(
                                dayName: '화',
                                day: 31,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 34),
                    decoration: BoxDecoration(
                      color: ColorPath.Background1HECEFF1,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "일일통계",
                            style: TextPath.Heading2F18W600.copyWith(
                              color: ColorPath.BlackColor,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 22),
                              width: 150.w,
                              height: 105.h,
                              decoration: BoxDecoration(
                                color: ColorPath.BackgroundWhite,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: ColorPath.PrimaryColor.withOpacity(
                                        0.15),
                                    blurRadius: 10,
                                    offset: const Offset(
                                        5, 5), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      Text(
                                        '운동',
                                        style: TextPath.TextF16W500.copyWith(
                                          color: ColorPath.BlackColor,
                                        ),
                                      ),
                                      Text(
                                        '${(controller.finSportsCount.value * 100 / controller.allSportsCount.value).toInt()}%',
                                        style: TextPath.TextF16W500.copyWith(
                                          color: ColorPath.BlackColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 6),
                                  LinearPercentIndicator(
                                    animation: true,
                                    width: 100,
                                    animationDuration: 1000,
                                    lineHeight: 14.0,
                                    percent: controller.finSportsCount.value /
                                        controller.allSportsCount.value,
                                    barRadius: Radius.circular(10),
                                    progressColor: ColorPath.PrimaryColor,
                                    backgroundColor:
                                        ColorPath.PrimaryLightColor,
                                  ),
                                  const SizedBox(height: 6),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        controller.finInjectCount.value
                                            .toString(),
                                        style: TextPath.TextF12W400.copyWith(
                                            color: ColorPath.SecondaryColor),
                                      ),
                                      Text(
                                        ' / ',
                                        style: TextPath.TextF12W400.copyWith(
                                            color: ColorPath.TextGrey2H424242),
                                      ),
                                      Text(
                                        '${controller.allInjectCount.value.toString()}회',
                                        style: TextPath.TextF12W400.copyWith(
                                            color: ColorPath.TextGrey2H424242),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 22),
                              width: 150.w,
                              height: 105.h,
                              decoration: BoxDecoration(
                                color: ColorPath.BackgroundWhite,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: ColorPath.PrimaryColor.withOpacity(
                                        0.15),
                                    blurRadius: 10,
                                    offset: const Offset(
                                        5, 5), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      Text(
                                        '투약',
                                        style: TextPath.TextF16W500.copyWith(
                                          color: ColorPath.BlackColor,
                                        ),
                                      ),
                                      Text(
                                        '${(controller.finInjectCount.value * 100 / controller.allInjectCount.value).toInt()}%',
                                        style: TextPath.TextF16W500.copyWith(
                                          color: ColorPath.BlackColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 6),
                                  LinearPercentIndicator(
                                    animation: true,
                                    width: 100,
                                    animationDuration: 1000,
                                    lineHeight: 14.0,
                                    percent: controller.finSportsCount.value /
                                        controller.allSportsCount.value,
                                    barRadius: Radius.circular(10),
                                    progressColor: ColorPath.PrimaryColor,
                                    backgroundColor:
                                        ColorPath.PrimaryLightColor,
                                  ),
                                  const SizedBox(height: 6),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        controller.finInjectCount.value
                                            .toString(),
                                        style: TextPath.TextF12W400.copyWith(
                                            color: ColorPath.SecondaryColor),
                                      ),
                                      Text(
                                        ' / ',
                                        style: TextPath.TextF12W400.copyWith(
                                            color: ColorPath.TextGrey2H424242),
                                      ),
                                      Text(
                                        '${controller.allInjectCount.value.toString()}회',
                                        style: TextPath.TextF12W400.copyWith(
                                            color: ColorPath.TextGrey2H424242),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '오늘의 미션',
                            style: TextPath.Heading2F18W600.copyWith(
                              color: ColorPath.BlackColor,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        ...List.generate(
                          controller.missionCount.value,
                          (index) => MissionCard(
                            cardName: '투약',
                            cardStatus: '완료',
                            time: DateTime.now(),
                          ),
                        ),
                        const SizedBox(
                          height: 73,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
}

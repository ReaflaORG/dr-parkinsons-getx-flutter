import 'package:base/app/globals/global_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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
        () => Scaffold(
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
            leadingWidth: 60,
            leading: Container(
              margin: const EdgeInsets.only(
                left: 20,
              ),
              child: CircleAvatar(
                backgroundColor: ColorPath.BackgroundWhite,
                radius: 24,
                child: IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(
                    Icons.arrow_back,
                    color: ColorPath.TextGrey1H212121,
                  ),
                ),
              ),
            ),
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
                    'assets/images/icons/page2/24 alert.png',
                  ),
                ),
              ),
              const SizedBox(width: 20),
            ],
            backgroundColor: Colors.white,
          ),
          backgroundColor: ColorPath.Background1HECEFF1,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding:
                      EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.w),
                  color: ColorPath.BackgroundWhite,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        DateFormat('MM월 dd일 EEEE', 'ko').format(controller
                            .dateList[controller.current_index.value]),
                        style: TextPath.TextF14W500.copyWith(
                          color: ColorPath.BlackColor,
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ...List.generate(7, (index) {
                            return InkWell(
                              onTap: () async {
                                controller.current_index.value = index;
                                await controller.getMissionList();
                              },
                              child: MiniCalendar(
                                isSelected:
                                    index == controller.current_index.value,
                                time: controller.dateList[index],
                              ),
                            );
                          }),
                        ],
                      ),
                    ],
                  ),
                ),
                controller.process.value == false
                    ? Container(
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
                                '일일통계',
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
                                        color:
                                            ColorPath.PrimaryColor.withOpacity(
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
                                            style:
                                                TextPath.TextF16W500.copyWith(
                                              color: ColorPath.BlackColor,
                                            ),
                                          ),
                                          Text(
                                            controller.move.value != 0
                                                ? '${(controller.clearMove.value * 100 / controller.move.value).toStringAsFixed(0)}%'
                                                : '0%',
                                            style:
                                                TextPath.TextF16W500.copyWith(
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
                                        percent: controller.move.value == 0
                                            ? 0
                                            : controller.clearMove.value /
                                                controller.move.value,
                                        barRadius: const Radius.circular(10),
                                        progressColor: ColorPath.PrimaryColor,
                                        backgroundColor:
                                            ColorPath.PrimaryLightColor,
                                      ),
                                      const SizedBox(height: 6),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            controller.clearMove.value
                                                .toString(),
                                            style:
                                                TextPath.TextF12W400.copyWith(
                                                    color: ColorPath
                                                        .SecondaryColor),
                                          ),
                                          Text(
                                            ' / ',
                                            style:
                                                TextPath.TextF12W400.copyWith(
                                                    color: ColorPath
                                                        .TextGrey2H424242),
                                          ),
                                          Text(
                                            '${controller.move.value}회',
                                            style:
                                                TextPath.TextF12W400.copyWith(
                                                    color: ColorPath
                                                        .TextGrey2H424242),
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
                                        color:
                                            ColorPath.PrimaryColor.withOpacity(
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
                                            style:
                                                TextPath.TextF16W500.copyWith(
                                              color: ColorPath.BlackColor,
                                            ),
                                          ),
                                          Text(
                                            controller.pill.value != 0
                                                ? '${(controller.clearPill.value * 100 / controller.pill.value).toStringAsFixed(0)}%'
                                                : '0%',
                                            style:
                                                TextPath.TextF16W500.copyWith(
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
                                        percent: controller.pill.value == 0
                                            ? 0
                                            : controller.clearPill.value /
                                                controller.pill.value,
                                        barRadius: const Radius.circular(10),
                                        progressColor: ColorPath.PrimaryColor,
                                        backgroundColor:
                                            ColorPath.PrimaryLightColor,
                                      ),
                                      const SizedBox(height: 6),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            controller.clearPill.value
                                                .toString(),
                                            style:
                                                TextPath.TextF12W400.copyWith(
                                                    color: ColorPath
                                                        .SecondaryColor),
                                          ),
                                          Text(
                                            ' / ',
                                            style:
                                                TextPath.TextF12W400.copyWith(
                                                    color: ColorPath
                                                        .TextGrey2H424242),
                                          ),
                                          Text(
                                            '${controller.pill.value}회',
                                            style:
                                                TextPath.TextF12W400.copyWith(
                                                    color: ColorPath
                                                        .TextGrey2H424242),
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
                              controller.missionData.length,
                              (index) {
                                return MissionCard(
                                  index: index,
                                );
                              },
                            ),
                            const SizedBox(height: 73),
                          ],
                        ),
                      )
                    : const SizedBox.shrink()
              ],
            ),
          ),
        ),
      );
}

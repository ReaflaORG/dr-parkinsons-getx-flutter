import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../globals/global_appbar_widget.dart';
import '../../../globals/global_dialog_widget.dart';
import '../../../globals/global_layout_widget.dart';
import '../../../globals/global_loader_indicator_widget.dart';
import '../../../service/auth_service.dart';
import '../../../theme/color_path.dart';
import '../../../theme/text_path.dart';
import '../../main/controller/main_controller.dart';
import '../controller/mission_controller.dart';
import '../widgets/mini_calendar_widget.dart';
import '../widgets/mission_card_widget.dart';

/// 미션 뷰
class MissionView extends GetView<MissionController> {
  const MissionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoad.value
          ? const GlobalLoaderIndicatorWidget()
          : GlobalLayoutWidget(
              context: context,
              onWillPop: () => MainController.to.handleBackPressed(),
              floatingActionButton: SizedBox(
                width: 110.w,
                height: 40.w,
                child: FloatingActionButton.extended(
                  extendedPadding: const EdgeInsets.symmetric(
                    horizontal: 23.5,
                    vertical: 8,
                  ),
                  elevation: 4,
                  onPressed: () {
                    GlobalMakeAlarm(context: context);
                  },
                  label: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add_rounded,
                        color: Colors.white,
                        size: 18.sp,
                      ),
                      SizedBox(width: 2.5.w),
                      Text(
                        '미션추가',
                        style: TextPath.TextF14W500.copyWith(
                          color: ColorPath.BackgroundWhite,
                        ),
                      ),
                    ],
                  ),
                  backgroundColor: ColorPath.PrimaryColor,
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
              appBar: GlobalAppBarWidget(
                title: '미션관리',
                appBar: AppBar(),
                isLeadingVisible: true,
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
              ),
              body: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        bottom: 20,
                      ).w,
                      color: ColorPath.BackgroundWhite,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            DateFormat('MM월 dd일 EEEE', 'ko').format(
                              controller
                                  .dateList[controller.current_index.value],
                            ),
                            style: TextPath.TextF14W500.copyWith(
                              color: ColorPath.BlackColor,
                              height: 1.2.w,
                            ),
                          ),
                          SizedBox(height: 10.w),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(7, (index) {
                              return MiniCalendar(
                                index: index,
                                isSelected:
                                    index == controller.current_index.value,
                                time: controller.dateList[index],
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 34,
                      ).w,
                      decoration: BoxDecoration(
                        color: ColorPath.Background1HECEFF1,
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(16).r,
                          topRight: const Radius.circular(16).r,
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
                          SizedBox(height: 12.w),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10.w,
                                  vertical: 22.w,
                                ),
                                width: 150.w,
                                height: 120.w,
                                decoration: BoxDecoration(
                                  color: ColorPath.BackgroundWhite,
                                  borderRadius: BorderRadius.circular(12).r,
                                  boxShadow: [
                                    BoxShadow(
                                      color: ColorPath.PrimaryColor.withOpacity(
                                        0.15,
                                      ),
                                      blurRadius: 10,
                                      offset: const Offset(5, 5),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10.w,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                                    ),
                                    SizedBox(height: 10.w),
                                    SizedBox(
                                      width: double.infinity,
                                      child: LinearPercentIndicator(
                                        animation: true,
                                        animationDuration: 1000,
                                        lineHeight: 14.0,
                                        percent: controller.move.value == 0
                                            ? 0
                                            : controller.clearMove.value /
                                                controller.move.value,
                                        barRadius: const Radius.circular(10).r,
                                        progressColor: ColorPath.PrimaryColor,
                                        backgroundColor:
                                            ColorPath.PrimaryLightColor,
                                      ),
                                    ),
                                    SizedBox(height: 10.w),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10.w,
                                      ),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: RichText(
                                          text: TextSpan(
                                            style:
                                                TextPath.TextF12W400.copyWith(
                                              color: ColorPath.SecondaryColor,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: controller.clearMove.value
                                                    .toString(),
                                              ),
                                              TextSpan(
                                                text: ' / ',
                                                style: TextPath.TextF12W400
                                                    .copyWith(
                                                  color: ColorPath
                                                      .TextGrey2H424242,
                                                ),
                                              ),
                                              TextSpan(
                                                text:
                                                    '${controller.move.value}회',
                                                style: TextPath.TextF12W400
                                                    .copyWith(
                                                  color: ColorPath
                                                      .TextGrey2H424242,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10.w,
                                  vertical: 22.w,
                                ),
                                width: 150.w,
                                height: 120.w,
                                decoration: BoxDecoration(
                                  color: ColorPath.BackgroundWhite,
                                  borderRadius: BorderRadius.circular(12).r,
                                  boxShadow: [
                                    BoxShadow(
                                      color: ColorPath.PrimaryColor.withOpacity(
                                        0.15,
                                      ),
                                      blurRadius: 10,
                                      offset: const Offset(5, 5),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10.w,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                                    ),
                                    SizedBox(height: 10.w),
                                    SizedBox(
                                      width: double.infinity,
                                      child: LinearPercentIndicator(
                                        animation: true,
                                        animationDuration: 1000,
                                        lineHeight: 14.0,
                                        percent: controller.pill.value == 0
                                            ? 0
                                            : controller.clearPill.value /
                                                controller.pill.value,
                                        barRadius: const Radius.circular(10).r,
                                        progressColor: ColorPath.PrimaryColor,
                                        backgroundColor:
                                            ColorPath.PrimaryLightColor,
                                      ),
                                    ),
                                    SizedBox(height: 10.w),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10.w,
                                      ),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: RichText(
                                          text: TextSpan(
                                            style:
                                                TextPath.TextF12W400.copyWith(
                                              color: ColorPath.SecondaryColor,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: controller.clearPill.value
                                                    .toString(),
                                              ),
                                              TextSpan(
                                                text: ' / ',
                                                style: TextPath.TextF12W400
                                                    .copyWith(
                                                  color: ColorPath
                                                      .TextGrey2H424242,
                                                ),
                                              ),
                                              TextSpan(
                                                text:
                                                    '${controller.pill.value}회',
                                                style: TextPath.TextF12W400
                                                    .copyWith(
                                                  color: ColorPath
                                                      .TextGrey2H424242,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 24.w),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '오늘의 미션',
                                  style: TextPath.Heading2F18W600.copyWith(
                                    color: ColorPath.BlackColor,
                                  ),
                                ),
                                SizedBox(height: 12.w),
                                ...List.generate(
                                  controller.missionData.length,
                                  (index) {
                                    return MissionCard(
                                      index: index,
                                    );
                                  },
                                ),
                                SizedBox(height: 250.w),
                              ],
                            ),
                          ),
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

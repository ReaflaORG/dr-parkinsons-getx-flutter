import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../globals/global_appbar_widget.dart';
import '../../../globals/global_layout_widget.dart';
import '../../../service/auth_service.dart';
import '../../../theme/color_path.dart';
import '../../../theme/text_path.dart';
import '../controller/alarm_setting_controller.dart';

class AlarmSettingView extends GetView<AlarmSettingController> {
  const AlarmSettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GlobalLayoutWidget(
        context: context,
        appBar: GlobalAppBarWidget(
          appBar: AppBar(),
          title: '알람 설정',
        ),
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 50).w,
            child: Column(
              children: [
                // Container(
                //   padding: EdgeInsets.symmetric(vertical: 2.w),
                //   child: Column(
                //     children: [
                //       Container(
                //         alignment: Alignment.centerLeft,
                //         child: Text(
                //           '환자 보호를 위한 문자 발송 서비스',
                //           style: TextPath.TextF14W400.copyWith(),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                // SizedBox(height: 52.w),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '기본 알림 설정',
                          style: TextPath.TextF16W600.copyWith(
                            color: ColorPath.TextGrey1H212121,
                          ),
                        ),
                      ),
                      SizedBox(height: 17.5.w),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 10, right: 10).w,
                        child: Row(
                          children: [
                            Text(
                              '기본알림',
                              style: TextPath.TextF14W500.copyWith(
                                color: ColorPath.TextGrey1H212121,
                              ),
                            ),
                            const Spacer(),
                            Switch(
                              value: AuthService.to.userData.value.notification,
                              onChanged: (value) {
                                controller.checkBasicAlarm(
                                  type: 'common',
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15.w),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 10, right: 10).w,
                        child: Row(
                          children: [
                            Text(
                              '미션알림',
                              style: TextPath.TextF14W500.copyWith(
                                color: ColorPath.TextGrey1H212121,
                              ),
                            ),
                            const Spacer(),
                            Switch(
                              value: AuthService
                                  .to.userData.value.missionNotification,
                              onChanged: (value) {
                                controller.checkBasicAlarm(
                                  type: 'mission',
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15.w),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 10, right: 10).w,
                        child: Row(
                          children: [
                            Text(
                              '새 게시물 알림',
                              style: TextPath.TextF14W500.copyWith(
                                color: ColorPath.TextGrey1H212121,
                              ),
                            ),
                            const Spacer(),
                            Switch(
                              value: AuthService
                                  .to.userData.value.postNotification,
                              onChanged: (value) {
                                controller.checkBasicAlarm(
                                  type: 'post',
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 54.5.w),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '활동 확인이 안될 경우',
                          style: TextPath.TextF16W600.copyWith(
                            color: ColorPath.TextGrey1H212121,
                          ),
                        ),
                      ),
                      SizedBox(height: 15.w),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 10, right: 10).w,
                        child: Row(
                          children: [
                            Text(
                              '보호자에게 문자전송',
                              style: TextPath.TextF14W500.copyWith(
                                color: ColorPath.TextGrey1H212121,
                              ),
                            ),
                            const Spacer(),
                            Switch(
                              value: AuthService
                                  .to.userData.value.guardianNotification,
                              onChanged: (value) {
                                controller.checkBasicAlarm(
                                  type: 'guardian',
                                );
                              },
                            ),
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
      ),
    );
  }
}

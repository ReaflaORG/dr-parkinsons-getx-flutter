import 'package:base/app/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../theme/colors.dart';
import '../../../theme/texts.dart';
import '../controller/alarm_setting_controller.dart';

// alarm setting view
class AlarmSettingView extends GetView<AlarmSettingController> {
  const AlarmSettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: ColorPath.BackgroundWhite,
          elevation: 0,
          centerTitle: false,
          leadingWidth: 39.w,
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 18.w),
              child: Image.asset(
                'assets/doctor/back_arrow.png',
                width: 21.w,
                height: 13.5.w,
              ),
            ),
          ),
          title: Container(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Text(
              '알람 설정',
              style: TextPath.Heading2F18W600.copyWith(
                color: ColorPath.TextGrey1H212121,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          actions: [
            Container(
              padding: EdgeInsets.fromLTRB(0.w, 10.w, 18.w, 10.w),
              child: InkWell(
                onTap: () {},
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Image.asset(
                    'assets/search_doctors/search_doctors_icon.png',
                    width: 24.w,
                    height: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 2.w),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '환자 보호를 위한 문자 발송 서비스',
                          style: TextPath.TextF14W400.copyWith(),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 52.w),
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
                      const SizedBox(height: 17.5),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 10, right: 10),
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
                              onChanged: (value) async {
                                await controller.checkBasicAlarm(
                                  type: 'common',
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 10, right: 10),
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
                              onChanged: (value) async {
                                await controller.checkBasicAlarm(
                                  type: 'mission',
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 10, right: 10),
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
                              onChanged: (value) async {
                                await controller.checkBasicAlarm(
                                  type: 'post',
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 54.5),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '활동 확인이 안될 경우',
                          style: TextPath.TextF16W600.copyWith(
                            color: ColorPath.TextGrey1H212121,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 10, right: 10),
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
                              onChanged: (value) async {
                                await controller.checkBasicAlarm(
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

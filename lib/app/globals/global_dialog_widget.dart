// ignore_for_file: non_constant_identifier_names

import 'package:dr_parkinsons/app/globals/global_toast_widget.dart';
import 'package:dr_parkinsons/app/modules/home/controller/home_controller.dart';
import 'package:dr_parkinsons/app/modules/mission/controller/mission_controller.dart';
import 'package:dr_parkinsons/app/modules/mission/widgets/alarm.dart';
import 'package:dr_parkinsons/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../service/permission_service.dart';
import '../theme/color_path.dart';
import '../theme/text_path.dart';

/// 뒤로가기 확인 모달
Future<dynamic> GlobalWillPopScopeDialogWidget({String? type}) =>
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(10).w,
        height: 160.w,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20).w,
              child: Wrap(
                children: [
                  Text(
                    '진행사항이 저장되지 않을 수 있습니다',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.w),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: 50.w,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back();

                        switch (type) {
                          case 'signin':
                            Get.until((route) => Get.currentRoute == '/signin');
                            break;
                          default:
                            Get.back();
                            break;
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.grey.shade400),
                      ),
                      child: const Text(
                        '나가기',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: 50.w,
                    child: ElevatedButton(
                      child: const Text(
                        '계속진행',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () => Get.back(),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      elevation: 20.0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      enterBottomSheetDuration: const Duration(milliseconds: 250),
      exitBottomSheetDuration: const Duration(milliseconds: 100),
    );

/// 권한 허용 확인 모달
Future<dynamic> GlobalPermissionModalOpenAppSettingsWidget({
  required PermissionService controller,
  Future<void> Function()? okOnPressed,
}) =>
    Get.dialog(
      WillPopScope(
        onWillPop: () => Future(() => false),
        child: CupertinoAlertDialog(
          title: const Text('권한을 허용해주세요'),
          content: Column(
            children: [
              SizedBox(height: 10.w),
              SizedBox(
                width: Get.width,
                child: Text(
                  "접근 권한이 없어 해당 기능을 사용할 수 없습니다. ${dotenv.env["APP_KO_NAME"]}을 원활하게 이용하기 위해서 권한을 허용해주세요",
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: 10.w),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 5).w,
                width: Get.width,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.all(
                    const Radius.circular(5).r,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Get.width,
                      child: const Text(
                        '허용이 필요한 항목',
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '위치기반',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 12.sp,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(width: 21.w),
                        Text(
                          controller.isLocationPermissionsGranted.value
                              ? '허용'
                              : '비허용',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 12.sp,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            CupertinoDialogAction(
              child: Text(
                '취소',
                style: TextStyle(
                  color: Colors.grey.shade700,
                ),
              ),
              onPressed: () =>
                  controller.handlePermissionDialogCancelOnPressed(),
            ),
            CupertinoDialogAction(
              child: const Text('설정'),
              onPressed: () => controller.handlePermissionReOnPressed(),
            ),
          ],
        ),
      ),
      name: 'GlobalPermissionModalOpenAppSettingsWidget',
      barrierDismissible: false,
      routeSettings: const RouteSettings(
          name: 'GlobalPermissionModalOpenAppSettingsWidget'),
    );

/// 응급상황 모달
Future<dynamic> GlobalEmergencyModalWidget({required BuildContext context}) =>
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              SizedBox(
                width: 80.w,
                height: 80.w,
                child: Image.asset('assets/images/icons/page2/80 alert.png'),
              ),
              const SizedBox(height: 12),
              Text(
                '응급 문자 보내기',
                style: TextPath.Heading2F18W600.copyWith(
                  color: ColorPath.TextGrey1H212121,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '보호자 연락처',
                    style: TextPath.TextF12W400.copyWith(
                      color: ColorPath.TextGrey2H424242,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    '010 - XXXX - XXXX',
                    style: TextPath.TextF12W400.copyWith(
                      color: ColorPath.TextGrey2H424242,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: ColorPath.Background1HECEFF1,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(16),
                          ),
                        ),
                        height: 48.w,
                        child: Text(
                          '취소',
                          style: TextPath.TextF14W500.copyWith(
                            color: ColorPath.TextGrey1H212121,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        HomeController.to.sendEmergency();
                        Get.back();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: ColorPath.PrimaryColor,
                            borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(16),
                            )),
                        height: 48.w,
                        child: Text(
                          '전송',
                          style: TextPath.TextF14W500.copyWith(
                            color: ColorPath.BackgroundWhite,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          contentPadding: EdgeInsets.zero,
        );
      },
    );

/// 보호자 번호 추가 해야하는 모달
Future<dynamic> GlobalEmergencyModalWidget2({required BuildContext context}) =>
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              const Radius.circular(16).r,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30.w),
              SizedBox(
                width: 80.w,
                height: 80.w,
                child: Image.asset('assets/images/icons/page2/80 alert.png'),
              ),
              SizedBox(height: 12.w),
              Text(
                '응급 문자 보내기',
                style: TextPath.Heading2F18W600.copyWith(
                  color: ColorPath.TextGrey1H212121,
                ),
              ),
              SizedBox(height: 4.w),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '보호자 연락처가 등록되어 있지 않습니다.',
                    style: TextPath.TextF12W400.copyWith(
                      color: ColorPath.TertiaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40.w),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: ColorPath.Background1HECEFF1,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(16),
                          ),
                        ),
                        height: 48.w,
                        child: Text(
                          '뒤로가기',
                          style: TextPath.TextF14W500.copyWith(
                            color: ColorPath.TextGrey1H212121,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        Get.back();
                        Get.toNamed(Routes.PROFILE_SETTING);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: ColorPath.PrimaryColor,
                            borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(16),
                            )),
                        height: 48.w,
                        child: Text(
                          '프로필 설정',
                          style: TextPath.TextF14W500.copyWith(
                            color: ColorPath.BackgroundWhite,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          contentPadding: EdgeInsets.zero,
        );
      },
    );

/// 주의해야할 약품 모달
///
/// [medicineName] String : 약품 이름
///
/// [okOnPressed] void Function()? : 확인 버튼 클릭시 실행할 함수
Future<dynamic> GlobalDrugmisuseModalWidget(
  String medicineName, {
  void Function()? okOnPressed,
}) {
  return Get.dialog(
    AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ).r,
      ),
      title: Text(
        '주의해야할 약품',
        style: TextPath.TextF18W600.copyWith(),
      ),
      titlePadding: const EdgeInsets.fromLTRB(20, 20, 20, 0).w,
      contentPadding: EdgeInsets.zero,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0).w,
            child: Text(
              '$medicineName(은/는)\r\n파킨슨 증상을 악화시킬 수 있는 약물이므로\r\n전문의와 상의하시기 바랍니다.',
              style: TextPath.TextF14W400.copyWith(
                color: const Color(0XFF475467),
              ),
            ),
          ),
          SizedBox(height: 20.w),
          SizedBox(
            width: double.infinity,
            height: 44.w,
            child: ElevatedButton(
              onPressed: okOnPressed,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: ColorPath.PrimaryDarkColor,
                shape: RoundedRectangleBorder(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ).r,
                ),
              ),
              child: Text(
                '확인',
                style: TextPath.Heading3F16W600.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

/// 앱 업데이트 모달
Future<dynamic> GlobalAppVersionUpgradeModalWidget({
  Future<void> Function()? cancelOnPressed,
  Future<void> Function()? okOnPressed,
}) =>
    Get.dialog(
      WillPopScope(
        onWillPop: () => Future(() => false),
        child: CupertinoAlertDialog(
          title: const Text('앱 업데이트'),
          content: Column(
            children: [
              SizedBox(height: 10.w),
              SizedBox(
                width: Get.width,
                child: Text(
                  "${dotenv.env["APP_KO_NAME"]}을 원활하게 이용하기 위해서 최신 버전으로 업데이트할 것을 권장합니다. 이전 버전은 지원되지 않으니, 업데이트를 진행해야 계속할 수 있습니다.",
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: 10.w),
            ],
          ),
          actions: [
            CupertinoDialogAction(
              onPressed: cancelOnPressed,
              child: Text(
                '취소',
                style: TextStyle(
                  color: Colors.grey.shade500,
                ),
              ),
            ),
            CupertinoDialogAction(
              onPressed: okOnPressed,
              child: Text(
                '업데이트',
                style: TextStyle(
                  color: ColorPath.PrimaryDarkColor,
                ),
              ),
            ),
          ],
        ),
      ),
      name: 'GlobalAppVersionUpgradeModalWidget',
      barrierDismissible: false,
      routeSettings:
          const RouteSettings(name: 'GlobalAppVersionUpgradeModalWidget'),
    );

/// 투약 생성 모달
Future<dynamic> GlobalMakeAlarm({
  required BuildContext context,
}) =>
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Obx(
          () => AlertDialog(
            backgroundColor: ColorPath.Background1HECEFF1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                const Radius.circular(16).r,
              ),
            ),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.only(
                    top: 30,
                    left: 20,
                    right: 20,
                    bottom: 30,
                  ).w,
                  child: Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '알람 종류 선택',
                          style: TextPath.Heading3F16W600.copyWith(
                            color: ColorPath.TextGrey1H212121,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Alarm(
                                isPick: MissionController.to.alarm[0] ==
                                    MissionController.to.type.value,
                                ontap: () async {
                                  await MissionController.to.updateType(
                                      MissionController.to.alarm[0]);
                                },
                                imageUrl: 'assets/images/icons/3d/48pill.png',
                                text: MissionController.to.alarm[0]),
                            Alarm(
                                isPick: MissionController.to.alarm[1] ==
                                    MissionController.to.type.value,
                                ontap: () async {
                                  await MissionController.to.updateType(
                                      MissionController.to.alarm[1]);
                                },
                                imageUrl: 'assets/images/icons/3d/36water.png',
                                text: MissionController.to.alarm[1]),
                            Alarm(
                                isPick: MissionController.to.alarm[2] ==
                                    MissionController.to.type.value,
                                ontap: () async {
                                  await MissionController.to.updateType(
                                      MissionController.to.alarm[2]);
                                },
                                imageUrl: 'assets/images/icons/3d/36vegi.png',
                                text: MissionController.to.alarm[2]),
                            Alarm(
                                isPick: MissionController.to.alarm[3] ==
                                    MissionController.to.type.value,
                                ontap: () async {
                                  await MissionController.to.updateType(
                                      MissionController.to.alarm[3]);
                                },
                                imageUrl:
                                    'assets/images/icons/3d/36outdoor.png',
                                text: MissionController.to.alarm[3]),
                            Alarm(
                              isPick: MissionController.to.alarm[4] ==
                                  MissionController.to.type.value,
                              ontap: () async {
                                await MissionController.to
                                    .updateType(MissionController.to.alarm[4]);
                              },
                              imageUrl: 'assets/images/icons/3d/36heart.png',
                              text: MissionController.to.alarm[4],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30.w),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '시간 설정하기',
                          style: TextPath.Heading3F16W600.copyWith(
                            color: ColorPath.TextGrey1H212121,
                          ),
                        ),
                      ),
                      SizedBox(height: 12.w),
                      InkWell(
                        onTap: () {
                          Future<TimeOfDay?> selectedTime = showTimePicker(
                            initialEntryMode: TimePickerEntryMode.input,
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          //여기서 사용자가 시간을 선택할 때까지 멈춤
                          selectedTime.then((timeofDay) {
                            if (timeofDay != null) {
                              String temp_string =
                                  '${timeofDay.hour.toString().padLeft(2, '0')}시${timeofDay.minute.toString().padLeft(2, '0')}분';
                              int temp_value = int.parse(
                                  '${timeofDay.hour.toString().padLeft(2, '0')}${timeofDay.minute.toString().padLeft(2, '0')}');
                              Logger().d(
                                  '${timeofDay.hour.toString().padLeft(2, '0')}시${timeofDay.minute.toString().padLeft(2, '0')}분');
                              MissionController.to
                                  .updateTime(temp_value, temp_string);
                            }
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(10),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: ColorPath.BackgroundWhite,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(6))),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(Icons.access_time),
                              const SizedBox(width: 10),
                              Container(
                                alignment: Alignment.center,
                                width: 110.w,
                                height: 17.w,
                                child: Text(
                                  MissionController.to.dateFormatString.value,
                                  style: TextPath.TextF14W500.copyWith(
                                      color: ColorPath.TextGrey1H212121),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerRight,
                                width: 70.w,
                                height: 18.w,
                                child: Text(
                                  '변경',
                                  style: TextPath.TextF12W400.copyWith(
                                    color: ColorPath.TextGrey2H424242,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 48,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: ColorPath.BackgroundWhite,
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(16),
                                )),
                            height: 48,
                            child: Text(
                              '취소',
                              style: TextPath.TextF14W500.copyWith(
                                color: ColorPath.TextGrey1H212121,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            MissionController.to.addMission();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: ColorPath.PrimaryDarkColor,
                                borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(16),
                                )),
                            height: 48,
                            child: Text(
                              '등록하기',
                              style: TextPath.TextF14W500.copyWith(
                                color: ColorPath.BackgroundWhite,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            // ),
            contentPadding: const EdgeInsets.all(0),
          ),
        );
      },
    );

/// 미션 수정 다이얼로그
///
/// [context] BuildContext : BuildContext
///
/// [id] int : 미션 아이디
///
/// [isStatus] bool : 미션 상태
Future<dynamic> GlobalMissionUpdateAlarm({
  required int id,
  required bool isStatus,
}) {
  return Get.dialog(
    Obx(
      () => AlertDialog(
        backgroundColor: ColorPath.Background1HECEFF1,
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(16),
          ).r,
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.only(
                top: 30,
                left: 20,
                right: 20,
                bottom: 30,
              ).w,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '알람 종류 선택',
                      style: TextPath.Heading3F16W600.copyWith(
                        color: ColorPath.TextGrey1H212121,
                      ),
                    ),
                  ),
                  SizedBox(height: 14.w),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Alarm(
                          isPick: MissionController.to.alarm[0] ==
                              MissionController.to.type.value,
                          ontap: () {
                            MissionController.to.updateType(
                              MissionController.to.alarm[0],
                            );
                          },
                          imageUrl: 'assets/images/icons/3d/48pill.png',
                          text: MissionController.to.alarm[0],
                        ),
                        Alarm(
                          isPick: MissionController.to.alarm[1] ==
                              MissionController.to.type.value,
                          ontap: () {
                            MissionController.to.updateType(
                              MissionController.to.alarm[1],
                            );
                          },
                          imageUrl: 'assets/images/icons/3d/36water.png',
                          text: MissionController.to.alarm[1],
                        ),
                        Alarm(
                          isPick: MissionController.to.alarm[2] ==
                              MissionController.to.type.value,
                          ontap: () {
                            MissionController.to.updateType(
                              MissionController.to.alarm[2],
                            );
                          },
                          imageUrl: 'assets/images/icons/3d/36vegi.png',
                          text: MissionController.to.alarm[2],
                        ),
                        Alarm(
                          isPick: MissionController.to.alarm[3] ==
                              MissionController.to.type.value,
                          ontap: () {
                            MissionController.to.updateType(
                              MissionController.to.alarm[3],
                            );
                          },
                          imageUrl: 'assets/images/icons/3d/36outdoor.png',
                          text: MissionController.to.alarm[3],
                        ),
                        Alarm(
                          isPick: MissionController.to.alarm[4] ==
                              MissionController.to.type.value,
                          ontap: () {
                            MissionController.to.updateType(
                              MissionController.to.alarm[4],
                            );
                          },
                          imageUrl: 'assets/images/icons/3d/36heart.png',
                          text: MissionController.to.alarm[4],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.w),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '시간 설정하기',
                      style: TextPath.Heading3F16W600.copyWith(
                        color: ColorPath.TextGrey1H212121,
                      ),
                    ),
                  ),
                  SizedBox(height: 12.w),
                  InkWell(
                    onTap: () {
                      Future<TimeOfDay?> selectedTime = showTimePicker(
                        initialEntryMode: TimePickerEntryMode.input,
                        context: Get.overlayContext as BuildContext,
                        initialTime: TimeOfDay.now(),
                      );
                      // 여기서 사용자가 시간을 선택할 때까지 멈춤
                      selectedTime.then((timeofDay) {
                        if (timeofDay != null) {
                          String temp_string =
                              '${timeofDay.hour.toString().padLeft(2, '0')}시${timeofDay.minute.toString().padLeft(2, '0')}분';
                          int temp_value = int.parse(
                              '${timeofDay.hour.toString().padLeft(2, '0')}${timeofDay.minute.toString().padLeft(2, '0')}');
                          Logger().d(
                              '${timeofDay.hour.toString().padLeft(2, '0')}시${timeofDay.minute.toString().padLeft(2, '0')}분');
                          MissionController.to
                              .updateTime(temp_value, temp_string);
                        }
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10).w,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: ColorPath.TertiaryLightColor,
                        borderRadius: BorderRadius.all(
                          const Radius.circular(6).r,
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(Icons.access_time),
                          SizedBox(width: 10.w),
                          Container(
                            alignment: Alignment.center,
                            width: 110.w,
                            height: 17.w,
                            child: Text(
                              MissionController.to.dateFormatString.value,
                              style: TextPath.TextF14W500.copyWith(
                                color: ColorPath.TextGrey1H212121,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            width: 70.w,
                            height: 18.w,
                            child: Text(
                              '변경',
                              style: TextPath.TextF12W400.copyWith(
                                color: ColorPath.TextGrey2H424242,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 48.w,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () async {
                        MissionController.to.deleteMission(mission_id: id);
                        Get.back();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: ColorPath.BackgroundWhite,
                          borderRadius: BorderRadius.only(
                            bottomLeft: const Radius.circular(16).r,
                          ),
                        ),
                        height: 48.w,
                        child: Text(
                          '삭제하기',
                          style: TextPath.TextF14W500.copyWith(
                            color: ColorPath.TextGrey1H212121,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () async {
                        if (isStatus) {
                          GlobalToastWidget('이미 완료(실패)한 미션입니다');

                          return;
                        }

                        MissionController.to.updateMission(mission_id: id);
                        Get.back();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: ColorPath.PrimaryDarkColor,
                          borderRadius: BorderRadius.only(
                            bottomRight: const Radius.circular(16).r,
                          ),
                        ),
                        height: 48.w,
                        child: Text(
                          '수정하기',
                          style: TextPath.TextF14W500.copyWith(
                            color: ColorPath.BackgroundWhite,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        // ),
        contentPadding: EdgeInsets.zero,
      ),
    ),
  );
}

// showDialog(
//   context: context,
//   barrierDismissible: true,
//   builder: (BuildContext context) {
//     return
//   },
// );

/// 준비중입니다. 모달
Future<dynamic> GlobalReadyModal({required BuildContext context}) => showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: ColorPath.BackgroundWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.w)),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: 30,
                  left: 20,
                  right: 20.w,
                  bottom: 20,
                ).w,
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        '파킨슨병 조기진단을 위한 선별검사도구를 개발 및 검증 중에 있습니다.\r\n검증이 완료되면 업데이트 하겠습니다.\r\n감사합니다.',
                        style: TextPath.Heading3F16W600.copyWith(
                          color: ColorPath.TextGrey1H212121,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: SizedBox(
                  height: 48.w,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: ColorPath.PrimaryColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16.w),
                          bottomRight: Radius.circular(16.w),
                        )),
                    height: 48.w,
                    child: Text(
                      '닫기',
                      style: TextPath.TextF14W500.copyWith(
                        color: ColorPath.TextWhite,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          // ),
          contentPadding: const EdgeInsets.all(0),
        );
      },
    );

/// 내 증상 기록 모달
///
/// [alertTitleMsg] String : 제목
///
/// [alertContentMsg] String : 내용
///
/// [onCancelPressed] void Function()? : 취소 버튼 클릭시
///
/// [onOkPressed] void Function()? : 확인 버튼 클릭시
Future<dynamic> GlobalSymptomRecordWidget({
  required String alertTitleMsg,
  required String alertContentMsg,
  required void Function()? onCancelPressed,
  required void Function()? onOkPressed,
}) {
  return Get.dialog(
    AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(16),
        ).r,
      ),
      title: Text(
        alertTitleMsg,
        style: TextPath.TextF18W600.copyWith(),
      ),
      titlePadding: const EdgeInsets.fromLTRB(20, 20, 20, 0).w,
      contentPadding: EdgeInsets.zero,
      content: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0).w,
              child: Text(
                alertContentMsg,
                style: TextPath.TextF16W400.copyWith(),
              ),
            ),
            SizedBox(height: 24.w),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 48.w,
                    child: TextButton(
                      onPressed: onCancelPressed,
                      style: TextButton.styleFrom(
                        foregroundColor: ColorPath.TextGrey2H424242,
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(8),
                          ).r,
                        ),
                        side: BorderSide(
                          color: ColorPath.Background1HECEFF1,
                        ),
                      ),
                      child: Text(
                        '취소하기',
                        style: TextPath.TextF16W600.copyWith(),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 48.w,
                    child: TextButton(
                      onPressed: onOkPressed,
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: ColorPath.PrimaryDarkColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(8),
                          ).r,
                        ),
                      ),
                      child: Text(
                        '삭제하기',
                        style: TextPath.TextF16W600White.copyWith(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // SizedBox(
            //   width: double.infinity,
            //   height: 44.w,
            //   child:
            // ),
            // SizedBox(height: 10.w),
            // SizedBox(
            //   width: double.infinity,
            //   height: 44.w,
            //   child:
            // ),
          ],
        ),
      ),
    ),
  );
}

/// 쿠퍼티노 바텀시트 모달
///
/// [albumOnPressed] void Function()? : 앨범 버튼 클릭시
///
/// [videoOnPressed] void Function()? : 비디오 버튼 클릭시
void GlobalAlbumBottomSheetModal({
  required void Function()? albumOnPressed,
  required void Function()? videoOnPressed,
}) {
  Get.bottomSheet(
    Padding(
      padding: const EdgeInsets.all(9).w,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            // margin: const EdgeInsets.symmetric(vertical: 2).w,
            width: 50.w,
            height: 4.w,
            decoration: BoxDecoration(
              color: ColorPath.Background2HD9D9D9,
              borderRadius: BorderRadius.circular(4.w),
            ),
          ),
          SizedBox(height: 15.w),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     IconButton(
          //       onPressed: () {
          //         Get.back();
          //       },
          //       icon: Icon(
          //         Icons.arrow_back_ios_rounded,
          //         color: Colors.transparent,
          //         size: 18.sp,
          //       ),
          //     ),
          //     Text(
          //       '사진선택',
          //       style: TextPath.TextF14W600,
          //     ),
          //     IconButton(
          //       onPressed: () {
          //         Get.back();
          //       },
          //       icon: Icon(
          //         Icons.close_rounded,
          //         size: 22.sp,
          //       ),
          //     )
          //   ],
          // ),
          TextButton(
            onPressed: albumOnPressed,
            // style: TextButton.styleFrom(
            //   elevation: 0,
            //   backgroundColor: ColorPath.GreyLightColor,
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(8.w),
            //   ),
            // ),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8).w,
              alignment: Alignment.center,
              width: double.infinity,
              child: Text(
                '사진앨범',
                style: TextPath.TextF16W500.copyWith(
                  color: ColorPath.PrimaryColor,
                ),
              ),
            ),
          ),
          SizedBox(height: 4.w),
          TextButton(
            onPressed: videoOnPressed,
            // style: TextButton.styleFrom(
            //   elevation: 0,
            //   backgroundColor: ColorPath.GreyLightColor,
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(8.w),
            //   ),
            // ),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8).w,
              alignment: Alignment.center,
              width: double.infinity,
              child: Text(
                '영상앨범',
                style: TextPath.TextF16W500.copyWith(
                  color: ColorPath.PrimaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
    backgroundColor: Colors.white,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: const Radius.circular(24).w,
        topRight: const Radius.circular(24).w,
      ),
    ),
    ignoreSafeArea: true,
    useRootNavigator: true,
  );
  // await showCupertinoModalPopup(
  //   context: Get.overlayContext as BuildContext,
  //   builder: ((context) {
  //     return CupertinoActionSheet(
  //       actions: [
  //         CupertinoActionSheetAction(
  //           onPressed: () {
  //             Get.back();
  //             // handle_call(ESITMATE.number);
  //           },
  //           child: Text(
  //             '이미지 선택하기',
  //             style: TextPath.TextF14W500.copyWith(
  //               color: ColorPath.TextGrey2H424242,
  //             ),
  //           ),
  //         ),
  //         CupertinoActionSheetAction(
  //           onPressed: () async {
  //             // Get.back();
  //             // bool cancle = await APPMODAL.confirmModal(
  //             //     title: "계약을 취소하기겠습니까?",
  //             //     dscription:
  //             //         "계약취소 요청 후 되돌릴 수 없으며,\n반드시 전문가와 상의 후 진행해주세요.");
  //             // if (!cancle) return;
  //             // // todo 취소 API 호출
  //             // int findIndex = faker_estimate_connect.indexWhere(
  //             //     (element) => item.connect_id == element.connect_id);
  //             // faker_estimate_connect[findIndex].type = "취소내역";
  //             // faker_estimate_connect[findIndex].status = "계약취소";
  //             // await APPMODAL.alertModal(
  //             //     title: "계약이 취소되었습니다.",
  //             //     dscription: "취소 내역은 '나의견적'에서 '취소내역'\n항목에서 확인 가능합니다.");
  //             // // todo 데이터 리스트 업데이트
  //             // await onInitData();
  //           },
  //           child: Text(
  //             '동영상 선택하기',
  //             style: TextPath.TextF14W500.copyWith(
  //               color: ColorPath.TextGrey2H424242,
  //             ),
  //           ),
  //         ),
  //       ],
  //       cancelButton: CupertinoActionSheetAction(
  //         onPressed: () => Get.back(),
  //         child: Text(
  //           '닫기',
  //           style: TextStyle(
  //             color: Colors.black87,
  //             fontWeight: FontWeight.w600,
  //             fontSize: 14.sp,
  //           ),
  //         ),
  //       ),
  //     );
  //   }),
  // );
}

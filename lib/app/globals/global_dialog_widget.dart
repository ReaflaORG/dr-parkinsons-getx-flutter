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
import '../theme/texts.dart';

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

///* 보호자 번호 추가 해야하는 모달
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

class GlobalDrugmisuseModalWidget extends StatelessWidget {
  final String medicineName;
  final void Function()? okOnPressed;

  final bool isFound;
  const GlobalDrugmisuseModalWidget({
    super.key,
    required this.medicineName,
    required this.okOnPressed,
    required this.isFound,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            padding: const EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width - 20,
            height: 200.w,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Text(
                  '주의해야할 약품',
                  style: TextPath.Heading2F18W600,
                ),
                const SizedBox(height: 20),
                isFound
                    ? Text(
                        '$medicineName(은/는)\r\n파킨슨 증상을 악화시킬 수 있는 약물이므로,\r\n전문의와 상의하시기 바랍니다.',
                        style: TextPath.TextF14W400.copyWith(
                          color: const Color(0XFF475467),
                        ),
                      )
                    : const Text('검색 결과 없음'),
                SizedBox(height: 30.w),
                SizedBox(
                  width: double.infinity,
                  height: 44.w,
                  child: ElevatedButton(
                    onPressed: okOnPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorPath.PrimaryDarkColor,
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
        ),
      ),
    );
  }
}

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

///*투약 생성 모달
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
                        await Future.wait([
                          () async {
                            MissionController.to.deleteMission(mission_id: id);
                          }(),
                          () async {
                            Get.back();
                          }(),
                        ]);
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

                        await Future.wait([
                          () async {
                            MissionController.to.updateMission(mission_id: id);
                          }(),
                          () async {
                            Get.back();
                          }(),
                        ]);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: ColorPath.PrimaryDarkColor,
                          borderRadius: BorderRadius.only(
                            bottomRight: const Radius.circular(16).r,
                          ),
                        ),
                        height: 48,
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

///* 준비중입니다. 모달
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
                        '준비 중 입니다.',
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
Future<dynamic> GlobalSymptomRecordWidget({
  required String alertTitleMsg,
  required String alertContentMsg,
  required void Function()? onCancelPressed,
  required void Function()? onOkPressed,
}) {
  // return Get.dialog(
  //   CupertinoAlertDialog(
  //     title: Text(
  //       alertTitleMsg,
  //       style: TextPath.TextF18W600.copyWith(),
  //     ),
  //     content: Text(
  //       alertContentMsg,
  //       style: TextPath.TextF16W400.copyWith(),
  //     ),
  //     actions: [
  //       CupertinoDialogAction(
  //         isDefaultAction: true,
  //         child: Text("Close"),
  //       ),
  //       CupertinoDialogAction(
  //         isDefaultAction: true,
  //         child: Text("Close"),
  //       ),
  //     ],
  //   ),
  // );
  return Get.dialog(
    AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
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

// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../service/permission_service.dart';
import '../theme/colors.dart';

Future<dynamic> GlobalWillPopScopeDialogWidget({String? type}) =>
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(10),
        height: 160.h,
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
              padding: const EdgeInsets.all(20),
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
            SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: 50.h,
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
                    height: 50.h,
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

Future<dynamic> GlobalPermissionModalBottomSheetWidget({
  required PermissionService controller,
}) =>
    Get.dialog(
      WillPopScope(
        onWillPop: () => Future(() => false),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Container(
              // margin: const EdgeInsets.all(30),
              width: 320.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        SizedBox(
                          height: 150.h,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "${dotenv.env["APP_KO_NAME"]} 이용 안내",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              SizedBox(height: 10.h),
                              Text(
                                "${dotenv.env["APP_KO_NAME"]}을 이용하려면\r\n아래의 권한을 허용해 주세요",
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 14.sp,
                                  height: 1.h,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.permissionList.length,
                          itemBuilder: (BuildContext context, index) => Theme(
                            data: ThemeData().copyWith(
                              // unselectedWidgetColor: Colors.white,
                              colorScheme: ColorScheme.light(
                                primary: Colors.grey.shade600,
                              ),
                              dividerColor: Colors.transparent,
                            ),
                            child: ExpansionTile(
                              title: Row(
                                children: [
                                  Icon(
                                    controller.permissionList[index]['icon']
                                        as IconData,
                                    size: 16,
                                    color: Colors.grey.shade600,
                                  ),
                                  SizedBox(width: 10.w),
                                  Text(
                                    controller.permissionList[index]['title']
                                        .toString(),
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              initiallyExpanded: true,
                              tilePadding: EdgeInsets.zero,
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.only(left: 0, right: 20),
                                  child: Text(
                                    controller.permissionList[index]
                                            ['description']
                                        .toString(),
                                    style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20.h),
                                Divider(
                                  height: 1,
                                  color: Colors.grey.shade400,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.info_rounded,
                              color: Colors.grey.shade600,
                              size: 16,
                            ),
                            SizedBox(width: 10.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "권한 허용 후 ${dotenv.env["APP_KO_NAME"]}을 시작합니다",
                                  style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 14.sp,
                                  ),
                                ),
                                Text(
                                  "아래 '허용하기'를 눌러 권한을 허용해 주세요",
                                  style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40.h),
                  SizedBox(
                    width: Get.width,
                    height: 60.h,
                    child: ElevatedButton(
                      onPressed: () => controller.handlePermissionOnPressed(),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          const Color(0XFF82c736),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                            ),
                          ),
                        ),
                      ),
                      child: Text(
                        '허용하기',
                        style: TextStyle(
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      name: 'PermissionModalBottomSheetWidget',
      barrierDismissible: false,
      // transitionDuration: const Duration(milliseconds: 800),
      // transitionCurve: Curves.easeIn,
      routeSettings:
          const RouteSettings(name: 'PermissionModalBottomSheetWidget'),
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
              SizedBox(height: 10.h),
              SizedBox(
                width: Get.width,
                child: Text(
                  "접근 권한이 없어 해당 기능을 사용할 수 없습니다. ${dotenv.env["APP_KO_NAME"]}을 원활하게 이용하기 위해서 권한을 허용해주세요",
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                width: Get.width,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
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
              SizedBox(height: 10.h),
              SizedBox(
                width: Get.width,
                child: Text(
                  "${dotenv.env["APP_KO_NAME"]}을 원활하게 이용하기 위해서 최신 버전으로 업데이트할 것을 권장합니다. 이전 버전은 지원되지 않으니, 업데이트를 진행해야 계속할 수 있습니다.",
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: 10.h),
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

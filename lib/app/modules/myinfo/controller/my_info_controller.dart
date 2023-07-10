// ignore_for_file: unnecessary_overrides

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../globals/global_toast_widget.dart';
import '../../../models/base_response_model.dart';
import '../../../provider/provider.dart';
import '../../../routes/app_pages.dart';
import '../../../service/auth_service.dart';
import '../../../theme/color_path.dart';
import '../../../theme/text_path.dart';
import '../models/my_info_item_model.dart';

class MyInfoController extends GetxController {
  static MyInfoController get to => Get.find();

  // Data ▼

  /// 메뉴 데이터
  RxList<MyInfoMenuModel> menuData = [
    MyInfoMenuModel(
      title: '내 증상 기록',
      type: 'menu',
      page: Routes.MY_SYMPTOMS,
    ),
    MyInfoMenuModel(
      title: '프로필 설정',
      type: 'menu',
      page: Routes.PROFILE_SETTING,
    ),
    MyInfoMenuModel(
      title: '자주 묻는 질문',
      type: 'menu',
      page: Routes.FAQ,
    ),
    MyInfoMenuModel(
      title: '알람 설정',
      type: 'menu',
      page: Routes.ALARM_SETTING,
    ),
    MyInfoMenuModel(
      title: '의견제안',
      type: 'menu',
      page: Routes.SUGGEST_POLICY,
    ),
    MyInfoMenuModel(
      title: '약관 및 정책',
      type: 'menu',
      page: '/myinfo/terms',
    ),
    MyInfoMenuModel(
      title: '로그아웃',
      type: 'button',
      onPressed: () async {
        Get.dialog(
          AlertDialog(
            title: Text(
              '로그아웃 하시겠습니까?',
              style: TextPath.Heading2F18W600.copyWith(
                color: ColorPath.TextGrey1H212121,
              ),
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
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
                        onTap: () async {
                          // 로그아웃
                          await AuthService.to.handleLogout();
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
                            '로그아웃',
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
          ),
        );
      },
    ),
    MyInfoMenuModel(
      title: '버전 정보 v1.0.0',
      type: 'version',
      page: null,
    ),
  ].obs;

  // Function ▼

  /// 내 주치의 삭제 모달
  Future<dynamic> handlelMyDoctorModalWidget() => Get.dialog(
        AlertDialog(
          title: Text(
            '내 주치의를 삭제하시겠습니까?',
            style: TextPath.Heading2F18W600.copyWith(
              color: ColorPath.TextGrey1H212121,
            ),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20).w,
                child: const Text(
                  '주치의 찾기 탭을 통해 다시 담당 주치의를 설정하실 수 있습니다.',
                ),
              ),
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
                      onTap: () async {
                        await deleteMyDoctor();
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
                          '삭제',
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
        ),
      );

  // Function ▼

  /// 내 주치의 삭제 API 핸들러
  Future<void> deleteMyDoctor() async {
    try {
      AuthBaseResponseModel response = await Provider.dio(
        method: 'PATCH',
        url: '/doctor/${AuthService.to.myDoctor.value.doctorId}',
      );

      switch (response.statusCode) {
        case 200:
          await AuthService.to.handleMyInfo();
          break;
        default:
          throw Exception(response.message);
      }
    } catch (e) {
      GlobalToastWidget(e.toString().substring(11));
    }
  }

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  InternalFinalCallback<void> get onStart => super.onStart;

  @override
  InternalFinalCallback<void> get onDelete => super.onDelete;
}

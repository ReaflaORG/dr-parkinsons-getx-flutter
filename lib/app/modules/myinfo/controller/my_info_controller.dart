// ignore_for_file: unnecessary_overrides

import 'dart:async';

import 'package:dr_parkinsons/app/modules/myinfo/widgets/show_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../globals/global_toast_widget.dart';
import '../../../models/base_response_model.dart';
import '../../../provider/provider.dart';
import '../../../routes/app_pages.dart';
import '../../../service/auth_service.dart';
import '../models/my_info_item_model.dart';

class MyInfoController extends GetxController {
  static MyInfoController get to => Get.find();

  // Data ▼

  /// 메뉴 데이터
  RxList<MyInfoMenuModel> menuData = [
    MyInfoMenuModel(
      title: '내 증상 기록',
      page: Routes.MY_SYMPTOMS,
    ),
    MyInfoMenuModel(
      title: '정책제안',
      page: Routes.SUGGEST_POLICY,
    ),
    MyInfoMenuModel(
      title: '프로필 설정',
      page: Routes.PROFILE_SETTING,
    ),
    MyInfoMenuModel(
      title: '자주 묻는 질문',
      page: Routes.FAQ,
    ),
    MyInfoMenuModel(
      title: '알람 설정',
      page: Routes.ALARM_SETTING,
    ),
    MyInfoMenuModel(
      title: '약관 및 정책',
      page: '/myinfo/terms',
    ),
    MyInfoMenuModel(
      title: '회원 관리',
      page: Routes.MANAGE_MEMBER,
    ),
    MyInfoMenuModel(
      title: '버전 정보 v1.0.0',
      page: null,
    ),
  ].obs;

  // Function ▼

  // 전문의 설정하기 불러오기
  Future<void> putDoctorUser(BuildContext context) async {
    await showConfimDialog(
        context, '정말 삭제하시겠습니까?', '주치의 찾기 탭을 통해 다시 담당 주치의를 설정하실 수 있습니다.',
        () async {
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
    });
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

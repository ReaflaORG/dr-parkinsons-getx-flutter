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

// my info controller
class MyInfoController extends GetxController {
  static MyInfoController get to => Get.find();

  // Data ▼ ============================================
  // myinfo item model
  RxList<MyInfoItemModel> listArray = [
    MyInfoItemModel(title: '내 증상 기록', vc: Routes.MY_SYMPTOMS),
    MyInfoItemModel(title: '정책제안', vc: Routes.SUGGEST_POLICY),
    MyInfoItemModel(title: '프로필 설정', vc: Routes.PROFILE_SETTING),
    MyInfoItemModel(title: '자주 묻는 질문', vc: Routes.FAQ),
    MyInfoItemModel(title: '알람 설정', vc: Routes.ALARM_SETTING),
    MyInfoItemModel(title: '약관 및 정책', vc: Routes.TERMS_AND_CONDITION),
    MyInfoItemModel(title: '회원 관리', vc: Routes.MANAGE_MEMBER),
    MyInfoItemModel(title: '버전 정보 v1.0.0', vc: null),
  ].obs;

  // Function ▼ ========================================
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
        GlobalToastWidget(message: e.toString());
      }
    });
  }
  // Variable ▼ ========================================

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

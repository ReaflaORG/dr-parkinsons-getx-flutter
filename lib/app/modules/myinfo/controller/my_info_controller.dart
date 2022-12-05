// ignore_for_file: unnecessary_overrides

import 'dart:async';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
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

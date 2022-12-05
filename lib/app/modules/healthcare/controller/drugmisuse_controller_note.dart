// ignore_for_file: unnecessary_overrides

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../model/drugmisuse_infobox_model.dart';
import '../../../model/drugmisuse_model.dart';

class DrugMisuseController extends GetxController {
  static DrugMisuseController get to => Get.find();

  // GlobalKey ▼ =======================================

  /// * 글로벌 폼키
  Rx<GlobalKey<FormState>> globalFormKey = GlobalKey<FormState>().obs;

  // Controller ▼ =======================================

  /// * 약물 검색 텍스트 폼 필드 컨트롤러
  Rx<TextEditingController> drugmisuseTextFormFieldController =
      TextEditingController().obs;

  // FocusNode ▼ ========================================

  /// * 약물 검색 포커스 노드
  Rx<FocusNode> drugmisuseTextFormFieldFocusScopeNode = FocusNode().obs;

  // Data ▼ ============================================

  RxList<DrugMisuseInfoBoxModel> boxesData = <DrugMisuseInfoBoxModel>[
    DrugMisuseInfoBoxModel(
      title: '정신병약',
      text:
          '클로로프마진(chlo rpromazine), 프로클로페라진(prochlorperazine), 페르페나진(perphenazine), 플루페나진(fluphenazine), 프로메사진 promethazine), 할로페리돌(haloperidol), 피모자이드(pimozide), 아미설프라이드(amisulpride), 리스페리돈(risperidone), 올란자핀(olanzapine), 아리피프라졸(aripiprazole), 리튬(lithium)',
    ),
    DrugMisuseInfoBoxModel(
      title: '위장관운동약',
      text:
          '메토클로프라미드(metoclopramide), 레보설프라이드(levosulpride), 클레보프라이드(clebopride)',
    ),
    DrugMisuseInfoBoxModel(
      title: '칼슘통로 차단제(편두통 및 어지럼증 약)',
      text: '플루나리진(flunarizine), 시나리진(cinnarizine)',
    ),
    DrugMisuseInfoBoxModel(
      title: '뇌전증(간질약)',
      text: '발프로익 산(valproic acid)',
    ),
    DrugMisuseInfoBoxModel(
      title: '항히스타민제',
      text: '하이드록시진(hydroxyzine), 알리메마진(alimemazine), 아세프로메타진(aceprometazine)',
    ),
    DrugMisuseInfoBoxModel(
      title: '항균제',
      text:
          '박테리아약 : 리팜피신(ripampicin), 바이러스약 :  아싸이클로바(acyclovir), 비다라빈(vidarabine), 안티레트로바이알스(antiretrovirals), 곰팡이약 : 암포테리신 비(amphotericin B)',
    ),
    DrugMisuseInfoBoxModel(
      title: '호르몬제',
      text: '싸이록신(thyroxine, 갑상선 호르몬)',
    ),
    DrugMisuseInfoBoxModel(
      title: '부정맥약',
      text: '아미오다론(amiodarone)',
    ),
    DrugMisuseInfoBoxModel(
      title: '협심증약',
      text: '트리메타지딘(trimetazidine)',
    ),
  ].obs;

  RxList<DrugmisuseModel> boxesDefaultData = [
    DrugmisuseModel(
      title: 'ehakxlfwjd',
      company: '대우제약',
    ),
    DrugmisuseModel(
      title: 'ehakxlfwjd2',
      company: '대우제약',
    ),
    DrugmisuseModel(
      title: 'ehakxlfwjd3',
      company: '대우제약',
    ),
    DrugmisuseModel(
      title: 'ghdeorl',
      company: '대우제약2',
    ),
    DrugmisuseModel(
      title: '도마틸정',
      company: '대우제약',
    ),
    DrugmisuseModel(
      title: '타이레놀',
      company: '대우제약2',
    ),
  ].obs;

  RxList<DrugmisuseModel> boxesSearchData = <DrugmisuseModel>[].obs;

  // Variable ▼ ========================================

  RxBool isSearch = false.obs;
  RxBool isValue = false.obs;
  // Function ▼ ========================================

  /// * 이메일 텍스트 폼 필드 OnChanged
  Future<void> handleSearchFieldOnChanged({
    required String value,
  }) async {
    // 값 저장
    globalFormKey.value.currentState!.save();

    // 벨리데이터
    if (value.isNotEmpty) {
      isSearch.value = true;
    } else {
      isSearch.value = false;
    }

    // boxesSearchData.clear();
    boxesSearchData.assignAll(boxesDefaultData.where(
      (element) => element.title.contains(value),
    ));

    Logger().d(boxesSearchData.toJson());
    boxesSearchData.refresh();
  }

  // 사용자가 값을 입력 했을 때, boxDefaultData에서 사용자 입력값을 일치하는 것을 찾아서 boxSearchData를 뿌려준다.
  void searchFieldOnChange({
    required String value,
  }) {
    // 1 데이터 받아와서 사용자에게 입력값을 보여준다.
    Logger().d(value.isNotEmpty);
    // 2 사용자 입력값이 null 이면 isValue는 false, 입력값이 있을 때, true.
    if (value.isNotEmpty) {
      isValue.value = true;
    } else {
      isValue.value = false;
    }

    // 3 boxDefaultData에서 사용자 입력값을 포함하는 것을 찾아서 boxSearchData를 뿌려준다.
    boxesSearchData.assignAll(
        boxesDefaultData.where((element) => element.company.contains(value)));

    //4 배열을 새로고침 해줌
    boxesSearchData.refresh();
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

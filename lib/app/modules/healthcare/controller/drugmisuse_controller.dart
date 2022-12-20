// ignore_for_file: unnecessary_overrides

import 'dart:async';

import 'package:dr_parkinsons/app/models/base_response_model.dart';
import 'package:dr_parkinsons/app/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../globals/global_dialog_widget.dart';
import '../../../globals/global_toast_widget.dart';
import '../../../models/drugmisuse_infobox_model.dart';
import '../../../models/drugmisuse_model.dart';
import '../../../provider/provider.dart';

class DrugMisuseController extends GetxController {
  static DrugMisuseController get to => Get.find();

  //**
  //* Step 1 주의해야할 약물 모델링하기  [x]
  //* Step 2 주의해야할 약물 변수 변언하기 []
  //* Step 3 api 받아와서 주약 변수에 할당하기 []
  //* Step 4 View와 맞추기[]
  //**/

  // RxList<DrugmisuseModel> drugMisuseList = <DrugmisuseModel>[].obs;
  RxList<DrugmisuseModel> boxesSearchData = <DrugmisuseModel>[].obs;

  // Function ▼ =======================================
  Future<void> onHandleSearch({required String value}) async {
    // 값 저장
    globalFormKey.value.currentState!.save();

    // 벨리데이터
    if (value.isNotEmpty) {
      isSearch.value = true;
      try {
        Logger().d(AuthService.to.accessToken.value);

        AuthBaseResponseModel response = await Provider.dio(
            method: 'GET',
            url:
                '/healthcare/drug_misuse_medicine?orderBy=title&search=${drugmisuseTextFormFieldController.value.text}');
        switch (response.statusCode) {
          case 200:
            if (response.data.length == 0) {
              Get.dialog(GlobalDrugmisuseModalWidget(
                medicineName: '',
                isFound: false,
                okOnPressed: () => Get.back(),
              ));
            } else {
              boxesSearchData.assignAll(List<DrugmisuseModel>.from(
                  response.data.map((e) => DrugmisuseModel.fromJson(e))));
            }

            break;
          default:
            throw Exception(response.message);
        }
      } catch (e) {
        GlobalToastWidget(message: e.toString());
      }
    } else {
      isSearch.value = false;
    }
  }

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

  // Variable ▼ ========================================

  RxBool isSearch = false.obs;

  // Function ▼ ========================================

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

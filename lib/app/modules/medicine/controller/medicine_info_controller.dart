// ignore_for_file: unnecessary_overrides

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../widget/medicine_info_complex.dart';
import '../widget/medicine_info_comt_inhibitor.dart';
import '../widget/medicine_info_dopamine.dart';
import '../widget/medicine_info_dopamine_agonist.dart';
import '../widget/medicine_info_etc.dart';
import '../widget/medicine_info_maob_inhibitor.dart';

class MedicineInfoController extends GetxController {
  static MedicineInfoController get to => Get.find();

  // Data ▼

  // Variable ▼

  /// 약제명
  Rx<dynamic> medicineName = Get.parameters['params'].obs;

  // Function ▼
  Widget childWidget() {
    Logger().d(medicineName);

    switch (medicineName.value) {
      case '도파민제':
        return const MedicineInfoDopaminePage();
      case '복합제':
        return const MedicineInfoComplexPage();
      case '도파민작용제':
        return const MedicineInfoDopamineAgonistPage();
      case '콤트억제제':
        return const MedicineInfoComptInhibitorPage();
      case '마오비억제제':
        return const MedicineInfoMaobInhibitorPage();
      case '기타약제':
        return const MedicineInfoEtcPage();

      default:
        return Container();
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

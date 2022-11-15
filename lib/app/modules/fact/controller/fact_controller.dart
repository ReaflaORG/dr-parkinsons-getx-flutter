// ignore_for_file: unnecessary_overrides

import 'dart:async';

import 'package:get/get.dart';

import '../../../model/fact_model.dart';

class FactController extends GetxController {
  static FactController get to => Get.find();

  // Data ▼ ============================================

  RxList<FactModel> factData = [
    FactModel(
      title: '하루 1시간만 걸어도 파킨슨병 억제 효과',
      thumbnail: 'assets/images/samples/sample1.jpg',
    ),
    FactModel(
      title: '파킨슨병, 새로운 치료 단서 발견...',
      thumbnail: 'assets/images/samples/sample2.jpg',
    ),
    FactModel(
      title: '세브란스 연구팀, 파킨슨병 진행 억제...',
      thumbnail: 'assets/images/samples/sample3.jpg',
    ),
    FactModel(
      title: '[파킨슨병] 새로운 치유법, 빛을 시험하다',
      thumbnail: 'assets/images/samples/sample4.jpg',
    ),
    FactModel(
      title: "'뇌 신경회로 반감'... 뇌전증, 파킨슨병...",
      thumbnail: 'assets/images/samples/sample5.jpg',
    ),
  ].obs;

  // Variable ▼ ========================================

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

// ignore_for_file: unnecessary_overrides

import 'dart:async';

import 'package:get/get.dart';

import '../../../model/doctor_search_item_model.dart';

// search doctors controller
class DoctorSearchController extends GetxController {
  static DoctorSearchController get to => Get.find();

  // Data ▼ ============================================
  // search doctors item model
  RxList<DoctorSearchItemModel> listArray = [
    DoctorSearchItemModel(
      hospitalName: '병원명',
      hospitalAddress: 'OO시 OO구',
      doctorName: 'OOO 의사',
    ),
    DoctorSearchItemModel(
      hospitalName: '병원명',
      hospitalAddress: 'OO시 OO구',
      doctorName: 'OOO 의사',
    ),
    DoctorSearchItemModel(
      hospitalName: '병원명',
      hospitalAddress: 'OO시 OO구',
      doctorName: 'OOO 의사',
    ),
    DoctorSearchItemModel(
      hospitalName: '병원명',
      hospitalAddress: 'OO시 OO구',
      doctorName: 'OOO 의사',
    ),
    DoctorSearchItemModel(
      hospitalName: '병원명',
      hospitalAddress: 'OO시 OO구',
      doctorName: 'OOO 의사',
    ),
    DoctorSearchItemModel(
      hospitalName: '병원명',
      hospitalAddress: 'OO시 OO구',
      doctorName: 'OOO 의사',
    ),
    DoctorSearchItemModel(
      hospitalName: '병원명',
      hospitalAddress: 'OO시 OO구',
      doctorName: 'OOO 의사',
    ),
    DoctorSearchItemModel(
      hospitalName: '병원명',
      hospitalAddress: 'OO시 OO구',
      doctorName: 'OOO 의사',
    ),
    DoctorSearchItemModel(
      hospitalName: '병원명',
      hospitalAddress: 'OO시 OO구',
      doctorName: 'OOO 의사',
    ),
    DoctorSearchItemModel(
      hospitalName: '병원명',
      hospitalAddress: 'OO시 OO구',
      doctorName: 'OOO 의사',
    ),
    DoctorSearchItemModel(
      hospitalName: '병원명',
      hospitalAddress: 'OO시 OO구',
      doctorName: 'OOO 의사',
    ),
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

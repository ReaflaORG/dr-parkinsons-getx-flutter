// ignore_for_file: unnecessary_overrides

import 'dart:async';

import 'package:get/get.dart';

import '../model/search_doctors_item_model.dart';

// search doctors controller
class SearchDoctorsController extends GetxController {
  static SearchDoctorsController get to => Get.find();

  // Data ▼ ============================================
  // search doctors item model
  RxList<SearchDoctorsItemModel> listArray = [
    SearchDoctorsItemModel(
        hospitalName: '병원명', hospitalAddress: 'OO시 OO구', doctorName: 'OOO 의사'),
    SearchDoctorsItemModel(
        hospitalName: '병원명', hospitalAddress: 'OO시 OO구', doctorName: 'OOO 의사'),
    SearchDoctorsItemModel(
        hospitalName: '병원명', hospitalAddress: 'OO시 OO구', doctorName: 'OOO 의사'),
    SearchDoctorsItemModel(
        hospitalName: '병원명', hospitalAddress: 'OO시 OO구', doctorName: 'OOO 의사'),
    SearchDoctorsItemModel(
        hospitalName: '병원명', hospitalAddress: 'OO시 OO구', doctorName: 'OOO 의사'),
    SearchDoctorsItemModel(
        hospitalName: '병원명', hospitalAddress: 'OO시 OO구', doctorName: 'OOO 의사'),
    SearchDoctorsItemModel(
        hospitalName: '병원명', hospitalAddress: 'OO시 OO구', doctorName: 'OOO 의사'),
    SearchDoctorsItemModel(
        hospitalName: '병원명', hospitalAddress: 'OO시 OO구', doctorName: 'OOO 의사'),
    SearchDoctorsItemModel(
        hospitalName: '병원명', hospitalAddress: 'OO시 OO구', doctorName: 'OOO 의사'),
    SearchDoctorsItemModel(
        hospitalName: '병원명', hospitalAddress: 'OO시 OO구', doctorName: 'OOO 의사'),
    SearchDoctorsItemModel(
        hospitalName: '병원명', hospitalAddress: 'OO시 OO구', doctorName: 'OOO 의사'),
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

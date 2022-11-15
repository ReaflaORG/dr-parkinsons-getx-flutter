// ignore_for_file: unnecessary_overrides

import 'dart:async';

import 'package:get/get.dart';

import '../model/doctor_item_model.dart';

// doctor controller
class DoctorController extends GetxController {
  static DoctorController get to => Get.find();

  // Data ▼ ============================================
  // doctor item model
  RxList<DoctorItemModel> listArray = [
    DoctorItemModel(
        hospitalName: '병원명',
        department: '신경과 전문의',
        doctorName: 'OOO 의사',
        imagePath: 'assets/doctor/doctor_1.png',
        dateWritten: '22.10.00',
        title: '나를 잃어가는 병, 치매'),
    DoctorItemModel(
        hospitalName: '병원명',
        department: '신경과 전문의',
        doctorName: 'OOO 의사',
        imagePath: 'assets/doctor/doctor_2.png',
        dateWritten: '22.10.00',
        title: '나를 잃어가는 병, 치매'),
    DoctorItemModel(
        hospitalName: '병원명',
        department: '신경과 전문의',
        doctorName: 'OOO 의사',
        imagePath: 'assets/doctor/doctor_3.png',
        dateWritten: '22.10.00',
        title: '나를 잃어가는 병, 치매'),
    DoctorItemModel(
        hospitalName: '병원명',
        department: '신경과 전문의',
        doctorName: 'OOO 의사',
        imagePath: 'assets/doctor/doctor_4.png',
        dateWritten: '22.10.00',
        title: '나를 잃어가는 병, 치매'),
    DoctorItemModel(
        hospitalName: '병원명',
        department: '신경과 전문의',
        doctorName: 'OOO 의사',
        imagePath: 'assets/doctor/doctor_1.png',
        dateWritten: '22.10.00',
        title: '나를 잃어가는 병, 치매'),
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

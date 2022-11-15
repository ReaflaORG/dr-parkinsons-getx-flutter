import 'dart:core';

class MedicineInfoModel {
  MedicineInfoModel({
    required this.medicineInfoId, // 약물 idx
    required this.medicineInfoName, // 약물 이름
    required this.medicineInfoType, // 약물 타입
    required this.medicineInfoDescription, // 약물 설명
    required this.medicineInfoSideEffect, // 약물 부작용
    required this.medicineInfoList, // 약물 종류
    required this.createdAt, // 생성일
  });
  int medicineInfoId; // 약물 idx
  String medicineInfoName; // 약물 이름
  String medicineInfoType; // 약물 타입
  String medicineInfoDescription; // 약물 설명
  String medicineInfoSideEffect; // 약물 부작용
  List<String> medicineInfoList; // 약물 종류
  DateTime createdAt; // 생성일
}

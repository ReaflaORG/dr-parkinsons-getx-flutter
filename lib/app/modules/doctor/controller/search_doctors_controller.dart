import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../globals/global_toast_widget.dart';
import '../../../models/sarch_doctors_model.dart';
import '../../../provider/provider.dart';
import '../../../service/location_service.dart';

/// 주치의 찾기 검색 컨트롤러
class DoctorSearchController extends GetxController {
  static DoctorSearchController get to => Get.find();

  // GlobalKey ▼

  Rx<GlobalKey<FormState>> globalFormKey = GlobalKey<FormState>().obs;

  // Data ▼

  /// 전문의 데이터
  RxList<SearchDoctorsModel> doctorListData = <SearchDoctorsModel>[].obs;

  // Controller ▼

  Rx<TextEditingController> searchTextFormFieldController =
      TextEditingController().obs;

  // FocusNode ▼

  Rx<FocusNode> searchTextFocusNode = FocusNode().obs;

  // Variable ▼

  /// 검색
  Rx<dynamic> search = ''.obs;

  /// 검색 여부
  RxBool isSearch = false.obs;

  /// 거리
  Rx<String> distance = '20000'.obs;

  /// 거리 리스트
  RxList<String> distanceList = ['5', '10', '20'].obs;

  // Function ▼

  /// 검색
  Future<void> handleDoctorProvider() async {
    try {
      await Provider.dio(
        method: 'GET',
        url:
            '/doctor?long=${LocationService.to.locationData.longitude}&lat=${LocationService.to.locationData.latitude}&distance=$distance&search=${searchTextFormFieldController.value.text}',
      ).then((response) {
        switch (response.statusCode) {
          case 200:
            Future.value([
              doctorListData.assignAll(
                List<SearchDoctorsModel>.from(
                  response.data.map(
                    (e) => SearchDoctorsModel.fromJson(e),
                  ),
                ),
              ),
              doctorListData.refresh(),
            ]);
            break;
          default:
            throw Exception(response.message);
        }
      });
    } catch (e) {
      Logger().d(e);
      GlobalToastWidget(e.toString());
    }
  }

  @override
  Future<void> onInit() async {
    handleDoctorProvider();

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

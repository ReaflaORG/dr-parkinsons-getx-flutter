// ignore_for_file: unnecessary_overrides

import 'dart:async';

import 'package:base/app/model/sarch_doctors_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:location/location.dart';

import '../../../global/global_toast_widget.dart';
import '../../../model/base_response_model.dart';
import '../../../provider/main_provider.dart';
import '../../../service/auth_service.dart';

// search doctors controller
class DoctorSearchController extends GetxController {
  static DoctorSearchController get to => Get.find();

  // Data ▼ ============================================
  Rx<GlobalKey<FormState>> globalFormKey = GlobalKey<FormState>().obs;

  RxList<SearchDoctorsModel> listArray = <SearchDoctorsModel>[].obs;
  RxList<SearchDoctorsModel> searchData = <SearchDoctorsModel>[].obs;

  // Variable ▼ ========================================
  final Location location = Location();
  late final bool serviceEnabled;
  late final PermissionStatus permissionGranted;
  late final LocationData locationData;

  Rx<bool> process = true.obs;
  double? longitude = 0.0;
  double? latitude = 0.0;
  Rx<dynamic> search = ''.obs;

  RxBool isSearch = false.obs;

  Rx<String> distance = '5'.obs;
  RxList<String> distanceList = ['5', '10', '20'].obs;

  // TextEditingController ▼ ========================================
  Rx<TextEditingController> searchTextFormFieldController =
      TextEditingController().obs;

  // FocusNode ▼ ========================================
  Rx<FocusNode> searchTextFocusNode = FocusNode().obs;

  // Function ▼ ========================================
  Future<void> getLocation() async {
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationData = await location.getLocation();

    location.onLocationChanged.listen((LocationData loc) {
      longitude = loc.longitude;
      latitude = loc.latitude;
    });
  }

  Future<void> onHandleSearch({required String searchKeyword}) async {
    // 값 저장
    globalFormKey.value.currentState!.save();

    // 벨리데이터
    if (searchKeyword.isNotEmpty) {
      isSearch.value = true;

      try {
        Logger().d(AuthService.to.accessToken.value);

        AuthBaseResponseModel response = await AuthProvider.dio(
            method: 'GET',
            // url:
            //     '/doctor?long=126.9347011&lat=37.5551399&distance=${distance.value}&search=$searchKeyword');
            url:
                '/doctor?long=126.9347011&lat=37.5551399&distance=0&search=$searchKeyword');

        switch (response.statusCode) {
          case 200:
            searchData.assignAll(List<SearchDoctorsModel>.from(
                response.data.map((e) => SearchDoctorsModel.fromJson(e))));
            break;
          default:
            throw Exception(response.message);
        }
      } catch (e) {
        GlobalToastWidget(message: e.toString().substring(11));
      }
    } else {
      isSearch.value = false;
    }
  }

  Future<void> getDoctorList(double? long, double? lat) async {
    try {
      AuthBaseResponseModel response = await AuthProvider.dio(
        method: 'GET',
        url: '/doctor?long=$long&lat=$lat&distance=5&search=',
      );

      switch (response.statusCode) {
        case 200:
          listArray.assignAll(List.generate(response.data.length,
              (index) => SearchDoctorsModel.fromJson(response.data[index])));
          process.value = false;
          //listArray.map((element) => Logger().d(element.toJson()));
          break;

        default:
          throw Exception(response.message);
      }
    } catch (e) {
      Logger().d(e);
      GlobalToastWidget(message: e.toString().substring(11));
    }
  }

  @override
  Future<void> onInit() async {
    //await getLocation();

    // Logger().d(longitude);
    // Logger().d(latitude);

    //await getDoctorList(longitude, latitude);
    await getDoctorList(126.9347011, 37.5551399); //test
    //long=126.9347011&lat=37.5551399&distance=0&search=대림

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

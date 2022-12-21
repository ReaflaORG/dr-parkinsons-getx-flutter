import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:logger/logger.dart';

import '../globals/global_toast_widget.dart';

/// 위치 조회 서비스
class LocationService extends GetxService {
  static LocationService get to => Get.find();

  /// 디바이스 정보
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  /// 위치 정보 가져오기 데이터
  LocationData locationData = LocationData.fromMap({
    'latitude': 37.5,
    'longitude': 127.0,
  });

  /// 위치 정보
  Location location = Location();

  /// 위치 정보 가져오기 성공 여부
  RxBool serviceEnabled = false.obs;

  /// 위치 정보 가져오기 권한 여부
  late PermissionStatus permissionGranted;

  /// 위치 정보 가져오기
  Future<void> getLocation() async {
    if (!await location.serviceEnabled()) {
      if (!await location.requestService()) {
        GlobalToastWidget(message: '위치 정보를 가져올 수 없습니다');
        return;
      }
    }

    if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;

      if (iosInfo.isPhysicalDevice) {
        locationData = await location.getLocation();
      } else {
        GlobalToastWidget(message: '시뮬레이터는 위치 정보를 가져올 수 없습니다');
      }
    } else if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

      if (androidInfo.isPhysicalDevice) {
        Logger().d(locationData);
        locationData = await location.getLocation();
        Logger().d(locationData);
      } else {
        GlobalToastWidget(message: '시뮬레이터는 위치 정보를 가져올 수 없습니다');
      }
    }
  }

  @override
  void onInit() {
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
}

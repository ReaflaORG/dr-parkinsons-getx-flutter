import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

import '../globals/global_toast_widget.dart';

/// 위치 조회 서비스
class LocationService extends GetxService {
  static LocationService get to => Get.find();

  /// 디바이스 정보
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  /// 위치 정보 가져오기 데이터
  late LocationData locationData;

  /// 위치 정보
  final Location location = Location();

  /// 위치 정보 가져오기 성공 여부
  RxBool serviceEnabled = false.obs;

  /// 위치 정보 가져오기 권한 여부
  late PermissionStatus permissionGranted;

  /// 위치 정보 가져오기
  Future<void> getLocation() async {
    List temp = [
      await Future.value(await location.serviceEnabled()),
      await Future.value(await location.requestService()),
    ];

    if (!temp[0] && !temp[1]) {
      return;
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    // Logger().d(await location.getLocation());
    // Logger().d(await deviceInfo.toString());

    if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;

      if (iosInfo.isPhysicalDevice) {
        locationData = await location.getLocation();
      } else {
        GlobalToastWidget(message: '시뮬레이터에서는 위치 정보를 가져올 수 없습니다.');
        locationData = LocationData.fromMap({
          'latitude': 37.566535,
          'longitude': 126.97796919999996,
        });
      }
    } else if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

      if (androidInfo.isPhysicalDevice) {
        locationData = await location.getLocation();
      } else {
        GlobalToastWidget(message: '시뮬레이터에서는 위치 정보를 가져올 수 없습니다.');
        locationData = LocationData.fromMap({
          'latitude': 37.566535,
          'longitude': 126.97796919999996,
        });
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

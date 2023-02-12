import 'dart:async';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../globals/global_toast_widget.dart';
import '../../../models/disorder_model.dart';
import '../../../models/doctor_model.dart';
import '../../../provider/provider.dart';
import '../../../service/auth_service.dart';

/// 주치의 찾기 컨트롤러
class DoctorDetailController extends GetxController {
  static DoctorDetailController get to => Get.find();

  // Data ▼

  /// 의사 데이터
  Rx<DoctorModel> doctor = DoctorModel().obs;

  RxList<YoutubeVideoModel> videoData = [
    YoutubeVideoModel(
      title: '파킨슨TV+? 플러스가 뭐죠? 이상운동질환의 개념과 종류 완벽정리!',
      thumbnail: 'https://img.youtube.com/vi/B3XHI4vua1E/maxresdefault.jpg',
      createdAt: DateFormat('yyyy-MM-dd').parse('2022-10-7'),
      youtubePlayer: YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(
          'https://www.youtube.com/watch?v=B3XHI4vua1E',
        ) as String,
        flags: const YoutubePlayerFlags(
          mute: false,
          autoPlay: false,
          disableDragSeek: false,
          loop: false,
          isLive: false,
          forceHD: false,
          enableCaption: true,
          captionLanguage: 'ko',
        ),
      ),
    ),
    YoutubeVideoModel(
      title: '위치 불문! 근육이 부르르~ 근긴장이상증의 원인부터 치료까지 한방에 정리',
      thumbnail: 'https://img.youtube.com/vi/b0bg1TWHZCY/maxresdefault.jpg',
      createdAt: DateFormat('yyyy-MM-dd').parse('2022-10-21'),
      youtubePlayer: YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(
          'https://www.youtube.com/watch?v=b0bg1TWHZCY',
        ) as String,
        flags: const YoutubePlayerFlags(
          mute: false,
          autoPlay: false,
          disableDragSeek: false,
          loop: false,
          isLive: false,
          forceHD: false,
          enableCaption: true,
          captionLanguage: 'ko',
        ),
      ),
    ),
    YoutubeVideoModel(
      title: 'EP4 임상시험 왜 이렇게 오래 걸리나 했더니... 이것 때문이었어?',
      thumbnail: 'https://img.youtube.com/vi/cu9DxNP06KM/maxresdefault.jpg',
      createdAt: DateFormat('yyyy-MM-dd').parse('2022-10-27'),
      youtubePlayer: YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(
          'https://www.youtube.com/watch?v=cu9DxNP06KM',
        ) as String,
        flags: const YoutubePlayerFlags(
          mute: false,
          autoPlay: false,
          disableDragSeek: false,
          loop: false,
          isLive: false,
          forceHD: false,
          enableCaption: true,
          captionLanguage: 'ko',
        ),
      ),
    ),
  ].obs;

  // Data ▼

  /// 로딩 상태
  Rx<bool> isLoad = true.obs;

  // 의사 이이디
  dynamic doctor_id = Get.arguments['doctor_id'] ?? 1;

  /// 전문의 설정 여부
  Rx<bool> isDoctorSubscribe = false.obs;

  // Function ▼

  /// 전문의 데이터 불러오기
  Future<void> handleDoctorDetailProvider() async {
    try {
      isLoad.value = true;

      await Provider.dio(
        method: 'GET',
        url: '/doctor/$doctor_id',
      ).then((response) {
        switch (response.statusCode) {
          case 200:
            AuthService.to.handleMyInfo();
            doctor.value = DoctorModel.fromJson(response.data);
            handleDoctorSubscribe();
            isLoad.value = false;
            break;
          default:
            throw Exception(response.message);
        }
      });
    } catch (e) {
      isLoad.value = false;
      Logger().d(e);
      GlobalToastWidget(e.toString().substring(11));
    }
  }

  /// 전문의 설정하기 불러오기
  Future<void> handleDoctorPatchProvider() async {
    try {
      await Provider.dio(
        method: 'PATCH',
        url: '/doctor/$doctor_id',
      ).then((response) async {
        switch (response.statusCode) {
          case 200:
            AuthService.to.handleMyInfo();
            doctor.value = DoctorModel.fromJson(response.data);
            handleDoctorSubscribe();
            if (isDoctorSubscribe.value) {
              GlobalToastWidget('내 주치의 설정이 완료되었습니다');
            }
            break;
          default:
            throw Exception(response.message);
        }
      });
    } catch (e) {
      Logger().d(e);
      GlobalToastWidget(e.toString().substring(11));
    }
  }

  /// 전문의 설정
  void handleDoctorSubscribe() {
    doctor.value.users!
                .indexWhere((e) => e == AuthService.to.userData.value.uid) !=
            -1
        ? isDoctorSubscribe.value = false
        : isDoctorSubscribe.value = true;
  }

  @override
  Future<void> onInit() async {
    await handleDoctorDetailProvider().then((value) {
      isLoad.value = false;
    });

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

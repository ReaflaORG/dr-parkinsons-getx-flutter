// ignore_for_file: unnecessary_overrides

import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

import '../model/carousel_slide_model.dart';

class SignInController extends GetxController {
  static SignInController get to => Get.find();

  // Data ▼ ===========================================

  RxList<CarouselSlideModel> carouselSlideData = <CarouselSlideModel>[
    CarouselSlideModel(
      title: '파킨슨 관리는 닥터 파킨슨 앱에서 !',
      description: '닥터 파킨슨 앱에서\r\n파킨슨 환자의 건강을 관리하세요.',
      image: 'assets/images/signin/onboarding_1.png',
    ),
    CarouselSlideModel(
      title: '자가 테스트와 주치의 찾기',
      description:
          '파킨슨 병인지 검사하고,\r\n진행도를 테스트 할 수 있어요\r\n가까운 파킨슨 병 전문의를  확인할 수 있어요\r\n',
      image: 'assets/images/signin/onboarding_2.png',
    ),
    CarouselSlideModel(
      title: '미션 알림 설정 및 보호자 알림 서비스',
      description:
          '투약과 운동 시간 알림을 관리할 수 있어요\r\n환자가 복약을 안하거나 위급 시,\r\n보호자 또는 병원에게 알려줄 수 있어요\r\n',
      image: 'assets/images/signin/onboarding_3.png',
    ),
    CarouselSlideModel(
      title: '복지정보와 주치의 영상',
      description:
          '파킨슨 병의 증상 설명과 다양한\r\n복지혜택정보를 확인할 수 있어요\r\n내 주치의 영상을 모아서 볼 수 있어요',
      image: 'assets/images/signin/onboarding_4.png',
    )
  ].obs;

  // Controller ▼ ======================================

  Rx<CarouselController> carouselController = CarouselController().obs;

  // Funcion ▼ =========================================

  // Variable ▼ ========================================

  Rx<int> carouselSliderIndex = 0.obs;

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

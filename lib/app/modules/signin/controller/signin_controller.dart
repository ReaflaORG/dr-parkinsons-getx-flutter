// ignore_for_file: unnecessary_overrides

import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dr_parkinsons/app/globals/global_toast_widget.dart';
import 'package:dr_parkinsons/app/models/base_response_model.dart';
import 'package:dr_parkinsons/app/models/doctor_model.dart';
import 'package:dr_parkinsons/app/models/user_model.dart';
import 'package:dr_parkinsons/app/service/auth_service.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:logger/logger.dart';

import '../../../models/carousel_slide_model.dart';
import '../../../provider/provider.dart';

class SignInController extends GetxController {
  static SignInController get to => Get.find();

  // Controller ▼ ======================================

  /// 슬라이드 컨트롤러
  Rx<CarouselController> carouselController = CarouselController().obs;

  // Data ▼ ===========================================

  /// 슬라이드 데이터
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

  // Variable ▼ ========================================

  /// 카카오 토큰
  RxSet<OAuthToken> kakaoToken = <OAuthToken>{}.obs;

  /// 유저 데이터
  RxSet<AccessTokenInfo> userData = <AccessTokenInfo>{}.obs;

  /// 슬라이드 인덱스
  Rx<int> carouselSliderIndex = 0.obs;

  // Funcion ▼ =========================================

  /// 카카오 로그인 프로바이더
  Future<void> handleKakaoProvider() async {
    if (await isKakaoTalkInstalled()) {
      try {
        await UserApi.instance.loginWithKakaoTalk();
      } catch (error) {
        if (error is PlatformException && error.code == 'CANCELED') {
          return;
        }

        try {
          await UserApi.instance.loginWithKakaoAccount();
          Logger().d('카카오계정으로 로그인 성공');
        } catch (error) {
          Logger().d('카카오계정으로 로그인 실패 $error');
          return;
        }
      }
    } else {
      try {
        await UserApi.instance.loginWithKakaoAccount();
        Logger().d('카카오계정으로 로그인 성공');
      } catch (error) {
        Logger().d('카카오계정으로 로그인 실패 $error');
        return;
      }
    }

    try {
      User user = await UserApi.instance.me();
      Account? userInfo = user.kakaoAccount;

      if (userInfo == null) {
        await UserApi.instance.unlink();
        GlobalToastWidget('카카오 계정 정보를 가져오지 못했습니다');

        return;
      }

      if (userInfo.email == null) {
        await UserApi.instance.unlink();
        GlobalToastWidget('카카오 계정에 이메일을 허용해주세요');

        return;
      }

      AuthBaseResponseModel response = await Provider.dio(
        method: 'POST',
        url: '/auth/register/kakao',
        requestModel: {
          'provider': 'kakao',
          'provider_id': user.id.toString(),
          'user_email': userInfo.email,
          'device_token': DateTime.now().millisecondsSinceEpoch.toString(),
        },
      );

      switch (response.statusCode) {
        case 201:
          UserModel response_user = UserModel.fromJson(response.data['user']);
          String token = response.data['access_token'];
          DoctorModel? doctor;

          Future.value([
            if (response_user.doctorId != null)
              {
                doctor = DoctorModel.fromJson(response.data['doctor']),
              },
            AuthService.to.handleLogin(
              user: response_user,
              responseAccessToken: token,
              doctor: doctor,
            )
          ]).then((value) {
            Get.offAllNamed('/main');
          });
          break;
        default:
          throw Exception(response.message);
      }
    } catch (e) {
      Logger().d(e);
      GlobalToastWidget(e.toString());
      return;
    }
  }

  /// 임시 로그인
  /// {"id":2585184509,"connected_at":"2022-12-18T12:15:52Z","kakao_account":{"has_email":true,"email_needs_agreement":false,"is_email_valid":true,"is_email_verified":true,"email":"dormitalk@naver.com"}}
  Future<void> handleTempSignIn() async {
    try {
      // User user = await UserApi.instance.me();
      // Account? userInfo = user.kakaoAccount;

      // if (userInfo == null) {
      //   return;
      // }

      AuthBaseResponseModel response = await Provider.dio(
        method: 'POST',
        url: '/auth/register/kakao',
        requestModel: {
          'provider': 'kakao',
          'provider_id': '2585184509',
          'user_email': 'dormitalk@naver.com',
          'device_token': DateTime.now().millisecondsSinceEpoch.toString(),
        },
      );

      switch (response.statusCode) {
        case 201:
          UserModel response_user = UserModel.fromJson(response.data['user']);
          String token = response.data['access_token'];
          DoctorModel? doctor;

          Future.value([
            if (response_user.doctorId != null)
              {
                doctor = DoctorModel.fromJson(response.data['doctor']),
              },
            AuthService.to.handleLogin(
              user: response_user,
              responseAccessToken: token,
              doctor: doctor,
            )
          ]).then((value) {
            Get.offAllNamed('/main');
          });
          break;
        default:
          throw Exception(response.message);
      }
    } catch (e) {
      Logger().d(e);
      GlobalToastWidget(e.toString());
      return;
    }
  }

  @override
  Future<void> onInit() async {
    // await Future.value([
    //   GlobalToastWidget('자동 로그인 중이니 터치 금지'),
    //   handleTempSignIn(),
    // ]);

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

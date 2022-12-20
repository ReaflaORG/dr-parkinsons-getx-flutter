import 'package:dr_parkinsons/app/models/doctor_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../globals/global_toast_widget.dart';
import '../models/base_response_model.dart';
import '../models/user_model.dart';
import '../provider/provider.dart';
import '../routes/app_pages.dart';

/// Auth 서비스
class AuthService extends GetxService {
  static AuthService get to => Get.find();

  // Variable ▼ ========================================

  /// 액세스 토큰
  Rx<String?> accessToken = GetStorage().read<String>('access_token').obs;

  /// 로그인 체크
  RxBool isLogin = false.obs;

  /// 유저 데이터
  late Rx<UserModel> userData;

  // 전담의 의사 데이터
  late Rx<DoctorModel> myDoctor;

  // Functions ▼ ========================================

  /// 로그인 처리 핸들러
  Future<void> handleLogin({
    required UserModel user,
    required String responseAccessToken,
    DoctorModel? doctor,
  }) async {
    // 데이터 초기화
    await Future.value([
      accessToken.value = responseAccessToken,
      userData = user.obs,
      isLogin.value = true,
      if (doctor != null)
        {
          myDoctor = doctor.obs,
        },
      GetStorage().write('access_token', responseAccessToken),
    ]);

    return;
  }

  /// 토큰 로그인 처리 핸들러
  // Future<void> handleTokenLogin({
  //   required AuthBaseResponseModel resposne,
  // }) async {
  //   // 데이터 초기화
  //   accessToken.value = resposne.data!.tokenInfo.accessToken;
  //   userData = resposne.data!.userInfo.obs;
  //   isLogin.value = true;

  //   /// 스토리지 초기화
  //   await Future.wait([
  //     GetStorage().write('access_token', resposne.data!.tokenInfo.accessToken),
  //   ]);
  // }

  /// 로그아웃 처리 핸들러
  Future<void> handleLogout() async {
    /// 스토리지 초기화
    await Future.value([
      accessToken.value = '',
      isLogin.value = false,
      GetStorage().remove('access_token'),
    ]);
    Get.offAllNamed(Routes.SIGNIN);
  }

  /// 로그탈퇴 처리 핸들러
  Future<void> handleWithOut() async {
    try {
      AuthBaseResponseModel response = await Provider.dio(
        method: 'DELETE',
        url: '/myinfo',
      );

      switch (response.statusCode) {
        case 200:

          /// 데이터 초기화
          accessToken.value = '';
          isLogin.value = false;

          await Future.wait([
            GetStorage().remove('access_token'),
          ]);
          Get.offAllNamed(Routes.SIGNIN);
          break;

        default:
          throw Exception(response.message);
      }
    } catch (e) {
      GlobalToastWidget(message: e.toString());
    }
  }

  /// 내 정보 확인
  Future<void> handleMyInfo() async {
    try {
      AuthBaseResponseModel response = await Provider.dio(
        method: 'GET',
        url: '/myinfo',
      );

      switch (response.statusCode) {
        case 200:
          bool isDoctor = isMyDoctor;
          UserModel user = UserModel.fromJson(response.data['user']);
          AuthService.to.userData.value = user;
          AuthService.to.userData.refresh();
          if (isDoctor && userData.value.doctorId != null) {
            myDoctor.value = DoctorModel.fromJson(response.data['doctor']);
          } else if (!isDoctor && userData.value.doctorId != null) {
            myDoctor = DoctorModel.fromJson(response.data['doctor']).obs;
          }
          break;

        default:
          throw Exception(response.message);
      }
    } catch (e) {
      GlobalToastWidget(message: e.toString());
    }
  }

  /// 초기화
  Future<void> handleInitialization() async {
    // try {
    //   if (refreshToken.value != null && email.value != null) {
    //     AuthBaseResponseModel resposne = await AuthProvider.tokenLogin(
    //       method: 'POST',
    //       requestModel: {
    //         'user_email': email,
    //         'refresh_token': refreshToken,
    //       },
    //     );

    //     switch (resposne.statusCode) {
    //       case 200:
    //         // await handleTokenLogin(resposne: resposne);
    //         break;
    //       default:
    //         Logger().d(resposne.message);
    //     }
    //   }
    // } catch (e) {
    //   Logger().d(e);
    // }
  }

  @override
  void onInit() {
    // await handleInitialization();

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

  bool get isMyDoctor => userData.value.doctorId != null ? true : false;
}

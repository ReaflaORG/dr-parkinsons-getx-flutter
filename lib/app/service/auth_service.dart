import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../globals/global_toast_widget.dart';
import '../models/base_response_model.dart';
import '../models/doctor_model.dart';
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
  Rx<DoctorModel> myDoctor = DoctorModel().obs;

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
          ]).then((value) {
            Get.offAllNamed(Routes.SIGNIN);
          });
          break;
        default:
          throw Exception(response.message);
      }
    } catch (e) {
      GlobalToastWidget(e.toString().substring(11));
    }
  }

  /// 내 정보 확인
  Future<void> handleMyInfo() async {
    try {
      await Provider.dio(
        method: 'GET',
        url: '/myinfo',
      ).then((response) {
        switch (response.statusCode) {
          case 200:
            userData.value = UserModel.fromJson(response.data['user']);

            if (isMyDoctor && userData.value.doctorId != null) {
              myDoctor.value = DoctorModel.fromJson(response.data['doctor']);
            } else if (!isMyDoctor && userData.value.doctorId != null) {
              myDoctor = DoctorModel.fromJson(response.data['doctor']).obs;
            }

            userData.refresh();
            myDoctor.refresh();
            break;
          default:
            throw Exception(response.message);
        }
      });
    } catch (e) {
      GlobalToastWidget(e.toString().substring(11));
    }
  }

  /// 초기화
  Future<void> handleInitialization() async {}

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

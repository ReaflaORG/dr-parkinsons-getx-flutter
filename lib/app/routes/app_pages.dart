// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'package:get/get.dart';

import '../modules/diagnosis/binding/diagnosis_binding.dart';
import '../modules/diagnosis/view/diagnosis_view.dart';
import '../modules/disorder/binding/disorder_binding.dart';
import '../modules/disorder/view/disorder_view.dart';
import '../modules/doctor/binding/doctor_binding.dart';
import '../modules/doctor/binding/search_doctors_binding.dart';
import '../modules/doctor/view/doctor_view.dart';
import '../modules/doctor/view/search_doctors_view.dart';
import '../modules/fact/binding/fact_binding.dart';
import '../modules/fact/view/fact_view.dart';
import '../modules/factpost/binding/factpost_binding.dart';
import '../modules/factpost/view/factpost_view.dart';
import '../modules/healthcare/binding/drugmisuse_binding.dart';
import '../modules/healthcare/binding/healthcare_binding.dart';
import '../modules/healthcare/view/drugmisuse_view.dart';
import '../modules/healthcare/view/healthcare_view.dart';
import '../modules/home/binding/home_binding.dart';
import '../modules/home/view/home_view.dart';
import '../modules/main/binding/main_binding.dart';
import '../modules/main/view/main_view.dart';
import '../modules/medicine/binding/medicine_binding.dart';
import '../modules/medicine/binding/medicine_info_binding.dart';
import '../modules/medicine/view/medicine_info_view.dart';
import '../modules/medicine/view/medicine_view.dart';
import '../modules/mission/binding/mission_binding.dart';
import '../modules/mission/view/mission_view.dart';
import '../modules/myinfo/binding/alarm_setting_binding.dart';
import '../modules/myinfo/binding/edit_my_symptoms_binding.dart';
import '../modules/myinfo/binding/faq_binding.dart';
import '../modules/myinfo/binding/manage_member_binding.dart';
import '../modules/myinfo/binding/my_info_binding.dart';
import '../modules/myinfo/binding/my_symptoms_binding.dart';
import '../modules/myinfo/binding/profile_setting_binding.dart';
import '../modules/myinfo/binding/suggest_policy_binding.dart';
import '../modules/myinfo/binding/terms_and_condition_binding.dart';
import '../modules/myinfo/binding/view_my_symptoms_binding.dart';
import '../modules/myinfo/binding/write_my_symptoms_binding.dart';
import '../modules/myinfo/view/alarm_setting_view.dart';
import '../modules/myinfo/view/edit_my_symptoms_view.dart';
import '../modules/myinfo/view/faq_view.dart';
import '../modules/myinfo/view/manage_member_view.dart';
import '../modules/myinfo/view/my_info_view.dart';
import '../modules/myinfo/view/my_symptoms_view.dart';
import '../modules/myinfo/view/profile_setting_view.dart';
import '../modules/myinfo/view/suggest_policy_view.dart';
import '../modules/myinfo/view/terms_and_condition_view.dart';
import '../modules/myinfo/view/view_my_symptoms_view.dart';
import '../modules/myinfo/view/write_my_symptoms_view.dart';
import '../modules/permission/binding/permission_binding.dart';
import '../modules/permission/view/permission_view.dart';
import '../modules/protector/binding/protector_binding.dart';
import '../modules/protector/view/protector_view.dart';
import '../modules/seminar/binding/seminar_binding.dart';
import '../modules/seminar/view/seminar_view.dart';
import '../modules/signin/binding/signin_binding.dart';
import '../modules/signin/view/signin_view.dart';
import '../modules/socialwelfare/binding/socialwelfare_binding.dart';
import '../modules/socialwelfare/view/socialwelfare_view.dart';
import '../modules/socialwelfarepost/binding/socialwelfarepost_binding.dart';
import '../modules/socialwelfarepost/view/socialwelfarepost_view.dart';
import '../modules/splash/binding/splash_binding.dart';
import '../modules/splash/view/splash_view.dart';
import '../modules/theme/binding/theme_binding.dart';
import '../modules/theme/view/theme_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      title: '테마 화면 (사용자에게 노출되지 않음)',
      name: Routes.THEME,
      page: () => const ThemeView(),
      binding: ThemeBinding(),
      transition: Transition.native,
      popGesture: false,
    ),
    GetPage(
      title: '스플래시 화면',
      name: INITIAL,
      page: () => const SplashView(),
      binding: SplashBinding(),
      transition: Transition.native,
      popGesture: false,
    ),
    GetPage(
      title: '권한 동의 안내 화면',
      name: Routes.PERMISSION,
      page: () => const PermissionView(),
      binding: PermissionBinding(),
      transition: Transition.native,
      popGesture: false,
    ),
    GetPage(
      title: '로그인 및 온보딩 화면',
      name: Routes.SIGNIN,
      page: () => const SignInView(),
      binding: SignInBinding(),
      transition: Transition.native,
      popGesture: false,
    ),
    GetPage(
      title: '메인',
      name: Routes.MAIN,
      page: () => const MainView(),
      binding: MainBinding(),
      transition: Transition.native,
      popGesture: false,
    ),
    GetPage(
      title: '홈',
      name: Routes.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      transition: Transition.native,
      popGesture: false,
    ),
    GetPage(
      title: '파킨슨 병 소개',
      name: Routes.DISORDER,
      page: () => const DisorderView(),
      binding: DisorderBinding(),
      transition: Transition.native,
      popGesture: false,
    ),
    GetPage(
      title: '학회 및 앱 소개',
      name: Routes.SEMINAR,
      page: () => const SeminarView(),
      binding: SeminarBinding(),
      transition: Transition.native,
      popGesture: false,
    ),
    GetPage(
      title: '보호자 알림 서비스',
      name: Routes.PROTECTOR,
      page: () => const ProtectorView(),
      binding: ProtectorBinding(),
      transition: Transition.native,
      popGesture: false,
    ),
    GetPage(
      title: '오해와 진실',
      name: Routes.FACT,
      page: () => const FactView(),
      binding: FactBinding(),
      transition: Transition.native,
      popGesture: false,
      children: [
        GetPage(
          title: '오해와 진실 포스트',
          name: Routes.FACTPOST,
          page: () => const FactPostView(),
          binding: FactPostBinding(),
          transition: Transition.native,
          popGesture: false,
        ),
      ],
    ),
    GetPage(
      title: '사회복지제도',
      name: Routes.SOCIALWELFARE,
      page: () => const SocialWelfareView(),
      binding: SocialWelfareBinding(),
      transition: Transition.native,
      popGesture: false,
      children: [
        GetPage(
          title: '사회복지제도 포스트',
          name: Routes.SOCIALWELFAREPOST,
          page: () => const SocialWelfarePostView(),
          binding: SocialWelfarePostBinding(),
          transition: Transition.native,
          popGesture: false,
        ),
      ],
    ),
    GetPage(
      title: '건강관리',
      name: Routes.HEALTHCARE,
      page: () => const HealthCareView(),
      binding: HealthCareBinding(),
      transition: Transition.native,
      popGesture: false,
    ),
    GetPage(
      title: '건강관리 - 약물검색',
      name: Routes.MEDICINE,
      page: () => const MedicineView(),
      binding: MedicineBinding(),
      transition: Transition.native,
      popGesture: false,
    ),
    GetPage(
      title: '건강관리 - 약물검색 - 약물정보',
      name: Routes.MEDICINEINFO,
      page: () => const MedicineInfoView(),
      binding: MedicineInfoBinding(),
      transition: Transition.native,
      popGesture: false,
    ),
    GetPage(
      title: '건강관리 - 주의약품',
      name: Routes.DRUGMISUSE,
      page: () => const DrugMisuseView(),
      binding: DrugMisuseBinding(),
      transition: Transition.native,
      popGesture: false,
    ),
    GetPage(
      title: '건강관리 - 자가진단',
      name: '${Routes.DIAGNOSIS}/:id',
      page: () => const DiagnosisView(),
      binding: DiagnosisBinding(),
      transition: Transition.native,
      popGesture: false,
    ),
    GetPage(
      title: '미션관리',
      name: Routes.MISSION,
      page: () => const MissionView(),
      binding: MissionBinding(),
      transition: Transition.native,
      popGesture: false,
    ),
    GetPage(
      title: '주치의찾기',
      name: Routes.SEARCH_DOCTOR,
      page: () => const SearchDoctorsView(),
      binding: SearchDoctorsBinding(),
      transition: Transition.native,
      popGesture: false,
    ),
    GetPage(
      title: '주치의상세보기',
      name: Routes.DOCTOR,
      page: () => const DoctorView(),
      binding: DoctorBinding(),
      transition: Transition.native,
      popGesture: false,
    ),
    GetPage(
      title: '내정보',
      name: Routes.MY_INFO,
      page: () => const MyInfoView(),
      binding: MyInfoBinding(),
      transition: Transition.native,
      popGesture: false,
    ),
    GetPage(
      title: '내 증상 기록',
      name: Routes.MY_SYMPTOMS,
      page: () => const MySymptomsView(),
      binding: MySymptomsBinding(),
      transition: Transition.native,
      popGesture: false,
    ),
    GetPage(
      title: '내 증상 작성하기',
      name: Routes.WRITE_MY_SYMPTOMS,
      page: () => const WriteMySymptomsView(),
      binding: WriteMySymptomsBinding(),
      transition: Transition.native,
      popGesture: false,
    ),
    GetPage(
      title: '내 증상 수정하기',
      name: Routes.EDIT_MY_SYMPTOMS,
      page: () => const EditMySymptomsView(),
      binding: EditMySymptomsBinding(),
      transition: Transition.native,
      popGesture: false,
    ),
    GetPage(
      title: '내 증상 리스트',
      name: Routes.VIEW_MY_SYMPTOMS,
      page: () => const ViewMySymptomsView(),
      binding: ViewMySymptomsBinding(),
      transition: Transition.native,
      popGesture: false,
    ),
    GetPage(
      title: '정책제안',
      name: Routes.SUGGEST_POLICY,
      page: () => const SuggestPolicyView(),
      binding: SuggestPolicyBinding(),
      transition: Transition.native,
      popGesture: false,
    ),
    GetPage(
      title: '프로필 설정',
      name: Routes.PROFILE_SETTING,
      page: () => const ProfileSettingView(),
      binding: ProfileSettingBinding(),
      transition: Transition.native,
      popGesture: false,
    ),
    GetPage(
      title: '자주 묻는 질문',
      name: Routes.FAQ,
      page: () => const FaqView(),
      binding: FaqBinding(),
      transition: Transition.native,
      popGesture: false,
    ),
    GetPage(
      title: '알람 설정',
      name: Routes.ALARM_SETTING,
      page: () => const AlarmSettingView(),
      binding: AlarmSettingBinding(),
      transition: Transition.native,
      popGesture: false,
    ),
    GetPage(
      title: '약관 및 정책',
      name: Routes.TERMS_AND_CONDITION,
      page: () => const TermsAndConditionView(),
      binding: TermsAndConditionBinding(),
      transition: Transition.native,
      popGesture: false,
    ),
    GetPage(
      title: '회원 관리',
      name: Routes.MANAGE_MEMBER,
      page: () => const ManageMemberView(),
      binding: ManageMemberBinding(),
      transition: Transition.native,
      popGesture: false,
    ),
  ];
}

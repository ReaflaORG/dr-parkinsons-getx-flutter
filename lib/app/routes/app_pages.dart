// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'package:dr_parkinsons/app/modules/myinfo/view/terms_webview_view.dart';
import 'package:get/get.dart';

import '../modules/diagnosis/binding/diagnosis_binding.dart';
import '../modules/diagnosis/view/diagnosis_view.dart';
import '../modules/disorder/binding/disorder_binding.dart';
import '../modules/disorder/view/disorder_view.dart';
import '../modules/doctor/binding/doctor_detail_binding.dart';
import '../modules/doctor/binding/search_doctors_binding.dart';
import '../modules/doctor/view/doctor_detail_view.dart';
import '../modules/doctor/view/doctor_search_view.dart';
import '../modules/fact/binding/fact_binding.dart';
import '../modules/fact/view/fact_view.dart';
import '../modules/factpost/binding/fact_detail_binding.dart';
import '../modules/factpost/view/fact_detail_view.dart';
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
import '../modules/myinfo/binding/terms_binding.dart';
import '../modules/myinfo/binding/terms_webview_binding.dart';
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
import '../modules/myinfo/view/terms_view.dart';
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
import '../modules/social_welfare/binding/social_welfare_binding.dart';
import '../modules/social_welfare/view/social_welfare_view.dart';
import '../modules/social_welfare_detail/binding/social_welfare_detail_binding.dart';
import '../modules/social_welfare_detail/view/social_welfare_detail_view.dart';
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
      title: '?????? ?????? (??????????????? ???????????? ??????)',
      name: Routes.THEME,
      page: () => const ThemeView(),
      binding: ThemeBinding(),
      transition: Transition.noTransition,
      popGesture: true,
    ),
    GetPage(
      title: '???????????? ??????',
      name: INITIAL,
      page: () => const SplashView(),
      binding: SplashBinding(),
      transition: Transition.noTransition,
      popGesture: true,
    ),
    GetPage(
      title: '?????? ?????? ?????? ??????',
      name: Routes.PERMISSION,
      page: () => const PermissionView(),
      binding: PermissionBinding(),
      transition: Transition.noTransition,
      popGesture: true,
    ),
    GetPage(
      title: '????????? ??? ????????? ??????',
      name: Routes.SIGNIN,
      page: () => const SignInView(),
      binding: SignInBinding(),
      transition: Transition.noTransition,
      popGesture: true,
    ),
    GetPage(
      title: '??????',
      name: Routes.MAIN,
      page: () => const MainView(),
      binding: MainBinding(),
      transition: Transition.noTransition,
      popGesture: true,
    ),
    GetPage(
      title: '???',
      name: Routes.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      transition: Transition.noTransition,
      popGesture: true,
    ),
    GetPage(
      title: '????????? ??? ??????',
      name: Routes.DISORDER,
      page: () => const DisorderView(),
      binding: DisorderBinding(),
      transition: Transition.downToUp,
      popGesture: true,
    ),
    GetPage(
      title: '?????? ??? ??? ??????',
      name: Routes.SEMINAR,
      page: () => const SeminarView(),
      binding: SeminarBinding(),
      transition: Transition.downToUp,
      popGesture: true,
    ),
    GetPage(
      title: '????????? ?????? ?????????',
      name: Routes.PROTECTOR,
      page: () => const ProtectorView(),
      binding: ProtectorBinding(),
      transition: Transition.downToUp,
      popGesture: true,
    ),
    GetPage(
      title: '???????????? ????????????',
      name: Routes.FACT,
      page: () => const FactView(),
      binding: FactBinding(),
      transition: Transition.downToUp,
      popGesture: true,
      children: [
        GetPage(
          title: '????????? ?????? ?????????',
          name: '${Routes.FACTPOST}/:id',
          page: () => const FactDetailView(),
          binding: FactDetailBinding(),
          transition: Transition.rightToLeft,
          popGesture: true,
        ),
      ],
    ),
    GetPage(
      title: '??????????????????',
      name: Routes.SOCIALWELFARE,
      page: () => const SocialWelfareView(),
      binding: SocialWelfareBinding(),
      transition: Transition.downToUp,
      popGesture: true,
      children: [
        GetPage(
          title: '?????????????????? ?????????',
          name: Routes.SOCIALWELFAREPOST,
          page: () => const SocialWelfareDetailView(),
          binding: SocialWelfareDetailBinding(),
          transition: Transition.rightToLeft,
          popGesture: true,
        ),
      ],
    ),
    GetPage(
      title: '????????????',
      name: Routes.HEALTHCARE,
      page: () => const HealthCareView(),
      binding: HealthCareBinding(),
      transition: Transition.native,
      popGesture: true,
    ),
    GetPage(
      title: '???????????? - ????????????',
      name: Routes.MEDICINE,
      page: () => const MedicineView(),
      binding: MedicineBinding(),
      transition: Transition.downToUp,
      popGesture: true,
    ),
    GetPage(
      title: '???????????? - ???????????? - ????????????',
      name: '${Routes.MEDICINEINFO}/:params',
      page: () => const MedicineInfoView(),
      binding: MedicineInfoBinding(),
      transition: Transition.rightToLeft,
      popGesture: true,
    ),
    GetPage(
      title: '???????????? - ????????????',
      name: Routes.DRUGMISUSE,
      page: () => const DrugMisuseView(),
      binding: DrugMisuseBinding(),
      transition: Transition.downToUp,
      popGesture: true,
    ),
    GetPage(
      title: '???????????? - ????????????',
      name: '${Routes.DIAGNOSIS}/:id',
      page: () => const DiagnosisView(),
      binding: DiagnosisBinding(),
      transition: Transition.downToUp,
      popGesture: true,
    ),
    GetPage(
      title: '????????????',
      name: Routes.MISSION,
      page: () => const MissionView(),
      binding: MissionBinding(),
      transition: Transition.rightToLeft,
      popGesture: true,
    ),
    GetPage(
      title: '????????? ??????',
      name: Routes.SEARCH,
      page: () => const DoctorSearchView(),
      binding: SearchDoctorsBinding(),
      transition: Transition.rightToLeft,
      popGesture: true,
      children: [
        GetPage(
          title: '????????? ?????? - ????????? ????????????',
          name: _Paths.DOCTOR_DETAIL,
          page: () => const DoctorDetailView(),
          binding: DoctorDetailBinding(),
          transition: Transition.rightToLeft,
          popGesture: true,
        ),
      ],
    ),
    GetPage(
      title: '?????????',
      name: Routes.MY_INFO,
      page: () => const MyInfoView(),
      binding: MyInfoBinding(),
      transition: Transition.noTransition,
      popGesture: true,
      children: [
        GetPage(
          title: '?????? ??? ??????',
          name: Routes.TERMS,
          page: () => const TermsAndConditionView(),
          binding: TermsBinding(),
          transition: Transition.rightToLeft,
          popGesture: true,
          children: [
            GetPage(
              title: '?????? ??? ?????? - ??????',
              name: Routes.TERMS_WEBVIEW,
              page: () => const TermsWebviewview(),
              binding: TermsWebviewBinding(),
              transition: Transition.rightToLeft,
              popGesture: true,
            ),
          ],
        ),
      ],
    ),
    GetPage(
      title: '??? ?????? ??????',
      name: Routes.MY_SYMPTOMS,
      page: () => const MySymptomsView(),
      binding: MySymptomsBinding(),
      transition: Transition.rightToLeft,
      popGesture: true,
    ),
    GetPage(
      title: '??? ?????? ????????????',
      name: Routes.WRITE_MY_SYMPTOMS,
      page: () => const WriteMySymptomsView(),
      binding: WriteMySymptomsBinding(),
      transition: Transition.rightToLeft,
      popGesture: true,
    ),
    GetPage(
      title: '??? ?????? ????????????',
      name: Routes.EDIT_MY_SYMPTOMS,
      page: () => const EditMySymptomsView(),
      binding: EditMySymptomsBinding(),
      transition: Transition.rightToLeft,
      popGesture: true,
    ),
    GetPage(
      title: '??? ?????? ?????????',
      name: Routes.VIEW_MY_SYMPTOMS,
      page: () => const ViewMySymptomsView(),
      binding: ViewMySymptomsBinding(),
      transition: Transition.rightToLeft,
      popGesture: true,
    ),
    GetPage(
      title: '????????????',
      name: Routes.SUGGEST_POLICY,
      page: () => const SuggestPolicyView(),
      binding: SuggestPolicyBinding(),
      transition: Transition.rightToLeft,
      popGesture: true,
    ),
    GetPage(
      title: '????????? ??????',
      name: Routes.PROFILE_SETTING,
      page: () => const ProfileSettingView(),
      binding: ProfileSettingBinding(),
      transition: Transition.rightToLeft,
      popGesture: true,
    ),
    GetPage(
      title: '?????? ?????? ??????',
      name: Routes.FAQ,
      page: () => const FaqView(),
      binding: FaqBinding(),
      transition: Transition.rightToLeft,
      popGesture: true,
    ),
    GetPage(
      title: '?????? ??????',
      name: Routes.ALARM_SETTING,
      page: () => const AlarmSettingView(),
      binding: AlarmSettingBinding(),
      transition: Transition.rightToLeft,
      popGesture: true,
    ),
    GetPage(
      title: '?????? ??????',
      name: Routes.MANAGE_MEMBER,
      page: () => const ManageMemberView(),
      binding: ManageMemberBinding(),
      transition: Transition.rightToLeft,
      popGesture: true,
    ),
  ];
}

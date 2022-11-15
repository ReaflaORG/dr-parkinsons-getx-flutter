// ignore_for_file: constant_identifier_names, unused_field

part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  /// 테마 화면 (사용자에게 노출되지 않음)
  static const THEME = _Paths.THEME;

  /// 스플래시
  static const SPLASH = _Paths.SPLASH;

  /// 권한 동의 안내 화면
  static const PERMISSION = _Paths.PERMISSION;

  /// 로그인 및 온보딩 화면
  static const SIGNIN = _Paths.SIGNIN;

  /// 메인
  static const MAIN = _Paths.MAIN;

  /// 홈
  static const HOME = _Paths.HOME;

  /// 건강관리
  static const HEALTHCARE = _Paths.HEALTHCARE;

  /// 미션관리
  static const MISSION = _Paths.MISSION;

  /// 주치의찾기
  static const SEARCH_DOCTOR = _Paths.SEARCH_DOCTOR;

  /// 주치의상세
  static const DOCTOR = _Paths.DOCTOR;

  /// 내정보
  static const MY_INFO = _Paths.MY_INFO;

  /// 내 증상 리스트
  static const MY_SYMPTOMS = _Paths.MY_SYMPTOMS;

  /// 내 증상 기록
  static const WRITE_MY_SYMPTOMS = _Paths.WRITE_MY_SYMPTOMS;

  /// 내 증상 수정
  static const EDIT_MY_SYMPTOMS = _Paths.EDIT_MY_SYMPTOMS;

  /// 내 증상 보기
  static const VIEW_MY_SYMPTOMS = _Paths.VIEW_MY_SYMPTOMS;

  /// 정책 제안
  static const SUGGEST_POLICY = _Paths.SUGGEST_POLICY;

  /// 프로필 설정
  static const PROFILE_SETTING = _Paths.PROFILE_SETTING;

  /// 자주 묻는 질문
  static const FAQ = _Paths.FAQ;

  /// 알람 세팅
  static const ALARM_SETTING = _Paths.ALARM_SETTING;

  /// 약관 및 정책
  static const TERMS_AND_CONDITION = _Paths.TERMS_AND_CONDITION;

  /// 회원관리
  static const MANAGE_MEMBER = _Paths.MANAGE_MEMBER;
}

abstract class _Paths {
  _Paths._();

  /// 테마 화면 (사용자에게 노출되지 않음)
  static const THEME = '/theme';

  /// 스플래시
  static const SPLASH = '/splash';

  /// 권한 동의 안내 화면
  static const PERMISSION = '/permission';

  /// 로그인 및 온보딩 화면
  static const SIGNIN = '/signin';

  /// 메인
  static const MAIN = '/main';

  /// 홈
  static const HOME = '/home';

  /// 건강관리
  static const HEALTHCARE = '/healthcare';

  /// 미션관리
  static const MISSION = '/mission';

  /// 주치의찾기
  static const SEARCH_DOCTOR = '/search_doctors';

  /// 주치의찾기
  static const DOCTOR = '/doctor';

  /// 내정보
  static const MY_INFO = '/myinfo';

  /// 내 증상 리스트
  static const MY_SYMPTOMS = '/myinfo/my_symptoms';

  /// 내 증상 기록
  static const WRITE_MY_SYMPTOMS = '/myinfo/write_my_symptoms';

  /// 내 증상 수정
  static const EDIT_MY_SYMPTOMS = '/myinfo/edit_my_symptoms';

  /// 내 증상 보기
  static const VIEW_MY_SYMPTOMS = '/myinfo/view_my_symptoms';

  /// 정책 제안
  static const SUGGEST_POLICY = '/myinfo/suggest_policy';

  /// 프로필 세팅
  static const PROFILE_SETTING = '/myinfo/profile_setting';

  /// 자주 묻는 질문
  static const FAQ = '/myinfo/faq';

  /// 알람 세팅
  static const ALARM_SETTING = '/myinfo/alarm_setting';

  /// 약관 및 정책
  static const TERMS_AND_CONDITION = '/myinfo/terms_and_condition';

  /// 회원관리
  static const MANAGE_MEMBER = '/myinfo/manage_member';
}

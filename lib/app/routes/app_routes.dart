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

  /// 파킨슨 병 소개
  static const DISORDER = _Paths.DISORDER;

  /// 학회 및 앱 소개
  static const SEMINAR = _Paths.SEMINAR;

  /// 오해와 진실
  static const FACT = _Paths.FACT;

  /// 오해와 진실 포스트
  static const FACTPOST = _Paths.FACTPOST;

  /// 사회복지제도
  static const SOCIALWELFARE = _Paths.SOCIALWELFARE;

  /// 사회복지제도 포스트
  static const SOCIALWELFAREPOST = _Paths.SOCIALWELFAREPOST;

  /// 보호자 알람 서비스
  static const PROTECTOR = _Paths.PROTECTOR;

  /// 건강관리
  static const HEALTHCARE = _Paths.HEALTHCARE;

  /// 약물검색
  static const MEDICINE = _Paths.MEDICINE;

  /// 건강관리 - 약물검색 - 약물정보
  static const MEDICINEINFO = _Paths.MEDICINEINFO;

  /// 건강관리 - 주의약품
  static const DRUGMISUSE = _Paths.DRUGMISUSE;

  /// 건강관리 - 자가진단
  static const DIAGNOSIS = _Paths.DIAGNOSIS;

  /// 미션관리
  static const MISSION = _Paths.MISSION;

  /// 주치의 찾기
  static const SEARCH = _Paths.SEARCH;

  /// 주치의 찾기 - 주치의 상세
  static const DOCTOR = _Paths.SEARCH + _Paths.DOCTOR;

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

  /// 파킨슨 병 소개
  static const DISORDER = '/disorder';

  /// 학회 및 앱 소개
  static const SEMINAR = '/seminar';

  /// 오해와 진실
  static const FACT = '/fact';

  /// 오해와 진실 포스트
  static const FACTPOST = '/factpost';

  ///사회복지제도
  static const SOCIALWELFARE = '/socialwelfare';

  ///사회복지제도 포스트
  static const SOCIALWELFAREPOST = '/socialwelfarepost';

  /// 보호자 알람 서비스
  static const PROTECTOR = '/protector';

  /// 건강관리
  static const HEALTHCARE = '/healthcare';

  /// 건강관리 - 약물검색
  static const MEDICINE = '/medicine';

  /// 건강관리 - 약물검색 - 약물정보
  static const MEDICINEINFO = '/medicineinfo';

  /// 건강관리 - 주의약품
  static const DRUGMISUSE = '/drugmisuse';

  /// 건강관리 - 자가진단
  static const DIAGNOSIS = '/diagnosis';

  /// 미션관리
  static const MISSION = '/mission';

  /// 주치의 찾기
  static const SEARCH = '/search';

  /// 주치의 찾기 - 주치의 상세보기
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

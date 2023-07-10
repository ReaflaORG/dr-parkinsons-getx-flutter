/// 내정보 메뉴 모델
///
/// [title] : 메뉴 타이틀
///
/// [type] : 메뉴 타입
///
/// [page] : 화면 이동시 사용할 뷰컨트롤러 이름
///
/// [onPressed] : 버튼 클릭시 사용할 함수
class MyInfoMenuModel {
  MyInfoMenuModel({
    required this.title,
    required this.type,
    this.page,
    this.onPressed,
  });

  String title;
  String type;
  String? page;
  Function()? onPressed;
}

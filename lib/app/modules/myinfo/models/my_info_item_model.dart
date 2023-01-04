/// 내정보 메뉴 모델
///
/// [title] : 메뉴 타이틀
///
/// [page] : 화면 이동시 사용할 뷰컨트롤러 이름
class MyInfoMenuModel {
  MyInfoMenuModel({
    required this.title,
    this.page,
  });

  String title;
  String? page;
}

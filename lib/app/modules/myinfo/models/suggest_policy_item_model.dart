// suggest policy item model
class SuggestPolicyItemModel {
  SuggestPolicyItemModel(
      {required this.title,
      required this.dateWritten,
      required this.content,
      required this.isAgreePersonalInfo,
      required this.isSendAnonymous});
  String title;
  String dateWritten;
  String content;
  bool isAgreePersonalInfo;
  bool isSendAnonymous;
}

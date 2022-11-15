// alarm setting item model
class AlarmSettingItemModel {
  AlarmSettingItemModel(
      {required this.isBasicAlarm,
      required this.isMissionAlarm,
      required this.isNewArticleAlarm,
      required this.isSendTextMsgAlarm});
  bool isBasicAlarm = false;
  bool isMissionAlarm = false;
  bool isNewArticleAlarm = false;
  bool isSendTextMsgAlarm = false;
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/colors.dart';
import '../../../theme/texts.dart';

import '../models/alarm_setting_item_model.dart';

// alarm setting item widget
class AlarmSettingItemWidget extends StatelessWidget {
  const AlarmSettingItemWidget({
    super.key,
    required this.item,
  });
  final AlarmSettingItemModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              '기본 알림 설정',
              style: TextPath.TextF16W600.copyWith(
                color: ColorPath.TextGrey1H212121,
              ),
            ),
          ),
          SizedBox(height: 17.5),
          Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Row(
                children: [
                  Text(
                    '기본알림',
                    style: TextPath.TextF14W500.copyWith(
                      color: ColorPath.TextGrey1H212121,
                    ),
                  ),
                  Spacer(),
                  Switch(
                    value: item.isBasicAlarm,
                    onChanged: (value) => item.isBasicAlarm = value,
                  ),
                ],
              )),
          SizedBox(height: 15),
          Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Row(
                children: [
                  Text(
                    '미션알림',
                    style: TextPath.TextF14W500.copyWith(
                      color: ColorPath.TextGrey1H212121,
                    ),
                  ),
                  Spacer(),
                  Switch(
                    value: item.isMissionAlarm,
                    onChanged: (value) => item.isMissionAlarm = value,
                  ),
                ],
              )),
          SizedBox(height: 15),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Row(
              children: [
                Text(
                  '새 게시물 알림',
                  style: TextPath.TextF14W500.copyWith(
                    color: ColorPath.TextGrey1H212121,
                  ),
                ),
                Spacer(),
                Switch(
                  value: item.isNewArticleAlarm,
                  onChanged: (value) => item.isNewArticleAlarm = value,
                ),
              ],
            ),
          ),
          SizedBox(height: 54.5),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              '활동 확인이 안될 경우',
              style: TextPath.TextF16W600.copyWith(
                color: ColorPath.TextGrey1H212121,
              ),
            ),
          ),
          SizedBox(height: 15),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Row(
              children: [
                Text(
                  '보호자에게 문자전송',
                  style: TextPath.TextF14W500.copyWith(
                    color: ColorPath.TextGrey1H212121,
                  ),
                ),
                Spacer(),
                Switch(
                  value: item.isSendTextMsgAlarm,
                  onChanged: (value) => item.isSendTextMsgAlarm = value,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

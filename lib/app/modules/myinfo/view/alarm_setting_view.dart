import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../theme/colors.dart';
import '../../../theme/texts.dart';

import '../controller/alarm_setting_controller.dart';
import '../models/alarm_setting_item_model.dart';
import '../widgets/alarm_setting_item_widget.dart';

// alarm setting view
class AlarmSettingView extends GetView<AlarmSettingController> {
  const AlarmSettingView({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: ColorPath.BackgroundWhite,
            elevation: 0,
            centerTitle: false,
            leadingWidth: 39.w,
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 18.w),
                child: Image.asset(
                  'assets/doctor/back_arrow.png',
                  width: 21.w,
                  height: 13.5.w,
                ),
              ),
            ),
            title: Container(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Text(
                '알람 설정',
                style: TextPath.Heading2F18W600.copyWith(
                  color: ColorPath.TextGrey1H212121,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            actions: [
              Container(
                padding: EdgeInsets.fromLTRB(0.w, 10.w, 18.w, 10.w),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Image.asset(
                      'assets/search_doctors/search_doctors_icon.png',
                      width: 24.w,
                      height: 24,
                    ),
                  ),
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Stack(
              children: [
                Container(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      children: [
                        AlarmSetttingHeader(),
                        SizedBox(height: 52.w),
                        AlarmSettingBodyView(),
                        // Expanded(
                        //   child: AlarmSettingBodyView(),
                        // ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
}

// alarm setting header
class AlarmSetttingHeader extends GetView<AlarmSettingController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.w),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              '환자 보호를 위한 문자 발송 서비스',
              style: TextPath.TextF14W400.copyWith(),
            ),
          ),
        ],
      ),
    );
  }
}

// alarm setting body view
class AlarmSettingBodyView extends GetView<AlarmSettingController> {
  @override
  Widget build(BuildContext context) {
    AlarmSettingItemModel item = controller.listArray;
    return AlarmSettingItemWidget(
      item: item,
    );
  }
}

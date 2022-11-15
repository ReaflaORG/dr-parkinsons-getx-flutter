import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../theme/colors.dart';
import '../../../theme/texts.dart';

import '../controller/profile_setting_controller.dart';
import '../models/profile_setting_item_model.dart';
import '../widgets/profile_setting_item_widget.dart';

// profile setting view
class ProfileSettingView extends GetView<ProfileSettingController> {
  const ProfileSettingView({super.key});

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
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                '프로필 설정',
                style: TextPath.Heading2F18W600.copyWith(
                  color: ColorPath.TextGrey1H212121,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          body: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Stack(
              children: [
                Container(
                  child: Container(
                    //width: screenSize(context).width,
                    //height: screenSize(context).height,
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Column(
                      children: [
                        SizedBox(height: 40.w),
                        ProfileSettingBodyView(),
                        // Expanded(
                        //   child: ProfileSettingBodyView(),
                        // ),
                        SizedBox(height: MediaQuery.of(context).padding.bottom),
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

// profile setting body view
class ProfileSettingBodyView extends GetView<ProfileSettingController> {
  @override
  Widget build(BuildContext context) {
    ProfileSettingItemModel item = controller.listArray;
    return ProfileSettingItemWidget(
      item: item,
    );
  }
}

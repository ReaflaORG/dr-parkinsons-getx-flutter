import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../theme/colors.dart';
import '../../../theme/texts.dart';

import '../controller/profile_setting_controller.dart';
import '../widgets/profile_setting_widget.dart';

// profile setting view
class ProfileSettingView extends GetView<ProfileSettingController> {
  const ProfileSettingView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
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
        body: SafeArea(
          child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Stack(
              children: [
                Container(
                  child: Container(
                    //width: screenSize(context).width,
                    //height: screenSize(context).height,
                    padding: EdgeInsets.fromLTRB(20.w, 20.w, 20.w, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        //유저 데이터
                        ProfileSettingForm(),
                        SizedBox(height: 40.w),
                        // 액션리스트
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

// profile setting form
class ProfileSettingForm extends GetView<ProfileSettingController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 0),
        child: Column(
          children: [
            Container(
              alignment: Alignment.bottomLeft,
              child: Text(
                '이름',
                style: TextPath.TextF14W500.copyWith(
                  color: ColorPath.TextGrey1H212121,
                ),
              ),
            ),
            SizedBox(height: 6.w),
            TextField(
              controller: controller.userNameController.value,
              focusNode: controller.userNameFoucesNode.value,
              decoration: InputDecoration(
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: ColorPath.GrayCCCColor),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: ColorPath.Gray333Color),
                ),
                hintText: '이름',
                hintStyle: TextPath.TextF14W500.copyWith(
                  color: ColorPath.TextGrey4H9E9E9E,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
              ),
            ),
            if (controller.userNameError.value.isNotEmpty)
              Container(
                margin: EdgeInsets.only(top: 4.w),
                alignment: Alignment.bottomLeft,
                child: Text(
                  controller.userNameError.value,
                  style: TextPath.TextF10W400.copyWith(
                    color: ColorPath.ErrorColor,
                  ),
                ),
              ),
            SizedBox(height: 24.w),
            Container(
              alignment: Alignment.bottomLeft,
              child: Text(
                '연락처',
                style: TextPath.TextF14W500.copyWith(
                  color: ColorPath.TextGrey1H212121,
                ),
              ),
            ),
            SizedBox(height: 6.w),
            TextField(
              controller: controller.userPhoneController.value,
              focusNode: controller.userPhoneFoucesNode.value,
              decoration: InputDecoration(
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: ColorPath.GrayCCCColor),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: ColorPath.Gray333Color),
                ),
                hintText: '000-0000-0000',
                hintStyle: TextPath.TextF14W500.copyWith(
                  color: ColorPath.TextGrey4H9E9E9E,
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 8,
                ),
              ),
            ),
            if (controller.userPhoneError.value.isNotEmpty)
              Container(
                margin: EdgeInsets.only(top: 4.w),
                alignment: Alignment.bottomLeft,
                child: Text(
                  controller.userPhoneError.value,
                  style: TextPath.TextF10W400.copyWith(
                    color: ColorPath.ErrorColor,
                  ),
                ),
              ),
            SizedBox(height: 24.w),
            Container(
              alignment: Alignment.bottomLeft,
              child: Text(
                '보호자명',
                style: TextPath.TextF14W500.copyWith(
                  color: ColorPath.TextGrey1H212121,
                ),
              ),
            ),
            SizedBox(height: 6.w),
            TextField(
              controller: controller.guardianNameController.value,
              focusNode: controller.guardianNameFoucesNode.value,
              decoration: InputDecoration(
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: ColorPath.GrayCCCColor),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: ColorPath.Gray333Color),
                ),
                hintText: '이름',
                hintStyle: TextPath.TextF14W500.copyWith(
                  color: ColorPath.TextGrey4H9E9E9E,
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 8,
                ),
              ),
            ),
            if (controller.guardianNameError.value.isNotEmpty)
              Container(
                margin: EdgeInsets.only(top: 4.w),
                alignment: Alignment.bottomLeft,
                child: Text(
                  controller.guardianNameError.value,
                  style: TextPath.TextF10W400.copyWith(
                    color: ColorPath.ErrorColor,
                  ),
                ),
              ),
            SizedBox(height: 24.w),
            Container(
              alignment: Alignment.bottomLeft,
              child: Text(
                '보호자 연락처',
                style: TextPath.TextF14W500.copyWith(
                  color: ColorPath.TextGrey1H212121,
                ),
              ),
            ),
            SizedBox(height: 6.w),
            TextField(
              controller: controller.guardianPhoneController.value,
              focusNode: controller.guardianPhoneFoucesNode.value,
              decoration: InputDecoration(
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: ColorPath.GrayCCCColor),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: ColorPath.Gray333Color),
                ),
                hintText: '000-0000-0000',
                hintStyle: TextPath.TextF14W500.copyWith(
                  color: ColorPath.TextGrey4H9E9E9E,
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 8,
                ),
              ),
            ),
            if (controller.guardianPhoneError.value.isNotEmpty)
              Container(
                margin: EdgeInsets.only(top: 4.w),
                alignment: Alignment.bottomLeft,
                child: Text(
                  controller.guardianPhoneError.value,
                  style: TextPath.TextF10W400.copyWith(
                    color: ColorPath.ErrorColor,
                  ),
                ),
              ),
            SizedBox(height: 24.w),
            Container(
              alignment: Alignment.bottomLeft,
              child: Text(
                '성별',
                style: TextPath.TextF14W500.copyWith(
                  color: ColorPath.TextGrey1H212121,
                ),
              ),
            ),
            SizedBox(height: 10.w),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(
                controller.userGenderList.length,
                (index) => Container(
                  margin: EdgeInsets.only(right: index == 0 ? 10.w : 0),
                  child: RadioButtonForProfile(
                    title: controller.userGenderList[index],
                    isCheck: controller.userGenderList[index] ==
                        controller.userGender.value,
                    onClick: () => controller.userGender.value =
                        controller.userGenderList[index],
                  ),
                ),
              ),
            ),
            SizedBox(height: 24.w),
            Container(
              alignment: Alignment.bottomLeft,
              child: Text(
                '연령대',
                style: TextPath.TextF14W500.copyWith(
                  color: ColorPath.TextGrey1H212121,
                ),
              ),
            ),
            SizedBox(height: 10.w),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(
                controller.userBirthDayList.length,
                (index) => Container(
                  margin: EdgeInsets.only(right: 10.w),
                  child: RadioButtonForProfile(
                    title: index == 0
                        ? '~${controller.userBirthDayList[index]}'
                        : index == 3
                            ? '${controller.userBirthDayList[index]}~'
                            : controller.userBirthDayList[index],
                    isCheck: controller.userBirthDayList[index] ==
                        controller.userBirthDay.value,
                    onClick: () => controller.userBirthDay.value =
                        controller.userBirthDayList[index],
                  ),
                ),
              ),
            ),
            SizedBox(height: 24.w),
            Container(
              alignment: Alignment.bottomLeft,
              child: Text(
                '파킨슨 진단 결과',
                style: TextPath.TextF14W500.copyWith(
                  color: ColorPath.TextGrey1H212121,
                ),
              ),
            ),
            SizedBox(height: 10.w),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(
                controller.diagnosticStatusList.length,
                (index) => Container(
                    margin: EdgeInsets.only(
                      right: index != controller.diagnosticStatusList.length - 1
                          ? 10.w
                          : 0,
                    ),
                    child: RadioButtonForProfile(
                      title: controller.diagnosticStatusList[index],
                      isCheck: controller.diagnosticStatusList[index] ==
                          controller.diagnosticStatus.value,
                      onClick: () => controller.diagnosticStatus.value =
                          controller.diagnosticStatusList[index],
                    )),
              ),
            ),
            SizedBox(height: 24.w),
            Container(
              alignment: Alignment.bottomLeft,
              child: Text(
                '파킨슨 의심시기',
                style: TextPath.TextF14W500.copyWith(
                  color: ColorPath.TextGrey1H212121,
                ),
              ),
            ),
            SizedBox(height: 6.w),
            InkWell(
              onTap: () => controller.handleSelectDate(),
              child: TextField(
                decoration: InputDecoration(
                  enabled: false,
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: ColorPath.GrayCCCColor),
                  ),
                  hintText: controller.diagnosticDayString.value,
                  hintStyle: TextPath.TextF14W500.copyWith(
                    color: ColorPath.TextGrey4H9E9E9E,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 14,
                    horizontal: 8,
                  ),
                  suffixIcon: Padding(
                    padding: EdgeInsets.fromLTRB(18.75, 12.5, 22.75, 12.5),
                    child: Image.asset(
                      'assets/myinfo/fa_calendar.png',
                      width: 14.86,
                      height: 16,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.w),
            const ProfileSettingAction(),
          ],
        ),
      ),
    );
  }
}

// profile setting action
class ProfileSettingAction extends GetView<ProfileSettingController> {
  const ProfileSettingAction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Row(
        children: [
          SizedBox(
            width: 128.w,
            height: 38.w,
            child: TextButton(
              onPressed: () => Get.back(),
              style: TextButton.styleFrom(
                foregroundColor: ColorPath.TextGrey1H212121,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                  side: BorderSide(
                    color: ColorPath.Border3E7E7E7,
                  ),
                ),
              ),
              child: Text(
                '취소',
                style: TextPath.TextF14W400.copyWith(
                  color: ColorPath.TextGrey3H616161,
                ),
              ),
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: SizedBox(
              height: 38.w,
              child: TextButton(
                onPressed: () async => await controller.handleSubmit(),
                style: TextButton.styleFrom(
                  foregroundColor: ColorPath.TextGrey1H212121,
                  backgroundColor: ColorPath.Blue2F7ABAColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                    side: BorderSide(
                      color: ColorPath.Border3E7E7E7,
                    ),
                  ),
                ),
                child: Text(
                  '완료',
                  style: TextPath.TextF14W400.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

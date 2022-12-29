import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../theme/color_path.dart';
import '../../../theme/texts.dart';
import '../controller/profile_setting_controller.dart';
import '../widgets/profile_setting_widget.dart';

// profile setting view
class ProfileSettingView extends GetView<ProfileSettingController> {
  const ProfileSettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        shadowColor: Colors.white,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () async {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text(
          '프로필 설정',
          style: TextPath.Heading2F18W600.copyWith(
            color: ColorPath.TextGrey1H212121,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              controller.handlePutMyInfoProvider();
            },
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 18).w,
              child: Text(
                '저장',
                style: TextPath.TextF14W500.copyWith(
                  color: ColorPath.PrimaryDarkColor,
                ),
              ),
            ),
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                //유저 데이터
                const ProfileSettingForm(),
                SizedBox(height: 40.w),
                // 액션리스트
                SizedBox(height: MediaQuery.of(context).padding.bottom),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// profile setting form
class ProfileSettingForm extends GetView<ProfileSettingController> {
  const ProfileSettingForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0).w,
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
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 8).w,
              ),
            ),
            if (controller.userNameError.value.isNotEmpty)
              Container(
                margin: const EdgeInsets.only(top: 4).w,
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
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 8,
                ).w,
              ),
            ),
            if (controller.userPhoneError.value.isNotEmpty)
              Container(
                margin: const EdgeInsets.only(top: 4).w,
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
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 8,
                ).w,
              ),
            ),
            if (controller.guardianNameError.value.isNotEmpty)
              Container(
                margin: const EdgeInsets.only(top: 4).w,
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
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 8,
                ).w,
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
                (index) {
                  return RadioButtonForProfile(
                    title: controller.userGenderList[index],
                    isCheck: controller.userGenderList[index] ==
                        controller.userGender.value,
                    onClick: () {
                      controller.handleRadioSelect(index, type: '성별');
                    },
                  );
                },
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
            SizedBox(
              height: 40.w,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: controller.userBirthDayList.length,
                itemBuilder: (context, index) {
                  return RadioButtonForProfile(
                    title: controller.userBirthDayList[index].label,
                    isCheck: controller.userBirthDayList[index].isSelected,
                    onClick: () {
                      controller.handleRadioSelect(index, type: '연령대');
                    },
                  );
                },
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   children: List.generate(
            //     controller.userBirthDayList.length,
            //     (index) {
            //       return RadioButtonForProfile(
            //         title: controller.userBirthDayList[index].label,
            //         isCheck: controller.userBirthDayList[index].isSelected,
            //         onClick: () {
            //           controller.handleRadioSelect(index, type: '연령대');
            //         },
            //       );
            //     },
            //   ),
            // ),
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
                (index) {
                  return RadioButtonForProfile(
                    title: controller.diagnosticStatusList[index],
                    isCheck: controller.diagnosticStatusList[index] ==
                        controller.diagnosticStatus.value,
                    onClick: () {
                      controller.handleRadioSelect(index, type: '파킨슨 진단 결과');
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 24.w),
            Container(
              alignment: Alignment.bottomLeft,
              child: Text(
                '파킨슨 진단일',
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
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 14,
                    horizontal: 8,
                  ).w,
                  suffixIcon: Padding(
                    padding:
                        const EdgeInsets.fromLTRB(18.75, 12.5, 22.75, 12.5).w,
                    child: Image.asset(
                      'assets/myinfo/fa_calendar.png',
                      width: 14.86.w,
                      height: 16.w,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 100.w),
          ],
        ),
      ),
    );
  }
}

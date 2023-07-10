import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../globals/global_appbar_widget.dart';
import '../../../globals/global_layout_widget.dart';
import '../../../globals/global_text_widget.dart';
import '../../../theme/color_path.dart';
import '../../../theme/text_path.dart';
import '../controller/profile_setting_controller.dart';
import '../widgets/profile_setting_widget.dart';

class ProfileSettingView extends GetView<ProfileSettingController> {
  const ProfileSettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GlobalLayoutWidget(
        context: context,
        appBar: GlobalAppBarWidget(
          appBar: AppBar(),
          title: '프로필 설정',
          actions: [
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(right: 5).w,
              child: TextButton(
                onPressed: controller.isSaveButtonEnable.value
                    ? () => {controller.handlePutMyInfoProvider()}
                    : null,
                child: Text(
                  '저장',
                  style: TextPath.TextF14W600.copyWith(
                    color: controller.isSaveButtonEnable.value
                        ? ColorPath.TextGrey1H212121
                        : const Color(0XFFDADADA),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 50).w,
            child: Column(
              children: [
                const TextFieldWidget(),
                SizedBox(height: 50.w),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// 텍스트 필드 위젯
class TextFieldWidget extends GetView<ProfileSettingController> {
  const TextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.bottomLeft,
            child: Text(
              '이름',
              style: TextPath.TextF16W500.copyWith(
                color: ColorPath.TextGrey1H212121,
              ),
            ),
          ),
          SizedBox(height: 5.w),
          TextField(
            controller: controller.userNameController.value,
            focusNode: controller.userNameFoucesNode.value,
            onChanged: (String value) {
              controller.handleOnChanged(value, type: 'userName');
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 14,
              ).w,
              hintText: '본인의 이름을 입력해주세요',
              hintStyle: TextPath.TextF14W500.copyWith(
                color: ColorPath.TextGrey4H9E9E9E,
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: ColorPath.Gray333Color,
                ),
              ),
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
          SizedBox(height: 32.w),
          Container(
            alignment: Alignment.bottomLeft,
            child: Text(
              '연락처',
              style: TextPath.TextF16W500.copyWith(
                color: ColorPath.TextGrey1H212121,
              ),
            ),
          ),
          SizedBox(height: 5.w),
          TextField(
            controller: controller.userPhoneController.value,
            focusNode: controller.userPhoneFoucesNode.value,
            keyboardType: TextInputType.number,
            onChanged: (String value) {
              controller.handleOnChanged(value, type: 'userPhone');
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 14,
              ).w,
              hintText: "'-'를 제외한 11자리를 입력해주세요",
              hintStyle: TextPath.TextF14W500.copyWith(
                color: ColorPath.TextGrey4H9E9E9E,
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: ColorPath.Gray333Color,
                ),
              ),
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
          SizedBox(height: 32.w),
          Container(
            alignment: Alignment.bottomLeft,
            child: Text(
              '보호자명',
              style: TextPath.TextF16W500.copyWith(
                color: ColorPath.TextGrey1H212121,
              ),
            ),
          ),
          SizedBox(height: 5.w),
          TextField(
            controller: controller.guardianNameController.value,
            focusNode: controller.guardianNameFoucesNode.value,
            onChanged: (String value) {
              controller.handleOnChanged(value, type: 'guardianName');
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 14,
              ).w,
              hintText: '보호자 이름을 입력해주세요',
              hintStyle: TextPath.TextF14W500.copyWith(
                color: ColorPath.TextGrey4H9E9E9E,
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: ColorPath.Gray333Color,
                ),
              ),
            ),
          ),
          if (controller.guardianNameError.value.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 5).w,
              child: GlobalTextWidget.error(
                controller.guardianNameError.value,
              ),
            ),
          SizedBox(height: 32.w),
          Container(
            alignment: Alignment.bottomLeft,
            child: Text(
              '보호자 연락처',
              style: TextPath.TextF16W500.copyWith(
                color: ColorPath.TextGrey1H212121,
              ),
            ),
          ),
          SizedBox(height: 5.w),
          TextField(
            controller: controller.guardianPhoneController.value,
            focusNode: controller.guardianPhoneFoucesNode.value,
            keyboardType: TextInputType.number,
            onChanged: (String value) {
              controller.handleOnChanged(value, type: 'guardianPhone');
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 14,
              ).w,
              hintText: "'-'를 제외한 11자리를 입력해주세요",
              hintStyle: TextPath.TextF14W500.copyWith(
                color: ColorPath.TextGrey4H9E9E9E,
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: ColorPath.Gray333Color,
                ),
              ),
            ),
          ),
          if (controller.guardianPhoneError.value.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 5).w,
              child: GlobalTextWidget.error(
                controller.guardianPhoneError.value,
              ),
            ),
          SizedBox(height: 32.w),
          Container(
            alignment: Alignment.bottomLeft,
            child: Text(
              '성별',
              style: TextPath.TextF16W500.copyWith(
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
          SizedBox(height: 32.w),
          Container(
            alignment: Alignment.bottomLeft,
            child: Text(
              '연령대',
              style: TextPath.TextF16W500.copyWith(
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
          SizedBox(height: 32.w),
          Container(
            alignment: Alignment.bottomLeft,
            child: Text(
              '파킨슨 진단 결과',
              style: TextPath.TextF16W500.copyWith(
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
          SizedBox(height: 32.w),
          Container(
            alignment: Alignment.bottomLeft,
            child: Text(
              '파킨슨 진단일',
              style: TextPath.TextF16W500.copyWith(
                color: ColorPath.TextGrey1H212121,
              ),
            ),
          ),
          SizedBox(height: 5.w),
          InkWell(
            onTap: () {
              controller.handleSelectDate();
            },
            child: TextField(
              decoration: InputDecoration(
                enabled: false,
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: ColorPath.GrayCCCColor),
                ),
                hintText: controller.diagnosticDayString.value,
                hintStyle: TextPath.TextF16W500.copyWith(
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
          SizedBox(height: 32.w),
          Container(
            alignment: Alignment.bottomLeft,
            child: OutlinedButton(
              onPressed: () => controller.handleSignoutModal(),
              child: Text(
                '탈퇴하기',
                style: TextPath.TextF16W500.copyWith(
                  color: ColorPath.TextGrey1H212121,
                ),
              ),
            ),
          ), // 회원탈퇴

          SizedBox(height: 100.w),
        ],
      ),
    );
  }
}

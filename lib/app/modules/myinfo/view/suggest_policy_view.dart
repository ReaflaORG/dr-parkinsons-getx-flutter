import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../theme/colors.dart';
import '../../../theme/texts.dart';

import '../controller/suggest_policy_controller.dart';
import '../widgets/show_dialog.dart';

// suggest policy view
class SuggestPolicyView extends GetView<SuggestPolicyController> {
  const SuggestPolicyView({super.key});

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
                '정책 제안하기',
                style: TextPath.Heading2F18W600.copyWith(
                  color: ColorPath.TextGrey1H212121,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          body: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 0),
                  child: Column(
                    children: [
                      SizedBox(height: 40.w),
                      SuggestPolicyBodyView(),
                      SizedBox(height: 40.w),
                      SuggestPolicyActionView(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
}

///* suggest policy body view
class SuggestPolicyBodyView extends GetView<SuggestPolicyController> {
  const SuggestPolicyBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 0),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                '제목',
                style: TextPath.TextF14W500.copyWith(
                  color: ColorPath.TextGrey1H212121,
                ),
              ),
            ),
            SizedBox(height: 6.w),
            TextField(
              controller: controller.policyTitleController.value,
              focusNode: controller.polityTitleFoucesNode.value,
              decoration: InputDecoration(
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: ColorPath.GrayCCCColor),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: ColorPath.Gray333Color),
                ),
                hintText: '정책제안합니다.',
                hintStyle: TextPath.TextF14W500.copyWith(
                  color: ColorPath.TextGrey4H9E9E9E,
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 14.w,
                  horizontal: 8.w,
                ),
              ),
            ),
            if (controller.polityTitleError.value.isNotEmpty)
              Container(
                margin: EdgeInsets.only(top: 4.w),
                alignment: Alignment.bottomLeft,
                child: Text(
                  controller.polityTitleError.value,
                  style: TextPath.TextF10W400.copyWith(
                    color: ColorPath.ErrorColor,
                  ),
                ),
              ),
            SizedBox(height: 24.w),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                '내용',
                style: TextPath.TextF14W500.copyWith(
                  color: ColorPath.TextGrey1H212121,
                ),
              ),
            ),
            SizedBox(height: 6.w),
            TextField(
              controller: controller.policyContentController.value,
              focusNode: controller.policyContentFoucesNode.value,
              maxLines: 10,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorPath.GrayCCCColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorPath.Gray333Color),
                ),
                hintText: '내용입력',
                hintStyle: TextPath.TextF14W500.copyWith(
                  color: ColorPath.TextGrey4H9E9E9E,
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 14.w,
                  horizontal: 8.w,
                ),
              ),
            ),
            if (controller.policyContentError.value.isNotEmpty)
              Container(
                margin: EdgeInsets.only(top: 4.w),
                alignment: Alignment.bottomLeft,
                child: Text(
                  controller.policyContentError.value,
                  style: TextPath.TextF10W400.copyWith(
                    color: ColorPath.ErrorColor,
                  ),
                ),
              ),
            SizedBox(height: 15.w),
            Container(
              alignment: Alignment.centerLeft,
              height: 24,
              child: SizedBox(
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                      height: 20,
                      child: Checkbox(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        side: BorderSide(
                          color: ColorPath.Border1H9E9E9E,
                          width: 1,
                        ),
                        value: controller.boxStatusWithPersonalAgree.value,
                        onChanged: (bool? value) {
                          controller.changeCheckBoxWithPersonalAgree(value);
                        },
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Text(
                      '개인정보 처리방침에 동의합니다.',
                      style: TextPath.TextF14W500.copyWith(
                        color: ColorPath.TextGrey1H212121,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 5.w),
            Container(
              alignment: Alignment.centerLeft,
              height: 24,
              child: SizedBox(
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                      height: 20,
                      child: Checkbox(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        side: BorderSide(
                          color: ColorPath.Border1H9E9E9E,
                          width: 1,
                        ),
                        value: controller.boxStatusWithAnonymous.value,
                        onChanged: (bool? value) {
                          controller.changeCheckBoxWithAnonymous(value);
                        },
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Text(
                      '익명으로 전송합니다.',
                      style: TextPath.TextF14W500.copyWith(
                        color: ColorPath.TextGrey1H212121,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SuggestPolicyActionView extends GetView<SuggestPolicyController> {
  const SuggestPolicyActionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10.w, 0, 0, 0),
      child: Row(
        children: [
          SizedBox(
            width: 128,
            height: 38,
            child: TextButton(
              onPressed: () {
                Get.back();
              },
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
              height: 38,
              child: TextButton(
                onPressed: () async {
                  //showAlertDialog(context, alertTitleMsg, alertContentMsg);
                  await controller.handleSubmit(context);
                },
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

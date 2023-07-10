import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../globals/global_appbar_widget.dart';
import '../../../globals/global_inkwell_widget.dart';
import '../../../globals/global_layout_widget.dart';
import '../../../globals/global_text_widget.dart';
import '../../../theme/color_path.dart';
import '../../../theme/text_path.dart';
import '../controller/suggest_policy_controller.dart';

class SuggestPolicyView extends GetView<SuggestPolicyController> {
  const SuggestPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GlobalLayoutWidget(
        context: context,
        resizeToAvoidBottomInset: true,
        appBar: GlobalAppBarWidget(
          appBar: AppBar(),
          title: '의견 제안하기',
          actions: [
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(right: 5).w,
              child: TextButton(
                onPressed: controller.isSaveButtonEnable.value
                    ? () {
                        Get.dialog(
                          AlertDialog(
                            title: Text(
                              '의견을 전송 하시겠습니까?',
                              style: TextPath.Heading2F18W600.copyWith(
                                color: ColorPath.TextGrey1H212121,
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(16),
                              ).r,
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(20.w),
                                  child: const Text('여러분의 소중한 의견은 익명으로 전송됩니다.'),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: InkWell(
                                        onTap: () {
                                          Get.back();
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: ColorPath.Background1HECEFF1,
                                            borderRadius:
                                                const BorderRadius.only(
                                              bottomLeft: Radius.circular(16),
                                            ),
                                          ),
                                          height: 48.w,
                                          child: Text(
                                            '취소',
                                            style:
                                                TextPath.TextF14W500.copyWith(
                                              color: ColorPath.TextGrey1H212121,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: InkWell(
                                        onTap: () async {
                                          // 로그아웃
                                          await controller
                                              .handleSubmit(context);
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: ColorPath.PrimaryColor,
                                              borderRadius:
                                                  const BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(16),
                                              )),
                                          height: 48.w,
                                          child: Text(
                                            '전송',
                                            style:
                                                TextPath.TextF14W500.copyWith(
                                              color: ColorPath.BackgroundWhite,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            contentPadding: EdgeInsets.zero,
                          ),
                        );
                      }
                    : null,
                child: Text(
                  '전송',
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
class TextFieldWidget extends GetView<SuggestPolicyController> {
  const TextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '제목',
            style: TextPath.TextF16W500.copyWith(
              color: ColorPath.TextGrey1H212121,
            ),
          ),
          SizedBox(height: 5.w),
          TextField(
            controller: controller.titleController.value,
            focusNode: controller.titleFoucesNode.value,
            onChanged: (String value) {
              controller.handleOnChanged(value, type: 'title');
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 14,
              ).w,
              hintText: '제목을 입력해주세요',
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
          if (controller.titleError.value.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 5).w,
              child: GlobalTextWidget.error(
                controller.titleError.value,
              ),
            ),
          SizedBox(height: 32.w),
          Text(
            '내용',
            style: TextPath.TextF16W500.copyWith(
              color: ColorPath.TextGrey1H212121,
            ),
          ),
          SizedBox(height: 5.w),
          TextField(
            controller: controller.contentController.value,
            focusNode: controller.contentFoucesNode.value,
            maxLines: 5,
            onChanged: (String value) {
              controller.handleOnChanged(value, type: 'content');
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 14,
              ).w,
              hintText: '의견을 제안할 내용을 입력해주세요',
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
          if (controller.contentError.value.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 5).w,
              child: GlobalTextWidget.error(
                controller.contentError.value,
              ),
            ),
          SizedBox(height: 18.w),
          GlobalInkWellWidget(
            onTap: () {
              controller.changeCheckBoxWithPersonalAgree(
                !controller.boxStatusWithPersonalAgree.value,
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 20.w,
                  height: 20.w,
                  child: Checkbox(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4).r,
                    ),
                    side: BorderSide(
                      color: ColorPath.Border1H9E9E9E,
                      width: 1.w,
                    ),
                    value: controller.boxStatusWithPersonalAgree.value,
                    onChanged: (bool? value) {
                      controller.changeCheckBoxWithPersonalAgree(value);
                    },
                  ),
                ),
                SizedBox(width: 12.w),
                Text(
                  '개인정보 처리방침에 동의합니다',
                  style: TextPath.TextF14W500.copyWith(
                    color: ColorPath.TextGrey1H212121,
                  ),
                ),
              ],
            ),
          ),
          // GlobalInkWellWidget(
          //   onTap: () {
          //     controller.changeCheckBoxWithAnonymous(
          //       !controller.boxStatusWithAnonymous.value,
          //     );
          //   },
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.start,
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: [
          //       SizedBox(
          //         width: 20.w,
          //         height: 20.w,
          //         child: Checkbox(
          //           shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(4).r,
          //           ),
          //           side: BorderSide(
          //             color: ColorPath.Border1H9E9E9E,
          //             width: 1.w,
          //           ),
          //           value: controller.boxStatusWithAnonymous.value,
          //           onChanged: (bool? value) {
          //             controller.changeCheckBoxWithAnonymous(value);
          //           },
          //         ),
          //       ),
          //       SizedBox(width: 12.w),
          //       Text(
          //         '익명으로 전송합니다',
          //         style: TextPath.TextF14W500.copyWith(
          //           color: ColorPath.TextGrey1H212121,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
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

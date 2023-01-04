import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mime/mime.dart';

import '../../../globals/global_appbar_widget.dart';
import '../../../globals/global_dialog_widget.dart';
import '../../../globals/global_layout_widget.dart';
import '../../../globals/global_text_widget.dart';
import '../../../theme/color_path.dart';
import '../../../theme/text_path.dart';
import '../controller/write_my_symtoms_controller.dart';

const String alertTitleMsg = '내 증상 기록';
const String alertContentMsg = '저장이 완료되었습니다.';

class WriteMySymptomsView extends GetView<WriteMySymptomsController> {
  const WriteMySymptomsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GlobalLayoutWidget(
        context: context,
        resizeToAvoidBottomInset: true,
        appBar: GlobalAppBarWidget(
          appBar: AppBar(),
          title: '증상 기록하기',
          actions: [
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(right: 5).w,
              child: TextButton(
                onPressed: controller.isSaveButtonEnable.value
                    ? () => controller.handleSubmit()
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
                // const WriteMySymptomsAction(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// 텍스트 필드 위젯
class TextFieldWidget extends GetView<WriteMySymptomsController> {
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
            controller: controller.titleTextEditController.value,
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
            '내 증상 기록',
            style: TextPath.TextF16W500.copyWith(
              color: ColorPath.TextGrey1H212121,
            ),
          ),
          SizedBox(height: 5.w),
          TextField(
            controller: controller.contentTextEditController.value,
            focusNode: controller.contentFoucesNode.value,
            keyboardType: TextInputType.multiline,
            maxLines: 5,
            onChanged: (String value) {
              controller.handleOnChanged(value, type: 'content');
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 14,
              ).w,
              hintText: '나의 증상을 기록해보세요!',
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
          SizedBox(height: 32.w),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              '영상 및 사진 업로드',
              style: TextPath.TextF16W500.copyWith(
                color: ColorPath.TextGrey1H212121,
              ),
            ),
          ),
          SizedBox(height: 12.w),
          GridView.count(
              crossAxisCount: 3,
              mainAxisSpacing: 10.w,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 10.w,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              children: [
                DottedBorder(
                  color: const Color.fromRGBO(4, 168, 180, 0.9),
                  strokeWidth: 1,
                  dashPattern: const [3, 1],
                  borderType: BorderType.RRect,
                  radius: Radius.circular(6.w),
                  child: TextButton(
                    onPressed: () {
                      GlobalAlbumBottomSheetModal(albumOnPressed: () {
                        controller.handleFileAdd(isImage: false);
                        Get.back();
                      }, videoOnPressed: () {
                        controller.handleFileAdd(isImage: true);
                        Get.back();
                      });
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: ColorPath.TextGrey1H212121,
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        '+',
                        style: TextPath.TextF20W400.copyWith(
                          color: ColorPath.SecondaryColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                ...List.generate(controller.files.length, (index) {
                  String mimeStr = lookupMimeType(controller.files[index].path)!
                      .split('/')[0];

                  return mimeStr == 'image'
                      ? Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: FileImage(
                              File(controller.files[index].path),
                            ),
                            fit: BoxFit.cover,
                          )),
                          padding: EdgeInsets.all(5.w),
                          alignment: Alignment.topRight,
                          child: GestureDetector(
                            onTap: () {
                              controller.handleFileRemove(index: index);
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 5.w),
                              decoration: const BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                              child: const Icon(
                                Icons.cancel_rounded,
                              ),
                            ),
                          ),
                        )
                      : Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              color: Colors.black,
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(7.w),
                              child: Image.asset(
                                  'assets/doctor/video_play_button.png'),
                            ),
                            Positioned(
                              top: 5.w,
                              right: 3.w,
                              child: GestureDetector(
                                onTap: () {
                                  controller.handleFileRemove(index: index);
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: 5.w),
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle),
                                  child: const Icon(
                                    Icons.cancel_rounded,
                                  ),
                                ),
                              ),
                            )
                          ],
                        );
                }).toList(),
              ]),
        ],
      ),
    );
  }
}

class WriteMySymptomsAction extends GetView<WriteMySymptomsController> {
  const WriteMySymptomsAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10.w, 0.w, 0.w, 0.w),
      child: Row(
        children: [
          SizedBox(
            width: 128.w,
            height: 38.w,
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
              height: 38.w,
              child: TextButton(
                onPressed: () {},
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
                child: InkWell(
                  onTap: () {
                    controller.handleSubmit();
                  },
                  child: Text(
                    '완료',
                    style: TextPath.TextF14W400.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

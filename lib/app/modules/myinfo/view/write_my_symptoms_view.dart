import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../theme/colors.dart';
import '../../../theme/texts.dart';
import '../controller/write_my_symtoms_controller.dart';

const String alertTitleMsg = '내 증상 기록';
const String alertContentMsg = '저장이 완료되었습니다.';

// write my symptoms view
class WriteMySymptomsView extends GetView<WriteMySymptomsController> {
  const WriteMySymptomsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPath.BackgroundWhite,
        elevation: 0,
        centerTitle: false,
        leadingWidth: 39.w,
        leading: InkWell(
          onTap: () {
            Get.back();
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
            '내 증상 기록',
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
              padding: EdgeInsets.fromLTRB(20.w, 0.w, 20.w, 0.w),
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).padding.top),
                  const WriteMySymptomsBodyView(),
                  // Expanded(
                  //   child: WriteMySymptomsView(),
                  // ),
                  SizedBox(height: MediaQuery.of(context).padding.bottom),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class WriteMySymptomsBodyView extends GetView<WriteMySymptomsController> {
  const WriteMySymptomsBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const WriteMySymptomsForm(),
          SizedBox(height: 50.w),
          const WriteMySymptomsAction(),
          SizedBox(height: 30.w),
        ],
      ),
    );
  }
}

class WriteMySymptomsForm extends GetView<WriteMySymptomsController> {
  const WriteMySymptomsForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 0.w, 20.w, 0.w),
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
            controller: controller.mySymptomsTitleTextEditController.value,
            focusNode: controller.titleFoucesNode.value,
            decoration: InputDecoration(
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: ColorPath.GrayCCCColor),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: ColorPath.Gray333Color),
              ),
              hintText: '파킨슨 일지 (10.17)',
              hintStyle: TextPath.TextF14W500.copyWith(
                color: ColorPath.TextGrey4H9E9E9E,
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: 14.w,
                horizontal: 8.w,
              ),
            ),
          ),
          if (controller.titleError.value.isNotEmpty)
            Container(
              margin: EdgeInsets.only(top: 4.w),
              alignment: Alignment.bottomLeft,
              child: Text(
                controller.titleError.value,
                style: TextPath.TextF10W400.copyWith(
                  color: ColorPath.ErrorColor,
                ),
              ),
            ),
          SizedBox(height: 24.w),
          // Container(
          //   alignment: Alignment.centerLeft,
          //   child: Text(
          //     '작성시간',
          //     style: TextPath.TextF14W500.copyWith(
          //       color: ColorPath.TextGrey1H212121,
          //     ),
          //   ),
          // ),
          // SizedBox(height: 6.w),
          // TextField(
          //   decoration: InputDecoration(
          //     border: UnderlineInputBorder(
          //       borderSide: BorderSide(color: ColorPath.GrayCCCColor),
          //     ),
          //     focusedBorder: UnderlineInputBorder(
          //       borderSide: BorderSide(color: ColorPath.Gray333Color),
          //     ),
          //     hintText: '10월 17일 오후 3시 20분',
          //     hintStyle: TextPath.TextF14W500.copyWith(
          //       color: ColorPath.TextGrey4H9E9E9E,
          //     ),
          //     contentPadding: EdgeInsets.symmetric(
          //       vertical: 14.w,
          //       horizontal: 8.w,
          //     ),
          //   ),
          // ),
          SizedBox(height: 24.w),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              '내 증상 기록',
              style: TextPath.TextF14W500.copyWith(
                color: ColorPath.TextGrey1H212121,
              ),
            ),
          ),
          SizedBox(height: 6.w),
          TextField(
            controller: controller.mySymptomsContentTextEditController.value,
            focusNode: controller.contentFoucesNode.value,
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
          if (controller.contentError.value.isNotEmpty)
            Container(
              margin: EdgeInsets.only(top: 4.w),
              alignment: Alignment.bottomLeft,
              child: Text(
                controller.contentError.value,
                style: TextPath.TextF10W400.copyWith(
                  color: ColorPath.ErrorColor,
                ),
              ),
            ),
          SizedBox(height: 24.w),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              '영상 및 사진 업로드',
              style: TextPath.TextF14W500.copyWith(
                color: ColorPath.TextGrey1H212121,
              ),
            ),
          ),
          SizedBox(height: 12.w),
          Container(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                DottedBorder(
                  color: const Color.fromRGBO(4, 168, 180, 0.9),
                  strokeWidth: 1,
                  dashPattern: const [3, 1],
                  borderType: BorderType.RRect,
                  radius: Radius.circular(6.w),
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor: ColorPath.TextGrey1H212121,
                    ),
                    child: Container(
                      width: 64,
                      height: 64,
                      alignment: Alignment.center,
                      child: Text(
                        '+',
                        style: TextPath.TextF20W400.copyWith(
                          color: const Color.fromRGBO(4, 168, 180, 0.9),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                InkWell(
                  onTap: () {},
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/my_symptoms/sample_img.png',
                        width: 90,
                        height: 60,
                      ),
                      Positioned(
                        top: 4.06,
                        right: 4.06,
                        child: Image.asset(
                          'assets/my_symptoms/close_icon.png',
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
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
